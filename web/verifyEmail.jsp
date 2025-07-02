<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.base"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession userSession =(HttpSession) request.getSession();
        String vry = request.getParameter("vry");
        String eml = userSession.getAttribute("email").toString();
        if (vry.equals("")|| vry==null)
            vry="0";
        else if(!vry.equals("0")) {
            base bd = new base();
            bd.conectar();
            String emailVry= "select * from Users where email = '"+eml+"' and verifier= '"+vry+"';";
            ResultSet emailVerifier = bd.consulta(emailVry);
            if(emailVerifier.next()){
                String strQry = "update Users set verifier = '0', verify_stat = '1' where email ='"+eml+"'" ;
                bd.insertar(strQry);
                userSession.setAttribute("activacion", "1");
                userSession.removeAttribute("email");
                userSession.removeAttribute("Verificador");
            }
            else{
                int activeUsr = Integer.parseInt(userSession.getAttribute("activacion").toString());
                if(activeUsr !=1){
                    response.sendRedirect("missingData.jsp");
                }
            }
        }
    %>
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
        <div class="card-header">
            <h1 class="text-white" align="right">Castelán</h1>
        </div>
        <center>
            <s1>Verificación completada <i class="fa-regular fa-shield-check fa-beat fa-2xl" style="color: #02e32f;"></i></s1>
            <s1>Por favor vuelve a iniciar sesión &nbsp; <i class="fas fa-exclamation"></i></s1>
             <a href="inicio.html"><center><button class="btn btn-secondary" ><i class="fab fa-node-js"></i>Iniciar Sesión</button></center></a>
        </center>
        <img src='icn/WCALogo.png' height="100 vh" align='right'>
    </body>
</html>
