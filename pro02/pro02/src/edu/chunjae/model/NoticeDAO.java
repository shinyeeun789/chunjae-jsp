package edu.chunjae.model;

import edu.chunjae.dto.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class NoticeDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Notice> getNoticeList() {
        List<Notice> noticeList = new ArrayList<>();

        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                noti.setResdate(sdf.format(d));

                noti.setVisited(rs.getInt("visited"));
                noticeList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }

        return noticeList;
    }

    public Notice getNotice(int no) {
        Notice notice = new Notice();

        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ONE);
            pstmt.setInt(1, no);
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

        return notice;
    }

    public int addNotice(Notice noti) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_INSERT);
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            cnt = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

}
