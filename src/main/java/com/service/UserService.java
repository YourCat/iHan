package com.service;

import com.domain.User;

public interface UserService {

	User CheckLoginAndPwd(String name, String pwd);

	void addUser(User user);

}