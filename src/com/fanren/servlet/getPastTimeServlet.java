package com.fanren.servlet;

/**
 * @Author: FanrenCLI
 * @Date: 2018/11/19 19:06
 * @Description: Class
 * @version:
 */

import com.fanren.bean.PastTime;
import com.fanren.dao.SqlConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(loadOnStartup = 1,urlPatterns = "/update",name = "init")
public class getPastTimeServlet extends HttpServlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        /** 
        * @Author: FanrenCLI
        * @Date: 21:50 2018/11/19
        * @param: servletConfig
        * @Description: Method
        */
        System.out.println("请求传送过来了！");
        List<PastTime> list=new ArrayList<>();
        this.sqlConn(list);
        ServletContext servletContext= servletConfig.getServletContext();
        servletContext.setAttribute("past_time",list);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求传送过来了2");
        List<PastTime> list=new ArrayList<>();
        this.sqlConn(list);
        ServletContext servletContext=req.getServletContext();
        servletContext.setAttribute("past_time",list);
    }

    //定义数据库操作
    public void sqlConn(List<PastTime> list){
        Connection conn=new SqlConnection().getConn();
        try {
            String sql="select * from past_time";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                PastTime ps=new PastTime(resultSet.getInt(1),resultSet.getString(2),
                        resultSet.getDate(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(6),
                        resultSet.getDouble(7),resultSet.getDouble(8));
                list.add(ps);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
