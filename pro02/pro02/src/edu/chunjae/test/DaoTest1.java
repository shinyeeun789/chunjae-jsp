package edu.chunjae.test;

import edu.chunjae.dto.*;
import edu.chunjae.model.*;
import java.sql.*;
import java.util.*;

public class DaoTest1 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        List<Notice> noticeList = new ArrayList<>();

        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        String sql = "SELECT * FROM notice ORDER BY no DESC";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisited(rs.getInt("visited"));
                noticeList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }

        for(Notice n:noticeList) {
            System.out.println(n.toString());
        }
    }

}
