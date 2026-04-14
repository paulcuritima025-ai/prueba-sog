-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2026 a las 20:48:23
-- Versión del servidor: 10.6.16-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codaini`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_modalidad` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL COMMENT '1 Activo, 0 Inactivo',
  `instituto` varchar(300) DEFAULT NULL,
  `id_postulante` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_cese` datetime DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `id_persona`, `id_modalidad`, `id_cargo`, `estado`, `instituto`, `id_postulante`, `fecha_registro`, `fecha_alta`, `fecha_cese`, `id_usuario_registro`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 1, 74, 93, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, NULL, NULL, 1, 'SENATI', NULL, '2026-02-16 05:27:45', NULL, NULL, 1, '2026-02-16 06:12:11', 1),
(3, 3, NULL, NULL, 1, 'SENATI', NULL, '2026-02-16 06:26:08', '2025-11-01 00:00:00', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `tipo_proyecto` int(11) NOT NULL COMMENT '1=Videojuego, 2=Web, 3=Modelado',
  `nombre_proyecto` varchar(255) NOT NULL,
  `imagen_nombre` varchar(255) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `plataforma` varchar(100) DEFAULT NULL,
  `idioma` varchar(100) DEFAULT NULL,
  `apk` varchar(255) DEFAULT NULL COMMENT 'Ruta de descarga si es videojuego',
  `caracteristicas` text DEFAULT NULL,
  `url` varchar(800) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `fecha_proyecto` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado_proyecto` text NOT NULL,
  `controles` text NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1 COMMENT '1=Activo, 0=Inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `tipo_proyecto`, `nombre_proyecto`, `imagen_nombre`, `sinopsis`, `genero`, `plataforma`, `idioma`, `apk`, `caracteristicas`, `url`, `cliente`, `fecha_proyecto`, `descripcion`, `estado_proyecto`, `controles`, `fecha_registro`, `id_usuario_registro`, `fecha_modificacion`, `id_usuario_modificacion`, `activo`) VALUES
(1, 1, 'Animal Football', 'animalfootball1.png', 'Animal Football es un videojuego arcade de fútbol en 2.5D protagonizado por animales coleccionables mediante cartas. Los partidos se juegan en equipos de 5 jugadores (1 arquero + 4 de campo) y están diseñados para móviles en orientación horizontal.', 'Arcade / Aventura / Deportes', 'Android (actualmente disponible solo para PC)', 'Inglés', 'Soccer2.5D.zip', 'Exploración, Recolección, Enemigos', NULL, NULL, '2025-05-01', 'En Animal Football los equipos están formados por animales coleccionables, cada uno con habilidades únicas que cambiarán el rumbo del partido. Forma tu equipo ideal, elige tus cartas y domina la cancha usando pases, tiros y habilidades especiales.\r\n\r\nCon un estilo arcade en 2.5D, partidas rápidas y estratégicas te esperan, donde cada movimiento cuenta. Colecciona animales raros, desbloquea poderes sorprendentes y desafía a la CPU en partidos llenos de acción y emoción.\r\n\r\nActualmente disponible para PC con controles de teclado, y muy pronto podrás jugarlo en tu móvil con controles táctiles intuitivos. ¡Descarga la demo y comienza a construir tu equipo de campeones!\r\n\r\nCada jugador controlable tiene una habilidad especial con tiempo de recarga, mientras que el portero puede actuar automáticamente o bajo control manual del jugador. Los disparos, atajadas y habilidades están regulados por probabilidades basadas en atributos de cada personaje, lo que añade un componente estratégico al juego.', 'Inicio: 28/10\r\nPróximo objetivo: Generar un APK jugable en móviles, con el fin de validar mecánicas y experiencia para luego subirlo a Google Play Store.', 'Movimiento: W, A, S, D\r\nDisparo / Pase: J\r\nQuitar / Tiro: K\r\nNota: Se planea migrar la experiencia a controles táctiles en Android con joystick y botones laterales.', '2025-11-02 22:49:05', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_imagen`
--

CREATE TABLE `proyecto_imagen` (
  `id_proyecto_imagen` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `imagen_nombre` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fg_principal` tinyint(1) DEFAULT 0 COMMENT '1 = imagen principal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyecto_imagen`
--

INSERT INTO `proyecto_imagen` (`id_proyecto_imagen`, `id_proyecto`, `imagen_nombre`, `activo`, `fg_principal`) VALUES
(1, 1, 'gameplay1.png', 1, 1),
(2, 1, 'gameplay2.png', 1, 0),
(3, 1, 'gameplay3.png', 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`);

--
-- Indices de la tabla `proyecto_imagen`
--
ALTER TABLE `proyecto_imagen`
  ADD PRIMARY KEY (`id_proyecto_imagen`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proyecto_imagen`
--
ALTER TABLE `proyecto_imagen`
  MODIFY `id_proyecto_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `proyecto_imagen`
--
ALTER TABLE `proyecto_imagen`
  ADD CONSTRAINT `proyecto_imagen_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
