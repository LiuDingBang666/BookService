package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.AdminDao;
import icu.liuwisdom.core.po.User;
import icu.liuwisdom.core.service.AdminService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//管理员服务类
@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    //获得所有管理员信息
    @Override
    public Page<User> findUserList(Integer page, Integer rows, String name, String sex, String role) {

        // 创建用户对象
        User user = new User();
        // 判断用户名称
        if (StringUtils.isNotBlank(name)) {
            user.setName(name);
        }
        // 判断用户性别
        if (StringUtils.isNotBlank(sex)) {
            user.setSex(sex);
        }
        //判断用户角色
        if (StringUtils.isNotBlank(role)) {
            user.setRole(role);
        }
        // 当前页
        user.setStart((page - 1) * rows);
        // 每页数
        user.setRows(rows);
        // 查询客户列表
        List<User> admins =
                adminDao.selectAdminList(user);
        // 查询客户列表总记录数
        Integer count = adminDao.selectAdminListCount(user);
        // 创建Page返回对象
        Page<User> result = new Page<>();
        result.setPage(page);
        result.setRows(admins);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    //        添加用户
    @Override
    public Integer addUser(User user) {

        return this.adminDao.insertUser(user);
    }

    //通过手机号查询用户是否存在
    @Override
    public User findUserByTel(String tel) {
        return this.adminDao.selectUser(tel);
    }

    //通过手机号删除用户
    @Override
    public Integer deleteUserByTel(String tel) {
        return this.adminDao.deleteUserByTel(tel);
    }

    // 通过手机号修改改用户
    @Override
    public Integer alterUserByTel(User user, String oldTel) {
        return this.adminDao.alterUserByTel(user, oldTel);
    }

    //根据用户名和密码查找用户
    @Override
    public User findUserByNameAndPassword(User user) {

        return this.adminDao.selectUserByNameAndPassword(user);
    }


}



