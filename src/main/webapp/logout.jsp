<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>退出</title>
    <link rel="stylesheet" href="css/common.css">
</head>

<body>
    <%
    Object id=session.getAttribute("id");
    if(id!=null){
        session.setAttribute("id",null);
    }
    %>
    <p>退出成功</p>
    <a href="login.jsp">重新登录</a>
    <a href="index.jsp">首页</a>
</body>

</html>