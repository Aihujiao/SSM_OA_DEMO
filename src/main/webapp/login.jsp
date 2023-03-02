<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/14
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="css/layui.css" th:href="@{../web/css/layui.css}"/>
  <link rel="stylesheet" type="text/css" href="css/self.css" th:href="@{../web/css/self.css}"/>
  <script src="js/layui.js" type="text/javascript" charset="utf-8"></script>
  <title>OA登录系统</title>
</head>
<body>
<div class="layui-card layui-panel pageBody">
  <!-- 卡片面板  -->
  <div class="layui-card-header">
    系统登陆页面
  </div>
  <div class="layui-card-body">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
      <ul class="layui-tab-title">
        <div class="tabTitle">
          <li class="layui-this">管理员登录</li>
          <li>职员登录</li>
        </div>
      </ul>
      <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
          <form class="layui-form" action="<%=contextPath%>/AdminServer" method="post">
            <input type="hidden" name="op" value="adminLogin" />
            <div class="layui-form-item">
              <label class="layui-form-label">管理昵称</label>
              <div class="layui-input-block">
                <input type="text" name="adminNickName" required lay-verify="required" placeholder="请输入管理员昵称" autocomplete="off" class="layui-input longInputBox resizeInput">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">登录密码</label>
              <div class="layui-input-inline">
                <input type="password" name="adminPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-input-block">
              <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
          </form>
        </div>
        <div class="layui-tab-item">
          <form class="layui-form" action="<%=contextPath%>/EmployeeServer?op=employeeLogin" method="post">
            <input type="hidden" name="op" value="employeeLogin" />
            <div class="layui-form-item">
              <label class="layui-form-label">员工账号</label>
              <div class="layui-input-block">
                <input type="text" name="employeeName" required lay-verify="required" placeholder="请输入管理员昵称" autocomplete="off" class="layui-input longInputBox resizeInput">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">登录密码</label>
              <div class="layui-input-inline">
                <input type="password" name="emoloyeePassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-input-block">
              <div class="self-input-button">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
