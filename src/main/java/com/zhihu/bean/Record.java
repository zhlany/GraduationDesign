package com.zhihu.bean;

import lombok.Data;

/**
 * @ClassName: Record
 * @Description: 记录表
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @param :
 * @return: null
 **/
@Data
public class Record {
    private int id;
    private String stuEmail; //学生邮箱
    private String comEmail; //公司邮箱
    private String jobName;  //兼职名
    private String applyState;  //申请的状态 0:待处理 1:已通过 2:未通过 4:已完成
    private String applyTime;   //申请的时间
    private String stuGrade;    //学生评分
    private String stuText;     //学生评价
    private String comGrade;    //企业评分
    private String comText;     //企业评价
    private String stuState;    //学生的兼职状态
    private String applyId;     //记录的ID

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStuEmail() {
        return stuEmail;
    }

    public void setStuEmail(String stuEmail) {
        this.stuEmail = stuEmail;
    }

    public String getComEmail() {
        return comEmail;
    }

    public void setComEmail(String comEmail) {
        this.comEmail = comEmail;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getApplyState() {
        return applyState;
    }

    public void setApplyState(String applyState) {
        this.applyState = applyState;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }

    public String getStuGrade() {
        return stuGrade;
    }

    public void setStuGrade(String stuGrade) {
        this.stuGrade = stuGrade;
    }

    public String getStuText() {
        return stuText;
    }

    public void setStuText(String stuText) {
        this.stuText = stuText;
    }

    public String getComGrade() {
        return comGrade;
    }

    public void setComGrade(String comGrade) {
        this.comGrade = comGrade;
    }

    public String getComText() {
        return comText;
    }

    public void setComText(String comText) {
        this.comText = comText;
    }

    public String getStuState() {
        return stuState;
    }

    public void setStuState(String stuState) {
        this.stuState = stuState;
    }

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }
}
