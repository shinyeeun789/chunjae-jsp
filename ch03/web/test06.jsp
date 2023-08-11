<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> EL(Expression Language) - 표현 언어 </title>
</head>
<body>
<%
    // 표현식에서 사용시에는 데이터변수로 저장하고, 매개변수로 전달해야 함
    String title = "졸리고 배고픈데 비도 많이 와서 집 가고 싶다";
    String[] kimName = {"까다로움", "나이많음", "꾸준함", "웃김"};
    Map<String, String> leeName = new HashMap<>();
    leeName.put("name", "이이름");
    leeName.put("age", "25");
    leeName.put("nick", "네임리");

    // EL 사용시에는 데이터를 넘기는 곳에서 setAttribute를 지정해야 함
    request.setAttribute("title", title);
    request.setAttribute("kim", kimName);
    request.setAttribute("lee", leeName);
%>

    <h2> 표현식 (Expression) </h2>
    <p><%=title %></p>
    <div class="cate">
        <% for (String s:kimName) { %>
            <p><%=s %></p>
        <% } %>
    </div>
    <p><%=leeName %></p>
    <!-- 표현식으로 전달할 경우 -->
    <a href="test07.jsp?title=<%=title %>&kim=<%=kimName %>&lee=<%=leeName %>"></a>
    <hr>
    <h2> 표현언어(Expression Language) </h2>
    <p> ${title} </p>
    <c:forEach var="s" items="${kim}">
        <p> ${s} </p>
    </c:forEach>
    <p> ${lee} </p>
    <!-- forward 문장을 기술하면 주소는 바뀌지 않고, 해당 문서가 화면에 로딩됨 -->
</body>
</html>
