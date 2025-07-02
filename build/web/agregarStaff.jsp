<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <script src="https://kit.fontawesome.com/ef8a93e188.js" crossorigin="anonymous"></script>
        <!-- ICON -->
        <link rel="icon" href="img/logo.png">
        <!-- BOOTSWATCH -->
        <link href="https://bootswatch.com/5/minty/bootstrap.min.css" rel="stylesheet">
        <title>Castelán</title>
        <style type="text/css" media="screen">
            .abs-center{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 80vh;
            }
            input{
                background-color: #898989 !important;
                color: white !important;
            }
            ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
                color: #044E6B !important;
                opacity: 1; /* Firefox */
            }
            
        </style>
    </head>
     <body class="bg-primary">
          <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            String nombreCat="", corte="", limite="", fechaIni ="", fechaFin="";
            int WCAID =Integer.parseInt(request.getParameter("WCAID"));
            base bd = new base();
            try {
                bd.conectar();
                String strQry = "SELECT * FROM Persona WHERE WCAID = " + WCAID + ";";
                ResultSet rs = bd.consulta(strQry);   
                if(rs.next()){
                    nombrePersona = rs.getString(2);
                }
            }
            catch (Exception e){
                out.print(e.getMessage());
            }
         %>
        <div class="card-header">
            <h1 class="text-white" align="right">BIENVENIDO A LOS GRUPOS</h1>
        </div>
        <div class="container">
            <div class="abs-center">
                <div class="col-md-6 col-sm-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header">
                            <h1 class="text-white"><i class="fab fa-node-js"></i> ¿A qupe grupo te agregamos?</h1>
                        </div>
                        <div class="card-body">
                            <main class="join-main">
                                <form action="agregarStaff.jsp?WCAID=<%=WCAID%>">
                                    <div class="mb-3">
                                        <label for="pet-select">Grupo:</label>
                                        <select name="grupo" id="grupo">
                                          <option value="" disabled>EN QUE GRUPO COMPETIRAS</option>
                                          <%
                                            try {
                                                bd.conectar();
                                                String strQry1 = "SELECT DISTINCT g.IDGrupo, c.NombreCat FROM Grupo g JOIN Categoria c ON g.IDCat = c.IDCat;";
                                                ResultSet rs = null;
                                                int ID_g;
                                                rs = bd.consulta(strQry1);
                                                while (rs.next()){
                                                    ID = Integer.parseInt(rs.getString(1));
                                          %>
                                          <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %>, <%= rs.getInt(1) %></option>
                                          <%
                                                }
                                                rs.close();
                                                bd.cierraConexion();
                                            } catch (Exception ex){
                                                out.print(ex.getMessage());
                                            }
                                         %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pet-select">Grupo:</label>
                                        <select name="staff" id="staff">
                                          <option value="" disabled>¿Como apoyaras al equipo?</option>
                                          <option value="1">Scrambler</option>
                                          <option value="2">Runner</option>
                                          <option value="3">Juez</option>
                                          <option value="4">Capturista</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-secondary"><i class="fas fa-sign-in-alt"></i> Actualizar</button>
                                </form>
                            </main>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <img src='icn/WCALogo.png' height="100 vh" align='right'>
    </body>
</html>
