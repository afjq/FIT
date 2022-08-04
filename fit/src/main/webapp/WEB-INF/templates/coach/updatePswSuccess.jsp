<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密码修改成功页面</title>
<script type="text/javascript"
	src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script type="text/javascript"> 
$(function() {    
    function jump(count) {    
        window.setTimeout(function(){    
            count--;    
            if(count > 0) {    
                $('#num').attr('innerHTML', count);    
                jump(count);    
            } else {    
                location.href="/coach/toCoachLogin";    
            }    
        }, 1000);    
    }    
    jump(3);    
});  
</script>
</head>
<body>


	<span style="color: green" mce_style="color:Green"> 修改密码成功！ 页面将在<span
		id="num">3</span>秒后跳转重新登陆<br />
	</span>
</body>
</html>