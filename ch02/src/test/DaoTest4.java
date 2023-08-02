package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

// updateMember()
public class DaoTest4 {

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
        System.out.print("변경(감소/증가)할 포인트 입력 > ");
        int point = sc.nextInt();
        int cnt = 0;
        try {
            String sql = "update member set point=point+? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, point);
            pstmt.setString(2, id);
            cnt = pstmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("해당 회원의 포인트 변경이 성공적으로 이루어졌습니다.");
            } else {
                System.out.println("해당 회원의 포인트 변경에 실패했습니다.");
            }
            con.close(pstmt, conn);

        } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        }
    }
}
