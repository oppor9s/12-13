package com.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.DeleteShopCar;
import com.entity.LoginUser;
import com.entity.Order;
import com.entity.Shopcar;
import com.entity.Shopcar2;
import com.entity.UsersAddress;
import com.user.service.AddUserService;
import com.user.service.AdminLoginService;
import com.user.service.FindProductService;
import com.user.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource 
	private OrderService orderService;
	@Resource
	private AddUserService addUserService;
	@Resource
	private FindProductService findProductService;
	@Resource
	private AdminLoginService adminloginservice;
	//展示到订单页面
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String findByI(Model model,HttpSession session){
		List<Shopcar> list=findProductService.findByUserName((String) session.getAttribute("name"));
		if(list.size()==0){
			JOptionPane.showMessageDialog(null,"购物车不能为空");
			return "shop1111";
		}
		List<UsersAddress> list3=addUserService.address((String) session.getAttribute("name"));
		model.addAttribute("list3",list3);
		model.addAttribute("name1",session.getAttribute("name"));
		model.addAttribute("list",list);
		return "order";
	}
	//生成订单，并存到数据库
	@RequestMapping(value="/makeorder",method=RequestMethod.POST)
	public String makeorder(DeleteShopCar d,HttpSession session,Model model){

		// 截取字符串，获得各个checkBox的值
		String tempString=d.getTempString();
		if(tempString==null){
			JOptionPane.showMessageDialog(null,"地址不能为空！！！");
			return "redirect:/order/add";
		}else{
			String temp[] = tempString.split(",");
				if(temp.length>1){
					JOptionPane.showMessageDialog(null,"地址只能选一个！！！");
					return "redirect:/order/add";
				}
		}
		String temp[] = tempString.split(",");
		List<UsersAddress> listaddress=addUserService.address(Integer.parseInt(temp[0]));
		//将订单信息存入表Shopcar2中
		List<Shopcar> list=findProductService.findByUserName((String) session.getAttribute("name"));
		for(int i=0;i<list.size();i++){
			Shopcar2 shopcar2=new Shopcar2();
			shopcar2.setId(list.get(i).getId());
			shopcar2.setCount(list.get(i).getCount());
			shopcar2.setName(list.get(i).getName());
			shopcar2.setPrice(list.get(i).getPrice());
			shopcar2.setSumprice(list.get(i).getSumprice());
			shopcar2.setType(list.get(i).getType());
			shopcar2.setUserName(list.get(i).getUserName());
			findProductService.save(shopcar2);
		}
		List<LoginUser> list1=addUserService.findName((String) session.getAttribute("name"));
		int sumprice=0;
		for(int i=0;i<list.size();i++){
			sumprice+=list.get(i).getCount()*list.get(i).getPrice();
		}
		String name=(String) session.getAttribute("name");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time =df.format(new Date());
		Order order = new Order();
		order.setTime(time);
		order.setAddress(listaddress.get(0).getAddress());
		order.setUserName(name);
		order.setSumprice(sumprice);
		order.setGuanli(0);
		order.setState("确认下单");
		orderService.addOrder(order);
		model.addAttribute("order",order);
		//清空购物车
		findProductService.deleteshopcar((String) session.getAttribute("name"));
		return "order2";
	}
	//查询订单详情
	@RequestMapping(value="/findorder1",method=RequestMethod.GET)
	public String ordermessage(@RequestParam(value="id") int orderid,Model model,HttpSession session){
		List<Order> listorder=adminloginservice.order1(orderid);
		if(listorder.get(0).getGuanli()==1){
			JOptionPane.showMessageDialog(null,"商品已接单,不能更该。");
			return "redirect:/adduser/usermessage";
		}if(listorder.get(0).getGuanli()==0){
			List<Shopcar2> list=adminloginservice.findorderproduct((String) session.getAttribute("name"));
			model.addAttribute("list",list);
			return "changeorder";
		}
		return "changeorder";
		
	}
	//修改订单
	@RequestMapping(value="/changeorder1",method=RequestMethod.GET)
	public String changeorder(){
		JOptionPane.showMessageDialog(null,"修改完成。");
		return "redirect:/adduser/usermessage";
	}
	//修改订单的商品数量
	@RequestMapping("/jianchangecount")
	public String jianchangecount(@RequestParam("id") String iid,HttpSession session,Model model){
		int id=new Integer(iid);
		List<Shopcar2> list=orderService.findshopcarcount(id);

		int count=list.get(0).getCount()-1;
		if(count==0){
			count=1;
		}
		System.out.println(count);
		orderService.changecount(count, id);
		return "redirect:/order/findorder1";
	}
	@RequestMapping("/jiachangecount")
	public String jiachangecount(@RequestParam("id") String iid,Model model,HttpSession session){
		int id=new Integer(iid);
		List<Shopcar2> list=orderService.findshopcarcount(id);
		int count=list.get(0).getCount()+1;
		orderService.changecount(count, id);
		return "redirect:/order/findorder1";
	}
	
	//批量删除购物车信息
	@RequestMapping("/bigdelete")
	public String bigdelete(DeleteShopCar d,HttpSession session){
		String tempString=d.getTempString();
		String count=d.getTempString();
		// 截取字符串，获得各个checkBox的值
		String temp[] = tempString.split(",");
		//获取改变的商品个数
		String te[] = count.split(",");
		//session.setAttribute("changecount", count);
		for(int i=0;i<temp.length;i++){
			orderService.change(Integer.parseInt(temp[i]));
		}
		return "redirect:/order/findorder1";
	}
	//根据用户名删除订单的数据
	@RequestMapping("/delete")
	public String delete(int id,Model model,HttpSession session){
		orderService.change(id);
		List<Shopcar2> list=orderService.order((String) session.getAttribute("name"));
		model.addAttribute("list",list);
		return "changeorder";
	}
	//删除订单
	@RequestMapping("/deleteorder88")
	public String delete88(int id,Model model,HttpSession session){
		orderService.delete88(id);
		List<Shopcar2> list=orderService.order((String) session.getAttribute("name"));
		model.addAttribute("list",list);
		return  "redirect:/adduser/usermessage";
	}
	
}
