<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            base bd = new base();
            bd.conectar();
            int id_Cat =Integer.parseInt(request.getParameter("idCat"));
            out.println(id);
            try {
                bd.conectar();
                String strQry = "delete from Categoria where ID_Torneo ='"+id+"' and ID_Cat = '"+id_Cat+"';";
                bd.borrar(strQry);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
            catch (Exception e){
                out.print(e.getMessage());
            }
         %>
    </body>
</html>
