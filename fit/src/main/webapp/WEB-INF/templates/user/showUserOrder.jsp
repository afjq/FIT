<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的所有订单</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script>
	$(function(){
	
		/* 删除确认 */
		$("#userOrderTable #del").each(function() {
			$(this).click(function() {
				if (confirm('您确定要删除此订单吗?') != true) {
					return false;
				}
			});
		});
		
	});
</script>
</head>
<body>
查看订单：
	<ul id="state">
		<c:forEach items="${requestScope.orderStateList }" var="orderState">
			<li value="${orderState.stateId }"><a href="/UserOrder/toShowUserOrder?stateId=${orderState.stateId }">${orderState.stateName }</a></li>
		</c:forEach>
	</ul>
	<table id="userOrderTable">
		<tr>
			<td>订单号</td>
			<td>订单价格</td>
			<td>下单时间</td>
			<td>订单状态</td>
			<td></td>
		</tr>
		<c:forEach items="${requestScope.userOrderList }" var="userOrder">
			<tr>
			<td>${userOrder.userorderId }</td>
			<td>${userOrder.userorderPrice }</td>
			<td><fmt:formatDate value="${userOrder.userorderCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${userOrder.userorderState.stateName }</td>
			<td>
				<a id="del" href="/UserOrder/del?orderId=${userOrder.userorderId }">删除订单</a>
				<%-- <a id="pay" href="/alipay/toPay?orderId=${userOrder.userorderId }&price=${userOrder.userorderPrice }" style="display: none">付款</a>  --%>
				<a href="/uODetail/toShowuoDetail?orderId=${userOrder.userorderId }">进入订单</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>