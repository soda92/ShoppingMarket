<%@page import="java.util.*,my.dao.*,my.util.*,my.bean.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品详情</title>
    <link rel="stylesheet" href="css/item_detail.css">
</head>

<body>
    <%
    String strId=request.getParameter("itemid");
    int id=4;
    if(strId!=null){
        id=Integer.parseInt(strId);
    }
    Item i=ItemDao.getItem(id);
    String[] des=i.getDesc().split(";");
    %>
    <h1><%=i.getName()%></h1>
    <img src="img/<%=i.getImg()%>" alt="" class="item">
    <p>
        <h2>商品价格:<%=i.getPrice()%></h2>
        <a href="cart.jsp?itemid=<%=i.getId()%>">添加到购物车</a>
        <a href="index.jsp">返回</a>
    </p>
    <div class="desc">
        <%
    for(String s:des){
    %>
        <img src="img/<%=s%>" alt="" class="des">
        <%
    }
    %>
    </div>
</body>

</html>