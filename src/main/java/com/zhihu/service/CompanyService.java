package com.zhihu.service;


import com.zhihu.bean.*;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    //完善企业信息
    Boolean CompleteCo(Company company);
    //获取企业信息
    Company Display(String email);
    //编辑公司介绍
    Company UpdateTem(Company company);
    //编辑公司负责人
    Company UpdateMe(Company company);
    //编辑公司基本信息
    Company UpdateUrl(Company company);
    //编辑公司名称
    Company UpdateName(Company company);
    //判断公司名称是否已存在
    Boolean isName(String name);
    //判断兼职名称是否已存在
    Boolean isJobName(String jobName, String email);
    Boolean isJob(Resume resume);
    //完善兼职信息
    Boolean comJob(Resume resume);
    //获取兼职信息
    List<Resume> disResume(String email);
    //获取所以有效兼职信息
    List<Resume> allResume();
    //通过名称获取兼职
    List<Resume> findResume(String jobName);
    //下线兼职
    Boolean downResume(int id);
    //上线兼职
    Boolean upResume(int id);
    //删除兼职
    Boolean delResume(int id);
    //通过ID获取兼职信息
    Resume getResumeById(int id);
    //修改兼职
    Boolean editJob(Resume resume);
    //验证密码
    Boolean verPwd(String email, String password);
    //修改密码
    Boolean editPwd(User user);
    //显示报名
    List<Map<String,Object>> showAp(String email);
    //通过
    Boolean passApply(int id);
    //不通过
    Boolean unPassApply(int id);
    //删除
    Boolean delApply(int id);
    //完成
    Boolean comApply(int id);
    Student getStudent(int id);
    //验证公司系信息是否完善
    String checkCompany(String email);
    //评价学生
    Boolean appStu(Record record);
    //公司申述
    Boolean Allege(Allege allege);
    //显示申述
    List<Allege> showAllege(String email);
}
