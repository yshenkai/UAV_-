package message;

import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sk.dao.Nofly_number_dao;

import entity.Nofly_number;

public class Scan_Noflu_Number {
	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		Nofly_number_dao nofly_number = context.getBean("nofly_number_dao",Nofly_number_dao.class);
		Date date=new Date();
		long intime = date.getTime()-60000;
		nofly_number.deleteByLowTime(intime);
	}
}
