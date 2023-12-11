package com.zhihu.dao;

import com.zhihu.bean.*;

import java.util.List;
import java.util.Map;

public interface CompanyDao {
    //完善企业信息
    void CompleteCom(Company company);
    //通过邮箱获取信息
    Company getComByEm(String email);
    //通过邮箱编辑公司介绍
    void UpdateTem(Company company);
    //通过邮箱编辑公司负责人
    void UpdateMe(Company company);
    //通过邮箱编辑公司基本信息
    void UpdateUrl(Company company);
    //通过邮箱编辑公司名称
    void UpdateName(Company company);
    //公司名称列表
    Company isName(String name);
    //公司名称列表
    Resume isJobName(String jobName);
    //判断Job是否存在
    Resume isJob(Resume resume);
    //通过email获取兼职列表
    List<Resume> getResume(String email);
    //完善兼职信息
    void comJob(Resume resume);
    //完善兼职信息
    void editJob(Resume resume);
    //通过邮箱得到兼职信息
    List<Resume> disResume(String email);
    //获取所有有效兼职
    List<Resume> allResume();
    //通过名称获取兼职
    List<Resume> findResume(String jobName);
    //下线兼职
    void downResume(int id);
    //删除兼职
    void delResume(int id);
    //上线线兼职
    void upResume(int id);
    //通过id获取兼职
    Resume getResumeById(int id);
    //获取用户密码
    String getPassword(String email);
    //修改密码
    void editPwd(User user);
    //显示报名
    List<Map<String,Object>> showAp(String email);
    //通过
    void passApply(int id);
    //不通过
    void unPassApply(int id);
    //删除
    void delApply(int id);
    //完成
    void comApply(int id);
    //获取student信息
    Student getStudent(int id);
    //评价学生
    void appStu(Record record);
    //公司申述
    void makeAllege(Allege allege);
    //显示公司申述
    List<Allege> showAllege(String email);

}
