package com.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Order;
import com.entity.Shopcar;
import com.entity.Shopcar2;
import com.user.dao.OrderDao;

@Service
public class OrderService {
	
	@Resource
	private OrderDao orderDao;
	public void addOrder(Order order){
		orderDao.save(order);
	}
	public void changecount(int count,int id){
		orderDao.changById(count, id);
	}
	public List<Shopcar2> findshopcarcount(int id){
		return orderDao.findshopcarcount(id);
	}
	public void change(int id){
		orderDao.delete1(id);
	}
	public List<Shopcar2> order(String name){
		return orderDao.findByUserName(name);
	}
	public void delete88(int id){
		orderDao.delete88(id);
	}
}
