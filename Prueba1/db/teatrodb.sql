-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2012 a las 03:04:11
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `teatrodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
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
-- Volcar la base de datos para la tabla `comentarios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `horarios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
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
  `afiche` longblob NOT NULL,
  `reseña` varchar(150) NOT NULL,
  PRIMARY KEY (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `obras`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_has_horarios`
--

CREATE TABLE IF NOT EXISTS `obras_has_horarios` (
  `idObra` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  PRIMARY KEY (`idObra`,`idHorario`),
  KEY `fk_Obras_has_Horarios_Horarios1` (`idHorario`),
  KEY `fk_Obras_has_Horarios_Obras1` (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `obras_has_horarios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_has_votaciones`
--

CREATE TABLE IF NOT EXISTS `obras_has_votaciones` (
  `idObra` int(11) NOT NULL,
  `idVotacion` int(11) NOT NULL,
  PRIMARY KEY (`idObra`,`idVotacion`),
  KEY `fk_Obras_has_Votaciones_Votaciones1` (`idVotacion`),
  KEY `fk_Obras_has_Votaciones_Obras1` (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `obras_has_votaciones`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `apellido`, `correo`, `password`) VALUES
(1, 'Diego', 'Abanto', 'dabanto21@gmail.com', '123456'),
(2, 'Rodolfo', 'Gamarra', 'rodgam@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
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
-- Volcar la base de datos para la tabla `votos`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_Comentarios_Obras` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comentarios_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `obras_has_horarios`
--
ALTER TABLE `obras_has_horarios`
  ADD CONSTRAINT `fk_Obras_has_Horarios_Horarios1` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Obras_has_Horarios_Obras1` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `obras_has_votaciones`
--
ALTER TABLE `obras_has_votaciones`
  ADD CONSTRAINT `fk_Obras_has_Votaciones_Obras1` FOREIGN KEY (`idObra`) REFERENCES `obras` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Obras_has_Votaciones_Votaciones1` FOREIGN KEY (`idVotacion`) REFERENCES `votos` (`idVoto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `fk_Votos_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
