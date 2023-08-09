<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 글 수정 </title>
    <%@include file="../head.jsp"%>

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <!-- 스타일 시트 추가하기 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width: 800px; margin:50px auto; border-collapse: collapse; }
        .tb1 th { width: 20%; line-height:32px; padding-top:8px; padding-bottom:8px; border-top:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width: 80%; line-height:32px; padding-top:8px; padding-bottom:8px; border-bottom:1px solid #333; border-top:1px solid #333; padding-left: 15px; }

        .intxt { width: 97%; line-height: 32px; padding: 5px; }
        .tb1 td textarea { width: 97%; padding: 5px; }

        .inbtn { display:block; border-radius:100px; min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-of-type { float:left; }
        .inbtn:last-of-type { float:right; }
    </style>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "select * from board where bno = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    rs = pstmt.executeQuery();
    Board bd = new Board();
    if(rs.next()) {
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setResdate(rs.getString("resdate"));
    }
    con.close(rs, pstmt, conn);
%>
</head>
<body>
    <div class="container">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/"> HOME </a> &gt; <a href="/board/boardList.jsp"> 공지사항 </a> &gt; <span> 공지사항 글 수정 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> 공지사항 글 수정하기 </h2>
                    <form action="updateBoardpro.jsp" method="post">
                        <table class="tb1">
                            <tbody>
                            <%
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                Date d = sdf.parse(bd.getResdate());
                                String date = sdf.format(d);
                            %>
                            <tr>
                                <th> 글번호 </th>
                                <td><input type="text" value="<%=bd.getBno()%>" id="bno" name="bno" class="intxt" readonly></td>
                            </tr>
                            <tr>
                                <th> 작성자 </th>
                                <td><input type="text" value="<%=bd.getAuthor()%>" id="author" name="author" class="intxt" readonly></td>
                            </tr>
                            <tr>
                                <th> 글제목 </th>
                                <td><input type="text" value="<%=bd.getTitle() %>" id="title" name="title" class="intxt"></td>
                            </tr>
                            <tr>
                                <th> 본문 </th>
                                <td><textarea name="content" id="content" cols="84" rows="10"><%=bd.getContent() %></textarea></td>
                            </tr>
                            <tr>
                                <th> 작성일 </th>
                                <td><input type="text" id="resdate" name="resdate" value="<%=date %>" class="intxt" readonly></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn_group">
                            <br><hr><br>
                            <input type="submit" value="수정하기" class="inbtn">
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="../footer.jsp" %>
        </footer>
    </div>
</body>
</html>
