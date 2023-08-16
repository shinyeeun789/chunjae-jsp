package edu.chunjae.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

// web.xml에서 servlet 연결을 해주었기 때문에 @WebServlet 어노테이션은 작성하지 않아도 됨
public class Main extends HttpServlet {

    // Main 서블릿이기 때문에 메소드명은 service로 정해주기
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "천재 신예은";
        System.out.println("user : " + user);

        ServletContext application = request.getServletContext();
        String realPath = request.getSession().getServletContext().getRealPath("/");        // Main Servlet이 있는 곳을 root로 잡아줌
        // <% String path = request.getContextPath(); %> => 얘와 같음

        application.setAttribute("realPath", realPath);                                     // JSP에서 ${realPath }로 불러올 수 있음

        request.setAttribute("user", user);
        // 주소검색창에서 http://localhost:8081/index.jsp 검색 시 들어올 수 없도록 설정
        // WEB-INF 폴더에 jsp 파일이 있으면 반드시 서블릿을 통해서만 들어올 수 있음 (보안)
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
        view.forward(request, response);
    }
}