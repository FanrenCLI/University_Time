package com.fanren.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @Author: FanrenCLI
 * @Date: 2018/11/19 19:07
 * @Description: Class
 * @version:
 */
public class SqlConnection {
    private  Connection conn;
    private String driver="com.mysql.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/university_time";
    private String username="root";
    private String password="lu8023lu..";
    public Connection getConn(){
        try {
            Class.forName(driver);
            conn=DriverManager.getConnection(url,username,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
