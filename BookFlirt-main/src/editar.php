<?php
$conn = mysqli_connect("localhost", "root", "", "bookflirt");

// Editar o item
if (isset($_GET['id'])) {
    // Obtemos o ID do item
    $id = $_GET['id'];
    $sql="SELECT * FROM `livros` WHERE livros.id_livros = '".$id."'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    echo '<form action=cadastra_item.php method="post" enctype="multipart/form-data">';
    echo  '  <input type="hidden" name="id_livro" id="id_livro" value="'.$id.'">';
    echo  '  <input type="text" name="titulo" id="titulo" placeholder="Titulo" value="'.$row["titulo"].'">';
    echo  '  <input type="text" name="sinopse" id="sinopse" placeholder="Sinopse" value="'.$row["descricao"].'">';
    echo  '  <input type="file" name="imagem" accept="image/jpeg,image/png" >';
    echo '   <input type="submit" name="editar" value="editar">';
    echo '</form>';
}
