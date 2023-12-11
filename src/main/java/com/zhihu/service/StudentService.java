package com.zhihu.service;


import com.zhihu.bean.Allege;
import com.zhihu.bean.Record;
import com.zhihu.bean.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {

    //填写基本信息
    Boolean comBasicInfo(Student student);
    //填写教育信息
    Boolean comEduInfo(Student student);
    //填写自我介绍
    Boolean comDescribe(Student student);
    //填写期望工作
    Boolean comExpect(Student student);
    //通过邮箱获取student
    Student getStuByEmail(String email);
    //判断信息是否存在
    Boolean isStu(String email);
    //报名
    Boolean stuApply(String email, int id);
    //判断是否报名
    Boolean isApply(String email, int id);
    //显示报名记录
    List<Map<String,Object>> showRecord(String email);
    //收藏
    Boolean stuCollect(String email, int id);
    //是否收藏
    Boolean isCollect(String email, int id);
    //显示收藏
    List<Map<String,Object>> showCollect(String email);
    //取消收藏
    Boolean delCollect(String email,int id);
    //检查学生信息是否完整
    String checkStudent(String email);
    //评价公司
    Boolean appCom(Record record);
    //删除
    Boolean stuDel(int id);
    //学生申述
    Boolean Allege(Allege allege);
    //显示学生申述
    List<Allege> showAllege(String email);



}
