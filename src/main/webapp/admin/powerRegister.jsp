<%@ page import="model.Power" %>
<%@ page import="ctrl.dao.PowerDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/5
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>添加权限</title>
</head>
<body>
<h2>新增权限信息</h2>
<form action="<%=contextPath%>/PowerServer">
    <input type="hidden" name="op" value="powerRegister">
    <p>权限名称：<input type="text" name="powerName" placeholder="权限名称"></p>
    权限等级:<select name="powerLevel" style="width:130px">
        <c:forEach var="power" items="${requestScope.powers}" varStatus="i">
            <c:choose>
                <c:when test="${i.count == 1}">
                    <option value="${i.count-1}">请选择</option>
                </c:when>
                <c:otherwise>
                    <option value="${i.count-1}">${i.count-1}级</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
    <p>权限介绍：<textarea name="powerIntro" id="powerIntro" cols="30" rows="10" placeholder="请输入该权限的简要描述"></textarea></p>
    <button>添加权限</button>
</form>
</body>
</html>
