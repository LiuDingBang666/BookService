package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.BookDao;
import icu.liuwisdom.core.dao.OrderDao;
import icu.liuwisdom.core.dao.OrderItemDao;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.OrderItem;
import icu.liuwisdom.core.po.Orders;
import icu.liuwisdom.core.po.User;
import icu.liuwisdom.core.service.UserOrdersService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*订单服务实现类*/
@Service
@Transactional
public class UserOrdersServiceImpl implements UserOrdersService {
    @Autowired
    private OrderDao orderDao;//注入订单dao
    @Autowired
    private BookDao bookDao;//注入图书dao
    @Autowired
    private OrderItemDao orderItemDao;//注入订单项dao

    //新增订单
    @Override
    public Integer addOrder(Orders orders) {
        // 2.1向orders表中添加数据
        int res = this.orderDao.insertOrder(orders);
        List<OrderItem> orderItems = orders.getOrderItems();
        for (OrderItem orderItem : orderItems) {/*循环出每一个订单项*/
            // 2.2向orderItem表中添加数据
            this.orderItemDao.insertOrderItem(orderItem);
            // 2.3修改商品表中数据
            this.bookDao.updateBookNum(orderItem);
        }
        return res;
    }

    //根据用户信息查找订单
    @Override
    public List<Orders> findOrdersByUser(User user) {
        return this.orderDao.selectOrderByUser(user);
    }

    //根据订单编号删除订单信息
    @Override
    public Integer deleteOrdersByID(String id) {
        //1、根据id查找订单项
        Orders orders = this.orderDao.selectOrderByID(id);
        //2、根据订单项中的图书id和库存修改图书数量
        List<OrderItem> orderItems = orders.getOrderItems();
        for (OrderItem orderItem : orderItems) {
            String bookid = orderItem.getBook().getBookid();
            Integer num = orderItem.getBuynum();
            this.bookDao.updateBookNumById(bookid, num);
        }
        //3、删除订单下的所有订单项
        this.orderItemDao.deleteOrderItem(id);
        //4、删除订单
        int res = this.orderDao.deleteOrderById(id);
        return res;
    }

    //根据订单编号查询订单信息
    @Override
    public Orders findOrdersByID(String id) {
        //1、根据id查找订单项
        Orders orders = this.orderDao.selectOrderByID(id);
        return orders;
    }

    //根据订单ID修改支付状态为已支付
    @Override
    public Integer alterOrdersPaystateByID(String id) {
        //1、修改图书销量
        Orders orders = this.orderDao.selectOrderByID(id);
        List<OrderItem> orderItems = orders.getOrderItems();
        for (OrderItem orderItem : orderItems) {
            Book book = new Book();
            book.setBookid(orderItem.getBook().getBookid());
            book.setBuynum(orderItem.getBuynum());
            Integer res = this.bookDao.updateBookBuyNum(book);
//            System.out.println(res);
        }
        //2、修改订单信息
        return this.orderDao.updateOrderState(id);
    }

    /*根据订单信息查询订单*/
    @Override
    public Page<Orders> findOrderByInfo(Integer page, Integer rows, Integer state, String name) {
        // 创建订单对象
        Orders orders = new Orders();
        // 判断订单状态
        if (state != null) {
            orders.setPaystate(state);
        }
        // 判断用户名
        if (StringUtils.isNotBlank(name)) {
            User user = new User();
            user.setName(name);
            orders.setUser(user);
        }
        // 当前页
        orders.setStart((page - 1) * rows);
        // 每页数
        orders.setRows(rows);
        // 查询订单列表
        List<Orders> ordersResult =
                this.orderDao.selectOrderByInfo(orders);
        // 查询订单列表总记录数
        Integer count = this.orderDao.selectOrderCount(orders);
        // 创建Page返回对象
        Page<Orders> result = new Page<>();
        result.setPage(page);
        result.setRows(ordersResult);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

}
