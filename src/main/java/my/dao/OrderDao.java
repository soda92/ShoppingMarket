package my.dao;

import java.sql.*;
import java.util.ArrayList;
import my.bean.*;
import my.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;

public class OrderDao {
    public static Order getOrder(int orderid) {
        Order ret = new Order();
        try {
            Connection c = Conn.getConn();
            String sql = "select id,fin,dat,cost from orde where id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, orderid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ret.setId(rs.getInt("id"));
                ret.setDate(rs.getDate("dat"));
                ret.setFin(rs.getInt("fin"));
                ret.setCost(rs.getInt("cost"));
            }
            rs.close();
            ps.close();
            String sql2 = "select itemid,num from order_item where orderid=?";
            PreparedStatement ps2 = c.prepareStatement(sql2);
            ps2.setInt(1, orderid);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                int itemid = rs2.getInt("itemid");
                Item i = ItemDao.getItem(itemid);
                int num = rs2.getInt("num");
                ret.addItems(i, num);
            }
            rs2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static int finOrder(int userid, int orderid) {
        int cost = 0;
        try {
            Connection c = Conn.getConn();
            String sql = "update orde set fin=1, dat=?, cost=? where id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            Date d = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String str = formatter.format(d);
            ps.setString(1, str);
            Order order = getOrder(orderid);
            for (int i = 0; i < order.getItems().size(); i++) {
                cost += order.getItems().get(i).getPrice() * order.getNums().get(i);
            }
            ps.setInt(2, cost);
            ps.setInt(3, orderid);
            ps.executeUpdate();
            ps.close();
            sql = "insert into user_order(userid,orderid) values (?,?)";
            ps = c.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, orderid);
            ps.executeUpdate();
            ps.close();
            sql = "update user set money=money-? where id=?";
            ps = c.prepareStatement(sql);
            ps.setInt(1, cost);
            ps.setInt(2, userid);
            ps.executeUpdate();
            ps.close();
            sql = "insert into orde (fin,cost) values (0,0)";
            Statement stmt = c.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cost;
    }

    public static void updateOrderIncreaseItem(int orderid, int itemid) {
        try {
            Connection c = Conn.getConn();
            String sql = "select orderid,itemid from order_item where orderid=? and itemid=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.setInt(2, itemid);
            ResultSet rs = ps.executeQuery();
            int n = 0;
            while (rs.next()) {
                ++n;
            }
            rs.close();
            ps.close();
            if (n == 0) {
                String sql2 = "insert into order_item (orderid,itemid,num) values (?,?,1)";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.setInt(1, orderid);
                ps2.setInt(2, itemid);
                ps2.executeUpdate();
                ps2.close();
            } else {
                String sql2 = "update order_item set num=num+1 where orderid=? and itemid=?";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.setInt(1, orderid);
                ps2.setInt(2, itemid);
                ps2.executeUpdate();
                ps2.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int getLatestOrderId() {
        int ret = 0;
        try {
            Connection c = Conn.getConn();
            String sql = "select id from orde where fin=0";
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int cnt = 0;
            while (rs.next()) {
                ret = rs.getInt("id");
                ++cnt;
            }
            if (cnt == 0) {
                String sql2 = "insert into orde (fin,cost) values (0,0)";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.executeUpdate();
                ps2.close();
                ret = getLatestOrderId();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static void updateOrderDecreaseItem(int orderid, int itemid) {
        try {
            Connection c = Conn.getConn();
            String sql = "select orderid,itemid from order_item where orderid=? and itemid=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.setInt(2, itemid);
            ResultSet rs = ps.executeQuery();
            int n = 0;
            while (rs.next()) {
                ++n;
            }
            rs.close();
            ps.close();
            if (n == 1) {
                String sql2 = "delete from order_item where orderid=? and itemid=?";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.setInt(1, orderid);
                ps2.setInt(2, itemid);
                ps2.executeUpdate();
                ps2.close();
            } else {
                String sql2 = "update order_item set num=num-1 where orderid=? and itemid=?";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.setInt(1, orderid);
                ps2.setInt(2, itemid);
                ps2.executeUpdate();
                ps2.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Order> getOrders() {
        ArrayList<Order> ret = new ArrayList<>();
        try {
            Connection c = Conn.getConn();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select id,fin,dat,cost from orde");
            Order o = new Order();
            while (rs.next()) {
                o.setId(rs.getInt("id"));
                o.setDate(rs.getDate("dat"));
                o.setFin(rs.getInt("fin"));
                o.setCost(rs.getInt("cost"));
                int orderid = rs.getInt("id");
                String sql = "select itemid,num from order_item where orderid=?";
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

    public static ArrayList<Order> getOrders(int userid) {
        ArrayList<Order> ret=new ArrayList<>();
        ArrayList<Integer> ids=new ArrayList<>();
        try{
            Connection c=Conn.getConn();
            String sql="SELECT DISTINCT orderid FROM user_order,orde WHERE user_order.userid=? and user_order.orderid=orde.id and orde.fin=1";
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setInt(1,userid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("orderid");
                ids.add(id);
            }
            for(int id:ids){
                Order order=OrderDao.getOrder(id);
                ret.add(order);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return ret;
    }
}