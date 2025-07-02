<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <script src="https://kit.fontawesome.com/ef8a93e188.js" crossorigin="anonymous"></script>
        <!-- BOOTSWATCH -->
        <link href="https://bootswatch.com/5/quartz/bootstrap.min.css" rel="stylesheet">
        <title>CATEGORIAS</title>
        <style type="text/css" media="screen">
            .abs-center{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 80vh;
            }
            input{
                background-color: null;
                color: white !important;
            }
            ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
                color: #044E6B !important;
                opacity: 1; /* Firefox */
            }
            
        </style>
    </head>
    
    <body class="bg-primary" > 
         <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (Integer) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
            
        %>
        <div class="card-header">
            <h1 class="text-white" align="right">WCA </h1>
        </div>
        <div class="container">
            <div class="abs-center">
                <div class="col-md-6 col-sm-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header">
                            <h2 class="text-white">ALTAS CATEGORIA</h2>
                        </div>
                        <div class="card-body">
                            <main class="join-main">
                                <form action="nvCategoria.jsp">
                                    <div class="mb-3">
                                        <label for="nombre">Nombre de categoria</label><br>
                                            <input type="radio" id="3x3x3" name="nombrecat" value="3x3x3">
                                            <label for="3x3x3">3x3x3</label><br>
                                            <input type="radio" id="2x2x2" name="nombrecat" value="2x2x2">
                                            <label for="2x2x2">2x2x2</label><br>
                                            <input type="radio" id="4x4x4" name="nombrecat" value="4x4x4">
                                            <label for="4x4x4">4x4x4</label><br>
                                            <input type="radio" id="5x5x5" name="nombrecat" value="5x5x5">
                                            <label for="5x5x5">5x5x5</label><br>
                                            <input type="radio" id="6x6x6" name="nombrecat" value="6x6x6">
                                            <label for="6x6x6">6x6x6</label><br>
                                            <input type="radio" id="7x7x7" name="nombrecat" value="7x7x7">
                                            <label for="7x7x7">7x7x7</label><br>
                                            <input type="radio" id="3x3x3blind" name="nombrecat" value="3x3x3blind">
                                            <label for="3x3x3blind">3x3x3 a ciegas</label><br>
                                            <input type="radio" id="3x3x3menosMov" name="nombrecat" value="3x3x3menosMov">
                                            <label for="3x3x3menosMov">3x3x3 con menos movimientos</label><br>
                                            <input type="radio" id="3x3x3aHand" name="nombrecat" value="3x3x3aHand">
                                            <label for="3x3x3aHand">3x3x3 a una mano</label><br>
                                            <input type="radio" id="Clock" name="nombrecat" value="Clock">
                                            <label for="Clock">Clock</label><br>
                                            <input type="radio" id="Megaminx" name="nombrecat" value="Megaminx">
                                            <label for="Megaminx">Megaminx</label><br>
                                            <input type="radio" id="Pyraminx" name="nombrecat" value="Pyraminx">
                                            <label for="Pyraminx">Pyraminx</label><br>
                                            <input type="radio" id="Skewb" name="nombrecat" value="Skewb">
                                            <label for="Skewb">Skewb</label><br>
                                            <input type="radio" id="Cuadrado-1" name="nombrecat" value="Cuadrado-1">
                                            <label for="Cuadrado-1">Cuadrado-1</label><br>
                                            <input type="radio" id="4x4x4blind" name="nombrecat" value="4x4x4blind">
                                            <label for="4x4x4blind">4x4x4 a ciegas</label><br>
                                            <input type="radio" id="5x5x5blind" name="nombrecat" value="5x5x5blind">
                                            <label for="5x5x5blind">5x5x5 a ciegas</label><br>
                                            <input type="radio" id="3x3x3MultiBlind" name="nombrecat" value="3x3x3MultiBlind">
                                            <label for="3x3x3MultiBlind">3x3x3 MultiBlind</label><br>
                                            <input type="radio" id="other" name="nombrecat" value="other">
                                            <label for="other">Otro</label><br>
                                            <input id="Nombre" type="text" name="Nombre" placeholder="Nombre de categoría" class="form-control" style="display: none;"/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Corte" maxlength="3" type="number" min="0" max="600" name="Corte" placeholder="Corte" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Limite"  maxlength="3" type="number" min="600" max="3600" name="Limite" placeholder="Limite" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="HorarioIn" type="datetime-local" name="HorarioIn" min="2025-07-01T12:00" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <input id="HorarioFin" type="datetime-local" name="HorarioFin" min="2025-07-01T12:01" class="form-control" required/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pet-select">Zona:</label>
                                        <select name="zona" id="zona">
                                          <option value="" disabled>CUANTAS ZONAS HABRA</option>
                                          <option value="1">1</option>
                                          <option value="2">2</option>
                                          <option value="3">3</option>
                                          <option value="4">4</option>
                                          <option value="5">5</option>
                                          <option value="6">6</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-info"><i class="fas fa-sign-in-alt"></i> Ingresar</button>
                                </form>
                            </main>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <script type="text/javascript">
            document.querySelectorAll('input[name="nombrecat"]').forEach(radio => {
                radio.addEventListener('change', function() {
                    const miInput = document.getElementById('Nombre');
                    if (this.id === 'other') {
                        miInput.style.display = 'block';
                        miInput.disabled = false;
                    } else {
                        miInput.style.display = 'none';
                        miInput.disabled = true;
                    }
                });
            });
        </script>
    </body>
</html>