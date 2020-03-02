<%@page import="java.util.*,my.bean.*,my.dao.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
</head>

<body>
    <%
String username=request.getParameter("username");
String password=request.getParameter("password");
String phone=request.getParameter("telephone");
String address=request.getParameter("address");
if(username!=null && password!=null && phone!=null && address!=null){
    User user=new User();
    user.setUsername(username);
    user.setPassword(password);
    user.setAddress(address);
    user.setPhone(phone);
    user.setMoney(100);
    UserDao.newUser(user);
    %>
    <h1>注册成功！</h1>
    <a href="login.jsp">登录</a>
    <%
}
else{
    %>
    <form action="" method="POST">
        用户名：<input type="text" name="username" id="">
        <br>
        密码：<input type="password" name="password" id="">
        <br>
        电话：<input type="text" name="telephone" id="">
        <br>
        地址：<input type="text" name="address" id="">
        <br>
        <button type="submit">注册</button>
    </form>
    <%
}
%>
</body>

</html>