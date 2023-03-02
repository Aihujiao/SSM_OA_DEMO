<%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/14
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title>更新头像</title>
    <style>
        #newProfile{
            display: none;
        }
        #adminId,#adminProfile{
            display: none;
        }
    </style>
</head>
<body>
    <form action="<%=contextPath%>/ProfileUpdateServer" method="post" enctype="multipart/form-data">
        <input type="text" id="adminId" value="${sessionScope.admin.adminId}" name="adminId"/>
        <input type="text" id="adminProfile" value="${sessionScope.admin.adminProfile}" name="adminProfile">
        <c:choose>
            <c:when test="${empty sessionScope.admin.adminProfile}">
                <img src="/dir/havenot.jpg" onclick="pick()" width="150" alt="" id="myProfile">
                <input type="file" name="newProfile" id="newProfile"><br>
            </c:when>
            <c:otherwise>
                <img src="/dir/upload/${sessionScope.admin.adminProfile}" onclick="pick()" width="150" alt="" id="myProfile">
                <input type="file" name="newProfile" id="newProfile"><br>
            </c:otherwise>
        </c:choose>
        <p><button>提交头像</button></p>
    </form>
</body>
<script>
    var usedProfile = document.getElementById("myProfile").src;
    var newProfile = null;
    console.log("原头像地址为"+usedProfile);

    document.getElementById("newProfile").addEventListener("change",function getNew() {
        console.log("change方法执行");
        newProfile =document.getElementById("newProfile").value;
        newProfile = newProfile.replace("C:\\fakepath\\","/dir/");
        console.log(newProfile);
        document.getElementById("myProfile").src = newProfile;
    });

    function pick(){
        document.getElementById("newProfile").click();
    }

</script>
</html>
