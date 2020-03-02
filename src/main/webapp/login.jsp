<%@page import="java.util.*,my.dao.*,my.bean.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="css/common.css">
</head>

<body>
    <%
String username=request.getParameter("username");
String password=request.getParameter("password");
if(username!=null && password!=null){
    int id=UserDao.findUser(username,password);
    if(id!=-1){
        session.setAttribute("id",id);
        response.sendRedirect("index.jsp");
    }
}
%>
    <form action="" method="POST">
        用户名：<input type="text" name="username" id="">
        <br>
        密码：<input type="password" name="password" id="">
        <br>
        <button type="submit">登录</button>
        <a href="register.jsp">注册</a>
    </form>
</body>

</html>