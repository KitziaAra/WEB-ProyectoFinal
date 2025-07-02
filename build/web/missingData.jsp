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
        <title>Verificacion</title>
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
    <s1>Tu torneo no ha sido dado de alta, por favor verficate con un delegado<i class="fas fa-exclamation-triangle"></i></s1>
         <center>
            <form method="post" action="inicio.html" name="verifyEmail" >
                <a href="inicio.html"><center><button class="btn btn-secondary" ><i class="fab fa-node-js"></i>Validar</button></center></a>
            </form>
        </center>   
        <img src='icn/WCALogo.png' height="100 vh" align='right'>
    </body>
</html>