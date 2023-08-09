<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file="../encoding.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 묻고 답하기 목록 </title>
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

        .tb1 { width: 1000px; margin:50px auto; border-collapse: collapse; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px; border-top:1px solid #333;
            background-color:#0067a3; color:#fff; }
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

        .btn_group {
            margin-top: 20px;
            text-align: center;
        }
    </style>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT * FROM qnaList";           // sql문이 복잡하므로 qnaList 뷰 생성
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Qna> qnaList = new ArrayList<>();
    while(rs.next()) {
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setName(rs.getString("name"));
        qnaList.add(qna);
    }

    con.close(rs, pstmt, conn);
%>

    <!-- jQuery에서 Paging 처리 -->
    <link rel="stylesheet" href="../css/jquery.dataTables.css">
    <script src="../css/jquery.dataTables.js"></script>
</head>
<body>
    <div class="container">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/"> HOME </a> &gt; <a href="/qna/qnaList.jsp"> 묻고 답하기 </a> &gt; <span> 묻고 답하기 목록 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> 묻고 답하기 목록 </h2>
                    <table class="tb1" id="myTable">
                        <thead>
                        <th class="item1"> 글번호 </th>
                        <th class="item2"> 제목 </th>
                        <th class="item3"> 작성자 </th>
                        <th class="item4"> 작성일 </th>
                        </thead>
                        <tbody>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");              // 한글 지원 X
                            int tot = qnaList.size();
                            for(Qna q : qnaList) {
                                Date d = sdf.parse(q.getResdate());
                                String date = sdf.format(d);
                        %>
                        <tr>
                            <td class="item1"><%=tot %></td>
                            <td class="item2">
                                <% if(q.getLev() == 0) { %>
                                <a href="/qna/getQna.jsp?qno=<%=q.getQno() %>"><%=q.getTitle()%></a>
                                <% } else { %>
                                <a style="padding-left: 28px" href="/qna/getQna.jsp?qno=<%=q.getQno() %>"> [답변] <%=q.getTitle()%> </a>
                                <% } %>
                            </td>
                            <td class="item3"><%=q.getName() %></td>
                            <td class="item4"><%=date %></td>
                        </tr>
                        <%      tot--;
                        } %>
                        </tbody>
                    </table>
                    <script>
                        $(document).ready(function() {
                            $('#myTable').DataTable({
                                order: [[0, "desc"]]
                            });
                        });
                    </script>
                    <div class="btn_group">
                        <% if(sid != null) { %>
                        <a class="inbtn" href="/qna/addQna.jsp?lev=0&par=0"> 질문하기 </a>
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
