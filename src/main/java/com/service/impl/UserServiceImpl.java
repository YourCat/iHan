package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.IDao.UserMapper;
import com.domain.User;
import com.service.UserService;


@Service
public class UserServiceImpl implements UserService  {
	@Autowired
	private UserMapper userMapper;
	public User CheckLoginAndPwd(String name, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.CheckLoginAndPwd(name, pwd);
	}

	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}
}
