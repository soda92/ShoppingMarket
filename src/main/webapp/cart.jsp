<%@page import="java.util.*,my.dao.*,my.bean.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的购物车</title>
</head>

<body>
    <%
    String itemidStr=request.getParameter("itemid");
    int orderid=OrderDao.getLatestOrderId();
    if(itemidStr!=null){
        int itemid=Integer.parseInt(itemidStr);
        OrderDao.updateOrderIncreaseItem(orderid,itemid);
    }
    %>
    <p>当前购物车：</p>
    <ul>
        <%
    Order order=OrderDao.getOrder(orderid);
    ArrayList<Item> is=order.getItems();
    ArrayList<Integer> ns=order.getNums();
    for(int i=0;i<is.size();i++){
        String name=is.get(i).getName();
        int n=ns.get(i);
    %>
        <li><%=name%> x <%=n%></li>
        <%
    }
    %>
    </ul>
    <a href="../item/all.jsp">继续购物</a>
    <a href="../pay/pay.jsp?orderid=<%=order.getId()%>">结算</a>
</body>

</html>