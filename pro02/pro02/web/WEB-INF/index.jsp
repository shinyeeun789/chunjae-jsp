<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0", user-scale="no">
    <title> 메인 페이지 </title>
    <c:set var="path" value="${realPath }" />
    <%@ include file="/common.jsp"%>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/header.jsp" %>
    <div style="border-top: 3px solid deepskyblue"></div>
    <div class="contents">
        <h2> 사용자 : ${user } </h2>
        <h2> 메인 주소 : ${realPath } </h2>
        <h2> 메인 상대 주소 : ${path } </h2>
        <hr>
        <table class="table">
            <thead>
            <tr>
                <th>이미지1</th>
                <th>이미지2</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="./images/img01.webp" alt="이미지1"></td>
                <td><img src="./images/img02.webp" alt="이미지2"></td>
            </tr>
            </tbody>
        </table>
        <div class="btn-group">
            <a href="" class="btn btn-primary"> 서브1 </a>
            <a href="" class="btn btn-primary"> 서브2 </a>
        </div>
    </div>
    <%@ include file="/footer.jsp" %>
</div>
</body>
</html>
