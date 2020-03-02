<%@page import="java.util.*,my.dao.*,my.bean.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单主页</title>
    <link rel="stylesheet" href="css/common.css">
</head>

<body>
    <a href="index.jsp">商城主页</a>
    <a href="user_detail.jsp">个人主页</a>
    <%
    Integer id=(Integer)session.getAttribute("id");
    if(id!=null){
        ArrayList<Order> orders=OrderDao.getOrders(id);
        for(Order order:orders){
            %>
    <ul><%=order.getId()%> 总价：<%= order.getCost() %>
        <%
            for(int i=0;i<order.getItems().size();i++){
                Item it=order.getItems().get(i);
                int num=order.getNums().get(i);
                %>
        <li><%=it.getName()%> x <%=num%></li>
        <%
            }
            %>
    </ul>
    <%
        }
    }
    %>
</body>

</html>