<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="${realPath }" />

<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각종 자원 로딩 -->

<!-- jQuery 불러오기 -->
<script src="./js/jquery-1.10.0.js"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
    #hd {
        border-bottom: 2px solid #333;
    }
    #ft {
        border-bottom: 2px solid #333;
        margin-top: 20px;
    }
    .title {
        text-align: center;
    }
    .list {
        list-style: none;
    }
    .list li {
        margin-top: 24px;
    }
</style>
