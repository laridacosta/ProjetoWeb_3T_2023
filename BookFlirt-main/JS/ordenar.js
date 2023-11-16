// Biblioteca de ordenação
// https://github.com/tablesorter/tablesorter
$(document).ready(function() {
    // Adicione a biblioteca de ordenação à tabela
    $("ranking").tablesorter();
    // Definição da função de ordenação
    function sortTable(column) {
      // Ordene os dados da tabela
      $("ranking").tablesorter({
        sortList: [[column, 1]]
      });

      // Atualize a tabela com os dados ordenados
      $("ranking").trigger("update");
    }

    // Adicione um evento de clique a cada cabeçalho de coluna
    $("titulo").click(function() {
      // Obtenha o índice da coluna
      var columnIndex = $(this).index();
      // Ordene a tabela
      sortTable(columnIndex);
    });
  });