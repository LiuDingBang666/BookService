package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.User;
import org.apache.ibatis.annotations.Param;

//用户接口
public interface UserDao {
    /*判断该手机号是否已经存在*/
    public User selectHasTel(String tel);

    /*新增用户*/
    public Integer insertUser(User user);

    /*根据手机号和密码查询用户*/
    public User selectUser(User user);

    /*根据用户id查询用户信息*/
    public User selectUserById(Integer id);


    /*根据手机号修改用户信息*/
    public Integer updateUserInfoByTel(@Param("user") User user);

}



