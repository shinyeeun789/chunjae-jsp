<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // test5.jsp
    String path = request.getContextPath();                 // 현재 프로젝트의 위치(.../ch02/web)
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Scope Test </title>
</head>
<body>
<div class="container">
    <header id="hd">
        <%@include file="nav.jsp" %>
    </header>
    <h2 class="title"> Scope Test </h2>
    <hr>
<%
    String req = request.getParameter("req");
    String ses = (String) session.getAttribute("sesData");
    String app = (String) application.getAttribute("appData");
    String msg = request.getParameter("msg");
%>

    <ul class="list">
        <li> request : <%=req %> </li>
        <li> session : <%=ses %> </li>
        <li> application : <%=app %> </li>
        <li> msg : <%=msg %> </li>
    </ul>
    <p>
        <a href="test5.jsp"> 페이지5로 이동하기 </a> <br>
        <% if(ses != null) {%>
            <a href="logout.jsp"> 로그아웃 </a>
        <% } else { %>
            <a href="test4.jsp"> 로그인 </a>
        <% } %>
    </p>
</div>
</body>
</html>