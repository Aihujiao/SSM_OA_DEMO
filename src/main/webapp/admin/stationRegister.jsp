<%@ page import="java.util.List" %>
<%@ page import="ctrl.dao.StationDao" %>
<%@ page import="model.Station" %><%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/5
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>添加工作状态</title>
</head>
<body>
<h2>新增工作状态</h2>
    <form action="<%=contextPath%>/AdminServer">
        <input type="hidden" name="op" value="stationRegister">
        <p>状态名称：<input type="text" name="stationName" placeholder=""></p>
        <p>状态介绍：<textarea name="stationIntro" id="stationIntro" cols="30" rows="10" placeholder="请输入该状态的简要描述"></textarea></p>
        <button>添加状态</button>
    </form>
</body>
</html>
