<%@page import="conexion.base"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    String regexSQLInjc = "[$/\"']";
    boolean validChar = true;
    String pswd = request.getParameter("pass");
    String Torneo = request.getParameter("nombreTorneo");
    if (Torneo == null || Torneo.equals(""))
        Torneo="0";
    if(pswd == null || pswd.equals(""))
        pswd ="0";
    if(!Torneo.equals("0") && !pswd.equals("0")) {
        if (Torneo.matches(regexSQLInjc) || pswd.matches(regexSQLInjc))
            validChar = false;
        if (validChar){
            String newPass = pswd;
            base bd = new base();
            bd.conectar();
            String strQry = "select * from Torneo where Nombre_Torneo ='"+Torneo+"' and Contra_Torneo ='"+newPass+"';";
            ResultSet rsValidarUsr = bd.consulta(strQry);
            if (rsValidarUsr.next()){
                    HttpSession UserSession = (HttpSession) request.getSession();
                    UserSession.setMaxInactiveInterval(100000);
                    UserSession.setAttribute("id", Integer.parseInt(rsValidarUsr.getString(1)));
                    response.sendRedirect("admin.jsp");
            }else{
                response.sendRedirect("missingData.jsp");
            }
        }
    }
%>
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
    </head>
    <body class ="bg-primary">
        <div class="card-header">
            <h1 class="text-white" align="right">FAQ's YourStory</h1>
        </div>
        <h1 class="text-white">Usuario Desconocido</h1><br><br>
        <blockquote><img class="botn" src="icn/gifs/maple.gif" alt="regalo"></blockquote><br><br>
        <input type="hidden" id="email" name="email" value="<%=Torneo%>">
        <a href="inicio.html"><center><button class="btn btn-secondary" ><i class="fab fa-node-js"></i>Regresar</button></center></a>
        <img src='icn/WCALogo.png' height="100 vh" align='right'>
    </body>
</html>