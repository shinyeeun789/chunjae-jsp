<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 목록</title>
    <jsp:include page="../common.jsp" />
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
    <h2>파일 목록</h2>
       <table class="table">
           <thead>
            <tr>
                <th>작성자</th>
                <th>파일1</th>
                <th>파일2</th>
                <th>파일3</th>
            </tr>
           </thead>
           <tbody>
                <c:forEach var="file" items="${fileList }">
                    <tr>
                        <td>${file.uname }</td>
                        <td>
                            <c:if test="${!empty file.filename1 }">
                            <img src="${path }/storage/${file.filename1 }" alt="${file.filename1 }" width="100"/>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${!empty file.filename2 }">
                            <img src="${path }/storage/${file.filename2 }" alt="${file.filename2 }" width="100"/>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${!empty file.filename3 }">
                            <img src="${path }/storage/${file.filename3 }" alt="${file.filename3 }" width="100"/>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
           </tbody>
       </table>
    </form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
