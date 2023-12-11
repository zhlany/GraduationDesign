package com.zhihu.bean;

import lombok.Data;
/**
 * @ClassName: User
 * @Description: 用户表
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @param :
 * @return: null
 **/
@Data
public class User {
    private int id;
    private String email;  //邮箱
    private String password;  //密码
    private String type;   //用户类型
    private String state;  //状态

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

