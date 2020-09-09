-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-09-2020 a las 20:43:47
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinemacentral`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fav`
--

CREATE TABLE `fav` (
  `idpeli` int NOT NULL,
  `idusuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `fav`
--

INSERT INTO `fav` (`idpeli`, `idusuario`) VALUES
(0, 3),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelis`
--

CREATE TABLE `pelis` (
  `idpeli` int NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `anyo` int DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pelis`
--

INSERT INTO `pelis` (`idpeli`, `titulo`, `genero`, `director`, `duracion`, `anyo`, `foto`) VALUES
(0, 'Capitana Marvel', 'Ciencia ficción', 'Anna Boden y Ryan Fleck', 124, 2019, 'capitana_marvel.jpg'),
(1, 'Capitán Améria: Primer Vengador', 'Ciencia ficción', 'Joe Johnston', 124, 2011, 'capitan_1.jpg'),
(2, 'Iron Man', 'Ciencia ficción', 'Jon Favreau', 126, 2008, 'iron_man.jpg'),
(3, 'El Increíble Hulk', 'Ciencia ficción', 'Louis Leterrier', 112, 2008, 'hulk.jpg'),
(4, 'Iron Man 2', 'Ciencia ficción', 'Jon Favreau', 124, 2010, 'iron_man_2.jpg'),
(5, 'Thor', 'Ciencia ficción', 'Kenneth Branagh', 115, 2011, 'thor.jpg'),
(6, 'Los Vengadores', 'Ciencia ficción', 'Joss Whedon', 143, 2012, 'vengadores.jpg'),
(7, 'Iron Man 3', 'Ciencia ficción', 'Shane Black', 131, 2013, 'iron_man_3.jpg'),
(8, 'Thor: El mundo Oscuro', 'Ciencia ficción', 'Alan Taylor', 112, 2013, 'thor_oscuro.jpg'),
(9, 'Capitán Améria: Soldado de invierno', 'Ciencia ficción', 'Anthony Russo y Joe Russo', 136, 2014, 'capitan_2.jpg'),
(10, 'Guardianes de la Galaxia', 'Ciencia ficción', 'James Gunn', 122, 2014, 'guardianes.jpg'),
(11, 'Los Vengadores: La era de Ultrón', 'Ciencia ficción', 'Joss Whedon', 141, 2015, 'v_ultron.jpg'),
(12, 'Ant-Man', 'Ciencia ficción', 'Peyton Reed', 117, 2015, 'ant_man.jpg'),
(13, 'Capitán Améria: Civil War', 'Ciencia ficción', 'Anthony Russo y Joe Russo', 147, 2016, 'capitan_3.jpg'),
(14, 'Spider-Man: Homecoming', 'Ciencia ficción', 'Jon Watts', 133, 2017, 'spider_man.jpg'),
(15, 'Doctor Strange', 'Ciencia ficción', 'Scott Derrickson', 115, 2016, 'doctor_strange.jpg'),
(16, 'Black Panther', 'Ciencia ficción', 'Ryan Coogler', 134, 2018, 'black_panther.jpg'),
(17, 'Guardianes de la Galaxia Vol.2', 'Ciencia ficción', 'James Gunn', 137, 2017, 'guardianes2.jpg'),
(18, 'Thor: Ragnarok', 'Ciencia ficción', 'Taika Waititi', 130, 2017, 'thor_ragnarok.jpg'),
(19, 'Los Vengadores: Infinity War', 'Ciencia ficción', 'Anthony Russo y Joe Russo', 149, 2018, 'v_infinity.jpg'),
(20, 'Ant-Man y la Avispa', 'Ciencia ficción', 'Peyton Reed', 118, 2018, 'ant_man2.jpg'),
(21, 'Los Vengadores: Endgame', 'Ciencia ficción', 'Anthony Russo y Joe Russo', 181, 2019, 'v_endgame.jpg'),
(22, 'Spider-Man: Lejos de casa', 'Ciencia ficción', 'Jon Watts', 130, 2019, 'spider_man2.jpg'),
(23, 'Ghostbusters', 'Ciencia ficción y comedia', 'ivan reitman', 120, 1984, 'iron_man_3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `apellidos`, `correo`, `pass`, `rol`) VALUES
(1, 'Sergio', 'Mateos', 'sergiom@gmail.com', '12345', 'admin'),
(2, 'Laura', 'Ibarra', 'laura@gmail.com', '1234', 'admin'),
(3, 'Lian', 'López', 'lianl@gmail.com', '12345', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fav`
--
ALTER TABLE `fav`
  ADD PRIMARY KEY (`idusuario`,`idpeli`),
  ADD KEY `idpeli_idx` (`idpeli`);

--
-- Indices de la tabla `pelis`
--
ALTER TABLE `pelis`
  ADD PRIMARY KEY (`idpeli`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fav`
--
ALTER TABLE `fav`
  ADD CONSTRAINT `idpeli` FOREIGN KEY (`idpeli`) REFERENCES `pelis` (`idpeli`),
  ADD CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
