-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2026 a las 20:45:10
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
-- Base de datos: `codaini_sgp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_01_15_000001_create_dashboard_tables', 1),
(2, '2026_01_21_051051_create_sprints_table_and_add_sprint_id_to_tasks', 2),
(4, '2026_01_21_052755_add_details_to_tasks_and_create_related_tables', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_wiki_pages`
--

CREATE TABLE `project_wiki_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `contenido` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Referencia a seguridad.usuarios.id_usuario',
  `orden` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `project_wiki_pages`
--

INSERT INTO `project_wiki_pages` (`id`, `proyecto_id`, `titulo`, `slug`, `contenido`, `user_id`, `orden`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', 'test', 'contenido 1', 1, 0, '2026-02-14 10:13:54', '2026-02-14 10:13:54'),
(2, 1, 'test2', 'test2', 'asdsdsdsas', 1, 1, '2026-02-14 10:23:59', '2026-02-14 10:23:59'),
(3, 2, 'Reuniones', 'reuniones', 'Stefano- Angelina, Ivan, Fabrizio\nRealizar lista de animales para el público\n\n\nFabrizio García - Capacitación y Diseño de 3d \nAngelina - Diseño 3d de Gacela\nIvan - Diseño 3d de zorro\nEdgar - \nhabilidad del gato\ndiseño para animación para habilidad\nimpedimento: no se tiene definido las habilidades de otros personajes\nse le indicó que puede basarse en el GDD DEMO ACTUAL\n\nSergio - \npersonajes en pixel art zorro,  tortuga \ncomunicación con jeanpierre\n\nAxel - GDD\nAgregando habilidades a los personajes en el GDD\nmodificar o agregar todas las habilidades\n\nStefano -\nDiseño 3d del perro \n\nOscar - \nAnimación del botón para usar la habilidad especial como pregunta\nAnalizar la funcionalidad de habilidad especial del arquero en base a las probabilidades del GDD\nImplementar la funcionalidad de habilidad especial del arquero en base a las probabilidades del GDD\n\nJosé\nAnalizar la formación de los jugadores en el juego según los cambios de posición y alineación\nImplementar la formación de los jugadores en el juego según los cambios de posición y alineación\n\n\nKenet\nCambios y mejoras de Cambio de posición de equipo\nCambios y mejoras de Cambio de alineación\n\n\n\n\n\n\n-------------------------------\nCruces de  horario de los sábados\nAxel  8:15 - 10:15am\n\n\n\n\n\n\n\n\n', 1, 0, '2026-02-15 04:19:55', '2026-02-15 04:19:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `espacio_trabajo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'activo',
  `sistema_codigo` varchar(255) DEFAULT NULL,
  `empresa_codigo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `espacio_trabajo_id`, `nombre`, `descripcion`, `estado`, `sistema_codigo`, `empresa_codigo`, `created_at`, `updated_at`) VALUES
(1, 8, 'Seguridad', NULL, 'activo', '3', 1, '2026-01-16 09:49:40', '2026-01-26 10:21:49'),
(2, NULL, 'Sistema de Gestión de Proyecto', 'Proyecto sincronizado del sistema 2', 'activo', '2', 1, '2026-01-16 10:26:59', '2026-01-16 10:26:59'),
(6, 11, 'Diseño', 'Diseño UX', 'activo', '3', 1, '2026-01-26 10:29:28', '2026-01-26 10:30:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_user`
--

CREATE TABLE `proyecto_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'member',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sprints`
--

CREATE TABLE `sprints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `goal` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sprints`
--

INSERT INTO `sprints` (`id`, `proyecto_id`, `title`, `start_date`, `end_date`, `status`, `goal`, `created_at`, `updated_at`) VALUES
(4, 2, 'Sprint 1', '2026-01-31 05:00:00', '2026-04-30 05:00:00', 'pending', NULL, '2026-02-16 11:26:46', '2026-02-16 11:26:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` varchar(255) NOT NULL DEFAULT 'medium',
  `start_date` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sprint_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `proyecto_id`, `title`, `description`, `priority`, `start_date`, `due_date`, `status`, `created_at`, `updated_at`, `sprint_id`, `category`, `role`) VALUES
