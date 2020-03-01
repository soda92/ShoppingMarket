package my.util;

import java.sql.*;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.File;

public class Conn {
    private static Connection con = null;

    public static Connection getConn() {
        if (con != null) {
            return con;
        } else {
            Properties p = new Properties();
            String fn = "./src/main/resources/dbinfo.properties";
            File f = new File(fn);

            String url = null;
            String user = null;
            String password = null;
            try {
                FileInputStream fis = new FileInputStream(f);
                p.load(fis);
                url = p.getProperty("url");
                user = p.getProperty("username");
                password = p.getProperty("password");
                con = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
            return con;
        }
    }
}