package Msg_Server;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.UnknownHostException;
public class Msg_Client {
	private Socket socket;
	public Msg_Client() {
		System.out.println("客户端初始化...");
		try {
			socket=new Socket("10.64.11.10", 9999);
			System.out.println("客户端初始化完毕...");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void send_Msg(String msg){
		
		OutputStreamWriter writer;
		PrintWriter printWriter=null;
		try {
			OutputStream out = socket.getOutputStream();
			writer = new OutputStreamWriter(out, "UTF-8");
			printWriter=new PrintWriter(writer,true);
			printWriter.println(msg);
			printWriter.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public static void main(String[] args) {
		Msg_Client client=new Msg_Client();
		
			client.send_Msg("User:13262880098;Pit:-1.2;Rol:-2.8;Yaw:-162.9;"+
		"Lon:121.90465365213606;Lat:30.876299626639103;Alt:11.1"+"\n");
			
		
	}
	
}
