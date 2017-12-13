package com.user.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.LoginUser;
import com.entity.Product;

import com.entity.Shopcar;

@Repository
public class AddProductDao {
	@Resource
	private SessionFactory sessionFactory;
    //增加购物车中的商品
	  public void save(Shopcar shopcar)  {
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(shopcar);
			tx.commit();
			session.close();
		}
	 //新增商品 
	  public void saveproduct(Product product)  {
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
		}
}
