package icu.liuwisdom.core.controller;

import icu.liuwisdom.common.utils.*;
import icu.liuwisdom.core.po.*;
import icu.liuwisdom.core.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/*
 * 用户控制器
 * */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;//注入用户服务接口类
    @Autowired
    private UserBookService userBookService;//  注入用户图书服务接口类
    @Autowired
    private UserNoticeService userNoticeService;//注入用户公告服务接口类
    @Autowired
    private UserOrdersService userOrdersService;//注入订单服务类接口
    @Autowired
    private SuggestService suggestService; //注入用户建议信息服务接口

    /*--------------------用户管理-------------------*/
    /*页面跳转*/

    // 跳转到用户注册界面
    @RequestMapping("/goRegister")
    public String goRegister() {
        return "user/register";
    }

    //跳转到登录界面
    @RequestMapping("/goLogin")
    public String goLogin() {
        return "user/login";
    }


    /*跳转到首页*/
    @RequestMapping("/goIndex")
    public String goIndex(@RequestParam(defaultValue = "1") Integer page,
                          @RequestParam(defaultValue = "30") Integer rows,
                          String name, String category,
                          HttpServletResponse response, Model model) {
        // 条件查询所有管理员
        Page<Book> books = this.userBookService.findBookList(page, rows, name, category);
        Book book = new Book();
        book.setName(name);
        book.setCategory(category);
        //返回用户查询图书名
        model.addAttribute("selectBook", book);
        //返回热销图书
        model.addAttribute("hotBooks", this.userBookService.findHotBooks());
        //返回分页列表
        model.addAttribute("page", books);
        return "user/index";
    }

    /*跳转到关于我们*/
    @RequestMapping("/goAoubt")
    public String goAoubt() {
        return "user/about";
    }

    /*跳转到我的个人中心*/
    @RequestMapping("/goInfo")
    public String goInfo(Model model, HttpSession session) {
        //1.返回公告信息
        model.addAttribute("Notices", this.userNoticeService.findAllNotices());
        //2.返回订单信息
        model.addAttribute("Orders", this.userOrdersService.findOrdersByUser((User) session.getAttribute("USER_SESSION")));
        return "user/info";
    }


    /*跳转到购物车页面*/
    @RequestMapping("/goCart")
    public String goCart() {
        return "user/cart";
    }

    //发送验证码
    @RequestMapping("/sendMsg")
    @ResponseBody
    public String sendMsg(String tel) {
        System.out.println(tel);
        //发送验证码给指定手机号用户
        try {
            //获取随机验证码
            String code = AuthCodeUtil.getCode();
            //调用短信接口
            SendSmsUtil.sendSms(code, tel);
            //存储验证码
            RedisUtil.redisSend(tel, code);
        } catch (Exception e) {
            e.printStackTrace();
            return "FAIL";
        }
        return "OK";
    }

    //用户注册
    @ResponseBody
    @RequestMapping("/registerCheck")
    public String registerCheck(User user, String code, HttpSession session) {
        if (user == null || (code.trim().equals("") || code == null)) {
            return "Null";
        }
        //封装用户对象
        String tel = user.getTel();
        //判断该手机号是否已被注册
        User nowUser = this.userService.findHasTel(tel);
        if (nowUser != null) return "HasUser";
        //判断验证码是否一致
        if (!RedisUtil.getCode(tel).equals(code)) return "AuthFail";
        //新增用户
        this.userService.addUser(user);
        //保存用户信息
        session.setAttribute("USER_SESSION", user);
        return "OK";
    }


    //用户登录检查
    @RequestMapping("/loginCheck")
    public String loginCheck(String tel, String password, HttpSession session, String authcode, Model model) {
        //验证码判断
        if (!authcode.equalsIgnoreCase((String) session.getAttribute("check_code"))) {
            model.addAttribute("msg", "验证码有误！");
            return "user/login";
        }
        //查询用户
        User user = this.userService.findUserByTelAndPsd(tel, password);
        if (user == null) {
            model.addAttribute("msg", "手机号或密码有误！");
            return "user/login";
        }
        session.setAttribute("USER_SESSION", user);
        return "redirect:/user/goIndex";
    }


    /*用户退出登录*/
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "redirect:/user/index";
    }
    /*--------------------用户管理-------------------*/

    /*--------------------图书操作管理-------------------*/
    /*跳转到图书详细信息页面*/
    @RequestMapping("/goBook")
    public String goBook(String id, Model model) {
        Book book = this.userBookService.findBookInfoById(id);
        model.addAttribute("Book", book);
        //获取其他图书
        model.addAttribute("otherBook", this.userBookService.findRandomBook());
        return "user/book";
    }

    /*将商品加入购物车
     * 商品ID/
     * */
    @RequestMapping("/joinCart")
    @ResponseBody
    public String joinCart(String id, HttpSession session) {
        //判断商品是否存在并且库存是否足够
        Book book = this.userBookService.findBookByIdAndStock(id);
        if (book == null) return "FAIL";
        //加入购物车操作
        //1.判断是否存在购物车
        Map<Book, Integer> cart = (Map<Book, Integer>) session.getAttribute("cart");
        //System.out.println(cart);
        //判断购物车是否存在,不存在则创建一个购物车
        if (cart == null) {
            //创建购物车
            cart = new HashMap<Book, Integer>();
        }
        //3.4向购物车中添加商品
        Integer count = cart.put(book, 1);
        //3.5如果商品数量不为空，则商品数量+1，否则添加新的商品信息
        if (count != null) {
            cart.put(book, count + 1);
        }
        session.setAttribute("cart", cart);
        return "OK";
    }

    /*将购物车的指定商品删除
     * 商品ID和删除数量
     * */
    @RequestMapping("/clearCartBookById")
    @ResponseBody
    public String clearCartBookById(String id, String type, Integer num, HttpSession session) {
        // System.out.println("商品ID" + id);
        //查找该书籍是否存在
        Book book = this.userBookService.findBookInfoById(id);
        if (book == null) return "FAIL";
        //获取购物车
        Map<Book, Integer> cart = (Map<Book, Integer>) session.getAttribute("cart");
        //向购物车中添加商品信息
        Integer count = cart.put(book, 1);
        //如果商品数量不为空，则商品数量进行相应修改，否则添加新的商品信息
        if (count != null) {
            //根据用户操作修改相关商品
            if (type.equals("add")) {
                //增加商品
                cart.put(book, count + 1);
            } else if (type.equals("alt")) {
                //修改商品
                cart.put(book, num);
            } else if (type.equals("sub")) {
                //减少商品
                cart.put(book, count - 1);
            } else {
                //清空该商品
                cart.remove(book);
            }

        }
        return "OK";
    }

    /*--------------------图书操作管理-------------------*/
    /*--------------------订单操作管理-------------------*/
    /*跳转到订单结算页面*/
    @RequestMapping("/goSettlement")
    public String goSettlement() {
        return "user/orderSettlement";
    }

    /*提交订单页面*/
    @RequestMapping("/submitOrder")
    public String submitOrder(Orders orders, HttpSession session) {
        //1.获得用户
        User user = (User) session.getAttribute("USER_SESSION");
        //2.获取购物车
        Map<Book, Integer> cart = (Map<Book, Integer>) session.getAttribute("cart");
        // 3.将数据封装到订单对象中
        orders.setOrderid(IdUtils.getUUID());
        orders.setUser(user);
        for (Book b : cart.keySet()) {
            OrderItem item = new OrderItem();
            item.setOrders(orders);
            item.setBuynum(cart.get(b));
            item.setBook(b);
            orders.getOrderItems().add(item);
        }
        // 4.调用service中添加订单操作.
        Integer res = this.userOrdersService.addOrder(orders);
        if (res > 0) {
            //清空购物车
            session.setAttribute("cart", null);
        }
        return "redirect:/user/goInfo";
    }

    /*删除订单*/
    @RequestMapping("/delOrdersById")
    public String delOrdersById(String id) {
        this.userOrdersService.deleteOrdersByID(id);
        return "redirect:/user/goInfo";
    }

    /*查看订单信息*/
    @RequestMapping("/findOrderInfo")
    public String findOrderInfo(String id, Model model) {
        System.out.println(this.userOrdersService.findOrdersByID(id));
        model.addAttribute("orderInfo", this.userOrdersService.findOrdersByID(id));
        return "user/orderInfo";
    }

    /*订单支付*/
    @RequestMapping("/orderPayment")
    @ResponseBody
    public String orderPayment(String id) {
        System.out.println(id);
        Integer res = this.userOrdersService.alterOrdersPaystateByID(id);
        if (res == 0) {
            return "FAIL";
        }
        return "OK";
    }
    /*--------------------订单操作管理-------------------*/


    /*--------------------用户信息管理-------------------*/

    /*修改用户信息*/
    @RequestMapping("/alterUserInfo")
    @ResponseBody
    public String alterUserInfo(User user, HttpSession session) {
        System.out.println(user);
        //1、获取用户信息
        User nowUser = (User) session.getAttribute("USER_SESSION");
        user.setTel(nowUser.getTel());
        //2、更改出生日期格式
        //2、修改用户信息
        Integer res = this.userService.alterUserByTel(user);
        if (res == 0) return "FAIL";
        //3、更新用户信息
        session.setAttribute("USER_SESSION", this.userService.findHasTel(nowUser.getTel()));
        return "OK";
    }

    /*--------------------用户信息管理-------------------*/
    /*--------------------关于我们 6.26-------------------*/
    @RequestMapping("addSuggest")
    @ResponseBody
    public String addSuggest(Suggest suggest, HttpSession session) {
        System.out.println(suggest);
        /*获取上传人*/
        User user = (User) session.getAttribute("USER_SESSION");
        suggest.setProposer(user.getName());
        Integer res = this.suggestService.addSuggest(suggest);
        if (res == 0) {
            return "FAIL";
        }
        ;
        return "OK";

    }
    /*--------------------关于我们 6.26-------------------*/
}
