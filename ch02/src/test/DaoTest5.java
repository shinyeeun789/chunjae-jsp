package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

// deleteMember()
public class DaoTest5 {

    static Connection conn = null;
    static PreparedStatement pstmt = null;

    public static void main(String[] args) {

        DBC con = new MariaDBCon();
        conn = con.connect();
        if (conn != null) {
            System.out.println("DB 연결 성공");
        }

        // getMemberList()
        Scanner sc = new Scanner(System.in);
        System.out.print("포인트를 변경할 회원ID 입력 > ");
        String id = sc.nextLine();
        int cnt = 0;
        try {
            String sql = "delete from member where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            cnt = pstmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("성공적으로 삭제되었습니다.");
            } else {
                System.out.println("삭제 실패함");
            }
            con.close(pstmt, conn);

        } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        }
    }
}
