package com.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Product;
import com.entity.Shopcar;
import com.user.service.AddProductService;
import com.user.service.FindProductService;

@Controller
@RequestMapping("/addProcut")
public class AddProductController {
@Resource
private AddProductService addProductService;
@Resource
private FindProductService findProductService;

//加入购物车商品
@RequestMapping("/add")
public String adduser(@RequestParam("pagenum") int pagenum,Shopcar shopcar,Model model,HttpSession session){
	shopcar.setSumprice(shopcar.getCount()*shopcar.getPrice());
	shopcar.setUserName((String) session.getAttribute("name"));
	System.out.println(session.getAttribute("name"));
	addProductService.addProduct(shopcar);
	List<Product> list=findProductService.findByPage(pagenum, 4);
	int prenum=0,nextnum=0; int count=(int)findProductService.fianCount();
	if(pagenum==1){
		prenum=1;nextnum=pagenum+1;
	}else{
		if(count/4==0){
				if(pagenum<=count/4){
					prenum=pagenum;nextnum=prenum+1;
				}else{
					nextnum=pagenum;prenum=nextnum-1;
				}
		}else{
			if(pagenum<count/4+1){
				prenum=pagenum;nextnum=prenum+1;
			}else{
				nextnum=pagenum;prenum=nextnum-1;
			}
		}
	}
	model.addAttribute("prenum",prenum);
	model.addAttribute("nextnum",nextnum);
	model.addAttribute("list",list);

	return "product";
	
}
}
