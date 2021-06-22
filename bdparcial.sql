-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2021 a las 15:38:36
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdparcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `codigocita` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `hora` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Observacion` varchar(300) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'sin asignar',
  `codigopaciente` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `nombrepaciente` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidopaciente` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `edadpaciente` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `codigotrabajador` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `nombretrabajador` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidotrabajador` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipotrabajador` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`codigocita`, `fecha`, `hora`, `estado`, `Observacion`, `codigopaciente`, `nombrepaciente`, `apellidopaciente`, `edadpaciente`, `codigotrabajador`, `nombretrabajador`, `apellidotrabajador`, `tipotrabajador`) VALUES
('001', '07/07/2022', '5:00pm', 'Atendida', 'Dolor de cabeza', '1193526200', 'maria', 'perez', '22', '123', 'luis', 'perez', 'medico'),
('12', '07/07/2022', '4:00pm', 'No atendida', 'partidura de brazo', '1193526200', 'maria', 'perez', '22', '89', 'pedro', 'lopez', 'medico'),
('12345', '07/07/2022', '2:00pm', 'No atendida', 'sin asignar', '55', 'sofia', 'martinez', '14', '12', 'alex', 'marquez', 'medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codigo` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `trabajo` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`codigo`, `foto`, `nombre`, `apellido`, `tipo`, `estado`, `trabajo`) VALUES
('12', 'foto', 'alex', 'marquez', 'medico', 'Activo', 'servicio'),
('123', 'foto', 'luis', 'perez', 'medico', 'activo', 'servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loguin`
--

CREATE TABLE `loguin` (
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tipousuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `loguin`
--

INSERT INTO `loguin` (`usuario`, `contrasena`, `tipousuario`, `codigo`) VALUES
('Jean', 'jean', 'Empleado', '1193456399'),
('Laudaris', 'laudaris', 'Administrador', '1193526200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `codigo` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fechanacimiento` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `edad` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `barrio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`codigo`, `foto`, `nombre`, `apellido`, `fechanacimiento`, `edad`, `direccion`, `barrio`, `telefono`, `ciudad`, `estado`) VALUES
('55', 'foto', 'sofia', 'martinez', '07/07/2022', '14', 'calle 3', 'sabana', '30000', 'valledupar', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`codigocita`,`codigopaciente`,`codigotrabajador`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `loguin`
--
ALTER TABLE `loguin`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `usuariounk` (`usuario`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
