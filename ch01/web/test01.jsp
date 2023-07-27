<%-- 1. 디렉티브(Directive) --%>
<%-- <%@ %> 로 감싼다. --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%-- 2. 선언문(Declare) : 익명의 클래스 선언(현재 JSP 안에서만 사용 가능) --%>
<%-- <%! %> 로 감싼다. --%>
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
    <title> 기본 구성 요소 </title>
</head>
<body>
<%-- 3. 스크립트릿(scriptlet) : 자바 코딩 --%>
<%-- <% %> 로 감싼다. --%>
<%
    setName("김이름");
    String addr = "가산동";
%>
<hr>
<%-- 표현식(Expression) : 값을 가져와 출력할 때 사용 --%>
<%-- <%= %> 로 감싼다. --%>
<p> 이름 : <%=getName() %> </p>       <%-- 띄어쓰기 똑같이 해야 함 --%>
<p> 주소 : <%=addr %> </p>
<a href="/index.jsp"> 메인으로 </a>
</body>
</html>
