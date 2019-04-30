-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2019 a las 08:55:05
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futuro`
--
CREATE DATABASE IF NOT EXISTS `futuro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `futuro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

CREATE TABLE `asistentes` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanna`
--

CREATE TABLE `campanna` (
  `cod_campanna` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `ambito` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `cod_candidato` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `fecha_nac` varchar(20) NOT NULL,
  `lugar_nac` varchar(20) NOT NULL,
  `municipio` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `autonomia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidaturas`
--

CREATE TABLE `candidaturas` (
  `cod_candidato` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `cabeza_lista` int(1) NOT NULL DEFAULT '0',
  `posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `cod_evento` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `dia` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `municipio` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `cod_noticia` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `cuerpo` text NOT NULL,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `cod_punto` int(11) NOT NULL,
  `descripcion` text,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntariados`
--

CREATE TABLE `voluntariados` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntarios`
--

CREATE TABLE `voluntarios` (
  `cod_voluntario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `fecha_nac` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL,
  `autoriza_com` int(1) NOT NULL DEFAULT '0',
  `autoriza_gdpd` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD PRIMARY KEY (`cod_voluntario`,`cod_evento`),
  ADD KEY `FK_asistentes_eventos` (`cod_evento`);

--
-- Indices de la tabla `campanna`
--
ALTER TABLE `campanna`
  ADD PRIMARY KEY (`cod_campanna`);

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`cod_candidato`);

--
-- Indices de la tabla `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD PRIMARY KEY (`cod_candidato`,`cod_campanna`),
  ADD KEY `FK_candidaturas_campanna` (`cod_campanna`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`cod_evento`),
  ADD KEY `FK_eventos_campanna` (`cod_campanna`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`cod_noticia`),
  ADD KEY `FK_noticias_campanna` (`cod_campanna`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`cod_punto`),
  ADD KEY `FK_programa_campanna` (`cod_campanna`);

--
-- Indices de la tabla `voluntariados`
--
ALTER TABLE `voluntariados`
  ADD PRIMARY KEY (`cod_voluntario`,`cod_campanna`),
  ADD KEY `FK_voluntariados_campanna` (`cod_campanna`);

--
-- Indices de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`cod_voluntario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campanna`
--
ALTER TABLE `campanna`
  MODIFY `cod_campanna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `cod_candidato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `cod_evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `cod_noticia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `cod_punto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `cod_voluntario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD CONSTRAINT `FK_asistentes_eventos` FOREIGN KEY (`cod_evento`) REFERENCES `eventos` (`cod_evento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_asistentes_voluntarios` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD CONSTRAINT `FK_candidaturas_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_candidaturas_candidatos` FOREIGN KEY (`cod_candidato`) REFERENCES `candidatos` (`cod_candidato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `FK_eventos_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `FK_noticias_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `FK_programa_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `voluntariados`
--
ALTER TABLE `voluntariados`
  ADD CONSTRAINT `FK_voluntariados_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_voluntariados_voluntarios` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
