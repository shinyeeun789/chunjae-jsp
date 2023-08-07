<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 글 작성 </title>
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
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href=""> 공지사항 </a> &gt; <span> 공지사항 글 작성 </span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit"> 공지사항 글 작성하기 </h2>
                    <form action="addBoardpro.jsp" method="post">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <th><label for="title"> 글 제목 </label></th>
                                <td><input type="text" id="title" name="title" class="intxt"></td>
                            </tr>
                            <tr>
                                <th><label for="content"> 글 내용 </label></th>
                                <td>
                                    <textarea name="content" id="content" cols="84" rows="10" maxlength="990"></textarea>
                                    <input type="text" value="<%=sid%>" id="author" name="author" class="intxt" hidden>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="작성하기" class="inbtn">
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
