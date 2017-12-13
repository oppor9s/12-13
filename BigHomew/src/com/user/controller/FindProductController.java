package com.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.DeleteShopCar;
import com.entity.Product;
import com.entity.Producttype;
import com.entity.Shopcar;
import com.user.service.AdminLoginService;
import com.user.service.ChangeShopCarService;
import com.user.service.FindProductService;

@Controller
@RequestMapping("/findproduct")
public class FindProductController {
	@Resource
	private FindProductService findProductService;
	@Resource
	private ChangeShopCarService changeshopcarservice;
	@Resource
	private AdminLoginService adminloginservice;
	//查询所有产品
	@RequestMapping("/findAll")
	public String finall(Model model){
	model.addAttribute("list",findProductService.findAll());
	return "product";
	}
	//分页查询
	@RequestMapping("/findByPage")
	public String findByPage(@RequestParam("pagenum") int pagenum,Model model){
		List<Product> list=findProductService.findByPage(pagenum, 4);
		List<Product> list1=findProductService.findAll();
		int prenum=0,nextnum=0; int count=list1.size();
		System.out.println(count);
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
	//分类查询
	@RequestMapping("/findBytype1")
	public String findByPage1(@RequestParam(value="pagenum") int pagenum,@RequestParam(value="id") int id,Model model){
		System.out.println("分类查询");
		List<Producttype> list2=findProductService.findproducttype(id);
		List<Product> list1=findProductService.findByPage1(list2.get(0).getName(),pagenum, 4);
		List<Product> list3=findProductService.findbytype(list2.get(0).getName());
		int count=list3.size();;
		int prenum=0,nextnum=0; 
		if(count<4){nextnum=1;prenum=1;}
		 else{
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
		model.addAttribute("id",id);
		model.addAttribute("list",list1);
		
		return "product1";
	}
	//根据id查询商品
	@RequestMapping("/findById")
	public String findById(@RequestParam("id") int id,Model model,HttpSession session){
		String name=(String) session.getAttribute("name");
		if(name==null){
			JOptionPane.showMessageDialog(null,"请先登录。");
			return "redirect:/findproduct/findByPage?pagenum=1";
		}
		List<Product> list=findProductService.findById(id);
		model.addAttribute("list",list.get(0));
		return "buy";
	}
	//根据用户名查询购物车
	@RequestMapping("/findByUserName")
	public String findByI(Model model,HttpSession session){
		List<Shopcar> list=findProductService.findByUserName((String) session.getAttribute("name"));
	//	System.out.println(list.get(0).getUserName());
		model.addAttribute("list",list);
		return "shop1111";
	}
	//根据用户名删除购物车的数据
	@RequestMapping("/delete")
	public String delete(int id,Model model,HttpSession session){
		findProductService.delete(id);
		List<Shopcar> list=findProductService.findByUserName((String) session.getAttribute("name"));
		//	System.out.println(list.get(0).getUserName());
			model.addAttribute("list",list);
		return "shop1111";
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
		session.setAttribute("changecount", count);
		for(int i=0;i<te.length;i++){
			System.out.println("2222222222"+"  "+te[i]);
		}
		for(int i=0;i<temp.length;i++){
			System.out.println(temp[i]);
			findProductService.delete(Integer.parseInt(temp[i]));
		}
		return "redirect:/findproduct/findByUserName";
	}		
	//修改购物车商品数量
	@RequestMapping("/jianchangecount")
	public String jianchangecount(@RequestParam("id") String iid,HttpSession session,Model model){
		int id=new Integer(iid);
		List<Shopcar> list=findProductService.findshopcarcount(id);
		System.out.println("2222222222");
		System.out.println("00000000"+list.get(0).getCount());
		int count=list.get(0).getCount()-1;
		if(count==0){
			count=1;
		}
		System.out.println(count);
		changeshopcarservice.changecount(count, id);
		//List<Shopcar> list1=findProductService.findByUserName((String) session.getAttribute("name"));
		//model.addAttribute("list",list1);
		return "redirect:/findproduct/findByUserName";
	}
	@RequestMapping("/jiachangecount")
	public String jiachangecount(@RequestParam("id") String iid,Model model,HttpSession session){
		int id=new Integer(iid);
		List<Shopcar> list=findProductService.findshopcarcount(id);
		int count=list.get(0).getCount()+1;
		changeshopcarservice.changecount(count, id);
		//List<Shopcar> list1=findProductService.findByUserName((String) session.getAttribute("name"));
		//System.out.println(list1.get(0).getCount());
		//model.addAttribute("list",list1);
		return "redirect:/findproduct/findByUserName";
	}
	//根据商品类别查找商品
	public String findbyproducttype(){
		return "";
	}
}
