package icu.liuwisdom.core.po; /***********************************************************************
 * Module:  Book.java
 * Author:  LDB
 * Purpose: Defines the Class Book
 ***********************************************************************/

import java.util.*;

/*图书POJO*/
public class Book {
    private String bookid;//图书编号
    private String name;//图书名字
    private float price;//价格
    private String category;//图书分类
    private int num;//数量
    private String imgurl;//图书地址
    private String description;//描述
    private Date addtime;//添加时间
    private int buynum;//购买数量
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

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", category='" + category + '\'' +
                ", num=" + num +
                ", imgurl='" + imgurl + '\'' +
                ", description='" + description + '\'' +
                ", addtime=" + addtime +
                ", buynum=" + buynum +
                '}';
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((bookid == null) ? 0 : bookid.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Book other = (Book) obj;
        if (bookid == null) {
            if (other.bookid != null)
                return false;
        } else if (!bookid.equals(other.bookid))
            return false;
        return true;
    }

}