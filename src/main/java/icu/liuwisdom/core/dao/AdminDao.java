package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {
    /*获取所有管理员信息*/
    public List<User> selectAdminList(User user);

    /*管理员数*/
    public Integer selectAdminListCount(User user);

    /*新增用户信息*/
    public Integer insertUser(User user);

    /*根据手机号查询用户信息*/
    public User selectUser(String tel);

    /*根据手机号删除用户信息*/
    public Integer deleteUserByTel(String tel);

    /*根据手机号修改用户信息*/
    public Integer alterUserByTel(@Param("user") User user, @Param("oldtel") String oldtel);

    /*根据用户名和密码查找用户*/
    public User selectUserByNameAndPassword(User user);
}
