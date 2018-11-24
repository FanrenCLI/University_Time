import com.fanren.bean.PastTime;
import com.fanren.dao.SqlConnection;
import org.junit.Test;

import javax.sound.midi.Soundbank;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: FanrenCLI
 * @Date: 2018/11/16 12:04
 * @Description: Class
 * @version:
 */
public class test {

    @Test
    public void get() throws Exception {
        Connection conn=new SqlConnection().getConn();
        String sql="select * from past_time";
        PreparedStatement preparedStatement=conn.prepareStatement(sql);
        ResultSet resultSet=preparedStatement.executeQuery();
        List<PastTime> list=new ArrayList<>();
        while (resultSet.next()){
            PastTime ps=new PastTime(resultSet.getInt(1),resultSet.getString(2),
                    resultSet.getDate(3),resultSet.getString(4),
                    resultSet.getString(5),resultSet.getString(6),
                    resultSet.getDouble(7),resultSet.getDouble(8));
            list.add(ps);
        }
        System.out.println(list);
        conn.close();
    }
    @Test
    public void set() throws Exception{
        Connection conn=new SqlConnection().getConn();
        try {
            String sql="insert into past_time values (1,'第七届全国大学生GIS应用技能大赛','2018-11-29','河南理工大学','刘浩、钱振、陈昊煊、胡宇宸','一等奖',116.404, 39.915)," +
                    "(2,'第六届全国大学生GIS应用技能大赛','2017-12-3','南京师范大学','xxxxxxxx','一等奖',120.86,32.01)";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
           preparedStatement.execute();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            conn.close();
        }
    }
    
}
