-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Fev-2019 às 14:55
-- Versão do servidor: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `nome_aluno` varchar(30) NOT NULL,
  `sobrenome_aluno` varchar(30) NOT NULL,
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
  `nome_clie` varchar(30) NOT NULL,
  `sobrenome_clie` varchar(30) NOT NULL,
  `cod_end` int(4) NOT NULL,
  `cod_contato` int(5) NOT NULL,
  `cod_empresa` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `cod_contato` int(5) NOT NULL,
  `tel` int(14) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cod_end` int(5) NOT NULL,
  `tipo_logradouro` varchar(40) NOT NULL,
  `logradouro` varchar(40) NOT NULL,
  `bairro` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cod_empresa` int(5) NOT NULL,
  `cod_turma` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota`
--

CREATE TABLE `nota` (
  `cod_nota` int(5) NOT NULL,
  `material` varchar(40) NOT NULL,
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
  `data_servico` varchar(8) NOT NULL
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
  ADD UNIQUE KEY `cod_contato` (`cod_contato`),
  ADD UNIQUE KEY `cod_turma` (`cod_turma`),
  ADD UNIQUE KEY `cod_end` (`cod_end`),
  ADD UNIQUE KEY `cod_nota` (`cod_nota`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_clie`),
  ADD UNIQUE KEY `cod_clie` (`cod_clie`),
  ADD UNIQUE KEY `cod_contato` (`cod_contato`),
  ADD UNIQUE KEY `cod_empresa` (`cod_empresa`),
  ADD KEY `cod_end` (`cod_end`);

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
  ADD UNIQUE KEY `cod_empresa` (`cod_empresa`),
  ADD UNIQUE KEY `cod_turma` (`cod_turma`);

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
  MODIFY `cod_contato` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `cod_empresa` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `cod_end` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_func` int(5) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`cod_empresa`) REFERENCES `empresa` (`cod_empresa`);

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
  ADD CONSTRAINT `funcionario_ibfk_3` FOREIGN KEY (`cod_empresa`) REFERENCES `empresa` (`cod_empresa`),
  ADD CONSTRAINT `funcionario_ibfk_4` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
