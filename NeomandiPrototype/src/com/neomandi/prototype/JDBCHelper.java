package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCHelper {
    public static void Close(Connection con) {
        if (con != null) {
            try {
                con.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void Close(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void Close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void Close(PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static Connection getConnection() {
        try {
            Class.forName(Constants.DBNAME);
            Connection con = DriverManager.getConnection(Constants.URL, Constants.UID, Constants.PWD);
            return con;
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
