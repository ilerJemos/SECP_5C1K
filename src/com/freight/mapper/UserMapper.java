package com.freight.mapper;

import com.freight.pojo.User;

public interface UserMapper {
	public User findUserByNameandPassword(String name,String password);
	public void registerUser(String name,String password);
}
