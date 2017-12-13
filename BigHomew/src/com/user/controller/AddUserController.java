package com.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.LoginUser;
import com.entity.Order;
import com.entity.UsersAddress;
import com.user.service.AddUserService;
import com.user.service.AdminLoginService;

@Controller
@RequestMapping("/adduser")
public class AddUserController {
@Resource
private AddUserService addUserService;
@Resource
private AdminLoginService adminloginservice;
//注册新用户
	@RequestMapping("/add")
	public String adduser(LoginUser loginUser,HttpSession session){
		System.out.println(111111);
		session.setAttribute("name",loginUser.getName());
		addUserService.adduser(loginUser);
		return "index2";
	}
//用户登陆
	//验证用户名
	@RequestMapping("/loginname")
	@ResponseBody
	public String loginnmae(@RequestParam(value="q") String str,HttpSession session){
	//	String name = loginUser.getName();
		List<LoginUser> list=addUserService.findName(str);
		System.out.println("2111212121");
		System.out.println("用户姓名"+str);
		if(list.isEmpty()){
			return "noexist";
		}else{
				System.out.print("用户名存在");
				session.setAttribute("name1",str);
				System.out.println(session.getAttribute("name1"));
				return list.get(0).getPassword();		
		}
	}
	//验证密码
	@RequestMapping("/loginpassword")
	@ResponseBody
	public String loginpassword(@RequestParam(value="q") String str,HttpSession session){
	//	String name = loginUser.getName();
		List<LoginUser> list=addUserService.findName((String) session.getAttribute("name1"));
		
		System.out.println("用户姓名"+session.getAttribute("name1"));
		System.out.println("密码"+list.get(0).getPassword());
		if(str.equals(list.get(0).getPassword())){
			return "";
		}else{
			return "noexist";		
		}
	}
	//登陆跳转页面
	@RequestMapping("/login")
	public String login(HttpSession session,LoginUser user){
	session.setAttribute("name", user.getName());
		return "index2";
	}
//修改个人信息
	@RequestMapping("/usermessage")
	public String message(Model model,HttpSession session){
		String name=(String) session.getAttribute("name");
		if(name==null){
			JOptionPane.showMessageDialog(null,"请先登录。");
			return "redirect:/findproduct/findByPage?pagenum=1";
		}
		List<LoginUser> list1=addUserService.findName((String) session.getAttribute("name"));
		LoginUser user=new LoginUser();
		user.setAddress(list1.get(0).getAddress());
		user.setEmail(list1.get(0).getEmail());
		user.setId(list1.get(0).getId());
		user.setName(list1.get(0).getName());
		user.setPassword(list1.get(0).getPassword());
		user.setPhone(list1.get(0).getPhone());
		model.addAttribute("password0",list1.get(0).getPassword());
		model.addAttribute("user",user);
		List<Order> list2= adminloginservice.findorder((String) session.getAttribute("name"));
		model.addAttribute("list2",list2);
		model.addAttribute("name1",session.getAttribute("name"));
	//查询此用户的所有地址
		List<UsersAddress> list3=addUserService.address((String) session.getAttribute("name"));
		model.addAttribute("list3",list3);
		return "personal";
	}
	//删除用户地址
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id") int id){
		addUserService.delete(id);
		
		JOptionPane.showMessageDialog(null,"删除成功");
		return "redirect:/adduser/usermessage";
	}
	//修改用户地址
	@RequestMapping(value="/change",method=RequestMethod.POST)
	public String change(UsersAddress address){
		addUserService.change(address);
		JOptionPane.showMessageDialog(null,"修改成功");
		return "redirect:/adduser/usermessage";
	}
	//新增用户地址
	@RequestMapping("/addAddress")
	public String add(UsersAddress address){
		System.out.println(address.getName()+"9000000000000000");
		addUserService.add(address);
		return "redirect:/adduser/usermessage";
	}
	
	
	
//使用ajax验证用户名
	@RequestMapping(value="/check",method=RequestMethod.GET)
	@ResponseBody
	public String checkuser(@RequestParam(value="q") String str){
		 List<LoginUser> list= addUserService.findalluser(); 
		 System.out.println(list.size()+"00000000000");
		 for(int i=0;i<list.size();i++) {
			 System.out.println(list.get(i).getName()+"tttttttttttt");
			 if(list.get(i).getName().equals(str)){
				 return "yes";
			 }
		 }
		 return "ww";
	}
}
