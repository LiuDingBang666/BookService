package icu.liuwisdom.core.po; /***********************************************************************
 * Module:  OrderItem.java
 * Author:  LDB
 * Purpose: Defines the Class OrderItem
 ***********************************************************************/


import java.util.*;

/*订单项POJO*/
public class OrderItem {
    private int buynum;//购买数量
    private Orders orders;//订单
    private Book book;//图书



    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}