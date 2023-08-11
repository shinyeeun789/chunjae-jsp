<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String name = (String) pageContext.getAttribute("name");
    String age = (String) pageContext.getAttribute("age");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> includeFile.jsp </title>
</head>
<body>
    <div class="infile">
        <h1> includeFile.jsp </h1>
        <p> name : <%=name %> </p>
        <p> age : <%=age %> </p>
        <p> 아무 텍스트나 테스트 중 </p>
    </div>
</body>
</html>
