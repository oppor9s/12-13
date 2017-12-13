package com.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.LoginUser;
import com.user.service.ChangeLoginUserMessageService;

@Controller
@RequestMapping("/changemessage")
public class ChangeLoginUserMessageController {
	@Resource
	public ChangeLoginUserMessageService changeLoginUserMessageService;
	
	@RequestMapping(value="change",method=RequestMethod.POST)
	public String change(LoginUser user){
		System.out.println("iiiiiiiiiiiiiii");
		changeLoginUserMessageService.changmessage(user);
		return "redirect:/adduser/usermessage";
	}
}
