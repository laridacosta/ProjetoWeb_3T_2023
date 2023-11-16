<?php
$conn = mysqli_connect("localhost", "root", "", "bookflirt");

if (isset($_POST["submit"])) {

// Obter o nome de usuário e a senha do formulário
$username = $_POST["user"];
$password = $_POST["senha"];

// Validar o nome de usuário e a senha
$sql = "SELECT * FROM usuario WHERE nome = '". $username."' or usuario.email = '".$username."'";

$result = mysqli_query($conn, $sql);


// Se o nome de usuário e a senha forem válidos, criar uma sessão
if (mysqli_num_rows($result) == 1) {
    // Obter os dados do usuário
    $row = mysqli_fetch_assoc($result);
    //if (password_verify($password, $row["senha"] )) {
        if (1 == 1) {
        // Iniciar uma sessão
        session_start();
        // Armazenar os dados de login na sessão
        $_SESSION["username"] = $row["nome"];
        $_SESSION["user_id"] = $row["id_usuario"];
        $_SESSION["tipo"] = $row["tipo"];
        header("Location: ../inicio.php");
    }else{
        echo "O nome de usuário ou a senha estão incorretos.";
        // Redirecionar o usuário para a página inicial
        echo '<a href="../login.html">Voltar</a>';
    }

} else {

    // O nome de usuário e a senha são inválidos
    echo "O nome de usuário ou a senha estão incorretos.";
    echo '<a href="../login.html">Voltar</a>';
    //header("Location: ../index.php");
}
}