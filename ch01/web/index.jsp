<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-27
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%!
  private String name;
  public String getName() {                   // name의 getter
    return this.name;
  }
  public void setName(String name) {          // name의 setter
    this.name = name;
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <title> 메인 </title>
  </head>
  <body>
    <div>
      <h2> 천재교육 </h2>
    </div>
    <%
      setName("김이름");
      String addr = "가산동";
    %>
    <hr>
    <p> 이름 : <%=getName() %> </p>
    <p> 주소 : <%=addr %> </p>
    <a href="test01.jsp"> 테스트1 </a> <br>
    <a href="test02.jsp"> 로그인 폼 테스트 </a> <br>
    <a href="test03.jsp"> 복수 개의 값 전송 </a> <br>
    <a href="test04.jsp?msg=한시간남았네"> 요청 정보 및 헤더 정보 </a> <br>
    <a href="test05.jsp"> 로그인 폼 - Response 연습 </a> <br>
    <a href="test06.jsp"> 서블릿에서 jsp 6객체 만들기 </a>
  </body>
</html>
