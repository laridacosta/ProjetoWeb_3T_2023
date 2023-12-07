-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/12/2023 às 14:12
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
(44, 'Nosso lugar entre cometas', 'Existem cometas e estrelas, os cometas passam... e as estrelas: Ficam'),
(45, 'Como eu era antes de você', 'Um livro magistral'),
(49, 'A sutil arte de ligar o foda-se', 'Uma tragédia inusitada para uma vida melhor'),
(52, 'O vale das bonecas', 'O maior best-seller de todos os tempos'),
(53, 'O leão, a feiticeira e o quarda-roupa', 'Tenha coragem, querido coração'),
(55, 'Bridgerton', 'Julia Quinn é nossa Jane Austen contemporánea'),
(57, 'O mágico de oz', 'Agora eu sei que tenho um coração, porque ele está doendo'),
(58, 'Alice no país das maravilhas', 'Eu não sou louco, minha realidade é apenas diferente da sua'),
(59, 'Diário de um banana', 'Um romance em quadrinhos'),
(61, 'A árvore generosa', 'Era uma vez uma árvore...'),
(62, 'O mundo de Sofia', 'Quando a gente acha que sabe todas as respostas, a vida muda todas as perguntas'),
(65, 'Dom Casmurro', 'A loucura é uma ilha perdida no oceano da razão'),
(66, 'Anne de green gables', 'Eu serei a heroína da minha própria história'),
(68, 'Vivian contra o apocalipse', 'Então Deus desistiu da América');

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
(1, 'User'),
(7, 'Admin');

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
(1, 'Admin', 'admin@gmail.com', 'senha123', 0),
(11, 'Sofia', 'sofia@aluno.feliz.ifrs.edu.br', 'sofi123', 1),
(17, 'Maria', 'maria@@aluno.feliz.ifrs.edu.br', '12345', 1),
(18, 'José', 'Jose@aluno.feliz.ifrs.edu.br', 'jose123', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `votacao`
--

CREATE TABLE `votacao` (
  `id_livro` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `voto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `votacao`
--

INSERT INTO `votacao` (`id_livro`, `id_user`, `voto`) VALUES
(30, 3, 4),
(43, 1, 5),
(15, 1, 3),
(30, 1, 3),
(15, 3, 3),
(20, 3, 2),
(18, 1, 5),
(38, 1, 3),
(19, 1, 1),
(43, 9, 4),
(22, 9, 3),
(38, 9, 5),
(37, 3, 5),
(22, 3, 2),
(18, 3, 3),
(40, 3, 4),
(28, 3, 1),
(29, 3, 5),
(44, 3, 4),
(38, 3, 5),
(43, 3, 4),
(32, 3, 3),
(19, 3, 4),
(42, 3, 1),
(0, 9, 5),
(0, 9, 4),
(0, 9, 2),
(0, 9, 3),
(0, 9, 5),
(0, 9, 4),
(0, 9, 1),
(0, 9, 3),
(0, 9, 4),
(0, 9, 2),
(0, 9, 4),
(0, 9, 1),
(0, 9, 3),
(30, 9, 2),
(37, 9, 3),
(0, 3, 5),
(0, 3, 5),
(0, 3, 5),
(0, 9, 5),
(0, 9, 3),
(0, 9, 5),
(15, 9, 4),
(42, 9, 2),
(44, 9, 3),
(19, 9, 4),
(20, 9, 1),
(32, 9, 3),
(40, 9, 4),
(28, 9, 1),
(29, 9, 4),
(18, 9, 2),
(18, 10, 3),
(42, 10, 2),
(30, 10, 5),
(22, 10, 4),
(20, 10, 1),
(28, 10, 3),
(38, 10, 4),
(32, 10, 4),
(37, 10, 4),
(15, 10, 1),
(40, 10, 3),
(19, 10, 4),
(44, 10, 4),
(29, 10, 1),
(43, 10, 2),
(0, 11, 4),
(0, 11, 2),
(0, 11, 3),
(0, 11, 1),
(0, 11, 4),
(0, 11, 5),
(0, 11, 2),
(0, 11, 3);

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
-- Índices de tabela `votacao`
--
ALTER TABLE `votacao`
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de tabela `tipo_user`
--
ALTER TABLE `tipo_user`
  MODIFY `id_tipo_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
