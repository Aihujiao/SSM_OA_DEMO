<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/30
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>添加管理员</title>
</head>
<body>
<h2>管理员注册</h2>
    <form action="<%=contextPath%>/AdminServer">
        <input type="hidden" name="op" value="adminRegister">
        <p><input type="text" name="adminNickName" placeholder="请输入要注册的管理员昵称"></p>
        <p><input type="text" name="adminPassword" placeholder="请输入用于登录的密码" value="admin" readonly></p>
        <p><input type="text" name="adminProfile" placeholder="用户头像地址//待完善"></p>
        <p><input type="text" name="adminDepartmentId" placeholder="部门编号"></p>
        <button>注册管理员</button>
    </form>
</body>
</html>
