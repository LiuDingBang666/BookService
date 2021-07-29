package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.Orders;
import icu.liuwisdom.core.po.User;

import java.util.List;

//订单接口
public interface OrderDao {

    /*新增订单*/
    public Integer insertOrder(Orders orders);

    /*根据用户信息查询订单*/
    public List<Orders> selectOrderByUser(User user);

    /*根据订单ID查询订单*/
    public Orders selectOrderByID(String id);

    /*根据订单ID删除订单*/
    public Integer deleteOrderById(String id);

    /*根据订单ID修改支付状态为已支付*/
    public Integer updateOrderState(String id);

    /*根据订单信息查询订单*/
    public List<Orders> selectOrderByInfo(Orders orders);

    /*查询订单信息数量*/
    public Integer selectOrderCount(Orders orders);
}
