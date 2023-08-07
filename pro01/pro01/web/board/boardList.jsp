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
    <title> 공지사항 목록 </title>
    <%@include file="../head.jsp"%>

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

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
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px; border-top:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { line-height:32px; padding-top:8px; padding-bottom:8px; border-bottom:1px solid #333; border-top:1px solid #333; }
        .tb1 .item1 { width: 10%; text-align: center; }
        .tb1 .item2 { width: 50%; padding-left: 14px; }
        .tb1 .item3 { width: 10%; text-align: center; }
        .tb1 .item4 { width: 20%; text-align: center; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    String sql = "SELECT * FROM board ORDER BY bno DESC";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Board> boardList = new ArrayList<>();
    while(rs.next()) {
        Board bd = new Board();
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setAuthor(rs.getString("author"));
        bd.setResdate(rs.getString("resdate"));
        boardList.add(bd);
    }

    conn.close(rs, pstmt, con);
%>
</head>
<body>
    <div class="container">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href=""> 공지사항 </a> &gt; <span> 공지사항 목록 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> 공지사항 목록 </h2>
                    <table class="tb1">
                        <thead>
                            <th class="item1"> 글번호 </th>
                            <th class="item2"> 글제목 </th>
                            <th class="item3"> 작성자 </th>
                            <th class="item4"> 작성일 </th>
                        </thead>
                        <tbody>
                            <%
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                for(Board bd : boardList) {
                                    Date d = sdf.parse(bd.getResdate());
                                    String date = sdf.format(d);
                            %>
                                <tr>
                                    <td class="item1"><%=bd.getBno() %></td>
                                    <td class="item2">
                                        <% if(sid!=null) { %>
                                            <a href="/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=bd.getTitle() %></a>
                                        <% } else { %>
                                            <span><%=bd.getTitle() %></span>
                                        <% } %>
                                    </td>
                                    <td class="item3"><%=bd.getAuthor() %></td>
                                    <td class="item4"><%=date %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <div class="btn_group">
                        <br><hr><br>
                        <% if(sid != null && sid.equals("admin")) { %>
                        <a href="/board/addBoard.jsp" class="inbtn"> 글쓰기 </a>
                        <% } else { %>
                        <p>
                            관리자만 공지사항의 글을 쓸 수 있습니다. <br>
                            로그인한 사용자만 글의 상세 내용을 볼 수 있습니다.
                        </p>
                        <% } %>
                    </div>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="../footer.jsp" %>
        </footer>
    </div>
</body>
</html>
