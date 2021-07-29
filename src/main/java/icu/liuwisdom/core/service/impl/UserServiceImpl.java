package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.core.dao.UserDao;
import icu.liuwisdom.core.po.User;
import icu.liuwisdom.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*用户服务类*/
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;//注入用户dao

    /*判断该手机号是否已经存在*/
    @Override
    public User findHasTel(String tel) {
//        System.out.println(tel);
        return this.userDao.selectHasTel(tel);
    }

    /*新增用户*/
    @Override
    public Integer addUser(User user) {
        return this.userDao.insertUser(user);
    }

    /*根据手机号和密码查询用户*/
    @Override
    public User findUserByTelAndPsd(String tel, String password) {
        User user = new User();
        user.setTel(tel);
        user.setPassword(password);
        return this.userDao.selectUser(user);
    }

    /*修改用户信息*/
    @Override
    public Integer alterUserByTel(User user) {
        return this.userDao.updateUserInfoByTel(user);
    }
}
