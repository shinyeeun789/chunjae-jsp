<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>
<%
    String path9 = (String) request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
    <div class="container">
        <h2> 포맷 에러가 발생했습니다!! </h2>
        <figure class="vs">
            <img src="<%=path9 %>/img/errorimg.jpg" alt="에러 이미지">
        </figure>
    </div>
</body>
</html>
