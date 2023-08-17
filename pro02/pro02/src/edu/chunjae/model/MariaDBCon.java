package edu.chunjae.model;

import java.sql.*;

public class MariaDBCon implements DBConnect {
    final String DRIVER = "org.mariadb.jdbc.Driver";
    final String URL = "jdbc:mariadb://localhost:3306/edu";
    final String USER = "root";
    final String PASS = "1234";

    Connection conn = null;

    final static String BOARD_SELECT_ALL = "SELECT * FROM board ORDER BY bno DESC";
    final static String BOARD_SELECT_ONE = "SELECT * FROM board WHERE bno=?";
    final static String BOARD_UPDATE = "UPDATE board SET title=?, content=? WHERE bno=?";
    final static String BOARD_DELETE = "DELETE FROM board WHERE bno=?";
    final static String BOARD_INSERT = "INSERT INTO board(content, title) VALUES(?, ?)";

    @Override
    public Connection connect() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    @Override
    public void close(PreparedStatement pstmt, Connection conn) {
        try {
            if(pstmt != null) {
                pstmt.close();
            }
            if(conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if(rs != null) {
                rs.close();
            }
            if(pstmt != null) {
                pstmt.close();
            }
            if(conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
