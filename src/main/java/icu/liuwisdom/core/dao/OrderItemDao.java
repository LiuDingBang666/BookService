package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.OrderItem;
import icu.liuwisdom.core.po.Orders;

//订单项接口
public interface OrderItemDao {
    /*新增订单项*/
    public Integer insertOrderItem(OrderItem orderItem);

    /*根据订单编号删除订单项*/
    public Integer deleteOrderItem(String id);
}
