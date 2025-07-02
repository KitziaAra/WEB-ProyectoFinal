<%@page import="Verificador.cifrado"%>
<%@page import="conexion.base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Verificador.VerifcadorEmail"%>
<%@page import ="java.util.Date"%>
<%@page import ="java.util.Properties"%>
<%@page import ="javax.mail.Authenticator"%>
<%@page import ="javax.mail.Message"%>
<%@page import ="javax.mail.MessagingException"%>
<%@page import ="javax.mail.PasswordAuthentication"%>
<%@page import ="javax.mail.Session"%>
<%@page import ="javax.mail.Transport"%>
<%@page import ="javax.mail.internet.AddressException"%>
<%@page import ="javax.mail.internet.InternetAddress"%>
<%@page import ="javax.mail.internet.MimeMessage"%>
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
        <link href="https://bootswatch.com/5/slate/bootstrap.min.css" rel="stylesheet">
        <title>Castelán Industries</title>
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
            VerifcadorEmail VE= new VerifcadorEmail();
            String PassWord = VE.Vry();
            System.out.println(PassWord);
            String Nombre = request.getParameter("nombreTorneo");
            System.out.println(Nombre);
            String fechaIni = request.getParameter("fechaInicio");
            System.out.println(fechaIni);
            String fechaFin = request.getParameter("fechaFin");
            System.out.println(fechaFin);
            if(!Nombre.equals("") && !fechaIni.equals("") && !fechaFin.equals("")){
                base bd = new base();
                try{
                    bd.conectar();
                    String strQry= "insert into Torneo (Nombre_Torneo, Contra_Torneo, Fecha_Inicio, Fecha_Fin) values ('"+Nombre+"','"+PassWord+"','"+fechaIni+"','"+fechaFin+"'); ";
                    bd.insertar(strQry);
                }
                catch(Exception XD){
                    out.print(XD.getMessage());
                }
        %>
        <div class="card-header">
            <h1 class="text-white" align="right">Castelán Industries</h1>
        </div>
        <div class="container">
        <div class="card-header">
            <h2><label>Felicidades, estás a punto de poder manejar tu torneo, inicia sesión a continuación</label></h2><br>
        </div>
            <s2><label>Nombre: <%out.println(Nombre);%></label></s2><br>
            <s2><label> Contraseña asignada <%out.println(PassWord);%></label></s2><br>
            <p align="center"><s2>Inicia Sesión</s2></p>
            <center>
                <form method="post" action="inicio.html" name="verifyEmail" >
                    <br>
                    <a href="inicio.html"><center><button class="btn btn-secondary" ><i class="fab fa-node-js"></i>Iniciar Sesión</button></center></a>
                </form>
            </center>
        </div>
        <%  }else
            response.sendRedirect("Registro Fallido.jsp");
        %>
    </body>
</html>