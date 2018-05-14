package com.ssm.dao;

import com.ssm.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User checkLogin(User user);


    User findUser(String username, String p);

    void registerUser(String username, String passwd);
}