<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/30
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>部门注册</title>
</head>
<body>
    <h2>部门注册</h2>
    <form action="<%=contextPath%>/DepartmentServer">
        <input type="hidden" name="op" value="departmentRegister">
        <p><input type="text" name="departmentName" placeholder="请输入需要添加的部门名称"></p>
        <p><input type="text" name="departmentIntro" placeholder="请输入该部门的介绍"></p>
        <button>注册部门</button>
    </form>
</body>
</html>
