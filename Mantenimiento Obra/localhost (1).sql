-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 28, 2012 at 05:08 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `teatrodb`
--
CREATE DATABASE `teatrodb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `teatrodb`;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `publicado` binary(1) NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `idObra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`,`idObra`,`idUsuario`),
  KEY `fk_Comentarios_Obras` (`idObra`),
  KEY `fk_Comentarios_Usuarios1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comentarios`
--


-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `horarios`
--


-- --------------------------------------------------------

--
-- Table structure for table `obras`
--

CREATE TABLE IF NOT EXISTS `obras` (
  `idObra` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `director` varchar(30) NOT NULL,
  `actores` varchar(60) NOT NULL,
  `sala` int(11) NOT NULL,
  `precio` float NOT NULL,
  `temporada` year(4) NOT NULL,
  `afiche` varchar(150) NOT NULL,
  `resena` varchar(150) NOT NULL,
  PRIMARY KEY (`idObra`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `obras`
--

INSERT INTO `obras` (`idObra`, `nombre`, `autor`, `director`, `actores`, `sala`, `precio`, `temporada`, `afiche`, `resena`) VALUES
(39, 'Esto es Magia!', 'Mago Jorge', 'Director', 'MAGOS!', 5, 32, 2011, 'Esto_es_Magia!.jpg', 'ssssssssssss'),
(40, 'Nueva Obra', 'Autor', 'Director', 'Varios', 5, 12, 2012, 'Nueva_Obra.jpg', 'Aqui va la reseÃ±a'),
(41, 'Otra Obra', 'Autor', 'Direc', '0', 0, 0, 2000, 'Otra_Obra.png', '0'),
(42, 'ra ra', '', '', '', 0, 0, 0000, 'ra_ra.jpg', ''),
(43, 'je je', '', '', '', 0, 0, 0000, 'je_je.jpg', ''),
(44, 'jo ju', '', '', '', 0, 0, 0000, 'jo_ju.jpg', ''),
(45, 'The Crucible', 'El Autor', 'El Director', 'Actor 1, 2 , 3 y 4', 10, 60, 2013, 'The_Crucible.jpg', 'Esta es la reseÃ±a de la obra');

-- --------------------------------------------------------

--
-- Table structure for table `obras_has_horarios`
--

CREATE TABLE IF NOT EXISTS `obras_has_horarios` (
  `idObra` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  PRIMARY KEY (`idObra`,`idHorario`),
  KEY `fk_Obras_has_Horarios_Horarios1` (`idHorario`),
  KEY `fk_Obras_has_Horarios_Obras1` (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obras_has_horarios`
--


-- --------------------------------------------------------

--
-- Table structure for table `obras_has_votaciones`
--

CREATE TABLE IF NOT EXISTS `obras_has_votaciones` (
  `idObra` int(11) NOT NULL,
  `idVotacion` int(11) NOT NULL,
  PRIMARY KEY (`idObra`,`idVotacion`),
  KEY `fk_Obras_has_Votaciones_Votaciones1` (`idVotacion`),
  KEY `fk_Obras_has_Votaciones_Obras1` (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obras_has_votaciones`
--


-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `usuarios`
--


-- --------------------------------------------------------

--
-- Table structure for table `votos`
--

CREATE TABLE IF NOT EXISTS `votos` (
  `idVoto` int(11) NOT NULL AUTO_INCREMENT,
  `voto` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idVoto`,`idUsuario`),
  KEY `fk_Votos_Usuarios1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `votos`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_Comentarios_Obras` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comentarios_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `obras_has_horarios`
--
ALTER TABLE `obras_has_horarios`
  ADD CONSTRAINT `fk_Obras_has_Horarios_Horarios1` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Obras_has_Horarios_Obras1` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `obras_has_votaciones`
--
ALTER TABLE `obras_has_votaciones`
  ADD CONSTRAINT `fk_Obras_has_Votaciones_Obras1` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Obras_has_Votaciones_Votaciones1` FOREIGN KEY (`idVotacion`) REFERENCES `votos` (`idVoto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `fk_Votos_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
