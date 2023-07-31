<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Response 객체 폼 </title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <form action="response.jsp" method="post" name="login_form">
            <table class="table" id="tb1">
                <tbody>
                <tr>
                    <th> <label for="id"> 아이디 </label> </th>
                    <td> <input type="text" id="id" name="id" required> </td>
                </tr>
                <tr>
                    <th> <label for="pw"> 비밀번호 </label> </th>
                    <td> <input type="password" id="pw" name="pw" required> </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인" class="btn btn-primary">
                        <input type="reset" value="취소" class="btn btn-danger">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <%
        String msg = request.getParameter("msg");
        String id = (String) session.getAttribute("id");
        String pw = (String) session.getAttribute("pw");
    %>
    <h2> 로그인 정보 </h2>
    <% if(msg != null) { %>
        <p> msg : <%=msg %> </p>
    <% } %>
    <% if(id != null) { %>
        <p> id : <%=id %> </p>
        <p> pw : <%=pw %> </p>
    <% } %>
</body>
</html>
