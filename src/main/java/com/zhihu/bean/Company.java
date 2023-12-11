package com.zhihu.bean;

import lombok.Data;
/**
 * @ClassName: Company
 * @Description:  商家，公司信息
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @return: null
 **/
@Data
public class Company {
    private int id;
    private String email;  //邮箱
    private String name;   //公司名
    private String website;  //网站
    private String city;  //地点
    private String select_industry_hidden;  //领域
    private String select_scale_hidden;  //规模
    private String temptation;  //公司介绍
    private String principal;  //负责人
    private String phone;  //联系电话

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getSelect_industry_hidden() {
        return select_industry_hidden;
    }

    public void setSelect_industry_hidden(String select_industry_hidden) {
        this.select_industry_hidden = select_industry_hidden;
    }

    public String getSelect_scale_hidden() {
        return select_scale_hidden;
    }

    public void setSelect_scale_hidden(String select_scale_hidden) {
        this.select_scale_hidden = select_scale_hidden;
    }

    public String getTemptation() {
        return temptation;
    }

    public void setTemptation(String temptation) {
        this.temptation = temptation;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
