package com.ssm.service;

import com.ssm.pojo.User;

public interface UserService {
    User getUser(int id);
    User login(User user);

    User findUser(String username, String p);

    boolean registerUser(String user, String passwd);
}
