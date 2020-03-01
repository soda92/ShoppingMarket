package my.dao;

import java.sql.*;
import java.util.ArrayList;
import my.bean.*;
import my.util.*;

public class OrderDao {
    public static ArrayList<Order> getOrders() {
        ArrayList<Order> ret = new ArrayList<>();
        try {
            Connection c = Conn.getConn();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select (id,fin,dat,cost) from orde");
            Order o = new Order();
            while (rs.next()) {
                o.setDate(rs.getDate("dat"));
                o.setFin(rs.getInt("fin"));
                o.setCost(rs.getInt("cost"));
                int orderid = rs.getInt("id");
                String sql = "select (itemid,num) from order_item where orderid=?";
                PreparedStatement ps = c.prepareStatement(sql);
                ps.setInt(1, orderid);
                ResultSet rs2 = ps.executeQuery();
                while (rs2.next()) {
                    Item i = ItemDao.getItem(rs2.getInt("itemid"));
                    int num = rs2.getInt("num");
                    o.addItems(i, num);
                }
                rs2.close();
                ps.close();
            }
            rs.close();
            stmt.close();
            ret.add(o);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }
}