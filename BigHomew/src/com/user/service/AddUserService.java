package com.user.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.LoginUser;
import com.entity.UsersAddress;
import com.user.dao.AddUserDao;
@Service
public class AddUserService {
	@Resource
	private AddUserDao adduserDao;
	public void adduser(LoginUser loginUser){
		adduserDao.save(loginUser);
	}
	
	public List<LoginUser> findName(String name){
		 List<LoginUser> list=adduserDao.findByName(name);
		 return list;
	}
	public List<LoginUser> findalluser(){
		return adduserDao.users();
	}
	//查询此用户的所有地址
	public List<UsersAddress> address(String name){
		return adduserDao.address(name);
	}
	//根据id查询用户地址
	public List<UsersAddress> address(int id){
		return adduserDao.address(id);
	}
	//新增地址
	public void add(UsersAddress address ){
		adduserDao.addaddress(address);
	}
	//修改地址
	public void change(UsersAddress address){
		adduserDao.changeaddress(address);
	}
	//删除地址
	public void delete( int id){
		adduserDao.deleteaddress(id);
	}
}
