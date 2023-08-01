<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 객체 제어 </title>
</head>
<body>
<%
    // 보내는 곳에서 데이터를 담음
    Student st1 = new Student();
    st1.setNo(1);
    st1.setName("김이름");
    st1.setKor(100);
    st1.setEng(70);
    st1.setMat(100);
    request.setAttribute("st1", st1);

    // 여러 개의 데이터를 보낼 때는 컬렉션으로 주고받음
    // 1. ArrayList 보내기
    List<Student> st = new ArrayList<>();
    Student s = new Student();
    s.setNo(1);
    s.setName("이이름");
    s.setKor(100);
    s.setEng(90);
    s.setMat(80);
    st.add(s);
    Student s2 = new Student();
    s2.setNo(2);
    s2.setName("박이름");
    s2.setKor(90);
    s2.setEng(95);
    s2.setMat(80);
    st.add(s2);
    request.setAttribute("st", st);

    // ArrayList<String> 보내기
    ArrayList<String> lst = new ArrayList<>();
    lst.add("최이름");
    lst.add("한이름");
    lst.add("새이름");
    lst.add("신이름");
    request.setAttribute("lst", lst);

    // HashSet으로 보내기
    HashSet<String> set = new HashSet<>();
    set.add("삼이름");
    set.add("사이름");
    set.add("오이름");
    set.add("육이름");
    set.add("사이름");
    request.setAttribute("set", set);

    // HashMap으로 보내기
    HashMap<String, String> map = new HashMap<>();
    map.put("no", "3");
    map.put("name", "구이름");
    map.put("kor", "70");
    map.put("eng", "85");
    map.put("mat", "90");
    request.setAttribute("map", map);

    // 디스패처
    RequestDispatcher rd = request.getRequestDispatcher("test3.jsp");       // 보내질 곳 지정
    rd.forward(request, response);                                          // 주소창은 바뀌지 않고 test3.jsp의 내용이 나타남
//    response.sendRedirect("test3.jsp?map="+map);         // 단순 데이터는 가지만 특수문자나 객체 단위는 제대로 가지 않음 (쪽배 같은 느낌쓰) 따라서, 사이트 이동할 때만 이동
%>

<%
    // 받는 곳에서 출력하는 부분
    out.println("<p> 번호 : " + st1.getNo() + "</p>");
%>
    <p> 이름 : <%=st1.getName() %> </p>
    <p> 국어 : <%=st1.getKor() %> </p>
    <p> 영어 : <%=st1.getEng() %> </p>
    <p> 수학 : <%=st1.getMat() %> </p>
    <p> 총점 : <%=st1.getKor() + st1.getEng() + st1.getMat() %> </p>
</body>
</html>
