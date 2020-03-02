import org.junit.jupiter.api.Test;
import my.dao.*;
import my.bean.*;
import java.util.*;

public class TestGetOrder {
    @Test
    public void test() throws Exception {
        int orderid = OrderDao.getLatestOrderId();
        System.out.println(orderid);
    }

    @Test
    public void test2() throws Exception {
        int orderid = OrderDao.getLatestOrderId();
        Order order = OrderDao.getOrder(orderid);
        ArrayList<Item> is = order.getItems();
        System.out.println(is.size());
    }
}