<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>si</title>
    </head>
    <body>
        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            base bd = new base();
            int categoria, persona;
            int persona=Integer.parseInt(request.getParameter("WCAID"));
            int grupo = Integer.parseInt(request.getParameter("grupo"));
            try {
                bd.conectar();
                String strQry = "INSERT INTO Participantes_Grupo (IDGrupo, WCAID) VALUES (" + grupo + ", " + persona + ")";
                bd.edita(strQry);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } catch (Exception ex) {
            }
        %>
    </body>
</html>