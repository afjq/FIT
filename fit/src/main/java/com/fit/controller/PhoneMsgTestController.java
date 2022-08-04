package com.fit.controller;

import java.io.IOException;
import java.util.UUID;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/PhoneMsgTest")
public class PhoneMsgTestController<PhoneModel> {

	private String random = UUID.randomUUID().toString().replace("-", "");

	private String code1 = random.substring(0,6);

	//	获取
	@RequestMapping("getCode")
	@ResponseBody
	public String getCode(@RequestParam("phone") String phone) throws HttpException, IOException  {
		System.out.println("getCode执行：");
		HttpClient client = new HttpClient(); 
		PostMethod post = new PostMethod("http://utf8.api.smschinese.cn/"); // 在头文件中设置转码
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8"); // NameValuePair实例及其配置
		NameValuePair[] data = { 
				new NameValuePair("Uid", "Liwaiwai"),//中国网建sms平台注册的用户名
				new NameValuePair("Key", "d41d8cd98f00b204e980"),
				//中国网建sms平台注册的用户密钥
				new NameValuePair("smsMob", phone), //将要发送到的手机号码
				//要发送的短信内容
				new NameValuePair("smsText", "验证码：" +this.code1) };
		post.setRequestBody(data);

		client.executeMethod(post); Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode(); 
		System.out.println("statusCode:" +statusCode);
		for (Header h : headers) { 
			System.out.println(h.toString()); }
		String result = new String(post.getResponseBodyAsString().getBytes("utf-8")); 
		System.out.println(result); // 打印返回消息状态 post.releaseConnection();
		return "短信发送成功，请注意查收！";
	}

	//判断两个验证码是否一致
	@RequestMapping("codeCheck")
	@ResponseBody
	public Boolean checkCode(@RequestParam("code") String code)throws HttpException, IOException  {
		System.out.println("从页面ajax传来的code:"+code);
		if(code==code1) {
			System.out.println("验证成功");//在页面填写的验证码与发送到用户手机上的验证码一致时
			return true;
		}
		else {
			System.out.println("验证失败");
			return  false;
		}
		
	}



}





