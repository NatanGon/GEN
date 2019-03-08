-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Mar-2019 às 18:58
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gen`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `cod_aluno` int(5) NOT NULL,
  `nome_aluno` varchar(50) NOT NULL,
  `sobrenome_aluno` varchar(50) NOT NULL,
  `cod_contato` int(5) NOT NULL,
  `cod_turma` int(5) NOT NULL,
  `cod_end` int(5) NOT NULL,
  `cod_nota` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_clie` int(5) NOT NULL,
  `nome_clie` varchar(50) NOT NULL,
  `sobrenome_clie` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `cod_end` int(5) NOT NULL,
  `cod_contato` int(5) NOT NULL,
  `cod_empresa` int(5) NOT NULL,
  `cod_turma` int(5) NOT NULL,
  `cod_func` int(11) NOT NULL,
  `cod_servico` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `cod_contato` int(5) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`cod_contato`, `tel`, `email`) VALUES
(1, '22992271071', 'GEN@gmail.com'),
(2, '21992901071', 'nnatanngo@gmail.com'),
(3, '21992801070', 'felix.gabriel@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `cod_empresa` int(5) NOT NULL,
  `nome_empresa` varchar(40) NOT NULL,
  `cod_end` int(5) NOT NULL,
  `cod_contato` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`cod_empresa`, `nome_empresa`, `cod_end`, `cod_contato`) VALUES
(1, 'GEN', 1, 1),
(3, 'GEN', 2, 2),
(4, 'GEN', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cod_end` int(5) NOT NULL,
  `tipo_logradouro` varchar(40) NOT NULL,
  `logradouro` varchar(40) NOT NULL,
  `numero` int(5) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cep` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`cod_end`, `tipo_logradouro`, `logradouro`, `numero`, `bairro`, `estado`, `cep`) VALUES
(1, 'Rua', 'Estrela da Morte', 777, 'R13', 'Rio de Janeiro - RJ', 12345678),
(2, 'Rua', 'Valentin', 32, 'Neutro', 'Rio de Janeiro - RJ', 12345467),
(3, 'Rua', 'Vale', 55, 'Neura', 'Rio de Janeiro - RJ', 12335467);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_func` int(5) NOT NULL,
  `nome_func` varchar(40) NOT NULL,
  `sobrenome_func` varchar(40) NOT NULL,
  `cod_end` int(5) NOT NULL,
  `cod_contato` int(5) NOT NULL,
  `cod_empresa` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cod_func`, `nome_func`, `sobrenome_func`, `cod_end`, `cod_contato`, `cod_empresa`) VALUES
(1, 'Enos', 'Fernandes', 1, 1, 1),
(2, 'Natan', 'Gonçalves', 2, 2, 3),
(5, 'Gabriel', 'Felix', 3, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota`
--

CREATE TABLE `nota` (
  `cod_nota` int(5) NOT NULL,
  `materia` varchar(40) NOT NULL,
  `status` varchar(40) NOT NULL,
  `nota` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `cod_servico` int(5) NOT NULL,
  `cod_func` int(5) NOT NULL,
  `data_servico` varchar(8) NOT NULL,
  `hr_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` int(5) NOT NULL,
  `nome_turma` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cod_aluno`),
  ADD UNIQUE KEY `cod_aluno` (`cod_aluno`),
  ADD UNIQUE KEY `cod_turma` (`cod_turma`),
  ADD UNIQUE KEY `cod_end` (`cod_end`),
  ADD UNIQUE KEY `cod_nota` (`cod_nota`),
  ADD KEY `cod_contato` (`cod_contato`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_clie`),
  ADD UNIQUE KEY `cod_clie` (`cod_clie`),
  ADD UNIQUE KEY `cod_contato` (`cod_contato`),
  ADD UNIQUE KEY `cod_empresa` (`cod_empresa`),
  ADD KEY `cod_end` (`cod_end`),
  ADD KEY `cod_turma` (`cod_turma`,`cod_func`),
  ADD KEY `cod_func` (`cod_func`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`cod_contato`),
  ADD UNIQUE KEY `cod_contato` (`cod_contato`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`cod_empresa`),
  ADD UNIQUE KEY `cod_empresa` (`cod_empresa`),
  ADD UNIQUE KEY `cod_end` (`cod_end`),
  ADD UNIQUE KEY `cod_contatos` (`cod_contato`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`cod_end`),
  ADD UNIQUE KEY `cod_end` (`cod_end`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_func`),
  ADD UNIQUE KEY `cod_func` (`cod_func`),
  ADD UNIQUE KEY `cod_end` (`cod_end`),
  ADD UNIQUE KEY `cod_contato` (`cod_contato`),
  ADD UNIQUE KEY `cod_empresa` (`cod_empresa`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`cod_nota`),
  ADD UNIQUE KEY `cod_nota` (`cod_nota`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`cod_servico`),
  ADD UNIQUE KEY `cod_servico` (`cod_servico`),
  ADD UNIQUE KEY `cod_func` (`cod_func`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`),
  ADD UNIQUE KEY `cod_turma` (`cod_turma`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `cod_aluno` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_clie` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `cod_contato` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `cod_empresa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `cod_end` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_func` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `cod_nota` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `cod_servico` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `cod_turma` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`),
  ADD CONSTRAINT `aluno_ibfk_3` FOREIGN KEY (`cod_end`) REFERENCES `endereco` (`cod_end`),
  ADD CONSTRAINT `aluno_ibfk_4` FOREIGN KEY (`cod_nota`) REFERENCES `nota` (`cod_nota`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_end`) REFERENCES `endereco` (`cod_end`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`),
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`cod_empresa`) REFERENCES `empresa` (`cod_empresa`),
  ADD CONSTRAINT `cliente_ibfk_4` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`),
  ADD CONSTRAINT `cliente_ibfk_5` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`);

--
-- Limitadores para a tabela `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`cod_end`) REFERENCES `endereco` (`cod_end`),
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cod_end`) REFERENCES `endereco` (`cod_end`),
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`),
  ADD CONSTRAINT `funcionario_ibfk_3` FOREIGN KEY (`cod_empresa`) REFERENCES `empresa` (`cod_empresa`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
