package edu.chunjae.controller.notice;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/noticeList.do")
public class NoticeListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "공지사항 목록을 출력합니다.");
        RequestDispatcher view = request.getRequestDispatcher("/notice/noticeList.jsp");
        view.forward(request, response);
    }
}