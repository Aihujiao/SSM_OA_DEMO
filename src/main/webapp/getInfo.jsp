<%@ page import="model.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="ctrl.dao.AdminDao" %>
<%@ page import="ctrl.factory.AdminFactory" %>
<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/1/30
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="base.jsp"%>

<%
    System.out.println("跳到了获取信息页面");
//    String searched = request.getParameter("searched");
//    System.out.println(searched.length());
%>

<c:choose>
    <c:when test="${param.type == 'admins'}">
        <c:set var="title" value="查询所有管理员信息"></c:set>
    </c:when>
    <c:when test="${param.type == 'departments'}">
        <c:set var="title" value="查询所有部门信息"></c:set>
    </c:when>
    <c:when test="${param.type == 'employees'}">
        <c:set var="title" value="查询所有员工信息"></c:set>
    </c:when>
</c:choose>

<html>
<head>
    <title>${title}</title>
</head>
<body>
    <h2>${title}</h2>

    <c:choose>
        <c:when test="${param.type == 'admins'}">
            <form action="<%=contextPath%>/AdminServer?op=getAdminsByQuery" method="post">
                管理编号:<input type="text" name="adminId" placeholder="输入管理员编号查询信息">
                人员昵称:<input type="text" name="adminLikeName" placeholder="输入管理员名称查询信息" >
                部门名称:<select name="adminDepartmentId" style="width:130px">
                    <option value="0">请选择</option>
                    <c:forEach var="department" items="${requestScope.departments}" varStatus="i">
                        <option value="${department.departmentId}">${department.departmentName}</option>
                    </c:forEach>
                </select>
                权限等级:<select name="adminPowerLevel" style="width:130px">
                    <option value="0">请选择</option>
                    <c:forEach var="power" items="${requestScope.powers}" varStatus="i">
                        <option value="${power.powerLevel}">${power.powerName}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="查询信息">
                <hr>
                <table border="1">
                    <thead>
                        <tr>
                            <th>管理员编号</th>
                            <th>管理员昵称</th>
                            <th>头像地址</th>
                            <th>部门名称</th>
                            <th>权限等级</th>
                            <th>当前状态</th>
                            <th>具体操作</th>
                        </tr>
                    </thead>
                <c:forEach items="${requestScope.admins}" var="admin">
                    <%
                        AdminDao adminCtrl = AdminFactory.instance().getAdminCtrl();
                        Admin admin = (Admin)pageContext.findAttribute("admin");
                        int adminDepartmentId = admin.getAdminDepartmentId();
                        int adminStation = admin.getAdminStationId();
                        String departmentName = adminCtrl.getAdminDepartmentNameById(adminDepartmentId);
                        String stationName = adminCtrl.getAdminStationById(adminStation);
                    %>

                        <tr>
                            <td>${admin.adminId}</td>
                            <td>${admin.adminNickName}</td>
                            <td>${admin.adminProfile}</td>
                            <td><%=departmentName%></td>
                            <td>${admin.adminPowerLevel}级</td>
                            <td><%=stationName%></td>
                            <td>
                                <input type="submit" formaction="<%=contextPath%>/detail.jsp?type=admin&adminId=${admin.adminId}" value="详情">
                                <input type="submit" formaction="<%=contextPath%>/AdminServer?op=adminDeleteById&adminId=${admin.adminId}" value="注销">
                            </td>
                        </tr>

                </c:forEach>
                </table>
                <c:forEach var="i" begin="1" end="${requestScope.pageSum}">
                    [<a href="${pageContext.request.contextPath}/AdminServer?op=getAllAdmins&currentPageNum=${i}">${i}</a>]
                </c:forEach>
            </form>
        </c:when>
        <c:when test="${param.type == 'departments'}">
            <form action="" method="post">
                <input type="text" name="departmentLikeName" placeholder="输入部门名称查询信息" value="${requestScope.searched}">
                <input type="submit" formaction="<%=contextPath%>/DepartmentServer?op=getDepartmentsByName">
                <table border="1">
                    <thead>
                    <tr>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>部门介绍</th>
                        <th>具体操作</th>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.departments}" var="department">

                        <tr>
                            <td>${department.departmentId}</td>
                            <td>${department.departmentName}</td>
                            <td>${department.departmentIntro}</td>
                            <td>
                                <input type="submit" formaction="<%=contextPath%>/detail.jsp?type=department&departmentId=${department.departmentId}" value="详情">
                                <input type="submit" formaction="<%=contextPath%>/DepartmentServer?op=departmentDeleteById&departmentId=${department.departmentId}" value="注销">
                            </td>
                        </tr>

                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${requestScope.pageSum}">
                        [<a href="${pageContext.request.contextPath}/DepartmentServer?op=getAllDepartments&currentPageNum=${i}">${i}</a>]
                    </c:forEach>
                </table>
            </form>
        </c:when>
        <c:when test="${param.type == 'employees'}">
            <form action="" method="post">
                <table border="1">
                    <thead>
                    <tr>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>员工密码</th>
                        <th>员工性别</th>
                        <th>员工年龄</th>
                        <th>员工头像</th>
                        <th>员工部门</th>
                        <th>员工权限</th>
                        <th>员工职位</th>
                        <th>员工状态</th>
                        <th>具体操作</th>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.employees}" var="employee">
                        <tbody>
                        <tr>
                            <td>${employee.employeeId}</td>
                            <td>${employee.employeeName}</td>
                            <td>${employee.employeePassword}</td>
                            <td>${employee.employeeGender}</td>
                            <td>${employee.employeeAge}</td>
                            <td>${employee.employeeProfile}</td>
                            <td>${employee.employeeDepartmentId}</td>
                            <td>${employee.employeePowerId}</td>
                            <td>${employee.employeePosition}</td>
                            <td>${employee.employeeStation}</td>
                            <td>
                                <input type="submit" formaction="<%=contextPath%>/detail.jsp?type=employee&employeeId=${employee.employeeId}" value="详情">
                                <input type="submit" formaction="<%=contextPath%>/EmployeeServer?op=employeeDeleteById&employeeId=${employee.employeeId}" value="注销">
                            </td>
                        </tr>
                        </tbody>
                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${requestScope.pageSum}">
                        [<a href="${pageContext.request.contextPath}/EmployeeServer?op=getAllEmployees&currentPageNum=${i}">${i}</a>]
                    </c:forEach>
                </table>
            </form>
        </c:when>
        <c:when test="${param.type == 'powers'}">
            <form action="" method="post">
                <table border="1">
                    <thead>
                    <tr>
                        <th>权限编号</th>
                        <th>权限名称</th>
                        <th>权限等级</th>
                        <th>权限介绍</th>
                        <th>具体操作</th>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.powers}" var="power">

                        <tr>
                            <td>${power.powerId}</td>
                            <td>${power.powerName}</td>
                            <td>${power.powerLevel}</td>
                            <td>${power.powerIntro}</td>
                            <td>
                                <input type="submit" formaction="<%=contextPath%>/detail.jsp?type=power&powerId=${power.powerId}" value="详情">
                                <input type="submit" formaction="<%=contextPath%>/PowerServer?op=powerDeleteById&powerId=${power.powerId}" value="注销">
                            </td>
                        </tr>

                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${requestScope.pageSum}">
                        [<a href="${pageContext.request.contextPath}/PowerServer?op=getAllPowers&currentPageNum=${i}">${i}</a>]
                    </c:forEach>
                </table>
            </form>
        </c:when>
        <c:when test="${param.type == 'stations'}">
            <form action="" method="post">
                <table border="1">
                    <thead>
                    <tr>
                        <th>状态编号</th>
                        <th>状态名称</th>
                        <th>权限介绍</th>
                        <th>具体操作</th>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.stations}" var="station">

                        <tr>
                            <td>${station.stationId}</td>
                            <td>${station.stationName}</td>
                            <td>${station.stationIntro}</td>
                            <td>
                                <input type="submit" formaction="<%=contextPath%>/detail.jsp?type=station&stationId=${station.stationId}" value="详情">
                                <input type="submit" formaction="<%=contextPath%>/StationServer?op=stationDeleteById&stationId=${station.stationId}" value="注销">
                            </td>
                        </tr>

                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${requestScope.pageSum}">
                        [<a href="${pageContext.request.contextPath}/AdminServer?op=getAllStations&currentPageNum=${i}">${i}</a>]
                    </c:forEach>
                </table>
            </form>
        </c:when>
    </c:choose>

</body>
</html>
