package edu.chunjae.test;

import edu.chunjae.model.DBConnect;
import edu.chunjae.model.PostgreCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoTest4 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;

    public static void main(String[] args) {
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }
        String sql = "UPDATE notice SET title=?, content=? WHERE no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "수정 DAO 테스트");
            pstmt.setString(2, "수정 DAO 테스트 중입니다~.~ 내용도 입력 중입니다.1");
            pstmt.setInt(3, 1);
            int cnt = pstmt.executeUpdate();

            if(cnt > 0) {
                System.out.println("1건의 레코드가 수정되었습니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }

}