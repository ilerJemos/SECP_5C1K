package com.ssm.service.impl;

import com.ssm.dao.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("UserService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    public User getUser(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public User login(User user) {
        return userMapper.checkLogin(user);
    }

    public User findUser(String username, String p) {
        return userMapper.findUser(username,p);
    }

    @Override
    public boolean registerUser(String user, String passwd) {
        try{
            userMapper.registerUser(user,passwd);
        }catch (Exception e){
            return false;
        }
        return true;
    }
}
