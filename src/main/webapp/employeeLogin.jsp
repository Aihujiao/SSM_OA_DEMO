<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/29
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>

<html>
<head>
    <title>员工登录</title>
</head>
<body>
<form action="<%=contextPath%>/EmployeeServer" method="post">
    <input type="hidden" name="op" value="employeeLogin">
    <p>员工名：<input type="text" name="employeeName"></p>
    <p>员工密码：<input type="text" name="employeePassword"></p>
    <button>登录</button>
</form>
</body>
</html>
