package com.freight.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freight.mapper.UserMapper;
import com.freight.pojo.User;
import com.freight.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	@Override
	public User findUserByNameandPassword(String name, String password) {
		return userMapper.findUserByNameandPassword(name, password);
	}
	@Override
	public boolean registerUser(String name, String password) {
		try{
			userMapper.registerUser(name, password);
		}catch(Exception e){
			return false;
		}
		return true;
	}
}
