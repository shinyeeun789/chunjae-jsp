<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 로그인 </title>
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
                        <li class="breadcrumb-item">Custom</li>
                        <li class="breadcrumb-item active" aria-current="page">Login</li>
                    </ol>
                </div>
            </nav>
            <h2 class="title"> 로그인 </h2>
            <form action="${path }/LoginPro.do" method="post" class="container">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"> 아이디 </label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label"> 비밀번호 </label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary"> LOGIN </button>
            </form>
        </div>
        <%@ include file="/footer.jsp" %>
    </div>
</body>
</html>
