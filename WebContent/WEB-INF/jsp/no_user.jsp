<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示</title>
<link href="images/favicon.ico" rel="shortcut icon" />
</head>
<body>
	<p>用户名或密码错误！</p>
	<p>三秒后自动跳转到登陆界面<p>
	<p><a href="index.jsp">点击自动跳转</a></p>
	<%response.setHeader("refresh", "3;URL=index.jsp"); %>
</body>
</html>