(9, 2, 'TestBEN', 'ben ben', 'media', NULL, '2026-02-23 05:00:00', 'pending', '2026-02-16 11:26:27', '2026-02-28 21:07:37', 4, 'Partido', 'Diseño'),
(10, 2, 'testJP', NULL, 'media', NULL, '2026-02-23 11:27:26', 'in_progress', '2026-02-16 11:27:26', '2026-02-17 10:08:54', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_checklists`
--

CREATE TABLE `task_checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarea_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `task_checklists`
--

INSERT INTO `task_checklists` (`id`, `tarea_id`, `content`, `is_completed`, `created_at`, `updated_at`) VALUES
(4, 9, 'Celebraciones con jugadores, serpentinas, público, sonido de gol.', 1, '2026-02-16 17:13:47', '2026-02-16 17:56:13'),
(5, 9, 'Mostrar UI para continuar al segundo tiempo.', 1, '2026-02-16 17:13:55', '2026-02-16 17:56:14'),
(6, 10, 'Revisar requerimientos', 1, '2026-02-16 17:54:39', '2026-02-16 17:54:39'),
(7, 10, 'Implementar código', 0, '2026-02-16 17:54:39', '2026-02-16 17:54:39'),
(8, 10, 'Pruebas unitarias', 0, '2026-02-16 17:54:39', '2026-02-16 17:54:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_comments`
--

CREATE TABLE `task_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarea_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_user`
--

CREATE TABLE `task_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarea_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `task_user`
--

INSERT INTO `task_user` (`id`, `tarea_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 9, 1, NULL, NULL),
(5, 10, 2, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `project_wiki_pages`
--
ALTER TABLE `project_wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_wiki_pages_proyecto_slug_unique` (`proyecto_id`,`slug`),
  ADD KEY `project_wiki_pages_proyecto_id_foreign` (`proyecto_id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyecto_user`
--
ALTER TABLE `proyecto_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyecto_user_proyecto_id_foreign` (`proyecto_id`);

--
-- Indices de la tabla `sprints`
--
ALTER TABLE `sprints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sprints_proyecto_id_foreign` (`proyecto_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tareas_proyecto_id_foreign` (`proyecto_id`),
  ADD KEY `tareas_sprint_id_foreign` (`sprint_id`);

--
-- Indices de la tabla `task_checklists`
--
ALTER TABLE `task_checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_checklists_tarea_id_foreign` (`tarea_id`);

--
-- Indices de la tabla `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_tarea_id_foreign` (`tarea_id`),
  ADD KEY `task_comments_user_id_index` (`user_id`);

--
-- Indices de la tabla `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_user_tarea_id_user_id_unique` (`tarea_id`,`user_id`),
  ADD KEY `task_user_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `project_wiki_pages`
--
ALTER TABLE `project_wiki_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proyecto_user`
--
ALTER TABLE `proyecto_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sprints`
--
ALTER TABLE `sprints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `task_checklists`
--
ALTER TABLE `task_checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `task_user`
--
ALTER TABLE `task_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `project_wiki_pages`
--
ALTER TABLE `project_wiki_pages`
  ADD CONSTRAINT `project_wiki_pages_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proyecto_user`
--
ALTER TABLE `proyecto_user`
  ADD CONSTRAINT `proyecto_user_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sprints`
--
ALTER TABLE `sprints`
  ADD CONSTRAINT `sprints_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tareas_sprint_id_foreign` FOREIGN KEY (`sprint_id`) REFERENCES `sprints` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `task_checklists`
--
ALTER TABLE `task_checklists`
  ADD CONSTRAINT `task_checklists_tarea_id_foreign` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_tarea_id_foreign` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `task_user`
--
ALTER TABLE `task_user`
  ADD CONSTRAINT `task_user_tarea_id_foreign` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
