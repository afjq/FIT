package com.fit.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeCloseRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.fit.config.AlipayConfig;


@Controller
@RequestMapping("/alipay")
public class PayController {
	
//	http://localhost:8080/orderPay/toOrderPay?orderId=b2898eab2fc24b579e818ce48ceec035&price=8809.00
	@RequestMapping("toPay")
	public String toPay(
			@RequestParam("orderId")String orderId,
			@RequestParam("price")String price,
			Model model) {
		System.out.println("PayController.toPay() ran..");
		model.addAttribute("orderId", orderId);
		model.addAttribute("price", price);
		return "user/pay/index";
	}

	@RequestMapping("toNotify_url")
	public String toNotify_url() {
		System.out.println("PayController.notify_url() ran..");
		return "user/pay/notify_url";
	}
	@RequestMapping("return_url")
	public String return_url() {
		System.out.println("PayController.return_url() ran..");
		return "user/pay/return_url";
	}
	
	@ResponseBody
	@RequestMapping("pay")
	public String pay(HttpServletRequest request) {
		try {
			//获得初始化的AlipayClient
			AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
			
			//设置请求参数
			AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
			alipayRequest.setReturnUrl(AlipayConfig.return_url);
			alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
			
			//商户订单号，商户网站订单系统中唯一订单号，必填
			System.out.println("订单号："+request.getParameter("WIDout_trade_no"));
			String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//付款金额，必填
			System.out.println("付款金额："+request.getParameter("WIDtotal_amount"));
			String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
			//订单名称，必填
			System.out.println("订单名称："+request.getParameter("WIDsubject"));
			String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
			//商品描述，可空
			String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
			
			alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
					+ "\"total_amount\":\""+ total_amount +"\"," 
					+ "\"subject\":\""+ subject +"\"," 
					+ "\"body\":\""+ body +"\"," 
					+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			
			//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
			//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			//		+ "\"total_amount\":\""+ total_amount +"\"," 
			//		+ "\"subject\":\""+ subject +"\"," 
			//		+ "\"body\":\""+ body +"\"," 
			//		+ "\"timeout_express\":\"10m\"," 
			//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
			
			//请求
			String result = alipayClient.pageExecute(alipayRequest).getBody();
			
			//输出
			System.out.println("pay()的result：");
			System.out.println(result);
			return result;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping("close")
	public String close(HttpServletRequest request) {
		try {
			//获得初始化的AlipayClient
			AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

			//设置请求参数
			AlipayTradeCloseRequest alipayRequest = new AlipayTradeCloseRequest();
			//商户订单号，商户网站订单系统中唯一订单号
			String out_trade_no = new String(request.getParameter("WIDTCout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("WIDTCtrade_no").getBytes("ISO-8859-1"),"UTF-8");
			//请二选一设置

			alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," +"\"trade_no\":\""+ trade_no +"\"}");

			//请求
			String result = alipayClient.execute(alipayRequest).getBody();

			//输出
			System.out.println(result);
			
			return result;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	
}
