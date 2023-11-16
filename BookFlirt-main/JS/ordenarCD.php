<html>
<head>
</head>
<body>
        <tr>
            <th onclick="sortTable(0)">id_livros</th>
            <th onclick="sortTable(1)">votos</th>
        </tr>
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
</body>
</html>