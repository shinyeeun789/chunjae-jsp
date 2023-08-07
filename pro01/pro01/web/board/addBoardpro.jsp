<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    String author = request.getParameter("author");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;
    DBC con = new MariaDBCon();

    conn = con.connect();
    String sql = "insert into board(author, title, content) values(?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, author);
    pstmt.setString(2, title);
    pstmt.setString(3, content);
    cnt = pstmt.executeUpdate();


    String script = "<script>";
    script += "history.go(-1);";
    script += "</script>";
    if(cnt > 0) {
        response.sendRedirect("boardList.jsp");
    } else {
//        response.sendRedirect("addBoard.jsp");
        out.println(script);
    }
%>
