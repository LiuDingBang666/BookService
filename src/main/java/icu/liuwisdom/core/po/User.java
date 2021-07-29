package icu.liuwisdom.core.po; /***********************************************************************
 * Module:  User.java
 * Author:  LDB
 * Purpose: Defines the Class User
 ***********************************************************************/

import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

/*用户POJO*/
public class User {
    private long userid;//用户id
    private String name;//用户名
    private String tel;//手机号
    private String password;//密码
    private String sex;//性别
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;//生日
    private String role;//角色
    private int state = 0;//状态
    private String signature;//个性签名
    private String imgurl;//图片URL
    private String receiverAddress;//默认收获地址
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
        return "User{" +
                "userid=" + userid +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", role='" + role + '\'' +
                ", state=" + state +
                ", signature='" + signature + '\'' +
                ", imgurl='" + imgurl + '\'' +
                ", receiverAddress='" + receiverAddress + '\'' +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }
}