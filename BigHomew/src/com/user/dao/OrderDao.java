package com.user.dao;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Order;
import com.entity.Shopcar;
import com.entity.Shopcar2;
@Repository
public class OrderDao {
		@Resource
		private SessionFactory sessionFactory;

		  public void save(Order order)  {
				Session session = sessionFactory.openSession();
				Transaction tx=session.beginTransaction();
				session.save(order);
				tx.commit();
				session.close();
			}
	//查找订单商品的数量	  
			 public List<Shopcar2> findshopcarcount(int id){
				 Query query=this.sessionFactory.getCurrentSession().createQuery(" from Shopcar2 where id=?");
				 query.setParameter(0, id);
				 List<Shopcar2> list=query.list();
				 return list;
			 }
	//修改订单商品数量
			 public void changById(int count,int id){
					Session session = sessionFactory.openSession();
					Transaction tx=session.beginTransaction();
					Shopcar2 shopcar2= session.get(Shopcar2.class, new Integer(id));
					 shopcar2.setCount(count);
					 session.update(shopcar2);
					 tx.commit();	
			 }
	//批量删除
			 public void delete1(int id){
				 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Shopcar2 where id = ?");
				 query.setParameter(0, id);
				 query.executeUpdate();
			 }
	//删除订单
			 public void delete88(int id){
				 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Order where id = ?");
				 query.setParameter(0, id);
				 query.executeUpdate();
			 }
	//根据用户名查找订单
			 public List<Shopcar2> findByUserName(String username){
				 Query query=this.sessionFactory.getCurrentSession().createQuery("from Shopcar2 where username=?");
				 query.setParameter(0, username);
				 List<Shopcar2> list=query.list();
				 return list;
			 }
	}

