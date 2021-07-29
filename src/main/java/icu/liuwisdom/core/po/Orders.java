package icu.liuwisdom.core.po; /***********************************************************************
 * Module:  Orders.java
 * Author:  LDB
 * Purpose: Defines the Class Orders
 ***********************************************************************/

import java.util.*;

public class Orders {
    private String orderid;//订单编号
    private float money;//金额
    private int userid;//用户id
    private String receiverAddress;//收获地址
    private String receiverPhone;//收获手机号
    private String receiverName; // 收货人姓名
    private int paystate;//支付状态
    private Date ordertime;//生成时间
    private User user; // 订单所属用户
    private List<OrderItem> orderItems = new ArrayList<OrderItem>();//订单所属订单项
    private Integer start;            // 起始行
    private Integer rows;             // 所取行数

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }



    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReveicerPhone() {
        return receiverPhone;
    }

    public void setReveicerPhone(String reveicerPhone) {
        this.receiverPhone = reveicerPhone;
    }

    public int getPaystate() {
        return paystate;
    }

    public void setPaystate(int paystate) {
        this.paystate = paystate;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderid='" + orderid + '\'' +
                ", money=" + money +
                ", userid=" + userid +
                ", receiverAddress='" + receiverAddress + '\'' +
                ", receiverPhone='" + receiverPhone + '\'' +
                ", receiverName='" + receiverName + '\'' +
                ", paystate=" + paystate +
                ", ordertime=" + ordertime +
                ", user=" + user +
                ", orderItems=" + orderItems +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }
}