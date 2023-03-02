<%@ page import="ctrl.dao.AdminDao" %>
<%@ page import="ctrl.factory.AdminFactory" %>
<%@ page import="model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/29
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>更新管理员信息</title>
  <style>
    #newProfile{
      display: none;
    }
  </style>
</head>
<body>
<h2>信息更新</h2>
  <form action="<%=contextPath%>/AdminServer" method="post">
    <input type="hidden" name="op" value="adminUpdate">
    <p><input type="hidden" name="adminId" value="${sessionScope.admin.adminId}"></p>
    <p>昵称：<input type="text" name="newNickName" value="${sessionScope.admin.adminNickName}"></p>
    <p>密码：<input type="text" name="newPassword" value="${sessionScope.admin.adminPassword}"></p>
    个人头像:<p>
    <input type="hidden" name="adminProfile" value="sessionScope.admin.adminProfile">
    <c:choose>
      <c:when test="${empty sessionScope.admin.adminProfile}">
        <img src="/dir/havenot.jpg" onclick="pick()" width="150" alt="" id="myProfile">
      </c:when>
      <c:otherwise>
        <img src="/dir/upload/${sessionScope.admin.adminProfile}" onclick="pick()" width="150" alt="" id="myProfile">
      </c:otherwise>
    </c:choose>
  </p>
    <p><input type="hidden" name="newDepartmentId" value="${sessionScope.admin.adminDepartmentId}"></p>

    部门名称:<select name="newDepartmentId" style="width:130px">
      <option value="0">请选择</option>
    <c:forEach var="department" items="${requestScope.departments}">
      <c:choose>
        <c:when test="${department.departmentId eq sessionScope.admin.adminDepartmentId}">
          <option value="${department.departmentId}" selected="selected">${department.departmentName}</option>
        </c:when>
        <c:otherwise>
          <option value="${department.departmentId}">${department.departmentName}</option>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </select>
    <p>账号状态:<select name="newStationId" style="width:130px">
      <option value="0">请选择</option>
      <c:forEach var="station" items="${requestScope.stations}">
        <c:choose>
          <c:when test="${station.stationId eq sessionScope.admin.adminStationId}">
            <option value="${station.stationId}" selected="selected">${station.stationName}</option>
          </c:when>
          <c:otherwise>
            <option value="${station.stationId}">${station.stationName}</option>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </select></p>
    <c:if test="${sessionScope.admin.adminStationId ne 1}">
      <p>权限等级:<select name="newPowerId" style="width:130px">
        <option value="0">请选择</option>
        <c:forEach var="power" items="${requestScope.powers}">
          <c:choose>
            <c:when test="${power.powerId eq sessionScope.admin.adminPowerId}">
              <option value="${power.powerId}" selected="selected">${power.powerName}</option>
            </c:when>
            <c:otherwise>
              <option value="${power.powerId}">${power.powerName}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select></p>
    </c:if>
    <button>更新信息</button>
  </form>
<script>
  function pick(){
    window.open("<%=contextPath%>/updateProfile.jsp","_blank");
  }
  // var usedProfile = document.getElementById("myProfile").src;
  // var newProfile = null;
  // console.log("原头像地址为"+usedProfile);
  //
  // document.getElementById("newProfile").addEventListener("change",function getNew() {
  //   console.log("change方法执行");
  //   newProfile =document.getElementById("newProfile").value;
  //   newProfile = newProfile.replace("C:\\fakepath\\","/dir/");
  //   console.log(newProfile);
  //   document.getElementById("myProfile").src = newProfile;
  // });
  //
  // function pick(){
  //   document.getElementById("newProfile").click();
  // }
</script>
</body>
</html>
