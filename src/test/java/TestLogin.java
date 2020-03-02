import org.junit.jupiter.api.Test;
import my.dao.UserDao;

public class TestLogin {
    @Test
    public void testLogin() throws Exception {
        String username = "alex";
        String password = "123";
        int id = UserDao.findUser(username, password);
        System.out.println(id);
    }
}