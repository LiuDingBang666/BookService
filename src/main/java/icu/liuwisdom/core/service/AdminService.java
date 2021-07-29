package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.User;

import java.util.List;

//管理员服务接口
public interface AdminService {
    /*----用户管理----*/
    // 查询管理员列表
    public Page<User> findUserList(Integer page, Integer rows,
                                   String name, String sex, String role);

    /*新增用户信息*/
    public Integer addUser(User user);

    /*根据手机号查询用户信息*/
    public User findUserByTel(String tel);

    /*根据手机号删除用户信息*/
    public Integer deleteUserByTel(String tel);

    /*根据原手机号修改用户信息*/
    public Integer alterUserByTel(User user, String oldTel);

    /*----用户管理----*/

    /*根据用户名和密码查找用户*/
    public User findUserByNameAndPassword(User user);

}
