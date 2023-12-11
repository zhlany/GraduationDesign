package com.zhihu.bean;

import lombok.Data;
/**
 * @ClassName: Student
 * @Description:  简历表
 * @Author: 蓝芝护
 * @Date: 2022/5/1
 * @param :
 * @return: null
 **/
@Data
public class Student {
    private int id;
    private String name;  //姓名
    private String email; //邮箱
    private String age;   //性别
    private String sex;   //年龄
    private String height;      //身高
    private String weight;  //体重
    private String phone;  //电话
    private String school; //学校
    private String rank;  //学历
    private int beginYear;  //就读时间
    private int endYear;  //毕业时间
    private String freeTime;  //空闲时间
    private String exJob;  //意向兼职
    private String exSite; //意向地点
    private String introduce;  //自我描述
    private String upTime;  //更新时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public int getBeginYear() {
        return beginYear;
    }

    public void setBeginYear(int beginYear) {
        this.beginYear = beginYear;
    }

    public int getEndYear() {
        return endYear;
    }

    public void setEndYear(int endYear) {
        this.endYear = endYear;
    }

    public String getFreeTime() {
        return freeTime;
    }

    public void setFreeTime(String freeTime) {
        this.freeTime = freeTime;
    }

    public String getExJob() {
        return exJob;
    }

    public void setExJob(String exJob) {
        this.exJob = exJob;
    }

    public String getExSite() {
        return exSite;
    }

    public void setExSite(String exSite) {
        this.exSite = exSite;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getUpTime() {
        return upTime;
    }

    public void setUpTime(String upTime) {
        this.upTime = upTime;
    }
}

