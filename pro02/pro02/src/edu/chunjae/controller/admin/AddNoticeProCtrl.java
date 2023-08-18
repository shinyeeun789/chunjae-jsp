package edu.chunjae.controller.admin;

import edu.chunjae.dto.*;
import edu.chunjae.model.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/AddNoticePro.do")
public class AddNoticeProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Notice noti = new Notice();
        noti.setTitle(request.getParameter("title"));
        noti.setContent(request.getParameter("content"));

        PrintWriter out = response.getWriter();

        NoticeDAO dao = new NoticeDAO();
        int a = dao.addNotice(noti);
        if (a > 0) {
            response.sendRedirect("/AdminNoticeList.do");
        } else {
            out.println("<script> history.go(-1); </script>");
        }
    }
}