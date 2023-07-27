<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-27
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <a href="test01.jsp"> 테스트1 </a>
  </body>
</html>
