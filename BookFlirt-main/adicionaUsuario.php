<?php

$conexao = new mysqli("localhost","root","","bookflirt");

$sql = "INSERT INTO usuario(nome,email,senha,tipo) 
VALUES ('{$_POST['nome']}','{$_POST['email']}','{$_POST['senha']}', {$_POST['tipo']})";

$conexao->query($sql);

header("location: inicio.php");

?>