<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>

<%@ include file="../encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "DELETE FROM qna WHERE qno=(SELECT qno FROM qna WHERE lev=1 AND qno=?) OR par=(SELECT par FROM qna WHERE lev=0 AND par=?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    pstmt.setInt(2, qno);
    cnt = pstmt.executeUpdate();

    if(cnt > 0) {
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        out.print("<script> history.go(-1); </script>");
    }
%>
