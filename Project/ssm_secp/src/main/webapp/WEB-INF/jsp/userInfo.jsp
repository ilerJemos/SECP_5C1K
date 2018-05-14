<%@ page import="com.ssm.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/5/13
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userInfo</title>
</head>
<body>
<table>
    <th>id</th><th>name</th><th>password</th>
    <%
        User user = (User)session.getAttribute("user");
    %>
    <tr>
        <td><%
            out.print(user.getuId());
        %></td>
        <td><%
            out.print(user.getuName());
        %></td>
        <td><%
            out.print(user.getuPassword());
        %></td>
    </tr>
</table>
</body>
</html>
