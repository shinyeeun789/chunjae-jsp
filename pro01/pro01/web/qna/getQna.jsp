<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.*" %>
<%@ include file="../encoding.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 질문 및 답변 글 상세보기 </title>
    <%@ include file="../head.jsp" %>

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

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
        .tb1 td { line-height:32px; padding-top:8px; padding-bottom:8px; border-bottom:1px solid #333; border-top:1px solid #333; padding-left: 14px; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:nth-child(2) { float: right; margin-left: 5px; }
        .inbtn:nth-child(3) { float: left; margin-left: 5px; }
        .inbtn:last-child { float:right; margin-left: 5px; }
    </style>

<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT * FROM qna a, member b WHERE a.author = b.id AND qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();

    Qna qna = new Qna();
    while (rs.next()) {
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setName(rs.getString("name"));
        qna.setResdate(rs.getString("resdate"));
        qna.setLev(rs.getInt("lev"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setPar(rs.getInt("par"));
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
                <p><a href="/"> HOME </a> &gt; <a href="/qna/qnaList.jsp">  묻고 답하기</a> &gt; <span> 질문 및 답변 글 상세보기 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> 질문 및 답변 글 상세보기 </h2>
                    <table class="tb1" id="myTable">
                        <tbody>
                        <tr>
                            <th> 유형 </th>
                            <td>
                                <% if(qna.getLev() == 0) { %>
                                    <span> 질문 </span>
                                <% } else { %>
                                    <span> 답변 </span>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th> 글 번호 </th>
                            <td> <%=qna.getQno() %> </td>
                        </tr>
                        <tr>
                            <th> 글 제목 </th>
                            <td> <%=qna.getTitle() %> </td>
                        </tr>
                        <tr>
                            <th> 작성자 </th>
                            <td>
                                <% if(sid != null && sid.equals("admin")) { %>
                                    <span title="<%=qna.getAuthor() %>"><%=qna.getName() %></span>
                                <% } else { %>
                                    <span><%=qna.getName() %></span>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th> 글 내용 </th>
                            <td> <%=qna.getContent() %> </td>
                        </tr>
                        <tr>
                            <th> 작성일 </th>
                            <td> <%=qna.getResdate() %> </td>
                        </tr>
                        <tr>
                            <th> 조회수 </th>
                            <td> <%=qna.getCnt() %> </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <!-- 현재 글이 질문 글이면, 로그인한 사람만 답변하기, 질문을 등록한 사람만 질문글 수정, 질문글 삭제 버튼 추가
                                    답변 글이면 답변을 등록한 사람(관리자 포함)만 답변글 삭제, 답변글 수정 버튼 추가
                                     모든 사용자 목록 버튼 추가-->
                                <a href="/qna/qnaList.jsp" class="inbtn"> 목록 보기 </a>
                                <% if (qna.getLev() == 0 && sid != null) { %>
                                    <a href="/qna/addQna.jsp?lev=1&par=<%=qna.getQno() %>" class="inbtn"> 답변하기 </a>
                                    <% if (sid.equals("admin") || sid.equals(qna.getAuthor())) { %>
                                        <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn"> 질문글 수정 </a>
                                        <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=<%=qna.getLev() %>" class="inbtn"> 질문글 삭제 </a>
                                    <% }
                                   } else {
                                        if (sid != null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                            <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn"> 답변글 수정 </a>
                                            <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=<%=qna.getLev() %>" class="inbtn"> 답변글 삭제 </a>
                                <%      }
                                   } %>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="../footer.jsp" %>
        </footer>
    </div>
</body>
</html>
