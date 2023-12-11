package com.zhihu.dao;

import com.zhihu.bean.Allege;
import com.zhihu.bean.Company;
import com.zhihu.bean.Student;
import com.zhihu.bean.User;

import java.util.List;

public interface UserDao {
    //注册
    void Register(User user);
    //添加企业
    void addCompany(String email);
    //添加学生
    void addStudent(String email);
    //通过email获取用户
    User getEmail(String email);
    //通过email获取企业
    Company getComByEmail(String email);
    //通过email获取学生
    Student getStuByEmail(String email);
    List<User> listStu();
    //用户列表
    List<User> listUser(User user);
    //删除用户
    void delUser(int id);
    //锁定用户
    void lockUser(int id);
    //解锁用户
    void clearUser(int id);
    //修改密码
    void updatePassword(User user);
    //通过id获取用户
    User getUserById(int id);
    //申述列表
    List<Allege> listAllege(Allege allege);
    //通过id获取申述
    Allege getAllegeById(int id);
    //处理申述
    void dealAllege(Allege allege);
    //删除申述
    void delAllege(int id);
    //修改密码
    void resetPassword(User user);

}
