package com.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar;
import com.entity.Shopcar2;

@Repository
public class FindProductDao {
	@Resource
	private SessionFactory sessionFactory;
	public List<Product> findAll(){
		  Query query=this.sessionFactory.getCurrentSession().createQuery("from Product");
			return query.list();
	}
	 public List<Product> find4Page(int pageNum, int pageSize){
			Query query=this.sessionFactory.getCurrentSession().createQuery("from Product");
			query.setFirstResult((pageNum-1)*pageSize);
			query.setMaxResults(pageSize);
			return query.list();
	}
	 public List<Product> find1Page(String type,int pageNum, int pageSize){
			Query query=this.sessionFactory.getCurrentSession().createQuery("from Product where type=?");
			query.setParameter(0, type);
			query.setFirstResult((pageNum-1)*pageSize);
			query.setMaxResults(pageSize);
			return query.list();
	}

	 public long findCount(){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("select count(Product) from Product");
			return (long)query.uniqueResult();
	 }
	 public List<Product> findById(int id){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("from Product where id=?");
		 query.setParameter(0, id);
		 List<Product> list=query.list();
			return list;
	 }
	 public List<Shopcar> findByUserName(String username){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("from Shopcar where username=?");
		 query.setParameter(0, username);
		 List<Shopcar> list=query.list();
		 return list;
	 }
	 public void delete(int id){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Shopcar where id = ?");
		 query.setParameter(0, id);
		 query.executeUpdate();
	 }
	 public List<Shopcar> findshopcarcount(int id){
		 Query query=this.sessionFactory.getCurrentSession().createQuery(" from Shopcar where id=?");
		 query.setParameter(0, id);
		 List<Shopcar> list=query.list();
		 return list;
	 }
	 //生成订单后 根据用户名删除购物车
	 public void deleteshopcar(String name){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Shopcar where username = ?");
		 query.setParameter(0, name);
		 query.executeUpdate();
		 System.out.println("删除购物车");
	 }
	 //生成订单后将订单信息存入后台数据中
	  public void save(Shopcar2 shopcar2)  {
			Session session = sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(shopcar2);
			tx.commit();
			session.close();
		}
	 public List<Product> findbyproducttype(String type){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("from Product where type=?");
		 query.setParameter(0,type);
		 List<Product> list=query.list();
		 return list;
	 }
	 public void deleteproduct(int id){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("delete from Product where id = ?");
		 query.setParameter(0, id);
		 query.executeUpdate();
	 }
	 public List<Product> findbyname(String name){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("from Product where name=?");
		 query.setParameter(0,name);
		 List<Product> list=query.list();
		 return list;
	 }
	 public List<Product> findByType(String type){
		 Query query=this.sessionFactory.getCurrentSession().createQuery("from Product where type=?");
		 query.setParameter(0, type);
		 List<Product> list=query.list();
		 return list;
	 }
	 
	 
	public List<Producttype> type(int id){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Producttype where id=?");
		query.setParameter(0, id);
		List<Producttype> list=query.list();
		return list;
	}
}
