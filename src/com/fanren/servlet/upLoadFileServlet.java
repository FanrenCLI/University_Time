package com.fanren.servlet;

import com.fanren.dao.SqlConnection;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: FanrenCLI
 * @Date: 2018/11/20 15:21
 * @Description: Class
 * @version:
 */
@WebServlet(urlPatterns = "/upload")
public class upLoadFileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        req.setCharacterEncoding("utf-8");
        try {
            List<FileItem> items = upload.parseRequest(req);
            Map param = new HashMap();
            for (Object object : items) {
                FileItem fileItem = (FileItem) object;
                if (fileItem.isFormField()) {
                    param.put(fileItem.getFieldName(),
                            fileItem.getString("utf-8"));// 如果你页面编码是utf-8的
                   } else {
                    /*此处为验证密码信息*/
                    String check=(String) param.get("password");
                    if(!check.equals("123")){
                        resp.setStatus(404);
                        return;
                    }
                    String picturename = fileItem.getName();
                    File file=new File("F:"+File.separator+"image"+File.separator+
                            param.get("name")+File.separator+picturename);
                    if(!file.getParentFile().exists()){
                        file.getParentFile().mkdirs();
                    }
                    fileItem.write(file);
                }
            }
            Connection connection= new SqlConnection().getConn();
            String sql="insert into past_time(name,time,location,people,awards,lon,lat) values("+"'"+ param.get("name")+"'"+
                    ","+"'"+ param.get("time")+"'"+ ","+"'"+ param.get("location") +"'"+  ","+"'"+param.get("people")+"'"+","+ "'"+param.get("awards")+"'"+
                    ","+"'"+param.get("lon")+"'"+ ","+"'"+param.get("lat") +"'"+")";
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.execute();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
