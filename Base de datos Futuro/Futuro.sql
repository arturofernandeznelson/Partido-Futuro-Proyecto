-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.35-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para futuro
CREATE DATABASE IF NOT EXISTS `futuro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `futuro`;

-- Volcando estructura para tabla futuro.asistentes
CREATE TABLE IF NOT EXISTS `asistentes` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_evento` int(11) NOT NULL,
  PRIMARY KEY (`cod_voluntario`,`cod_evento`),
  KEY `FK_asistentes_eventos` (`cod_evento`),
  CONSTRAINT `FK_asistentes_eventos` FOREIGN KEY (`cod_evento`) REFERENCES `eventos` (`cod_evento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asistentes_voluntarios` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.campanna
CREATE TABLE IF NOT EXISTS `campanna` (
  `cod_campanna` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) DEFAULT NULL,
  `ambito` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_campanna`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.candidatos
CREATE TABLE IF NOT EXISTS `candidatos` (
  `cod_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `fecha_nac` varchar(20) NOT NULL,
  `lugar_nac` varchar(20) NOT NULL,
  `municipio` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `autonomia` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.candidaturas
CREATE TABLE IF NOT EXISTS `candidaturas` (
  `cod_candidato` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `cabeza_lista` int(1) NOT NULL DEFAULT '0',
  `posicion` int(11) NOT NULL,
  PRIMARY KEY (`cod_candidato`,`cod_campanna`),
  KEY `FK_candidaturas_campanna` (`cod_campanna`),
  CONSTRAINT `FK_candidaturas_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_candidaturas_candidatos` FOREIGN KEY (`cod_candidato`) REFERENCES `candidatos` (`cod_candidato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `cod_evento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `dia` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `municipio` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_evento`),
  KEY `FK_eventos_campanna` (`cod_campanna`),
  CONSTRAINT `FK_eventos_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.noticias
CREATE TABLE IF NOT EXISTS `noticias` (
  `cod_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) NOT NULL,
  `cuerpo` text NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  PRIMARY KEY (`cod_noticia`),
  KEY `FK_noticias_campanna` (`cod_campanna`),
  CONSTRAINT `FK_noticias_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `cod_punto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `cod_campanna` int(11) NOT NULL,
  PRIMARY KEY (`cod_punto`),
  KEY `FK_programa_campanna` (`cod_campanna`),
  CONSTRAINT `FK_programa_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.voluntariados
CREATE TABLE IF NOT EXISTS `voluntariados` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  PRIMARY KEY (`cod_voluntario`,`cod_campanna`),
  KEY `FK_voluntariados_campanna` (`cod_campanna`),
  CONSTRAINT `FK_voluntariados_campanna` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_voluntariados_voluntarios` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla futuro.voluntarios
CREATE TABLE IF NOT EXISTS `voluntarios` (
  `cod_voluntario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `fecha_nac` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL,
  `autoriza_com` int(1) NOT NULL DEFAULT '0',
  `autoriza_gdpd` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
