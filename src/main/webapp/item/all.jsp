<%@page import="java.util.*,my.util.*,my.bean.*,my.dao.*"%>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-hans">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物商城</title>
    <link rel="stylesheet" href="../static/css/item_all.css">
</head>

<body>
    <h1>购物商城</h1>
    <div id="nav">
        <span>商品分类：</span>
        <%
    ArrayList<String> types=ItemDao.getTypes();
    for(String type:types){
    %>
        <a href="all.jsp?type=<%=type%>"><%=type%></a>
        <%
    }
    %>
    </div>
    <p>你当前查看的是：
        <%
    String type=request.getParameter("type");
    if(type==null){
        type=ItemDao.getTypes().get(0);
    }
    out.print(type);
    %>
    </p>
    <div id="list">
        <%
    ArrayList<Item> items=ItemDao.getItemsWithType(type);
    for(Item i:items){
        %>
        <div class="item">
            <img src="../static/img/<%=i.getImg()%>" alt="">
            <a href="detail.jsp?itemid=<%=i.getId()%>"><%=i.getName()%></a>
        </div>
        <%
    }
    %>
    </div>
</body>

</html>