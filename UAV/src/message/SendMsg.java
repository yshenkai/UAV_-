package message;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SendMsg {
	HttpClient client;
	PostMethod method;
	public SendMsg() {
		client=new HttpClient();
		method=new PostMethod("http://gbk.api.smschinese.cn/");
		method.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");
	}
	public String send_Msg(String number) throws UnsupportedEncodingException, IOException{
		String data=number+"用户您好,您的无人机已飞入禁飞区,请立即返航。";
		NameValuePair[] msg ={ new NameValuePair("Uid", "shenkai"),new NameValuePair("Key", "d41d8cd98f00b204e980"),new NameValuePair("smsMob",number),new NameValuePair("smsText",data)};
		method.setRequestBody(msg);
		client.executeMethod(method);
		Header[] headers = method.getResponseHeaders();
		
		String result = new String(method.getResponseBodyAsString().getBytes("gbk")); 
		System.out.println(result); //打印返回消息状态
		method.releaseConnection();
		return result;
		
	}
}
