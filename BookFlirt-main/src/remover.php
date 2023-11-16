<?php
$conn = mysqli_connect("localhost", "root", "", "bookflirt");
// Remover o item
if (isset($_GET['id'])) {
  // Obtemos o ID do item
  $id = $_GET['id'];

  $sql="DELETE FROM `livros` WHERE livros.id_livros = '".$id."'";
  mysqli_query($conn, $sql);
  header("Location: ../ranking.php");
}