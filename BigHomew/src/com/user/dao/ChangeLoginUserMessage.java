package com.user.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.LoginUser;

@Repository
public class ChangeLoginUserMessage {
	@Resource
	private SessionFactory sessionFactory;
	
	public void changeloginusermessage(LoginUser user){
		Session session = sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();
	//this.sessionFactory.getCurrentSession().update(user);
	}
}
