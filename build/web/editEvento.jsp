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
        <title>FAQ's YourStory</title>
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
        <%
            base bd = new base();
            bd.conectar();
            int id= Integer.parseInt(request.getParameter("idEvent"));
            String strQry = "select * from eventos where ID_event='"+id+"';";
            ResultSet rs = bd.consulta(strQry);
            String pr = "",dt ="",en="",ar="",sl="";
            if(rs.next())
                pr= rs.getString(2);
                dt= rs.getString(3);
                en= rs.getString(4);
                ar= rs.getString(5);
                sl= rs.getString(6);
            
        %>
    </head>
    <body class="bg-primary">        
        <div class="card-header">
            <h1 class="text-white" align="right">Eventos YourStory</h1>
        </div>
        <div class="container">
            <div class="abs-center">
                <div class="col-md-6 col-sm-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <main class="join-main">
                                <form action="editarEvento.jsp">
                                    <div class="mb-3">
                                        <input id="ID" type="text" name="id"  class="form-control" value="<%=id%>" readonly/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Problema" type="text" name="Problema"   class="form-control" value="<%=pr%>" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Fecha" type="Date" name="Fecha" class="form-control" value="<%=dt%>" readonly/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Encargado" type="text" name="Encargado"  class="form-control" value="<%=en%>" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Area" type="text" name="Area"  class="form-control" value="<%=ar%>" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Solucion" type="text" name="Solucion"  class="form-control" value="<%=sl%>"  required/>
                                    </div>
                                    <button type="submit" class="btn btn-info"><i class="fas fa-sign-in-alt"></i> Actualizar </button>
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
