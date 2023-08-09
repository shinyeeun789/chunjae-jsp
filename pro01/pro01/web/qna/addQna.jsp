<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../encoding.jsp" %>
<%
    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = Integer.parseInt(request.getParameter("par"));

    String sel = "";
    if(lev == 0) {
        sel="질문";
    } else {
        sel="답변";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> <%=sel %> 글 등록 </title>

    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/common.css">
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
        .tb1 td textarea { width: 97%; padding: 5px; line-height: 15px; }

        .inbtn { display:block; border-radius:100px; min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-of-type { float:left; }
        .inbtn:last-of-type { float:right; }
    </style>
</head>
<body>
    <div class="container">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents">
            <div class="breadcrumb">
                <p><a href="/"> HOME </a> &gt; <a href="/qna/qnaList.jsp">  묻고 답하기 </a> &gt; <span> <%=sel %> 글 작성 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> <%=sel %> 글 작성하기 </h2>
                    <form action="addQnapro.jsp" method="post">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <th><label for="title"> 제목 </label></th>
                                <td>
                                    <input type="text" id="title" name="title" class="intxt" required>
                                    <input type="hidden" name="lev" id="lev" value="<%=lev %>">
                                    <input type="hidden" name="par" id="par" value="<%=par %>">
                                    <input type="hidden" name="author" id="author" value="<%=sid %>">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="content"> 글 내용 </label></th>
                                <td>
                                    <textarea name="content" id="content" cols="84" rows="10" maxlength="990"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="<%=sel %>글 등록하기" class="inbtn">
                                    <input type="reset" value="취소하기" class="inbtn">
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
