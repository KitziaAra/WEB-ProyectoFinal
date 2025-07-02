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
            String nm, cr,lm,fI,fF;
            String idCat = request.getParameter("idCat");
            nm = request.getParameter("nombreCat");
            cr = request.getParameter("corte");
            lm = request.getParameter("limite");
            fI = request.getParameter("fechaIni");
            fF = request.getParameter("fechaFin");
            try {
                bd.conectar();
                String strQry = "update Categoria set Nombre_Cat='"+nm+"', Corte='"+cr+"', Limite='"+lm+"', Horario_Inicio ='"+fI+"', Horario_Fin ='"+fF+"' where ID_Cat ='"+idCat+"';";
                bd.edita(strQry);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } catch (Exception ex) {
               ex.printStackTrace();
            }
        %>
    </body>
</html>