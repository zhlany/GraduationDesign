package com.zhihu.service;


import com.github.pagehelper.PageInfo;
import com.zhihu.bean.Allege;
import com.zhihu.bean.Company;
import com.zhihu.bean.Student;
import com.zhihu.bean.User;

import java.util.List;

public interface UserService {

    //注册
    boolean Register(User user);
    //判断邮箱是否被注册
    boolean isEmailExist(String email);
    //判断用户类型
    String UserType(String email, String password);
    //通过邮箱得到Company
    Company getCom(String email);
    Student getStu(String email);
    List<User> listStu();
    //查询用户列表
    PageInfo<User> pageUser(User user, Integer pageNum, Integer pageSize);
    //查询申述列表
    PageInfo<Allege> pageAllege(Allege allege, Integer pageNum, Integer pageSize);
    //删除用户
    boolean delUser(int id);
    //锁定用户
    boolean lockUser(int id);
    //解锁用户
    boolean clearUser(int id);
    //管理员重置密码
    boolean resetPassword(User user);
    //通过id
    User getUserById(int id);
    //获取申述
    Allege getAllegeById(int id);
    //处理申述
    Boolean dealAllege(Allege allege);
    //删除申述
    Boolean delAllege(int id);
    //重置密码
    String resetPassword(String email, String phone, String password);


}
