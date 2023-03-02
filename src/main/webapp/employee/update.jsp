<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/1
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp"%>
<html>
<head>
    <title>更新信息页</title>
</head>
<body>
    <h2>修改个人信息</h2>
    <form action="<%=contextPath%>/EmployeeServer?op=updateEmployee">
        <p>员工编号:<input type="text" name="employeeId" value="${sessionScope.employee.employeeId}"></p>
        <p>员工姓名:<input type="text" name="employeeName" value="${sessionScope.employee.employeeName}"></p>
        <p>员工密码:<input type="text" name="employeePassword" value="${sessionScope.employee.employeePassword}"></p>
        <p>员工性别:<input type="text" name="employeeGender" value="${sessionScope.employee.employeeGender}"></p>
        <p>员工年龄:<input type="text" name="employeeAge" value="${sessionScope.employee.employeeAge}"></p>
        <p>员工头像:<input type="text" name="employeeProfile" value="${sessionScope.employee.employeeProfile}"></p>
        <p>员工部门:<input type="text" name="employeeDepartmentId" value="${sessionScope.employee.employeeDepartmentId}"></p>
        <p>员工权限:<input type="text" name="employeePowerId" value="${sessionScope.employee.employeePowerId}"></p>
        <p>员工职位:<input type="text" name="employeePosition" value="${sessionScope.employee.employeePosition}"></p>
        <p>员工状态:<input type="text" name="employeeStation" value="${sessionScope.employee.employeeStation}"></p>
        <button>更新信息</button>
    </form>
</body>
</html>
