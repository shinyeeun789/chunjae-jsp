<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 보내온 결과 </title>
    <%
//        request : 요청객체로, 요청한 측에서 보낸 데이터가 저장되어 있는 곳
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        int qty = Integer.parseInt(request.getParameter("qty"));
        int price = Integer.parseInt(request.getParameter("price"));
    %>
</head>
<body>
    <div class="container">
        <ul class="lst">
            <li><span> 아이디 : </span> <%=id %> </li>
            <li><span> 비밀번호 : </span> <%=pw %> </li>
            <li><span> 금액 : </span> <%=qty*price %> </li>
        </ul>
    </div>
</body>
</html>
