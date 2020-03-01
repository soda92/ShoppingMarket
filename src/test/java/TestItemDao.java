import my.dao.ItemDao;
import java.util.ArrayList;
import my.bean.Item;
import org.junit.jupiter.api.Test;

public class TestItemDao {

    @Test
    public void testGetTypes() throws Exception {
        ArrayList<String> types = ItemDao.getTypes();
        for (String type : types) {
            System.out.println(type);
        }
    }

    @Test
    public void testGetItemsWithType() throws Exception {
        ArrayList<Item> is = ItemDao.getItemsWithType("1");
        for (Item i : is) {
            System.out.println(i);
        }
    }
}