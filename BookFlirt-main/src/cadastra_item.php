<?php
$conn = mysqli_connect("localhost", "root", "", "bookflirt");

// Verifica se o formulário foi enviado
if (isset($_POST['submit'])) {

    // Verifica se o campo de arquivo está vazio
    if (empty($_FILES['imagem']['name'])) {
        // A imagem está vazia
        echo "Você deve enviar uma imagem.";
        echo '<a href="../c_item.php">Voltar</a>';
        die;
    }
    // Obtém o tipo do arquivo
    $tipo_arquivo = exif_imagetype($_FILES['imagem']['tmp_name']);
    // Verifica se o arquivo é um JPEG ou um PNG
    if ($tipo_arquivo != IMAGETYPE_JPEG && $tipo_arquivo != IMAGETYPE_PNG) {
        // O arquivo não é um JPEG ou um PNG
        echo "O arquivo enviado não é um JPEG ou um PNG.";
        echo '<a href="../c_item.php">Voltar</a>';
        die;
    } else {
        $sql = "SELECT titulo FROM livros WHERE livros.titulo = '".$_POST["titulo"]."' ";
        $result = mysqli_query($conn, $sql);
        if(mysqli_num_rows($result) == 0){
            move_uploaded_file($_FILES['imagem']['tmp_name'], '../uploads/' . $_POST["titulo"]);
            $sql= "INSERT INTO `livros`(`id_livros`, `titulo`, `descricao`) VALUES (null,'".$_POST["titulo"]."','".$_POST["sinopse"]."')";
            mysqli_query($conn, $sql);
            echo "Livro cadastrado";
            echo '<a href="../c_item.php"> Voltar</a>';
        }else{
            echo "Livro ja existe";
            echo '<a href="../c_item.php"> Voltar</a>';
        }
    }
}


if (isset($_POST["editar"])){
    // Verifica se o campo de arquivo está vazio
    if (empty($_FILES['imagem']['name'])) {
        // A imagem está vazia
        echo "Você deve enviar uma imagem.";
        echo '<a href="editar.php?id=' . $item['id_livros'] . '">Voltar a edicao</a> | ';
        die;
    }
    // Obtém o tipo do arquivo
    $tipo_arquivo = exif_imagetype($_FILES['imagem']['tmp_name']);
    // Verifica se o arquivo é um JPEG ou um PNG
    if ($tipo_arquivo != IMAGETYPE_JPEG && $tipo_arquivo != IMAGETYPE_PNG) {
        // O arquivo não é um JPEG ou um PNG
        echo "O arquivo enviado não é um JPEG ou um PNG.";
        echo '<a href="editar.php?id=' . $item['id_livros'] . '">Voltar a edicao</a> | ';
        die;
    } else {
        $sql = "SELECT * FROM livros WHERE id_livros = '".$_POST["id_livro"]."' ";
        $result = mysqli_query($conn, $sql);
        if(mysqli_num_rows($result) == 1){
            $row = mysqli_fetch_assoc($result);
            move_uploaded_file($_FILES['imagem']['tmp_name'], '../uploads/' . $_POST["titulo"]);
            $sql= "UPDATE `livros` SET `titulo`='".$_POST["titulo"]."',`descricao`='".$_POST["sinopse"]."' WHERE livros.id_livros= '".$row["id_livros"]."'";
            mysqli_query($conn, $sql);
            echo "Livro atualizado";
            echo '<a href="../ranking.php">Voltar</a>';
        }
    }
}
?>