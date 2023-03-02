package ctrl.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
    private static final String driver ="com.mysql.cj.jdbc.Driver";
    private static final String url ="jdbc:mysql://localhost:3306/homework?useSSL=false&serverTimezone=UTC";
    private static final String user = "root";
    private static final String password ="Mrjian19971015";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public Connection getConnection(){
        Connection con = null;
        try {
            con = DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  con;
    }

    public static void close(ResultSet rs, Statement pstmt, Connection con){
        if(rs != null){
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        if (pstmt != null){
            try {
                pstmt.close();
                pstmt =null;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        if(con != null){
            try {
                con.close();
                con = null;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
