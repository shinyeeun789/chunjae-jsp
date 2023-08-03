<!-- 태그를 표시하지 않을 것이기 때문에 HTML 구조를 삭제해도 됨 -->

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // Scope Test
    pageContext.setAttribute("pageData", "페이지컨텍스트1");
    request.setAttribute("reqData", "요청한데이터");
    session.setAttribute("sesData", "세션데이터");
    application.setAttribute("appData", "애플리케이션데이터");
    request.setAttribute("msg", "안녕하세요 msg 데이터입니다~");

    RequestDispatcher rd = request.getRequestDispatcher("test5.jsp");
    rd.forward(request, response);
%>