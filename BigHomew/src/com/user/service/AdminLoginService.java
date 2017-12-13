package com.user.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Administrtor;
import com.entity.Order;
import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar2;
import com.user.dao.AdminLoginDao;

@Service
public class AdminLoginService {
	@Resource
	private AdminLoginDao adminlogindao;
	public List<Administrtor> login(String name){
		List list=adminlogindao.login(name);
		return list;
	}
	public List<Producttype> type(){
		return adminlogindao.type();
	}
	public List<Order> order(){
		return adminlogindao.order();
	}
	public void delete(int id){
		adminlogindao.delete(id);
	}
	public List<Order> findorder(String name){
		return adminlogindao.findorder(name);
	}
	public void changeproduct(Product p){
		adminlogindao.changeproduct(p);
	}
	public void deleteuser(String name){
		adminlogindao.deleteuser(name);
	}
	public void deleteorder(String name){
		adminlogindao.deleteorder(name);
	}
	public void deleteshopcar(String name){
		adminlogindao.deleteshopcar(name);
	}
	public List<Shopcar2> findorderproduct(String name){
		return adminlogindao.findorderproduct(name);
	}
	//根据id查询订单
	public List<Order> order1(int id){
		return adminlogindao.order1(id);
	}
	//更改订单状态
	public void changestate(Order order){
		adminlogindao.changestate(order);
	}
}
