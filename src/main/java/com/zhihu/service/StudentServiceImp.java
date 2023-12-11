package com.zhihu.service;


import com.zhihu.bean.Allege;
import com.zhihu.bean.Record;
import com.zhihu.bean.Resume;
import com.zhihu.bean.Student;
import com.zhihu.dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImp implements StudentService{
    @Autowired
    StudentDao sDao;

    //填写基本信息
    public Boolean comBasicInfo(Student student) {
        Boolean result = false;
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        student.setUpTime(ft.format(dNow));
        sDao.comBasicInfo(student);
        result = true;
        return result;
    }

    //填写教育信息
    public Boolean comEduInfo(Student student) {
        Boolean result = false;
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        student.setUpTime(ft.format(dNow));
        sDao.comEduInfo(student);
        result = true;
        return result;
    }

    //自我介绍
    public Boolean comDescribe(Student student) {
        Boolean result = false;
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        student.setUpTime(ft.format(dNow));
        sDao.comDescribe(student);
        result = true;
        return result;
    }

    //期望工作
    public Boolean comExpect(Student student) {
        Boolean result = false;
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        student.setUpTime(ft.format(dNow));
        sDao.comExpect(student);
        result = true;
        return result;
    }

    //判断信息是否存在
    public Boolean isStu(String email) {
        Boolean result = false;
        Student student = sDao.getStuByEmail(email);
        if(student!=null){
            result = true;
        }
        return result;
    }

    public Student getStuByEmail(String email) {
        return sDao.getStuByEmail(email);
    }

    //报名
    public Boolean stuApply(String email, int id) {
        Boolean result = false;
        Resume resume = sDao.getResumeById(id);
        Map<String,Object> map = new HashMap<String,Object>();
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        String applyTime =ft.format(dNow);
        map.put("applyTime",applyTime);
        map.put("stuEmail",email);
        map.put("comEmail",resume.getEmail());
        map.put("jobName",resume.getJobName());
        map.put("applyId",Integer.toString(id));
        sDao.stuApply(map);
        result = true;
        return result;
    }

    //是否报名
    public Boolean isApply(String email, int id) {
        Boolean result = false;
        List<String> reList = sDao.getRecordByEmail(email);
        for (String applyId:reList) {
            if(applyId!=null&&applyId!=""){
                if(applyId.equals(Integer.toString(id))){
                    result = true;
                    break;
                }
            }
        }

        return result;
    }

    //显示报名记录
    public List<Map<String,Object>> showRecord(String email) {
        return sDao.showRecord(email);
    }

    //收藏
    public Boolean stuCollect(String email, int id) {
        Boolean result = false;
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("stuEmail",email);
        map.put("resumeId",Integer.toString(id));
        sDao.stuCollect(map);
        result = true;
        return result;
    }

    //是否收藏
    public Boolean isCollect(String email, int resume_Id) {
        List<String> reList = sDao.getResumeIdByEmailInCollect(email);
        for (String resumeId:reList) {
            if(resumeId!=null&&resumeId!=""){
                if(resumeId.equals(Integer.toString(resume_Id))){
                    return true;
                }
            }
        }
        return false;
    }

    //显示收藏
    public List<Map<String, Object>> showCollect(String email) {
        return sDao.showCollect(email);
    }

    //取消收藏
    public Boolean delCollect(String email, int id) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("stuEmail",email);
        map.put("resumeId",Integer.toString(id));
        return sDao.delCollect(map);
    }

    //检查学生信息是否完整
    public String checkStudent(String email) {
        String tip = "";
        Student student = sDao.getStuByEmail(email);
        if(StringUtils.isEmpty(student)){
            tip = "只有学生用户才可以报名!";
        }else {
            if(student.getName()==null ||student.getName().length()<=0){
                tip = "请先填写用户姓名，完整的信息才可以报名！";
            }else if(student.getSex()==null || student.getSex().length()<=0){
                tip = "请先填写用户性别，完整的信息才可以报名！";
            }else if(student.getAge()==null || student.getAge().length()<=0){
                tip = "请先填写用户年龄，完整的信息才可以报名！";
            }else if(student.getHeight()==null || student.getHeight().length()<=0){
                tip = "请先填写用户身高，完整的信息才可以报名！";
            }else if(student.getWeight()==null || student.getWeight().length()<=0){
                tip = "请先填写用户体重，完整的信息才可以报名！";
            }else if(student.getSchool()==null || student.getSchool().length()<=0){
                tip = "请先填写用户就读学校，完整的信息才可以报名！";
            }else if(student.getRank()==null || student.getRank().length()<=0){
                tip = "请先填写用户学历，完整的信息才可以报名！";
            }else if(student.getPhone()==null || student.getPhone().length()<=0){
                tip = "请先填写用户手机号码，完整的信息才可以报名！";
            }else if(student.getFreeTime()==null || student.getFreeTime().length()<=0){
                tip = "请先填写用户空余时间，完整的信息才可以报名！";
            }else{
                tip = "success";
            }
        }
        return tip;
    }

    //评价公司
    public Boolean appCom(Record record) {
        Boolean result = false;
        sDao.appCom(record);
        result = true;
        return result;
    }

    //删除
    public Boolean stuDel(int id) {
        Boolean result = false;
        sDao.stuDel(id);
        result = true;
        return result;
    }

    //申述
    public Boolean Allege(Allege allege) {
        Boolean result = false;
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        allege.setAllTime(ft.format(dNow));
        sDao.makeAllege(allege);
        result = true;
        return result;
    }

    //显示学生申述
    public List<Allege> showAllege(String email) {
        return sDao.showAllege(email);
    }
}
