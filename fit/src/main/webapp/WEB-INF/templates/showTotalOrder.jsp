<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showTotalOrder Page</title>
</head>
<body>

    <form action="${pageContext.request.contextPath }/totalorder/getTotalOrder">
       <table width="50%" border="0" cellpadding="3" cellspacing="1"
			align="center" border="1">
          <tr>
             <td>序号</td>
             <td>健身课程</td>
             <td>课程教练</td>
             <td>生成时间</td>
          </tr>
          <c:forEach items="${requestScope.totalOrderList }" var="totalOrder" varStatus="statu">
          <tr>
             <td>${statu.count }</td>
             <td>${totalOrder.totalOrderTrain }</td>
             <td>${totalOrder.totalOrderCoach }</td>
             <td>${totalOrder.totalOrderCreatetime }</td>
          </tr>
          </c:forEach>
       </table>
    </form>

</body>
</html>