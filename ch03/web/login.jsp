<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 로그인 </title>
</head>
<body>
<%
    session.setAttribute("sid", "admin");
%>
<a href="test11.jsp?noVar=40"> 테스트11로 가기 </a>
</body>
</html>
