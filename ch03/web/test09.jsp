<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="ch03.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 디스패치 페이지 </title>
</head>
<body>
    <h2> names 배열로 온 데이터 </h2>
    <ul>
        <c:forEach var="name" items="${names }">
            <li> ${name} </li>
        </c:forEach>
    </ul>
    <hr>
    <h2> ArrayList로 온 데이터 </h2>
    <ul>
        <c:forEach var="name" items="${list }">
            <li> ${name} </li>
        </c:forEach>
    </ul>
    <hr>
    <h2> map으로 온 Map 데이터 </h2>
    <ul>
        <c:forEach var="i" items="${map }">
            <li> ${i.key } : ${i.value } </li>
        </c:forEach>
    </ul>
    <hr>
    <h2> ArrayList&lt;Member&gt;로 온 데이터 </h2>
    <ul>
        <c:forEach var="member" items="${mList }">
            <li>
                <p> 번호 : ${member.no} </p>
                <p> 번호 : ${member.id} </p>
                <p> 번호 : ${member.pw} </p>
                <p> 번호 : ${member.name} </p>
                <p> 번호 : ${member.point} </p>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
