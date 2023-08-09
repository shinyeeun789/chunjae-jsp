<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ include file="../encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "update qna set title=?, content=? where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, qno);
    cnt = pstmt.executeUpdate();

    con.close(pstmt, conn);

    if (cnt > 0) {
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        out.print("<script> history.go(-1); </script>");
    }
%>
