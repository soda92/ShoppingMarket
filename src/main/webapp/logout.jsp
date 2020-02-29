<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    Integer id=null;
    id=(Integer)session.getAttribute("user_id");
    if(id!=null){
        session.setAttribute("user_id",null);
    }
    out.print("success");
    %>
    <br>
    <a href="index.jsp">index</a>
</body>
</html>