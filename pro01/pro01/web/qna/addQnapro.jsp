<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>

<%@ include file="../encoding.jsp" %>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");
    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = Integer.parseInt(request.getParameter("par"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();

    conn = con.connect();
    String sql = "insert into qna(title, content, author, lev, par) values(?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, lev);
    pstmt.setInt(5, par);

    cnt = pstmt.executeUpdate();
    pstmt.close();

    if(lev == 0) {
        sql = "update qna set par=qno where par=0 and lev=0";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        cnt++;
    }

    if(cnt == 2) {
        System.out.println("질문 글이 등록되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp?");
    } else if(cnt == 1) {
        System.out.println("답변 글이 등록되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        System.out.println("질문 및 답변 등록에 실패했습니다.");
        out.println("<script> history.go(-1); </script>");
    }
%>
