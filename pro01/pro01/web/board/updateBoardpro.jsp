<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    int bno = Integer.parseInt(request.getParameter("bno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "update board set title=?, content=? where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, bno);
    int cnt = pstmt.executeUpdate();

    if (cnt > 0) {
        response.sendRedirect("/board/boardList.jsp");
    } else {
        response.sendRedirect("/board/updateBoard?bno="+bno);
    }

    con.close(pstmt, conn);
%>
