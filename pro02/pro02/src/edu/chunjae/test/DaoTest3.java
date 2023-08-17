package edu.chunjae.test;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.DBConnect;
import edu.chunjae.model.PostgreCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoTest3 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;

    public static void main(String[] args) {
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        String sql = "INSERT INTO notice(title, content) VALUES(?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "DAO 테스트");
            pstmt.setString(2, "DAO 테스트 중입니다~.~ 내용도 입력 중입니다.1");
            int cnt = pstmt.executeUpdate();

            if(cnt > 0) {
                System.out.println("1건의 레코드가 추가되었습니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }

}