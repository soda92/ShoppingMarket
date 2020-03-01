import static org.junit.jupiter.api.Assertions.assertNotEquals;
import org.junit.jupiter.api.Test;
import java.sql.*;
import my.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.util.Scanner;
public class Test1 {
    @Test
    public void testGetConn() {
        Connection c = Conn.getConn();
        assertNotEquals(null, c, "connection null");
    }
    @Test
    public void test2(){
        System.out.println(ClassLoader.getSystemClassLoader().getResource("file2").toString());
    }

    @Test
    public void test3() throws Exception{
        File f=new File("./src/main/resources/dbinfo.properties");
        FileInputStream fi=new FileInputStream(f);
        Scanner s=new Scanner(fi);
        System.out.println(s.nextLine());
        s.close();
    }
}