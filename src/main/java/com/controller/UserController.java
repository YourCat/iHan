package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.User;
import com.mysql.jdbc.integration.jboss.MysqlValidConnectionChecker;
import com.service.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService UserService;
	@RequestMapping("/MyCheck")
	public @ResponseBody JSONObject MyCheck(String username,String password,HttpSession session) {
		User user = UserService.CheckLoginAndPwd(username,password);
		session.setAttribute("user", user);
		JSONObject json=JSONObject.fromObject(user);
		System.out.println(json);
		return json;
	}
	
	//注销
	@RequestMapping("/LogOut")
	public String LogOut(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
	//注册
	@RequestMapping("/Register")
	public String Register(Model model,User user){
		UserService.addUser(user);
		model.addAttribute("msg", "注册成功");
		return "success";
	}
}
