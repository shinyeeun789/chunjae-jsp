<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%
    String id = (String) session.getAttribute("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Member mem = new Member();
    String pw = "";

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            mem.setId(rs.getString("id"));
            mem.setPw(rs.getString("pw"));
            mem.setName(rs.getString("name"));
            mem.setEmail(rs.getString("email"));
            mem.setTel(rs.getString("tel"));
            pw = mem.getPw();
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>

<%
    String path0 = request.getContextPath();
    String pw2 = pw.substring(0, 2);
    for (int i=0; i<pw.length()-2; i++) {
        pw2 += "*";
    }       // 12**
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 회원 정보 수정 </title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <style>
        /* 본문 영역 스타일 */
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
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:0 auto; }
        .tb1 th { width: 190px; }
        .tb1 td { width: 300px; line-height: 48px; padding-top:24px; padding-bottom:24px; }

        .indata { display:inline-block; width: 300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>정보수정</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 정보 수정</h2>
                <form action="modifypro.jsp" id="login_frm" class="frm" >
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="id"> 아이디 </label></th>
                            <td><input type="text" name="id" id="id" class="indata" value="<%=mem.getId() %>" readonly /></td>
                        </tr>
                        <tr>
                            <th><label for="pw2"> 비밀번호 </label></th>
                            <!-- re_pw에 입력한 값과 pw2의 값이 같으면, 원래 pw를 전달 -->
                            <!-- 서로 다르면, re_pw로 비밀번호를 변경할 것임 -->
                            <td>
                                <input type="text" name="re_pw" id="re_pw" class="indata" value="<%=pw2 %>" required />
                                <input type="hidden" name="pw2" id="pw2" value="<%=pw2 %>" />
                                <input type="hidden" name="pw" id="pw" value="<%=pw %>" />
                            </td>
                        </tr>
                        <tr>
                            <th><label for="name"> 이름 </label></th>
                            <td><input type="text" name="name" id="name" class="indata" value="<%=mem.getName() %>" readonly /></td>
                        </tr>
                        <tr>
                            <th><label for="email"> 이메일 </label></th>
                            <td><input type="email" name="email" id="email" class="indata" value="<%=mem.getEmail() %>" required /></td>
                        </tr>
                        <tr>
                            <th><label for="tel"> 전화번호 </label></th>
                            <td><input type="tel" name="tel" id="tel" class="indata" value="<%=mem.getTel() %>" required /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="colspan">
                                <input type="submit" value="회원정보수정" class="inbtn">
                                <a href="/member/mypage.jsp" class="inbtn"> 마이페이지로 </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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