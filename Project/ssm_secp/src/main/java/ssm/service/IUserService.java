package ssm.service;

import ssm.pojo.User;
public interface IUserService {
    //用户注册
    void regist(User user);
    //用户登录
    //void login(String name, String password);
    User checkLogin(String name,String passwd);
}
