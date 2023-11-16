-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/11/2023 às 09:41
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bookflirt`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livros` int(11) NOT NULL,
  `titulo` varchar(256) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livros`, `titulo`, `descricao`) VALUES
(12, 'É assim que acaba', 'Você vai sorrir em meio às lagrimas'),
(15, 'Os dois morrem no final', 'Olá, aqui quem fala é a central da morte'),
(18, 'Todo esse tempo', 'Como mágica. Você me leva completamente pra outro lugar.'),
(19, 'Acotar', 'Romance entre humanos e seres místicos '),
(20, 'Uma farsa de amor na espanha', 'Fingir estar apaixonado nunca foi tão gostoso'),
(22, 'Lady Killers', 'Entre na mente das psicopatas.'),
(28, '+ esperto que o diabo', 'O mistério revelado da liberdade e do sucesso'),
(29, 'Perdida', 'Um amor que ultrapassa as barreiras do empo'),
(30, 'Harry Potter', 'Todos temos luz e trevas dentro de nós, o que importa é o lado do qual decidimos agir'),
(32, 'O diário de Anne Frank', 'Eu não penso sobre toda miséria, mas sobre a beleza que ainda permanece'),
(37, 'Mentirosos', 'Nenhum mentiroso tem uma memória suficientemente boa para ser um mentiroso de êxito'),
(38, 'Os sete maridos de Evilyn Hugo', 'Não há nada mais poderoso do que uma mulher decidida a mudar o mundo'),
(40, 'Vermelho, branco e sangue azul', 'Às vezes você simplesmente pula e torce para que não seja um penhasco'),
(42, 'Dayse Jones and the Six', 'Acho que a gente precisa mostrar que tem fé nas pessoas mesmo quando elas não merecem. Caso contrário não seria fé, certo?'),
(43, 'Novembro 9', 'Você nunca será capaz de se encontrar se estiver perdido em outra pessoa'),
(44, 'Nosso lugar entre cometas', 'Existem cometas e estrelas, os cometas passam... e as estrelas: Ficam');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_user`
--

CREATE TABLE `tipo_user` (
  `id_tipo_user` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_user`
--

INSERT INTO `tipo_user` (`id_tipo_user`, `Name`) VALUES
(0, 'Admin'),
(1, 'User');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$MNg8Hu65auH.gFUfcrgMJOvSg6i6LQAFhoeHV8bJ3SEgGlkQ/5eE.', 0),
(3, 'Maria', 'maria@gmail.com', '12345', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `votacoes`
--

CREATE TABLE `votacoes` (
  `id_votos` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL,
  `votos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `votos_usu`
--

CREATE TABLE `votos_usu` (
  `id_votosUsu` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livros`);

--
-- Índices de tabela `tipo_user`
--
ALTER TABLE `tipo_user`
  ADD PRIMARY KEY (`id_tipo_user`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tipo` (`tipo`);

--
-- Índices de tabela `votacoes`
--
ALTER TABLE `votacoes`
  ADD PRIMARY KEY (`id_votos`),
  ADD KEY `id_livros` (`id_livros`);

--
-- Índices de tabela `votos_usu`
--
ALTER TABLE `votos_usu`
  ADD PRIMARY KEY (`id_votosUsu`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `tipo_user`
--
ALTER TABLE `tipo_user`
  MODIFY `id_tipo_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `votacoes`
--
ALTER TABLE `votacoes`
  MODIFY `id_votos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `votos_usu`
--
ALTER TABLE `votos_usu`
  MODIFY `id_votosUsu` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo_user` (`id_tipo_user`);

--
-- Restrições para tabelas `votacoes`
--
ALTER TABLE `votacoes`
  ADD CONSTRAINT `votacoes_ibfk_1` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id_livros`);

--
-- Restrições para tabelas `votos_usu`
--
ALTER TABLE `votos_usu`
  ADD CONSTRAINT `votos_usu_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `votos_usu_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livros`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
