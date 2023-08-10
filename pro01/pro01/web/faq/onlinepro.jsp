<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 가져오기 --%>
<%@ page import="com.chunjae.util.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%-- 2. 인코딩 설정 --%>
<%@ include file="../encoding.jsp" %>
<%
    //3. 보내온 이메일 데이터 받기
    String name = request.getParameter("name");
    String from = request.getParameter("author");
    String email = request.getParameter("email");    //보내는 사람 이메일
    String tel = request.getParameter("tel");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String to = "tlsdpdms789@naver.com";            //받는 사람 이메일

    //4. smtp 설정 -> Properties 활용
    Properties p = new Properties();
    p.put("mail.smtp.host","smtp.naver.com");       // 호스트 설정
    p.put("mail.smtp.port", "465");                 // 포트 설정
    p.put("mail.smtp.starttls.enable", "true");     // 전송 시작 주소를 받을건지
    p.put("mail.smtp.auth", "true");                // 인증 과정을 거칠건지
    p.put("mail.smtp.debug", "true");               // 에러 디버그 띄울건지
    // Gmail일 경우 아래 내용 추가
//    p.put("mail.smtp.ssl.enable", "false");
//    p.put("mail.smtp.trust", "smtp.gmail.com");
//    p.put("main.smtp.user", "email");
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");

    //5. 이메일 보내기
    try {
        Authenticator auth = new SMTPAuthenticator();
        Session ses = Session.getInstance(p, auth);                         // 인증권을 취득 후에 메일을 보내고 싶은 경우 사용
//        Session ses = Session.getDefaultInstance(p);                      -> 인증이 필요 없는 경우에 사용

        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses);
//        Message msg = new Massage();                                      -> 객체나 파일 첨부가 안됨

        msg.setSubject(title);                                              // 메일 제목 추가

        StringBuffer buffer = new StringBuffer();                           // 이메일 내용
        buffer.append("보내는 사람 : ");
        buffer.append(name+"\n");
        buffer.append("연락처 : ");
        buffer.append(tel+"\n");
        buffer.append("이메일 : ");
        buffer.append(email+"\n");
        buffer.append("제목 : ");
        buffer.append(title+"\n");
        buffer.append("내용 : ");
        buffer.append(content+"\n");

        Address fromAddr = new InternetAddress(from);                       //보내는 사람
        msg.setFrom(fromAddr);

        Address toAddr = new InternetAddress(to);                           // 받는 사람
        msg.addRecipient(Message.RecipientType.TO, toAddr);

        /* 받는 사람이 여러 명인 경우
        String[] addrs = {"ksb450424@naver.com", "okgunyang@naver.com", "kkt09072@naver.com", "sunglee0517@naver.com"};
        Address[] toAddrs  = new InternetAddress[4];
        for(int i=0; i<toAddrs.length; i++) {
            toAddrs[i] = new InternetAddress(addrs[i]);
        }
        msg.addRecipients(Message.RecipientType.TO, toAddrs);
        */

        msg.setContent(buffer.toString(), "text/html;charset=UTF-8");       // 메일 내용 추가 (택1)
//        msg.setText("이메일 내용");                                         // 메일 내용이 텍스트로만 가능 (택2)
        Transport.send(msg);                                                // 이메일 전송
    } catch(Exception e){
        e.printStackTrace();
        return;
    } finally {
        response.sendRedirect("/index.jsp");
    }
%>