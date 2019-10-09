package com.sk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sk.dao.Ad_info_dao;
import com.sk.dao.Ad_uva_list_dao;
import com.sk.dao.No_fly_dao;
import com.sk.dao.Nofly_number_dao;
import com.sk.dao.U_uva_info_dao;
import com.sk.dao.User_info_dao;

import entity.Ad_info;
import entity.Ad_uva_list;
import entity.No_fly;
import entity.Nofly_number;
import entity.Test_uva_info;
import entity.User_info;




@Controller
public class MyController {
	@Resource
	private User_info_dao user_dao;
	@Resource
	private U_uva_info_dao u_uva_dao;
	@Resource
	private Ad_uva_list_dao ad_uva_list_dao;
	@Resource
	private Nofly_number_dao nofly_number_dao;
	@Resource
	private Ad_info_dao ad_info_dao;
	@Resource
	private No_fly_dao no_fly_dao;
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		Cookie[] cookies = request.getCookies();
		String username="";
		String password="";
		if (cookies==null) {
			return "login";
		}
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("username_cookie")) {
				username=cookie.getValue();
			}
			if (cookie.getName().equals("password_cookie")) {
				password=cookie.getValue();
			}
		}
		map.put("username", username);
		map.put("password", password);
		return "login";
	}
	@RequestMapping("/tologin.do")
	public String tologin(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		User_info re = user_dao.findByName(username);
		String msg="";
		System.out.println(remember);
		if (re!=null && re.getPassword().equals(password)) {
			msg="user";
			map.put("username", username);
			map.put("password", password);
			if (remember!=null) {
				if (remember.equals("1")) {
					Cookie cookie=new Cookie("username_cookie", username);
					Cookie cookie2=new Cookie("password_cookie", password);
					response.addCookie(cookie);
					response.addCookie(cookie2);
				}else {
					Cookie[] cookies = request.getCookies();
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("username_cookie")) {
							cookie.setMaxAge(0);
						}
						if (cookie.getName().equals("password_cookie")) {
							cookie.setMaxAge(0);
						}
					}
				}
			}
		}else {
			msg="login";
		}
		return msg;
	}
	@RequestMapping("/register.do")
	public String register(){
		return "register";
	}
	@RequestMapping("/checkname.do")
	public void checkname(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		response.setContentType("text/plain; charset=utf-8");
		User_info re = user_dao.findByName(username);
		
		try {
			PrintWriter out = response.getWriter();
			if (re!=null) {
				out.print("用户名被占用");
			}else {
				out.print("用户名可以使用");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
	}
	@RequestMapping("/toregister.do")
	public String toregister(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("register_username");
		String password = request.getParameter("register_password");
		String euq = request.getParameter("device_code");
		User_info info=new User_info(username, password, euq);
		user_dao.save(info);
		u_uva_dao.createTable("u"+username);
		return "login";
	}
	@RequestMapping("/history.do")
	public String history(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String username = request.getParameter("username");
		//System.out.println(username);
		List<Test_uva_info> list = u_uva_dao.findAll("u"+username);
		map.put("history_list", list);
		for (Test_uva_info test_uva_info : list) {
			System.out.println(test_uva_info.getUsername());
		}
		return "history";
	} 
	@RequestMapping("/realtime_monitor.do")
	public void realtime_monitor(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String username=request.getParameter("username");
		request.setAttribute("username", username);
		RequestDispatcher re = request.getRequestDispatcher("realtime_monitor.jsp");
		try {
			re.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
	}
	@RequestMapping("/getuva_info.do")
	public void getuva_info(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("plain/text;charset=utf-8");
		String username=request.getParameter("username");
		//System.out.println("history:"+username);
		Ad_uva_list ad_uva_list = ad_uva_list_dao.findByName(username);
		if (ad_uva_list==null) {
			return;
		}
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(ad_uva_list.getPit()+";"+ad_uva_list.getRow()+";"+ad_uva_list.getYaw()+";"+ad_uva_list.getLon()+";"+ad_uva_list.getLat()+";"+ad_uva_list.getAlt());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}finally{
			if (out!=null) {
				out.close();
			}
		}
		
	}
	@RequestMapping("/find_plane.do")
	public void find_plane(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("plain/text;charset=utf-8");
		PrintWriter out = null;
		String user_name=request.getParameter("username");
		String info = null;
		if (user_name.equals("0")) {
			
			List<Ad_uva_list> list = ad_uva_list_dao.findAll();
			for (Ad_uva_list ad_uva_list : list) {
				info+="User:"+ad_uva_list.getUser()+";Pit:"+ad_uva_list.getPit()+";Row:"+ad_uva_list.getRow()+";Yaw:"+ad_uva_list.getYaw()+";Lon:"+ad_uva_list.getLon()+";Lat:"+ad_uva_list.getLat()+";Alt:"+ad_uva_list.getAlt()+"\n";
			}
		}else {
			
			Ad_uva_list ad_uva_list = ad_uva_list_dao.findByName(user_name);
			if (ad_uva_list!=null) {
				info="User:"+ad_uva_list.getUser()+";Pit:"+ad_uva_list.getPit()+";Row:"+ad_uva_list.getRow()+";Yaw:"+ad_uva_list.getYaw()+";Lon:"+ad_uva_list.getLon()+";Lat:"+ad_uva_list.getLat()+";Alt:"+ad_uva_list.getAlt()+"\n";
			}
			
		}
		try {
			out=response.getWriter();
			out.print(info);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}finally{
			if (out!=null) {
				out.close();
			}
		}
		
	}
	@RequestMapping("/add_number.do")
	public void add_number(HttpServletRequest request){
		String number = request.getParameter("nofly_number");
		Nofly_number number2=new Nofly_number();
		number2.setNumber(number);
		long intime=(new Date()).getTime();
		number2.setIntime(intime);
		Nofly_number entity_nofly = nofly_number_dao.findByNumber(number);
		if (entity_nofly==null) {
			nofly_number_dao.save(number2);
		}else {
			if (intime-entity_nofly.getIntime()>=2000) {
				nofly_number_dao.delete(number);
			}else {
				nofly_number_dao.update(number2);
			}
		}
		
	}
	@RequestMapping("/adminlogin.do")
	public String adminlogin(){
		return "adminlogin";
	}
	@RequestMapping("/toadminlogin.do")
	public String toadminlogin(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String username = request.getParameter("adminname");
		String password = request.getParameter("adminpassword");
		String remember = request.getParameter("remember");
		//User_info re = user_dao.findByName(username);
		Ad_info re = ad_info_dao.findByName(username);
		String msg="";
		System.out.println(remember);
		if (re!=null && re.getPassword().equals(password)) {
			msg="admin";
			map.put("adminname", username);
			map.put("adminpassword", password);
			if (remember!=null) {
				if (remember.equals("1")) {
					Cookie cookie=new Cookie("adminname_cookie", username);
					Cookie cookie2=new Cookie("adminpassword_cookie", password);
					response.addCookie(cookie);
					response.addCookie(cookie2);
				}else {
					Cookie[] cookies = request.getCookies();
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("adminname_cookie")) {
							cookie.setMaxAge(0);
						}
						if (cookie.getName().equals("adminpassword_cookie")) {
							cookie.setMaxAge(0);
						}
					}
				}
			}
		}else {
			msg="adminlogin";
		}
		return msg;
	}
	@RequestMapping("/admin_realtime_monitor.do")
	public void admin_realtime_monitor(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		List<Ad_uva_list> list = ad_uva_list_dao.findAll();
		response.setContentType("plain/text;charset=utf-8");
		PrintWriter out=null;
		String info ="";
		try {
			out = response.getWriter();
			if (list!=null) {
				for (Ad_uva_list ad_uva_list : list) {
					info+="User:"+ad_uva_list.getUser()+";Pit:"+ad_uva_list.getPit()+";Row:"+ad_uva_list.getRow()+";Yaw:"+ad_uva_list.getYaw()+";Lon:"+ad_uva_list.getLon()+";Lat:"+ad_uva_list.getLat()+";Alt:"+ad_uva_list.getAlt()+"\n";
				}
			}
			out.print(info);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (out!=null) {
				out.close();
			}
		}
		
	}
	@RequestMapping("/admin_realtime.do")
	public String admin_realtime(){
		return "admin_realtime_monitor";
	}
	@RequestMapping("/add_no_fly.do")
	public void add_no_fly(HttpServletRequest request,HttpServletResponse response){
		String info=request.getParameter("info");
		System.out.println("info:"+info);
		String begintime=request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String type=info.split(";")[0].split(":")[1];
		String aString="";
		aString=info.replaceAll("Type:"+type+";", "");
		No_fly fly=new No_fly();
		fly.setInfo(aString);
		fly.setType(type);
		fly.setEndtime(endtime);
		fly.setStartime(begintime);
		no_fly_dao.save(fly);
		System.out.println(info);
	}
	@RequestMapping("/find_no_fly.do")
	public void find_no_fly(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("plain/text;charset=utf-8");
		List<No_fly> list = no_fly_dao.findAll();
		String infoString="";
		PrintWriter out =null;
		try {
			out=response.getWriter();
			for (No_fly no_fly : list) {
				infoString+="Type:"+no_fly.getType()+";"+no_fly.getInfo()+"\n";
			}
			System.out.println(infoString);
			out.print(infoString);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (out!=null) {
				out.close();
			}
		}
	}
}
