package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Orders;
import icu.liuwisdom.core.po.User;
import org.springframework.core.annotation.Order;

import java.util.List;

/*订单服务接口*/
public interface UserOrdersService {
    //    新增订单
    public Integer addOrder(Orders orders);

    //根据用户信息查找订单
    public List<Orders> findOrdersByUser(User user);

    //根据订单编号删除订单信息
    public Integer deleteOrdersByID(String id);

    //根据订单编号查询订单信息
    public Orders findOrdersByID(String id);

    //根据订单ID修改支付状态为已支付
    public Integer alterOrdersPaystateByID(String id);

    /*根据订单信息查询订单*/
    public Page<Orders> findOrderByInfo(Integer page, Integer rows,Integer state, String name);

}
