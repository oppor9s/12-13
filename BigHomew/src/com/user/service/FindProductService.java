package com.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar;
import com.entity.Shopcar2;
import com.user.dao.FindProductDao;

@Service

public class FindProductService {
	@Resource 
	private FindProductDao findProductDao;
	
	public List<Product> findAll(){
		return findProductDao.findAll();
	}
	public List<Product> findByPage(int pageNum, int pageSize){
		return	findProductDao.find4Page(pageNum, pageSize);
	}
	public List<Product> findByPage1(String type,int pageNum, int pageSize){
		return	findProductDao.find1Page(type,pageNum, pageSize);
	}
	public long fianCount(){
		return findProductDao.findCount();
	}
	public List<Product> findById(int id){
		return findProductDao.findById(id);
	}
	public List<Shopcar> findByUserName(String username){
		return findProductDao.findByUserName(username);
	}
	public void delete(int id){
		findProductDao.delete(id);
	}
	public List<Shopcar> findshopcarcount(int id){
		return findProductDao.findshopcarcount(id);
	}
	public List<Product> findyproducttype(String type){
		return findProductDao.findbyproducttype(type);
	}
	public void deleteproduct(int id){
		findProductDao.deleteproduct(id);
	}
	public List<Product> findbyname(String name){
		return findProductDao.findbyname(name);
	}
	public List<Product> findbytype(String type){
		return findProductDao.findByType(type);
	}
	public List<Producttype> findproducttype(int id){
		return findProductDao.type(id);
	}
	//生成订单后 根据用户名删除购物车
	public void deleteshopcar(String name){
		findProductDao.deleteshopcar(name);
	}
	//生成订单后将订单信息存入后台数据中
	public void save(Shopcar2 shopcar2){
		findProductDao.save(shopcar2);
	}
}
