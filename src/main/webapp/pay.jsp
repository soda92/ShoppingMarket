<%@page import="my.bean.*,my.dao.*,java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付</title>
</head>

<body>
    <%
    String orderIdStr=request.getParameter("orderid");
    Integer userid=(Integer)session.getAttribute("id");
    if(orderIdStr!=null && userid!=null){
        int orderid=Integer.parseInt(orderIdStr);
        int cost=OrderDao.finOrder(userid,orderid);
        User user=UserDao.getUser(userid);
    %>
    <h1>支付成功！</h1>
    <p>当前余额：<%=user.getMoney()%></p>
    <%
    }
    %>
    <a href="index.jsp">主页</a>
    <a href="cart.jsp">购物车</a>
    <a href="order_index.jsp">查看订单</a>
    <a href="user_detail.jsp">个人主页</a>
</body>

</html>