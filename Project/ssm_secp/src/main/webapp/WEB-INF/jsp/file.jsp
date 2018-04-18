<%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/4/17
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>上传文件</h1>
    <form method="post" action="/user/doUpload" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit" value="上传文件"/>
    </form>
</body>
</html>
