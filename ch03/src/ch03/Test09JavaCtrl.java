package ch03;

import javax.servlet.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Test09JavaCtrl.do")
public class Test09JavaCtrl extends HttpServlet {
    // get과 post 중 하나만 존재해야 함
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청을 a 태그로 했기 때문에 doGet으로 받아야 함
        String[] names = {"김이름", "이이름", "박이름", "최이름", "신이름"};

        ArrayList<String> list = new ArrayList<>();
        list.add("새이름");
        list.add("권이름");
        list.add("김이름");
        list.add("이이름");

        Map<String, String> map = new HashMap<>();
        map.put("name","유이름");
        map.put("age", "15");
        map.put("height", "162.5");
        map.put("weight", "50");

        request.setAttribute("names", names);
        request.setAttribute("list", list);
        request.setAttribute("map", map);

        RequestDispatcher dispatcher = request.getRequestDispatcher("test09.jsp");
        dispatcher.forward(request, response);
    }
}