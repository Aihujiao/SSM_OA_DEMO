<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/2
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp"%>
<html>
<head>
    <title>员工注册</title>
</head>
<body>
  <form action="<%=contextPath%>/EmployeeServer">
    <input type="hidden" name="op" value="employeeRegister">
    <p>员工姓名:<input type="text" name="employeeName" placeholder="请输入要注册的员工姓名"></p>
    <p>员工密码:<input type="text" name="employeePassword" placeholder="请输入用于登录的密码"></p>
    员工性别:<select name="employeeGender" style="width:130px">
      <option value="0">男</option>
      <option value="1">女</option>
  </select>
    <p>员工年龄:<input type="text" name="employeeAge" placeholder="请输入您的年龄"></p>
    <p>员工头像:<input type="text" name="employeeProfile" placeholder="用户头像地址//待完善"></p>
    员工部门:<select name="departmentId" style="width:130px">
    <option value="0">请选择</option>
    <c:forEach var="department" items="${requestScope.departments}" varStatus="i">
      <option value="${i.count}">${department.departmentName}</option>
    </c:forEach>
  </select>
  <p>
    员工职位:<select name="positionId" style="width:130px">
    <option value="0">请选择</option>
    <c:forEach var="position" items="${requestScope.positions}">
      <option value="${position.positionId}">${position.positionName}</option>
    </c:forEach>
  </select>
  </p>
  <p>
    员工状态:<select name="stationId" style="width:130px">
    <option value="0">请选择</option>
    <c:forEach var="station" items="${requestScope.stations}">
      <option value="${station.stationId}">${station.stationName}</option>
    </c:forEach>
  </select>
  </p>
    <button>注册员工</button>
  </form>
</body>
</html>
