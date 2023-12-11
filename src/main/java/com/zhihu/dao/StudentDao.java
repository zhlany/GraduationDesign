package com.zhihu.dao;

import com.zhihu.bean.Allege;
import com.zhihu.bean.Record;
import com.zhihu.bean.Resume;
import com.zhihu.bean.Student;

import java.util.List;
import java.util.Map;

public interface StudentDao {

    //填写基本信息
    void comBasicInfo(Student student);
    //填写教育信息
    void comEduInfo(Student student);
    //填写自我介绍
    void comDescribe(Student student);
    //填写期望工作
    void comExpect(Student student);
    //通过邮箱获取student
    Student getStuByEmail(String email);
    //通过id获取resume
    Resume getResumeById(int id);
    //报名
    void stuApply(Map<String, Object> map);
    //通过email获取记录
    List<String> getRecordByEmail(String email);
    //显示报名记录
    List<Map<String,Object>> showRecord(String email);
    //评价公司
    void appCom(Record record);
    //删除
    void stuDel(int id);
    //学生申述
    void makeAllege(Allege allege);
    //显示学生申述
    List<Allege> showAllege(String email);
    //通过email获取收藏简历id
    List<String> getResumeIdByEmailInCollect(String email);
    //收藏
    Boolean stuCollect(Map<String, Object> map);
    //显示收藏
    List<Map<String,Object>> showCollect(String email);
    //取消收藏
    Boolean delCollect(Map<String, Object> map);
}
