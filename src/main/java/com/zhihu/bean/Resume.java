package com.zhihu.bean;

import lombok.Data;

/**
 * @ClassName: Resume
 * @Description:  兼职表
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @param :
 * @return: null
 **/
@Data
public class Resume {
    private int id;
    private String email;  //邮箱
    private String jobType;  //兼职类型
    private String jobName;  //兼职名
    private String department;  //地点
    private String number;  //要的人数
    private String deRequest; //兼职的要求
    private String detail;  //描述
    private String salary;  //薪资
    private String time;  //发布的时间
    private String state;  //兼职状态

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

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDeRequest() {
        return deRequest;
    }

    public void setDeRequest(String deRequest) {
        this.deRequest = deRequest;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
