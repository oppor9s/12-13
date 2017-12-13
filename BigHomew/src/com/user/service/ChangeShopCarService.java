package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.dao.ChangeShopCarCountDao;

@Service

public class ChangeShopCarService {

		@Resource
		private ChangeShopCarCountDao changeshopcarcountdao;
		public void changecount(int count,int id){
			changeshopcarcountdao.changById(count, id);
		}
}
