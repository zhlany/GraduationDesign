package com.zhihu.bean;

import lombok.Data;
/**
 * @ClassName: Allege
 * @Description:  申诉表
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @param :
 * @return: null
 **/
@Data
public class Allege {
    private int id;  //申诉者ID
    private int allId;  //申诉对象ID
    private String email;      //申诉者邮箱
    private String allEmail;   //申诉对象邮箱
    private String allReason;  //原因
    private String allText;    //描述
    private String allState;   //处理的状态
    private String allTime;    //申诉的时间
    private String dealText;   //处理的结果（回复）
    private String dealTime;   //处理的时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAllId() {
        return allId;
    }

    public void setAllId(int allId) {
        this.allId = allId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAllEmail() {
        return allEmail;
    }

    public void setAllEmail(String allEmail) {
        this.allEmail = allEmail;
    }

    public String getAllReason() {
        return allReason;
    }

    public void setAllReason(String allReason) {
        this.allReason = allReason;
    }

    public String getAllText() {
        return allText;
    }

    public void setAllText(String allText) {
        this.allText = allText;
    }

    public String getAllState() {
        return allState;
    }

    public void setAllState(String allState) {
        this.allState = allState;
    }

    public String getAllTime() {
        return allTime;
    }

    public void setAllTime(String allTime) {
        this.allTime = allTime;
    }

    public String getDealText() {
        return dealText;
    }

    public void setDealText(String dealText) {
        this.dealText = dealText;
    }

    public String getDealTime() {
        return dealTime;
    }

    public void setDealTime(String dealTime) {
        this.dealTime = dealTime;
    }
}
