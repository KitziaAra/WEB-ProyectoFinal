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
            int idCat =Integer.parseInt(request.getParameter("idCat"));
            base bd = new base();
            try {
                bd.conectar();
                String strQry = "select * from Categoria where ID_Torneo = '"+id+"' and ID_Cat='"+idCat+"';";
                ResultSet rs = bd.consulta(strQry);   
                if(rs.next()){
                    nombreCat = rs.getString(2);
                    corte = rs.getString(3);
                    limite = rs.getString(4);
                    fechaIni = rs.getString(5);
                    fechaFin = rs.getString(6);
                }
            }
            catch (Exception e){
                out.print(e.getMessage());
            }
         %>
        <div class="card-header">
            <h1 class="text-white" align="right">Castelán Industries</h1>
        </div>
        <div class="container">
            <div class="abs-center">
                <div class="col-md-6 col-sm-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header">
                            <h1 class="text-white"><i class="fab fa-node-js"></i> Editar </h1>
                        </div>
                        <div class="card-body">
                            <main class="join-main">
                                <form action="editadatos.jsp">
                                    <input id="id" type="hidden" name="idCat" value="<%=idCat%>" />
                                    <div class="mb-3">
                                        <input id="nombreCat" type="text" name="nombreCat" value="<%=nombreCat%>" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="corte" type="text" name="corte" value="<%=corte%>" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="limite" type="text" name="limite" value="<%=limite%>" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="fechaI" type="datetime" name="fechaIni" value="<%=fechaIni%>"  class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="fechaF" type="datetime" name="fechaFin" value="<%=fechaFin%>"  class="form-control" required/>
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
