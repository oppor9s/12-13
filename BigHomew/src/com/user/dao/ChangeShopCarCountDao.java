package com.user.dao;


import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Shopcar;



@Repository
public class ChangeShopCarCountDao {
	@Resource
	private SessionFactory sessionFactory;
	 public void changById(int count,int id){
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			Shopcar shopcar= session.get(Shopcar.class, new Integer(id));
			 shopcar.setCount(count);
			 session.update(shopcar);
			 tx.commit();
		//session.save(shopcar);
		// Query query=this.sessionFactory.getCurrentSession().createQuery(" update Shopcar set count=? where id=?");
		// query.setParameter(0, count);
		// query.setParameter(1, id);
		// query.executeUpdate();
		
	 }
	
}
