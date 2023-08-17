<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 목록 </title>
    <c:set var="path" value="${realPath }" />
</head>
<body>
<div class="container-fluid">
    <%@ include file="/header.jsp"%>
    <div class="contents">
        <nav aria-label="breadcrumb container-fluid" style="border-bottom: 2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item">고객지원</li>
                    <li class="breadcrumb-item active" aria-current="page">공지사항 목록</li>
                </ol>
            </div>
        </nav>
        <h2 class="title"> 공지사항 목록 </h2>
        <div class="box_wrap">
            <table class="table table-secondary" id="tb1">
                <thead>
                    <tr>
                        <th scope="col"> 번호 </th>
                        <th scope="col"> 제목 </th>
                        <th scope="col"> 작성일 </th>
                        <th scope="col"> 조회수 </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="noti" items="${noticeList }">
                        <tr>
                            <th scope="row">${noti.no }</th>
                            <td><a href="${path }/Notice.do?no=${noti.no }">${noti.title }</a></td>
                            <td>${noti.resdate }</td>
                            <td>${noti.visited }</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%@ include file="/footer.jsp" %>
    </div>
</body>
</html>
