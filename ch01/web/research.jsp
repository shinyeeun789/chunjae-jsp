<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 설문조사 결과 </title>
    <%
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String year = request.getParameter("year");
        String name = request.getParameter("name");
        String[] pet = request.getParameterValues("pet");

        for(int i=0; i<pet.length; i++) {
            if(pet[i].equals("dog")) {
                pet[i] = "강아지";
            } else if(pet[i].equals("cat")) {
                pet[i] = "고양이";
            } else if(pet[i].equals("cow")) {
                pet[i] = "송아지";
            } else {
                pet[i] = "망아지";
            }
        }
    %>
</head>
<body>
    <div class="container">
        <p> 아이디 : <strong> <%=id %> </strong></p>
        <p> 출생년도 : <strong> <%=year %></strong></p>
        <p> 이름 : <strong> <%=name %></strong></p>
        <p> 좋아하는 동물 : <br>
            <% for (String p:pet) { %>
                <strong><%=p %></strong><br>
            <% } %>
        </p>
        <a href="test03.jsp"> 테스트03으로 돌아가기 </a><br>
        <a href="test04.jsp?id=<%=id %>"> 테스트04로 이동하기 </a>      <!-- test04.jsp한테 id 값을 GET 방식으로 보내줌 -->
    </div>
</body>
</html>
