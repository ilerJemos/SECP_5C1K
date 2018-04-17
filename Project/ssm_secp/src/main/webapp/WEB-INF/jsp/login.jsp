<%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/4/16
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/user/login" method="post">
    <table border="1">
        <tr>
            <td>用户名</td>
            <td><input id = "name" type="text" name="name"></td>
        </tr>
        <tr>
            j<td>密码</td>
            <td><input id = "password" type="text" name="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
