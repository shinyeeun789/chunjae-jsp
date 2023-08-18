package edu.chunjae.model;

import java.sql.*;

public interface DBConnect {
    final static String NOTICE_SELECT_ALL = "SELECT * FROM notice ORDER BY no DESC";
    final static String NOTICE_SELECT_ONE = "SELECT * FROM notice WHERE no=?";
    final static String NOTICE_UPDATE = "UPDATE notice SET title=?, content=? WHERE no=?";
    final static String NOTICE_DELETE = "DELETE FROM notice WHERE no=?";
    final static String NOTICE_INSERT = "INSERT INTO notice(content, title) VALUES(?, ?)";

    final static String CUSTOM_SELECT_ALL = "select * from custom order by regdate";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";          // 회원 정보
    final static String CUSTOM_SELECT_LOG = "select * from custom where id=?, pw=?";
    final static String CUSTOM_INSERT = "insert into custom values(?,?,?,default,defualt,?,?,?,default)";
    final static String CUSTOM_UPDATE = "update custom set pw=?,tel=?,email=? where id=?";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);

}
