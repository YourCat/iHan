package com.IDao;

import org.apache.ibatis.annotations.Param;
import com.domain.User;

public interface UserMapper {
	//查询用户名跟密码
	public User CheckLoginAndPwd(@Param("username") String name,@Param("password") String pwd);
	//注册用户
	public void addUser(User user);
}
