package com.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.LoginUser;
import com.entity.UsersAddress;

@Repository
public class AddUserDao {
	@Resource
	private SessionFactory sessionFactory;
	//保存用户
	  public void save(LoginUser loginUser)  {
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(loginUser);
			tx.commit();
			session.close();
		}
	  //根据用户名字查找用户
	  public List<LoginUser> findByName(String name){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("from LoginUser where name=?");
		  query.setParameter(0, name);
			return query.list();		  
	  }
	  //查找所有用户
	  public List<LoginUser> users(){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("from LoginUser");
		  List list=query.list();
		  return list;
	  }
	  //查询此用户的所有地址
	  public List<UsersAddress> address(String name){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("from UsersAddress where name=?");
		  query.setParameter(0, name);
		  return query.list();
	  }
	  //根据id查询用户地址
	  public List<UsersAddress> address(int id){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("from UsersAddress where id=?");
		  query.setParameter(0, id);
		  return query.list();
	  }
	  //新增用户地址
	  public void addaddress(UsersAddress address){
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(address);
			tx.commit();
			session.close();
	  }
	  //修改用户地址
	  public void changeaddress(UsersAddress address){
		  System.out.println("21121212");
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.update(address);
			tx.commit();
			session.close();
	  }
	  //删除用户地址
	  public void deleteaddress(int id ){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("delete from UsersAddress where id = ?");
		  query.setParameter(0, id);
		  query.executeUpdate();	 
	  }
}
