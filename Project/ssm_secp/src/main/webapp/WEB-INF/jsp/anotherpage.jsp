<%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/4/17
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TestPage</title>
</head>
<body>
<div>
    <strong> ${sessionScope.user.username}!!!!! </strong>
</div>
<form action="/user/outLogin.do">
    <table>
        <tr>
            <td><input type="submit" value="退出登录" ></td>
        </tr>
    </table>
</form>
</body>
</html>
