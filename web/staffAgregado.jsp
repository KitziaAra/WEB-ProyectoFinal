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
            int categoria, persona, tipoStaff;
            String nombrePersona;
            int persona=Integer.parseInt(request.getParameter("WCAID"));
            int grupo = Integer.parseInt(request.getParameter("grupo"));
            int tipoStaff = Integer.parseInt(request.getParameter("staff"));
            
            try {
                String strQry = "SELECT * FROM Persona WHERE WCAID = " + persona;
                
                bd.conectar();
                ResultSet rs = bd.consulta(strQry);   
                if(rs.next()){
                    nombrePersona = rs.getString(2);
                }
                strQry = "INSERT INTO Participantes_Grupo (IDGrupo, WCAID) VALUES (" + grupo + ", " + persona + ")";
                bd.insertar(strQry);
                int idStaff = 0;
                
                strQry = "SELECT ID_Staff FROM Staff WHERE WCAID = " + persona;
                rs = bd.consulta(strQry);
                if (rs.next()) {
                    idStaff = rs.getInt("ID_Staff");
                } else {
                    strQry = "INSERT INTO Staff (Tipo_Staff, WCAID, Nombre_Staff) VALUES (" + tipoStaff + ", " + persona + ", '" + nombrePersona + "')";
                    bd.insertar(strQry);

                    //Por si se necesitara el idStaff despues de haberlo creado como staff
                    ResultSet rsNew = bd.consulta("SELECT LAST_INSERT_ID() AS nuevoID");
                    if (rsNew.next()) {
                        idStaff = rsNew.getInt("nuevoID");
                    }
                    rsNew.close();
                }
                rs.close();
                
                
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } catch (Exception ex) {
            }
        %>
    </body>
</html>