package edu.chunjae.model;

import java.sql.*;

public interface DBConnect {
    final static String NOTICE_SELECT_ALL = "SELECT * FROM notice ORDER BY no DESC";
    final static String NOTICE_SELECT_ONE = "SELECT * FROM notice WHERE no=?";
    final static String NOTICE_UPDATE = "UPDATE notice SET title=?, content=? WHERE no=?";
    final static String NOTICE_DELETE = "DELETE FROM notice WHERE no=?";
    final static String NOTICE_INSERT = "INSERT INTO notice(content, title) VALUES(?, ?)";
    Connection conn = null;

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);

}
