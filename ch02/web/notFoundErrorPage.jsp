<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>      <!-- JSP 문서는 반드시 이 코드가 있어야 함 -->
<%
    String path9 = (String) request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 404 ERROR </title>
</head>
<body>
    <div class="container">
        <h2> 요청하신 주소의 페이지를 찾을 수 없습니다. </h2>
        <figure class="vs">
            <img src="<%=path9 %>/img/404error.jpg" alt="404 에러 이미지">
        </figure>
    </div>
</body>
</html>
