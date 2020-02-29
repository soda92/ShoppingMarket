<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    Hello World
    <ul>
        <%
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db2", "root", "");
    Statement stmt=con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from a");
    while(rs.next()){
        out.print("<li>"+rs.getInt(1)+"|"+rs.getInt(2)+"</li>");
    }
    rs.close();
    stmt.close();
    con.close();
    %>
        <%
    String str="aaa";
    %>
        <br>
        <%
        out.print(str);
    %>
        <br>
        <%
    out.print(session.getAttribute("something"));
    %>
    </ul>
    <a href="login.jsp">login</a>
    <a href="logout.jsp">logout</a>
</body>

</html>