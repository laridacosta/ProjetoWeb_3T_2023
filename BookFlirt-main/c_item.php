<?php
// logado
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
        if ($_SESSION["tipo"] != 0) {
            header("Location: index.html");
        }
    }
    if (!isset($_SESSION["username"] )) {
        header("Location: index.html");
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicativo</title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <!-- Compiled and minified CSS -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body>
<style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        img{
            display: flex;
            width: 100px;
            height: 50%;
        }
            </style>
<header>
    <nav>
        <div class="nav-wrapper">
        <a href="#!" class="brand-logo center">BookFlirt</a>
        <ul class="left hide-on-med-and-down">
            <li><a href="inicio.php">Inicio</a></li>
            <li><a href="ranking.php">Ranking</a></li>
            <?php
                if ($_SESSION["tipo"] == 0) {
                    echo "<li><a href='c_item.php'>Cadastrar item</a></li>";
                }
            ?>
        </ul>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="src/logout.php">Sair</a></li>
        </ul>
        </div>
    </nav>
</header>

<form action="src/cadastra_item.php" method="post" enctype="multipart/form-data">
    <input type="text" name="titulo" id="titulo" placeholder="Titulo">
    <input type="text" name="sinopse" id="sinopse" placeholder="Sinopse">
    <input type="file" name="imagem" accept="image/jpeg,image/png">
    <input type="submit" name="submit" value="Enviar">
</form>

</body>
</html>