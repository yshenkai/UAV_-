package com.sk.test;


import java.util.Date;
import java.util.List;

import javax.enterprise.inject.New;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sk.dao.Ad_info_dao;
import com.sk.dao.Ad_uva_list_dao;
import com.sk.dao.Nofly_number_dao;
import com.sk.dao.U_uva_info_dao;

import entity.Ad_info;
import entity.Ad_uva_list;
import entity.Nofly_number;
import entity.Test_uva_info;

public class Database_connection_test {

	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		Nofly_number_dao dao = context.getBean("nofly_number_dao",Nofly_number_dao.class);
		Nofly_number number=new Nofly_number();
		number.setNumber("1111111111");
		number.setIntime((new Date()).getTime());
		dao.save(number);
		
	}

}
