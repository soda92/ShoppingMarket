package init;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/init")
public class Init extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from a");
            PrintWriter out = resp.getWriter();
            StringBuffer s = new StringBuffer();
            s.append("<html><body>");
            while (rs.next()) {
                s.append(rs.getInt(1)).append(rs.getInt(2)).append("<br>");
            }
            s.append("</body></html>");
            con.close();
            out.print(s);
        } catch (SQLException e) {
            return;
        }
    }
}