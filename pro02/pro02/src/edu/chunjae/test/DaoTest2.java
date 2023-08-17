package edu.chunjae.test;

import edu.chunjae.dto.*;
import edu.chunjae.model.*;
import java.sql.*;
import java.util.*;

public class DaoTest2 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        Notice notice = new Notice();

        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        String sql = "SELECT * FROM notice where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, 5);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                notice.setNo(rs.getInt("no"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setResdate(rs.getString("resdate"));
                notice.setVisited(rs.getInt("visited"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }

        System.out.println(notice.toString());
    }

}