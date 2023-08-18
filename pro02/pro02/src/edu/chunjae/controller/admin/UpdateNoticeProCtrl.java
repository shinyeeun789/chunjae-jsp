package edu.chunjae.controller.admin;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class UpdateNoticeProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        Notice noti = new Notice();
        noti.setNo(Integer.parseInt(request.getParameter("no")));
        noti.setTitle(request.getParameter("title"));
        noti.setContent(request.getParameter("content"));

        NoticeDAO dao = new NoticeDAO();
        int a = dao.updateNotice(noti);
        if (a > 0) {
            response.sendRedirect("/AdminNoticeList.do");
        } else {
            out.println("<script> history.go(-1); </script>");
        }
    }
}