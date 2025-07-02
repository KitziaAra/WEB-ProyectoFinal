<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    request.getSession().invalidate();
    response.sendRedirect("inicio.html");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    <img src='icn/WCALogo.png' height="100 vh" align='right'>
    </body>
</html>

