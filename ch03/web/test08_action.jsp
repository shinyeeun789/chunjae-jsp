<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> EL Data Recieve (표현 언어 폼 데이터 받기) </title>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");

    // pageContext == pageScope (=> 그냥 pageContext 사용)
    String pageName = (String) pageContext.getAttribute("pname");
//    String pName1 = pageScope.getAttribute("pname");

    // request == requestScope (=> 그냥 request 사용)
    String reqName = (String) request.getAttribute("rname");
    String sesName = (String) session.getAttribute("sname");
    String appName = (String) application.getAttribute("aname");

    String id1 = request.getParameter("id");
    String[] hobby1 = {"선택안함", "선택안함", "선택안함", "선택안함", "선택안함"};
    hobby1 = request.getParameterValues("hobby");
%>
</head>
<body>
    <h2> scope Expression VS EL Output </h2>
    <p><%=pageName %> : ${pname}</p>
    <p><%=reqName %> : ${rname}</p>
    <p><%=sesName %> : ${sname}</p>
    <p><%=appName %> : ${aname}</p>
    <!-- form으로 받은 데이터 -->
    <p><%=id1 %> : ${param.id}</p>
    <hr>
    <h3> 좋아하는 스포츠 </h3>
    <ul>
        <li> 첫 번째 - <%=hobby1[0] %> : ${paramValues.hobby[0]} </li>
        <c:if test="hobby[1] != null">
            <li> 두 번째 - <%=hobby1[1] %> : ${paramValues.hobby[1]} </li>
        </c:if>
    </ul>
</body>
</html>
