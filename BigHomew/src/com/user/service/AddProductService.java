package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Product;
import com.entity.Shopcar;
import com.user.dao.AddProductDao;

@Service
public class AddProductService {
@Resource 
private AddProductDao addProductDao;
		public void addProduct(Shopcar shopcar){
			addProductDao.save(shopcar);
		}
		
		public void addproduct(Product product){
			addProductDao.saveproduct(product);
		}
}
