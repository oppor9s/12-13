package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.LoginUser;
import com.user.dao.ChangeLoginUserMessage;

@Service
public class ChangeLoginUserMessageService {
@Resource
private ChangeLoginUserMessage change;

	public void changmessage(LoginUser user){
		change.changeloginusermessage(user);
	}
}
