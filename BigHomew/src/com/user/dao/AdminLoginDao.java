package com.user.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Administrtor;
import com.entity.Order;
import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar;
import com.entity.Shopcar2;

@Repository
public class AdminLoginDao {
	@Resource
	private SessionFactory sessionFactory;
	//管理员登陆
	public List<Administrtor> login(String name){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Administrtor where name=?");
		 query.setParameter(0, name);
		 List list=query.list();
		return list;
	}
	//查询产品类型
	public List<Producttype> type(){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Producttype");
		List<Producttype> list=query.list();
		
		return list;
	}
	//查询订单
	public List<Order> order(){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Order");
		List<Order> list=query.list();
		return list;
	}

	//删除订单
	public void delete(int id){
		Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Order where id = ?");
		query.setParameter(0, id);
		query.executeUpdate();
	}
	//根据用户名查找订单
	public List<Order> findorder(String name){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Order where userName=?");
		query.setParameter(0, name);
		List<Order> list=query.list();
		return list;
	}
	//修改商品
	public void changeproduct(Product p){
		Session session = sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.update(p);
		tx.commit();
		session.close();
	}
	//根据id删除用户
	public void deleteuser(String name){
		Query query=this.sessionFactory.getCurrentSession().createQuery("delete from LoginUser where name = ?");
		query.setParameter(0, name);
		query.executeUpdate();
		System.out.println("user");
	}
	//根据用户姓名删除订单
	public void deleteorder(String name){
		Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Order where username = ?");
		query.setParameter(0, name);
		query.executeUpdate();

	}
	//根据id查询订单
	public List<Order> order1(int id){
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Order where id = ?");
		query.setParameter(0, id);
		List<Order> list=query.list();
		return list;
	}
	//根据用户姓名删除订单
	 public void deleteshopcar(String name){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Shopcar where username = ?");
		 query.setParameter(0, name);
		 query.executeUpdate();
		 System.out.println("shopcar");
	 }
	 //查看订单详情
	 public List<Shopcar2> findorderproduct(String name){
		 Query query=this.sessionFactory.getCurrentSession().createQuery(" from Shopcar2 where username=?");
		 query.setParameter(0, name);
		 List<Shopcar2> list=query.list();
		 return list;
	 }
	 //更改订单状态
	 public void changestate(Order order){
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.update(order);
			tx.commit();
			session.close();
	 }
}
