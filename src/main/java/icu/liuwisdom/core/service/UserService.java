package icu.liuwisdom.core.service;

import icu.liuwisdom.core.po.User;
import org.apache.ibatis.annotations.Param;

//用户服务接口
public interface UserService {
    /*判断该手机号是否已经存在*/
    public User findHasTel(String tel);

    /*新增用户*/
    public Integer addUser(User user);

    /*根据手机号和密码查询该用户是否存在*/
    public User findUserByTelAndPsd(String tel, String password);

    /*修改用户信息*/
    public Integer alterUserByTel( User user);
}
