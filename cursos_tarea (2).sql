-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2015 a las 02:50:20
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cursos_tarea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
`id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(45) NOT NULL,
  `codigo_curso` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre_curso`, `codigo_curso`) VALUES
(1, 'Programacion', '12532'),
(2, 'HCI', '12535'),
(3, 'Diseño de Sonido', '52362'),
(4, 'Parametrico', '54235'),
(5, 'Color', '50236');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
`id_estudiante` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre`, `apellido`, `correo`) VALUES
(1, 'Lolita', 'Perez', 'lolim@hotmail.com'),
(2, 'Cristian', 'Baron', 'hdkk@hotmail.com'),
(3, 'Pepito', 'Perez', 'aksleok@hotmil.com'),
(4, 'Luisa', 'Mendez', 'lulu@gmail.com'),
(5, 'Carolina', 'Rodriguez', 'ahdoe@gmail.com'),
(6, ' Lina', 'Mayorca', 'juskdk@gmnail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_curso`
--

CREATE TABLE IF NOT EXISTS `estudiante_curso` (
`id_estudiante_curso` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante_curso`
--

INSERT INTO `estudiante_curso` (`id_estudiante_curso`, `id_estudiante`, `id_curso`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 1, 4),
(5, 1, 2),
(6, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_notas`
--

CREATE TABLE IF NOT EXISTS `estudiante_notas` (
`id_estudiante_notas` int(11) NOT NULL,
  `id_notas` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `float` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante_notas`
--

INSERT INTO `estudiante_notas` (`id_estudiante_notas`, `id_notas`, `id_estudiante`, `id_curso`, `float`) VALUES
(1, 2, 1, 1, 5),
(2, 3, 1, 2, 3),
(3, 3, 2, 4, 2.5),
(4, 4, 1, 3, 4),
(5, 2, 3, 5, 5),
(6, 2, 1, 4, 2),
(7, 3, 1, 3, 4.1),
(8, 6, 1, 3, 3),
(9, 3, 1, 5, 3.5),
(10, 4, 1, 5, 5),
(11, 2, 2, 1, 5),
(12, 3, 2, 2, 4),
(13, 6, 2, 2, 2.5),
(14, 6, 3, 2, 2.5),
(15, 4, 4, 5, 5),
(16, 6, 4, 5, 2),
(17, 4, 4, 5, 3),
(18, 3, 1, 1, 5),
(19, 4, 3, 2, 5),
(20, 2, 4, 4, 3),
(21, 3, 5, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
`id_notas` int(11) NOT NULL,
  `nombre_nota` varchar(45) NOT NULL,
  `porcentaje_nota` float NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `nombre_nota`, `porcentaje_nota`, `id_curso`) VALUES
(2, 'Tareas', 0.05, 1),
(3, 'Participacion', 0.15, 2),
(4, 'Quiz 2', 0.2, 2),
(6, 'Quiz 1', 0.2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
 ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
 ADD PRIMARY KEY (`id_estudiante_curso`), ADD KEY `id_estudiante_idx` (`id_estudiante`), ADD KEY `id_curso_idx` (`id_curso`);

--
-- Indices de la tabla `estudiante_notas`
--
ALTER TABLE `estudiante_notas`
 ADD PRIMARY KEY (`id_estudiante_notas`), ADD KEY `id_notas_curso_idx` (`id_curso`), ADD KEY `id_notas_notas_idx` (`id_notas`), ADD KEY `id_estudiante_notas_idx` (`id_estudiante`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
 ADD PRIMARY KEY (`id_notas`), ADD KEY `id_curso_idx` (`id_curso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
MODIFY `id_estudiante_curso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `estudiante_notas`
--
ALTER TABLE `estudiante_notas`
MODIFY `id_estudiante_notas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
ADD CONSTRAINT `id_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante_notas`
--
ALTER TABLE `estudiante_notas`
ADD CONSTRAINT `id_estudiante_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_estudiante_notas` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_notas_nota` FOREIGN KEY (`id_notas`) REFERENCES `notas` (`id_notas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
ADD CONSTRAINT `id_curso_notas` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
