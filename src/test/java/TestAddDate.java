import org.junit.jupiter.api.Test;
import java.sql.*;
import java.util.Date;
import java.util.Properties;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;

public class TestAddDate {
    @Test
    public void addDate() throws Exception {
        String path = "./src/test/java/testdb.properties";
        File f = new File(path);
        FileInputStream is = new FileInputStream(f);
        Properties p = new Properties();
        p.load(is);

        String url = p.getProperty("url");
        String user = p.getProperty("username");
        String password = p.getProperty("password");
        Connection c=DriverManager.getConnection(url, user, password);
        String sql="insert into test_date (t_date) values (?)";
        PreparedStatement ps=c.prepareStatement(sql);

        Date date=new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr=formatter.format(date);
        ps.setString(1,dateStr);
        int i=ps.executeUpdate();
        System.out.println(i);
    }
}