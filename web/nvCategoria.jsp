<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%     
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            base bd = new base();
            bd.conectar();
            
            String nombre=request.getParameter("nombrecat");
            if(nombre.equals("other")){
                nombre=request.getParameter("Nombre");
             }
            int Corte = Integer.parseInt(request.getParameter("Corte"));
            int Limite = Integer.parseInt(request.getParameter("Limite"));
            String HorarioIn=request.getParameter("HorarioIn");
            String HorarioFin=request.getParameter("HorarioFin");
            int zona= Integer.parseInt(request.getParameter("zona"));
            if(!nombre.equals("") && !HorarioIn.equals("")&& !HorarioFin.equals("")&& !(Corte<0)&& !(Limite<0) && !(zona<=1)){
                try{
                    String strQry = "insert into Categoria(Nombre_Cat, Corte,Limite, Horario_Inicio,Horario_Fin,Zona, ID_Torneo) values ('"+nombre+"','"+Corte+"','"+Limite+"','"+HorarioIn+"','"+HorarioFin+"','"+zona+"', '"+id+"');";
                    bd.insertar(strQry);
                    response.sendRedirect("admin.jsp");

                }
                catch(Exception XD){
                    out.print(XD.getMessage());
                }
            }   
        %>
    </head>
    <body>
    </body>
</html>