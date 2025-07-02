<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.base"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            String nombre="";
            base bd = new base();
            bd.conectar();
            String strQry = "Select Nombre_Torneo from Torneo where ID_Torneo = '"+id+"'";
            ResultSet rsDatosPer = bd.consulta(strQry);
            if(rsDatosPer.next())
                nombre = rsDatosPer.getString(1);
               System.out.println(nombre); 
        %>
        
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <script src="https://kit.fontawesome.com/ef8a93e188.js" crossorigin="anonymous"></script>
        <!-- ICON -->
        <link rel="icon" href="img/logo.png">
        <!-- BOOTSWATCH -->
        <link href="https://bootswatch.com/5/quartz/bootstrap.min.css" rel="stylesheet">
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">Gruopifier Nuevo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
              <ul class="navbar-nav me-auto">
                <li class="nav-item">
                  <a class="nav-link active" href="admin.jsp">Categorias
                    <span class="visually-hidden">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="admin.jsp">Horario</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="eventos.jsp">Staff</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="card-header">
            <h3 class="text-white">Categorias</h3>
        </div>
        <center>
            <div class="card-body">
                <center><s3>Bienvenido <%=nombre%>  &nbsp;<i class="fa-sharp fa-solid fa-chess-king fa-beat-fade" style="color: #00ee83;"></i></s3></center>
            </div>
            <div class="join-main">
                <s3>A continuación verás las categorias de tu torneo</s3>
                <s4>
                    <table class="table table-hover" border="3" >
                        <thead>
                            <tr class="table-info">
                                <th colspan="13" align="right"> test</th>
                                <th> 
                                    <a href="altasCategoria.jsp"><center><button class="btn btn-dark" ><i class="fas fa-user-plus"></i></button></center></a>
                                </th>
                            </tr>
                        </thead>
                        <thead>
                            <tr bgcolor="#0027D8">
                                <th scope="col"> Nombre </th>
                                <th scope="col"> Corte </th>
                                <th scope="col"> Limite </th>
                                <th scope="col"> Horario_Inicio </th>
                                <th scope="col"> Horario_Fin </th>
                                <th scope="col"> Zona</th>
                            </tr>
                        </thead>
                            <%
                                try {
                                    bd.conectar();
                                    String strQry1 = "select * from Categoria where ID_Torneo = '"+id+"'";
                                    ResultSet rs = null;
                                    int ID;
                                    rs = bd.consulta(strQry1);
                                    while (rs.next()){
                                        ID = Integer.parseInt(rs.getString(1));
                            %>
                                        <tbody>
                                            <tr class="table-info">
                                                <th> <%=rs.getString(2)%> </th>
                                                <th> <%=rs.getString(3)%></th>
                                                <th> <%=rs.getString(4)%></th>
                                                <th> <%=rs.getString(5)%></th>
                                                <th> <%=rs.getString(6)%></th>
                                                <th> <%=rs.getString(7)%></th>
                                                <th><center><button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#deleteWar"><i class="fas fa-exclamation"></i></button></center></th>
                                                <th><a href="edita.jsp?idCat=<%=ID%>"><center><button class="btn btn-dark" ><i class="fas fa-user-graduate"></i></button></center></a> </th>
                                            </tr>
                                            <div class="modal fade" id="deleteWar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h3 class="modal-title" id="exampleModalLabel">¿Estás seguro de borrar esta Categoria?</h3>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h6>Esta accion es permanente (mucho tiempo) y no se puede deshacer.</h6>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="delete.jsp?idCat=<%=ID%>"><center><button class="btn btn-warning" >Sí, borrala</button></center></a>
                                                            <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cerrar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </tbody>
                            <%
                                    }
                                    rs.close();
                                    bd.cierraConexion();
                                } catch (Exception ex){
                                    out.print(ex.getMessage());
                                }
                            %>
                    </table>
                </s4>
            </div>
                <a href="cerrar.jsp"><center><button class="btn btn-secondary" ><i class="fab fa-node-js"></i>Cerrar sesión</button></center></a>
            </div>
        </center>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    </body>
</html>