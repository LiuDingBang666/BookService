package icu.liuwisdom.core.controller;

import icu.liuwisdom.common.utils.IdUtils;
import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.*;
import icu.liuwisdom.core.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/*
 * 管理员控制器
 * */
@Controller()
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;//用户服务
    @Autowired
    private AdminBookService adminBookService;//图书服务
    @Autowired
    private AdminNoticeService adminNoticeService;//公告服务
    @Autowired
    private AdminBookSafetyStockService adminBookSafetyStockService;//图书安全库存服务
    @Autowired
    private SuggestService suggestService; //用户建议信息服务
    @Autowired
    private UserOrdersService userOrdersService; //用户订单服务接口


    /*-------------------用户管理 6.3-------------------------*/
    /*跳转到管理员首页*/
    @RequestMapping("/goIndex")
    public String goIndex() {
        return "admin/index";
    }

    /*用户登录*/
    @ResponseBody
    @RequestMapping("/loginCheck")
    public String loginCheck(User user, HttpSession session) {
        User hasUser = this.adminService.findUserByNameAndPassword(user);
        //查询该用户是否存在
        if (hasUser == null) {
            return "FAIL";
        }
        session.setAttribute("ADMIN_SESSION", user);
        return "OK";
    }

    /*退出登录*/
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "redirect:goLogin";
    }

    /*跳转到登录页面*/
    @RequestMapping("/goLogin")
    public String goLogin() {

        return "admin/login";
    }

    /*条件查询所有用户列表*/
    @RequestMapping("/goAdmin")
    public String goAdmin(@RequestParam(defaultValue = "1") Integer page,
                          @RequestParam(defaultValue = "10") Integer rows,
                          String name, String sex, String role,
                          HttpServletResponse response, Model model) {
        // 条件查询所有管理员
        Page<User> users = adminService.findUserList(page, rows, name, sex, role);
        //返回封装用户对象
        User selectUser = new User();
        selectUser.setName(name);
        selectUser.setSex(sex);
        selectUser.setRole(role);
        model.addAttribute("selectUser", selectUser);
        //返回分页列表
        model.addAttribute("page", users);
        return "admin/adminmanaged";
    }


    /*新增用户*/
    @ResponseBody
    @PostMapping("/createUser")
    public String createUser(User user) {
        //先判断手机号是否已注册
        if (this.adminService.findUserByTel(user.getTel()) != null) {
            return "FAIL";
        }
        this.adminService.addUser(user);
        return "OK";
    }


    /*根据手机号删除用户*/
    @ResponseBody
    @RequestMapping("/deleteUser")
    public String deleteUser(String tel) {
//        System.out.println(tel);
        if (this.adminService.deleteUserByTel(tel) != 1) {
            return "FAIL";
        }
        return "OK";
    }

    /*根据手机号返回用户信息*/
    @ResponseBody
    @RequestMapping("/getUserByTel")
    public User getUserByTel(String tel, HttpSession session) {
        //存储原来的手机号
        session.setAttribute("oldTel", tel);
        return this.adminService.findUserByTel(tel);
    }

    /*根据手机号修改用户信息*/
    @ResponseBody
    @RequestMapping("/alterUser")
    public String alterUser(User user, HttpSession session) {
        //获取原手机号
        String oldTel = (String) session.getAttribute("oldTel");
        User nowUser = this.adminService.findUserByTel(user.getTel());
        //先判断要修改的手机号是否被别人已注册
        if (nowUser != null && !nowUser.getTel().equals(oldTel)) {
            return "FAIL";
        }
        //修改用户信息
        Integer res = this.adminService.alterUserByTel(user, oldTel);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*-------------------用户管理 6.4-------------------------*/

    /*-------------------图书管理 6.4-------------------------*/

    /*返回所有图书信息*/
    @RequestMapping("/goBook")
    public String goBook(@RequestParam(defaultValue = "1") Integer page,
                         @RequestParam(defaultValue = "10") Integer rows,
                         String name, String category,
                         HttpServletResponse response, Model model) {
        // 条件查询所有图书信息
        Page<Book> books = adminBookService.findBookList(page, rows, name, category);
        //返回封装用户对象
        Book selectBook = new Book();
        selectBook.setName(name);
        selectBook.setCategory(category);
        model.addAttribute("selectBook", selectBook);
        //返回图书分类列表
        model.addAttribute("categorys", this.adminBookService.findBookTypes());
        //返回分页列表
        model.addAttribute("page", books);
        return "admin/bookmanaged";
    }

    /*新增图书*/
    @ResponseBody
    @RequestMapping("/createBook")
    public String createBook(Book book) {
        //图书信息为空
        if (book == null) {
            return "FAIL";
        }
        //设置图书编号
        book.setBookid(IdUtils.getUUID());
        Integer res = this.adminBookService.addBook(book);
        //新增失败
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*删除图书*/
    @ResponseBody
    @RequestMapping("/deleteBook")
    public String deleteBook(String id) {
        int res = this.adminBookService.deleteBook(id);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*根据图书编号返回图书信息*/
    @ResponseBody
    @RequestMapping("getBookById")
    public Book getBookById(String id) {
        return this.adminBookService.findBookById(id);
    }


    /*根据图书id修改图书信息*/
    @ResponseBody
    @RequestMapping("/alterBook")
    public String alterBook(Book book) {
        Integer res = this.adminBookService.AlterBookById(book);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }


    /*-------------------图书管理 6.5-------------------------*/

    /*-------------------公告管理 6.6-------------------------*/
    /*返回所有公告信息*/
    @RequestMapping("/goNotice")
    public String goNotice(@RequestParam(defaultValue = "1") Integer page,
                           @RequestParam(defaultValue = "10") Integer rows,
                           String content,
                           HttpServletResponse response, Model model) {
        // 条件查询所有公告
        Page<Notice> notices = adminNoticeService.findNoticeList(page, rows, content);
        //返回封装公告对象
        Notice selectNotice = new Notice();
        selectNotice.setContent(content);
        model.addAttribute("selectNotice", selectNotice);
        //返回分页列表
        model.addAttribute("page", notices);
        return "admin/noticemanaged";
    }

    /*新增公告*/
    @ResponseBody
    @RequestMapping("/createNotice")
    public String createNotice(Notice notice, HttpSession session) {
        //公告信息为空
        if (notice == null) {
            return "FAIL";
        }
        User nowAdmin = (User) session.getAttribute("ADMIN_SESSION");
        notice.setAdmin(nowAdmin.getName());
        Integer res = this.adminNoticeService.addNotice(notice);
        //新增失败
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*删除公告*/
    @ResponseBody
    @RequestMapping("/deleteNotice")
    public String deleteNotice(Integer id) {
        int res = this.adminNoticeService.deleteNotice(id);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*根据公告编号返回公告信息*/
    @ResponseBody
    @RequestMapping("getNoticeById")
    public Notice getNoticeById(Integer id) {
//        System.out.println(id);
        return this.adminNoticeService.findNoticeById(id);
    }


    /*根据公告id修改公告信息*/
    @ResponseBody
    @RequestMapping("/alterNotice")
    public String alterBook(Notice notice) {
//        System.out.println(book);
        Integer res = this.adminNoticeService.AlterNoticeById(notice);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }

    /*-------------------公告管理 6.6-------------------------*/

    /*-------------------安全库存管理 6.26-------------------------*/
    /*跳转到安全库存管理界面*/
    @RequestMapping("/goSafetyStockManaged")
    public String SafetyStockManaged(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "10") Integer rows,
                                     String name, String category,
                                     HttpServletResponse response, Model model) {
        // 条件查询所有图书信息
        Page<Book> books = adminBookSafetyStockService.findHotSellBook(page, rows, name, category);
        //返回封装图书对象
        Book selectBook = new Book();
        selectBook.setName(name);
        selectBook.setCategory(category);
        model.addAttribute("selectBook", selectBook);
        //返回图书分类列表
        model.addAttribute("categorys", this.adminBookService.findBookTypes());
        //返回分页列表
        model.addAttribute("page", books);
        return "admin/safetystockmanaged";
    }
    /*-------------------安全库存管理 6.26-------------------------*/

    /*-------------------用户建议信息管理 6.26-------------------------*/
    /*跳转到用户建议信息管理界面*/
    @RequestMapping("/goSuggestManaged")
    public String SuggestManaged(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer rows, String content,
                                 HttpServletResponse response, Model model) {
        // 条件查询所有建议信息
        Page<Suggest> suggests = this.suggestService.findSuggestList(page, rows, content);
        //返回查询建议信息
        model.addAttribute("selectContent", content);
        //返回分页列表
        model.addAttribute("page", suggests);
        return "admin/suggestmanaged";
    }

    /*删除用户建议*/
    @RequestMapping("/deleteSuggestById")
    @ResponseBody
    public String deleteSuggestById(Integer id) {
        System.out.println(id);
        if (id != null) {
            Integer res = this.suggestService.deleteSuggest(id);
            if (res > 0) {
                return "OK";
            }
        }
        return "FAIL";
    }
    /*-------------------用户建议信息管理 6.26-------------------------*/
    /*-------------------用户订单管理 6.30-------------------------*/

    /*跳转到订单管理页面*/
    @RequestMapping("/goOrderManaged")
    public String goOrderManaged(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer rows, Integer state, String name,
                                 HttpServletResponse response, Model model) {
        // 条件查询所有订单信息
        Page<Orders> orders = this.userOrdersService.findOrderByInfo(page, rows, state, name);
        //返回订单状态信息
        model.addAttribute("state", state);
        //返回订单人信息
        model.addAttribute("name", name);
        //返回分页列表
        model.addAttribute("page", orders);
        return "admin/ordermanaged";
    }

    /*删除订单*/
    @RequestMapping("/delOrdersById")
    @ResponseBody
    public String delOrdersById(String id) {
        Integer res = this.userOrdersService.deleteOrdersByID(id);
        if (res == 0) return "FAIL";
        else return "OK";
    }

    /*查看订单信息*/
    @RequestMapping("/findOrderInfo")
    public String findOrderInfo(String id, Model model) {
//        System.out.println(this.userOrdersService.findOrdersByID(id));
        model.addAttribute("orderInfo", this.userOrdersService.findOrdersByID(id));
        return "admin/orderinfo";
    }
    /*-------------------用户订单管理 6.30-------------------------*/
}
