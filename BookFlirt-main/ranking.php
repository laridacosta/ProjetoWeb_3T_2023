<?php
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    if (!isset($_SESSION["username"])) {
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
   <!-- <script src="JS/ordenar.js"></script> -->
</head>
<body>
<header>
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

    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        h1{
            background-color: rgb(36, 201, 193);
            color: white;
            font-size: 15px;
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5%;
            text-decoration: none;
        }
            </style>
    <h1>
        <tr>
            <th onclick="sortTable(1)">votos</th>
        </tr>
    </h1>
<?php

//Carrega os intens

$conn = mysqli_connect("localhost", "root", "", "bookflirt");
$sql = "SELECT `id_votos`, `id_livros`, `votos` FROM `votacoes` WHERE 1";
$result = mysqli_query($conn, $sql);

?>

    <script>
        function sortTable(columnIndex) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("id_votos");
            switching = true;
            dir = "asc"; // Estabelece a direção como ascendente
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("votcoes")[columnIndex];
                    y = rows[i + 1].getElementsByTagName("votacoes")[columnIndex];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }
    </script>

<?php
//Carrega os intens
$conn = mysqli_connect("localhost", "root", "", "bookflirt");
$sql = "SELECT `id_livros`, `titulo`, `descricao` FROM `livros` WHERE 1";
$result = mysqli_query($conn, $sql);

// Percorremos o resultado da consulta e adicionamos os itens à tabela
?>
<table class='centered' id="ranking" name="ranking">;
<thead>
<tr>
    <th data-field="Image">Capa</th>
    <th data-field="titulo">Titulo</th>
    <th data-field="descricao">Sinopse</th>
</tr>
</thead>
<?php
foreach ($result as $item) {
  // Adicionamos um item à tabela
  echo '<tr>';
  echo '<td><img src="uploads/'.$item['titulo'].'" width="50" height="50" alt="Imagem" /></td>';
  echo '<td>' . $item['titulo'] . '</td>';
  echo '<td>' . $item['descricao'] . '</td>';
}
echo "</table>";
?>
<script src="JS/ordenar.js"></script>
</header>
</body>
</html>l