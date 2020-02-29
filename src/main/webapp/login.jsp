<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <%
Integer user_id=null;
user_id=(Integer)session.getAttribute("user_id");
if(user_id!=null){
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb", "root", "");
    String sql1="SELECT * FROM user WHERE id=?";
    PreparedStatement stmt1=con1.prepareStatement(sql1);
    stmt1.setInt(1,user_id);
    ResultSet rs1 = stmt1.executeQuery();
    Integer num=0;
    while(rs1.next()){
        num+=1;
    }
    rs1.close();
    stmt1.close();
    con1.close();
    if(num!=0){
        response.sendRedirect("index.jsp");
    }
}
String username=request.getParameter("username");
String password=request.getParameter("password");
String message="";
if(username!=null && password!=null){
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb", "root", "");
    String sql="SELECT * FROM user WHERE username=?";
    PreparedStatement stmt=con.prepareStatement(sql);
    stmt.setString(1,username);
    ResultSet rs = stmt.executeQuery();
    String psd=null;
    Integer id=null;
    while(rs.next()){
        psd=rs.getString("password");
        id=rs.getInt("id");
    }
    if(psd==null){
        message="No such user";
    }
    else if(!psd.equals(password)){
        message="password incorrect";
    }
    else{
        session.setAttribute("user_id",id);
        String from=null;
        from=request.getParameter("from");
        if(from!=null){
            response.sendRedirect(from);
        }else{
            response.sendRedirect("index.jsp");
        }
    }
    rs.close();
    stmt.close();
    con.close();
}
%>
<%= message %>
    <form action="" method="post">
        username:<input type="text" name="username">
        <br>
        password: <input type="password" name="password" id="">
        <br>
        <button type="submit">login</button>
    </form>
</body>

</html>