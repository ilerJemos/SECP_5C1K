package com.freight.service;

import com.freight.pojo.User;

public interface UserService {
	public User findUserByNameandPassword(String name,String password);
	public boolean registerUser(String name,String password);
}
