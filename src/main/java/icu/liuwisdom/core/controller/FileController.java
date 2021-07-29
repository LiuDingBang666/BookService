package icu.liuwisdom.core.controller;

import icu.liuwisdom.common.utils.ImageFormatValidation;
import icu.liuwisdom.common.utils.file.OSSUtil;
import icu.liuwisdom.core.po.User;
import icu.liuwisdom.core.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLEncoder;

/*文件控制器*/
@Controller
public class FileController {
    @Autowired
    private OSSUtil ossUtil;
    @Autowired
    private UserService userService;

    /*用户头像上传*/
    @RequestMapping("/goFileUpload")
    public String goFileUpload(String type, @RequestParam("file") MultipartFile multipartFile, HttpSession session, Model model) {
        //获得用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        //文件类型检查
        String ext = multipartFile.getOriginalFilename();
        boolean res = ImageFormatValidation.FormatValidation(ext.substring(ext.lastIndexOf(".")));
        if (!res) {
            model.addAttribute("msg", "上传文件类型有误，请重新上传！");
        } else {
            //如果头像已存在，则替换
            if (user.getImgurl() != null) {
                String imgUrl = user.getImgurl().substring(user.getImgurl().indexOf("signature"));
                ossUtil.deleteFile(imgUrl);
            }
            String url = ossUtil.uploadFile(multipartFile, type);
            //更新头像地址
            user.setImgurl(url);
            this.userService.alterUserByTel(user);
            //更新用户信息
            session.setAttribute("USER_SESSION", this.userService.findHasTel(user.getTel()));
        }
        return "redirect:/user/goInfo";
    }
}
