package Msg_Server;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.inject.New;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sk.dao.Ad_uva_list_dao;
import com.sk.dao.U_uva_info_dao;

import entity.Ad_uva_list;

import entity.Test_uva_info;


public class Msg_Sever {
	private ServerSocket serverSocket;
	private List<PrintWriter> list;
	File dirFile;
	//File file;
	SimpleDateFormat format=new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
	SimpleDateFormat format2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	public Msg_Sever() {
		try {
			System.out.println("服务器初始化...");
			serverSocket=new ServerSocket(9999);
			
			list=new ArrayList<PrintWriter>();
			System.out.println("服务器初始化完毕...");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("服务器初始化失败...");
			e.printStackTrace();
		}
	}
	public void start(){
		while (true) {
			System.out.println("等待客户端连接...");
			try {
				Socket socket = serverSocket.accept();
				Com_Run run=new Com_Run(socket);
				Thread thread=new Thread(run);
				thread.start();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
	}
	class Com_Run implements Runnable{
		private Socket socket;
		public Com_Run(Socket socket) {
			this.socket=socket;
			
		}
		public void run() {
			String ip=socket.getInetAddress().getHostAddress();
			int port=socket.getPort();
			Connection connection=null;
			System.out.println(ip+":"+port+"连接成功...");
			PrintWriter printWriter=null;
			PrintWriter pWriter=null;
			//SqlCon sqlCon=new SqlCon();
			String userString=null;
			double lat_new = 0.0;
			double lon_new = 0.0;
			FileWriter fileWriter=null;
			
			try {
				//pWriter=new PrintWriter(file);
				InputStream in = socket.getInputStream();
				OutputStream outputStream = socket.getOutputStream();
				InputStreamReader reader=new InputStreamReader(in,"UTF-8");
				OutputStreamWriter outputStreamWriter=new OutputStreamWriter(outputStream,"UTF-8");
				BufferedReader bufferedReader=new BufferedReader(reader);
				printWriter=new PrintWriter(outputStreamWriter,true);
				String msg;
				list.add(printWriter);
				//connection = ConUtil.getConnection();
				//connection.prepareStatement("insert into l_user() values()");
				String user = null;
				Change_WGS change_WGS=new Change_WGS();				
				Date date=new Date();
				String time = format.format(date);
				String time2 = format2.format(date);
				boolean flag=false;
				Ad_uva_list_dao ad_uva_list_dao = context.getBean("ad_uva_list_dao",Ad_uva_list_dao.class);
				U_uva_info_dao u_uva_info_dao = context.getBean("u_uva_info_dao",U_uva_info_dao.class);
				while ((msg=bufferedReader.readLine())!=null) {
					System.out.println(ip+":"+port+msg);
					
					if(user!=null){
						user=msg.split(";")[0].split(":")[1];
					}
					if (msg.indexOf("NaN")==-1 && msg.indexOf("null")==-1) {
						String[] note = msg.split(";");
						userString=note[0].split(":")[1];
						
						float pit=Float.parseFloat(note[1].split(":")[1]);
						float row=Float.parseFloat(note[2].split(":")[1]);
						float yaw=Float.parseFloat(note[3].split(":")[1]);
						double lon=Float.parseFloat(note[4].split(":")[1]);
						double lat=Float.parseFloat(note[5].split(":")[1]);
						float alt=Float.parseFloat(note[6].split(":")[1]);
						double[] l = change_WGS.wgs2bd(lat, lon);
						lat_new=l[0];
						lon_new =l[1];
						dirFile=new File("E:/"+userString);
						if (!dirFile.exists()) {
							dirFile.mkdir();
						}
						fileWriter=new FileWriter("E:/"+userString+"/"+time+".txt",true);
						fileWriter.write(msg+"\n");
						fileWriter.flush();
						//pWriter.append(msg+"\n");
						//pWriter.flush();
						
						//L_User l_User=new L_User(userString, rol, yaw, lon_new, lat_new, alt, pit);
						Ad_uva_list ad_uva_list=new Ad_uva_list(userString, pit, row, yaw, lon_new, lat_new, alt);
						
						//Ad_uva_list ad_uva_list=new Ad_uva_list(userString, pit, row, yaw, lon_new, lat_new, alt);
						//sqlCon.update_l_user(l_User);
						if (!flag) {
							
							ad_uva_list_dao.save(ad_uva_list);
							Test_uva_info u_info=new Test_uva_info();
							u_info.setStartLat(lat_new);
							u_info.setStartLon(lon_new);
							u_info.setStartime(time2);
							u_info.setUsername(userString);
							u_uva_info_dao.save(u_info);
							flag=true;
						}
						Test_uva_info u_info=new Test_uva_info();
						
						ad_uva_list_dao.update(ad_uva_list);
					}else {
						continue;
					}
				}
				String time3 = format2.format(new Date());
				U_uva_info_dao u_uva_info_dao1 = context.getBean("u_uva_info_dao",U_uva_info_dao.class);
				Test_uva_info test_uva_info=new Test_uva_info();
				test_uva_info.setUsername(userString);
				test_uva_info.setEndLat(lat_new);
				test_uva_info.setEndLon(lon_new);
				test_uva_info.setEndtime(time3);
				u_uva_info_dao1.update(test_uva_info);
				
				System.out.println("警告:"+ip+":"+port+"用户已下线...");
			} catch (Exception e) {
				System.out.println("警告:"+ip+":"+port+"用户已下线...");
			}finally{
				try {
					String time3 = format2.format(new Date());
					U_uva_info_dao u_uva_info_dao1 = context.getBean("u_uva_info_dao",U_uva_info_dao.class);
					Test_uva_info test_uva_info=new Test_uva_info();
					test_uva_info.setUsername(userString);
					test_uva_info.setEndLat(lat_new);
					test_uva_info.setEndLon(lon_new);
					test_uva_info.setEndtime(time3);
					u_uva_info_dao1.update(test_uva_info);
					//sqlCon.update_user_info(u_info);
					list.remove(printWriter);
					System.out.println("警告:"+ip+":"+port+"用户已下线...");
					if (pWriter!=null) {
						pWriter.close();
					}
					if (printWriter!=null) {
						printWriter.close();
					}
					if (fileWriter!=null) {
						fileWriter.close();
					}
					socket.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	public static void main(String[] args) {
		Msg_Sever msg_Sever=new Msg_Sever();
		msg_Sever.start();
	}
}
