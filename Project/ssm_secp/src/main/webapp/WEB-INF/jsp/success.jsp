<%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/4/16
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success</title>
</head>
<body>

    <div>
        <strong> welcome,${sessionScope.user.username}! </strong>
    </div>
    this is success page!

    <a href="/user/anotherpage.do">点我跳到另一个页面</a>

    <form action="/user/outLogin.do">
        <table>
            <tr>
                <td><input type="submit" value="退出登录"></td>
            </tr>
        </table>
    </form>
</body>
</html>
