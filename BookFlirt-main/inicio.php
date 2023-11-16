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
    <?php
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    if (!isset($_SESSION["username"])) {
        header("Location: index.html");
    }
?>
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
    <th data-field="price">Opcoes</th>
</tr>
</thead>
<?php
foreach ($result as $item) {
  // Adicionamos um item à tabela
  echo '<tr>';
  echo '<td><img src="uploads/'.$item['titulo'].'" width="50" height="50" alt="Imagem" /></td>';
  echo '<td>' . $item['titulo'] . '</td>';
  echo '<td>' . $item['descricao'] . '</td>';
  // Adicionamos uma coluna com opções de edição e remoção
  echo '<td>';
  echo '<a href="src/editar.php?id=' . $item['id_livros'] . '">Editar</a> | ';
  echo '<a href="src/remover.php?id=' . $item['id_livros'] . '">Remover</a>';
  echo '</td>';
  echo '</tr>';
}
echo "</table>";
?>
<script src="JS/ordenar.js"></script>
</header>
</body>
</html>
    
</header>
</body>
</html>