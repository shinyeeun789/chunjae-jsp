package edu.chunjae.controller.custom;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login.do")
public class LoginCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "로그인 하시기 바랍니다.");
        // 주소검색창에서 http://localhost:8081/index.jsp 검색 시 들어올 수 없도록 설정
        // WEB-INF 폴더에 jsp 파일이 있으면 반드시 서블릿을 통해서만 들어올 수 있음 (보안)
        RequestDispatcher view = request.getRequestDispatcher("/custom/login.jsp");
        view.forward(request, response);
    }
}