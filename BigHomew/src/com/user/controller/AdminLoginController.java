package com.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.entity.Administrtor;
import com.entity.LoginUser;
import com.entity.Order;
import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar;
import com.entity.Shopcar2;
import com.user.service.AddProductService;
import com.user.service.AddUserService;
import com.user.service.AdminLoginService;
import com.user.service.FindProductService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	@Resource
	private AdminLoginService adminloginservice;
	@Resource
	private AddProductService addpproductservice;
	@Resource
	private FindProductService findproductservice;
	@Resource
	private AddUserService addUserService;
	//在后台展示订单  和  增加商品的商品类型
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Administrtor admin,Model model,HttpSession session){
		session.setAttribute("adminName", admin.getName());
		session.setAttribute("adminPassword", admin.getPassword());
		List<Administrtor> list=adminloginservice.login(admin.getName());
		if(list.get(0).getPassword().equals(admin.getPassword())){
			List<Producttype> ll=adminloginservice.type();
			List<Order> order=adminloginservice.order();
			model.addAttribute("order",order);
			model.addAttribute("type",ll);
			model.addAttribute("name1",list.get(0).getName1());
			List<Product> list1=findproductservice.findyproducttype("巨大");
			List<Product> list2=findproductservice.findyproducttype("巨小");
			List<Product> list3=findproductservice.findyproducttype("中");
			System.out.println(list1.get(0).getName());
			model.addAttribute("list1",list1);
			model.addAttribute("list2",list2);
			model.addAttribute("list3",list3);
			
			List<LoginUser> alluser=addUserService.findalluser();
			model.addAttribute("alluser",alluser);
			return "administrator";
		}
		
		return "";
	}
	//增加商品
	@RequestMapping(value="/addproduct",method=RequestMethod.POST)
	public String addproduct( @RequestParam(value="name") String name,@RequestParam(value="price") String price ,@RequestParam(value="type") String type,
		@RequestParam(value="file") MultipartFile file,HttpServletRequest request,Model model,HttpSession session) throws IOException {
		
		
		   String originalFilename = file.getOriginalFilename();   
		   if(originalFilename==null){
			   JOptionPane.showMessageDialog(null,"图片不能为空");
			   return "administrator";
		   }
		   System.out.println(originalFilename);
	        //上传图片            
	        //存储图片的物理路径  
		   String realPath=request.getSession().getServletContext().getRealPath("/");
		   System.out.println(realPath);
	        //新的图片名称  
	        String newFileName = originalFilename;  
	        System.out.println(newFileName);
	        //新图片  
	        File newFile = new File(realPath+"\\img"+"\\"+newFileName);  
	        //将内存中的数据写入磁盘  
	        file.transferTo(newFile);    

		Product p=new Product();
		p.setName(name);
		p.setPrice(price);
		p.setType(type);
		p.setImg(newFileName);
		addpproductservice.addproduct(p);
		List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name1",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		System.out.println(list1.get(0).getName());
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		JOptionPane.showMessageDialog(null,"添加成功");		
		return "administrator";
	}
	//根据产品类类型查找商品进行删除
	@RequestMapping(value="/deleteproduct",method=RequestMethod.GET)
	public String findbyproducytype(@RequestParam(value="id") int id,Model model,HttpSession session){
		if(id!=0){
		findproductservice.deleteproduct(id);
		}
	 	List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		System.out.println(list1.get(0).getName());
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		JOptionPane.showMessageDialog(null,"成功删除商品");

		return "administrator";
	}
	//查看订单详情
	@RequestMapping(value="/ordermessage",method=RequestMethod.GET)
	public String ordermessage(@RequestParam(value="name") String name,Model model){
		System.out.println(name+"   "+"oooooooooo");
		List<Shopcar2> list=adminloginservice.findorderproduct(name);
		
		//System.out.println(list.get(0).getName()+"0000000000000000");
		model.addAttribute("list",list);
		return "ordermessage";
	}
	//删除订单
	@RequestMapping(value="/deleteorder",method=RequestMethod.GET)
	public String deleteorder(@RequestParam(value="id") int orderid,Model model,HttpSession session){
		adminloginservice.delete(orderid);
		List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		//model.addAttribute("order",session.getAttribute("order1"));
		//model.addAttribute("type",session.getAttribute("type1"));
		//model.addAttribute("name",session.getAttribute("name2"));
		//model.addAttribute("list1",session.getAttribute("list11"));
		//model.addAttribute("list2",session.getAttribute("list22"));
		//model.addAttribute("list3",session.getAttribute("list33"));
		return "administrator";
	}
	@RequestMapping(value="/deleteorder2",method=RequestMethod.GET)
	public String deleteorder2(@RequestParam(value="id") int orderid,Model model,HttpSession session){
		adminloginservice.delete(orderid);
		List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		return "administrator";
	}
	//根据用户名查询订单 或 根据商品名查找商品
	@RequestMapping(value="/findorder",method=RequestMethod.POST)
	public String findorder(@RequestParam(value="findorder") String name,Model model){
		System.out.println(name);
		List<Order> list= adminloginservice.findorder(name);
		if(list.size()!=0){
			model.addAttribute("list",list);
			return "findOrder";
		}else{
			List<Product> list1= findproductservice.findbyname(name);
			List<Producttype> ll=adminloginservice.type();
			model.addAttribute("type",ll);
			model.addAttribute("p",list1.get(0));
		return "findProduct";
		}
	}
	//修改商品
	@RequestMapping(value="/changeproduct",method=RequestMethod.POST)
	public String changeproduct(Product p,Model model,HttpSession session){
		System.out.println(p.getName());
		adminloginservice.changeproduct(p);
		List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name1",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		System.out.println(list1.get(0).getName());
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		return "administrator";
	}
	//根据id删除用户
	@RequestMapping(value="/deleteuser",method=RequestMethod.GET)
	public String deleteuser(@RequestParam(value="name") String name,Model model,HttpSession session){
		//删除用户
		adminloginservice.deleteuser(name);
		//删除购物车信息
		adminloginservice.deleteorder(name);
		//删除订单
		adminloginservice.deleteshopcar(name);
		
		List<Producttype> ll=adminloginservice.type();
		List<Order> order=adminloginservice.order();
		model.addAttribute("order",order);
		model.addAttribute("type",ll);
		model.addAttribute("name1",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		System.out.println(list1.get(0).getName());
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		return "administrator";
	}
	//接单
	@RequestMapping(value="/jiedan",method=RequestMethod.GET)
	public String jiedan(@RequestParam(value="id") int orderid,Model model,HttpSession session){
		List<Order> listorder=adminloginservice.order1(orderid);
		if(listorder.get(0).getGuanli()==0){
			Order order = new Order();
			order.setAddress(listorder.get(0).getAddress());
			order.setGuanli(1);
			order.setId(listorder.get(0).getId());
			order.setState("已接单");
			order.setSumprice(listorder.get(0).getSumprice());
			order.setTime(listorder.get(0).getTime());
			order.setUserName(listorder.get(0).getUserName());
			adminloginservice.changestate(order);
		}
		

		if(listorder.get(0).getGuanli()==1){
			JOptionPane.showMessageDialog(null,"商品已接单");
			System.out.println("已订单");
			List<Producttype> ll=adminloginservice.type();
			List<Order> order1=adminloginservice.order();
			
			model.addAttribute("order",order1);
			model.addAttribute("type",ll);
			model.addAttribute("name1",session.getAttribute("adminName"));
			
			List<Product> list1=findproductservice.findyproducttype("巨大");
			List<Product> list2=findproductservice.findyproducttype("巨小");
			List<Product> list3=findproductservice.findyproducttype("中");
			model.addAttribute("list1",list1);
			model.addAttribute("list2",list2);
			model.addAttribute("list3",list3);
			List<LoginUser> alluser=addUserService.findalluser();
			model.addAttribute("alluser",alluser);
			return "administrator";
		}
		List<Producttype> ll=adminloginservice.type();
		List<Order> order2=adminloginservice.order();
		
		
		System.out.println("接单情况："+order2.get(6).getState());
		model.addAttribute("order",order2);
		model.addAttribute("type",ll);
		model.addAttribute("name1",session.getAttribute("adminName"));
		
		List<Product> list1=findproductservice.findyproducttype("巨大");
		List<Product> list2=findproductservice.findyproducttype("巨小");
		List<Product> list3=findproductservice.findyproducttype("中");
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		List<LoginUser> alluser=addUserService.findalluser();
		model.addAttribute("alluser",alluser);
		return "administrator";
	}
	
}
