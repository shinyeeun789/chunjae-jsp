<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    session.invalidate();                       // 로그데이터를 모두 지우기 -> 로그아웃
    response.sendRedirect("test5.jsp");
%>