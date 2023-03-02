<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/29
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>操作功能</title>
</head>
<body>
<h2>管理员功能</h2>
<form action="" method="post">
    <p>你好管理员<b>${sessionScope.admin.adminNickName}</b>你的编号是 <b>${sessionScope.admin.adminId}</b> ,请选择一下的功能进行操作</p>
    <hr>
    <input type="submit" formaction="<%=contextPath%>/AdminServer?op=toAdminUpdate" value="更新个人信息">

    <c:choose>
        <c:when test="${sessionScope.admin.adminId == 1}">
            <hr>
            注册功能
            <hr>
            <input type="submit" formaction="<%=contextPath%>/admin/register.jsp" value="注册管理员">
            <input type="submit" formaction="<%=contextPath%>/admin/departmentRegister.jsp" value="注册部门">
            <input type="submit" formaction="<%=contextPath%>/AdminServer?op=toEmployeeRegister" value="注册员工">
            <input type="submit" formaction="<%=contextPath%>/PowerServer?op=toPowerRegister" value="新增权限">
            <input type="submit" formaction="<%=contextPath%>/admin/stationRegister.jsp" value="新增状态">
            <input type="submit" formaction="<%=contextPath%>/admin/positionRegister.jsp" value="新增职位">
            <hr>
            查询功能
            <hr>
            <input type="submit" formaction="<%=contextPath%>/AdminServer?op=getAllAdmins" value="查询管理员">
            <input type="submit" formaction="<%=contextPath%>/DepartmentServer?op=getAllDepartments" value="查询部门">
            <input type="submit" formaction="<%=contextPath%>/EmployeeServer?op=getAllEmployees" value="查询员工信息">
            <input type="submit" formaction="<%=contextPath%>/PowerServer?op=getAllPowers" value="查询所有权限">
            <input type="submit" formaction="<%=contextPath%>/StationServer?op=getAllStations" value="查询所有状态">
        </c:when>
        <c:otherwise>
            <input type="submit" formaction="/AdminServer?op=adminDeleteById" value="注销账户">
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${param.msg == 'succeed'}">
            <p style="color: red">操作成功</p>
        </c:when>
        <c:when test="${param.msg == 'err'}">
            <p style="color: red">操作失败</p>
        </c:when>
        <c:when test="${param.exist == 'true'}">
            <p style="color: red">账号已存在！</p>
        </c:when>
        <c:when test="${param.msg == 'registerSucceed'}">
            <p style="color: red">注册成功</p>
        </c:when>
        <c:when test="${param.msg == 'registerFalse'}">
            <p style="color: red">注册失败</p>
        </c:when>
        <c:when test="${param.msg == 'noway'}">
            <p style="color: red">想都别想！无法删除最高级数据！</p>
        </c:when>
    </c:choose>
</form>
</body>
</html>
