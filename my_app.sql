-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2020 a las 09:15:46
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `kind_food` set('japones','vegetariano','mexicano','apto para celiacos','italiano','regional') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Can kenji', 'Carrer del Rosselló, 325, 08037 Barcelona', 41.4003, 2.16641, 'japones,regional'),
(2, 'Teresa Carles', 'Carrer de Jovellanos, 2, 08001 Barcelona', 41.3851, 2.16801, 'vegetariano,apto para celiacos'),
(3, 'El Nacional', 'Passeig de Gràcia, 24 Bis, 08007 Barcelona', 41.3902, 2.16789, 'regional'),
(4, 'La Chula Cervecería Mexicana', 'Carrer del Rosselló, 483, 08025 Barcelona', 41.4074, 2.17583, 'mexicano'),
(5, 'El Casal Café Bar', 'Plaça Victor Balaguer, 5, 08003 Barcelona', 41.383, 2.1811, 'vegetariano,regional'),
(6, 'NAP Antic', 'Av. de Francesc Cambó, 30, 08003 Barcelona', 41.3867, 2.17881, 'italiano'),
(7, 'Tlaxcal Cantina & Taquería ', 'Carrer del Comerç, 27, 08003 Barcelona', 41.385, 2.18433, 'mexicano'),
(8, 'Dip Dumpling', 'Carrer de Ramón y Cajal, 61, 08012 Barcelona', 41.4039, 2.16053, 'japones,vegetariano,mexicano'),
(9, 'Nanaya', 'Avinguda Diagonal, 173, 08018 Barcelona', 41.4049, 2.19455, 'japones'),
(10, 'Xiringuito Escribà', 'Av. del Litoral, 62, 08005 Barcelona', 41.3925, 2.20473, 'vegetariano,apto para celiacos,regional');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
