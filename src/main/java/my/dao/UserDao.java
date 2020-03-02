package my.dao;

import java.sql.*;
import my.bean.*;
import my.util.Conn;

public class UserDao {
    public static User getUser(int userid) {
        User ret = new User();
        try {
            Connection c = Conn.getConn();
            String sql = "select id,username,password,money,address,phone from user where id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ret.setId(rs.getInt("id"));
                ret.setUsername(rs.getString("username"));
                ret.setPassword(rs.getString("password"));
                ret.setMoney(rs.getInt("money"));
                ret.setAddress(rs.getString("address"));
                ret.setPhone(rs.getString("phone"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static int findUser(String username, String password) {
        int id = -1;
        try {
            Connection c = Conn.getConn();
            String sql = "select id from user where username=? and password=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                id=rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public static void newUser(User user) {
        try {
            Connection c = Conn.getConn();
            String sql = "insert into user (username,password,money,address,phone) values(?,?,?,?,?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getMoney());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateUser(int userid, User user) {
        try {
            Connection c = Conn.getConn();
            String sql = "update user set username=?,password=?,money=?,address=?,phone=? where id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getMoney());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteUser(int userid) {
        try {
            Connection c = Conn.getConn();
            String sql = "delete from user where id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}