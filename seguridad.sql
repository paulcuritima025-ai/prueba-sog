-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2026 a las 20:44:57
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
-- Base de datos: `seguridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_rol`
--

CREATE TABLE `empleado_rol` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `rol_codigo` int(11) NOT NULL,
  `empleado_codigo` int(11) NOT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `empleado_rol_activo` bit(1) NOT NULL,
  `usuario_registro` int(11) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `usuario_modifica` int(11) DEFAULT NULL,
  `cuarentena` char(1) DEFAULT NULL,
  `fecha_reg_cuarentena` datetime DEFAULT NULL,
  `usuario_reg_cuarentena` int(11) DEFAULT NULL,
  `fecha_modifica_cuarentena` datetime DEFAULT NULL,
  `usuario_modifica_cuarentena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleado_rol`
--

INSERT INTO `empleado_rol` (`empresa_codigo`, `sistema_codigo`, `rol_codigo`, `empleado_codigo`, `fecha_reg`, `empleado_rol_activo`, `usuario_registro`, `fecha_modifica`, `usuario_modifica`, `cuarentena`, `fecha_reg_cuarentena`, `usuario_reg_cuarentena`, `fecha_modifica_cuarentena`, `usuario_modifica_cuarentena`) VALUES
(1, 2, 1, 1, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 2, 1, '2026-02-16 00:52:39', b'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 2, 2, '2026-02-16 00:52:34', b'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 2, 3, '2026-02-16 00:52:35', b'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 3, 1, 1, '2019-09-22 10:04:31', b'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 1, '2026-03-11 02:26:02', b'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_codigo` int(11) NOT NULL,
  `empresa_descripcion` varchar(80) DEFAULT NULL,
  `empresa_direccion` varchar(80) DEFAULT NULL,
  `empresa_db` varchar(80) DEFAULT NULL,
  `empresa_url` varchar(80) DEFAULT NULL,
  `empresa_login` varchar(80) DEFAULT NULL,
  `empresa_password` varchar(80) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `empresa_activo` bit(1) NOT NULL,
  `empresa_instancia` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_codigo`, `empresa_descripcion`, `empresa_direccion`, `empresa_db`, `empresa_url`, `empresa_login`, `empresa_password`, `fecha_reg`, `empresa_activo`, `empresa_instancia`) VALUES
(1, 'CODAINI', 'SMP', 'codaini', '127.0.0.1', 'root', '', '2026-01-07 00:00:00', b'1', NULL),
(2, 'ENCH', 'LINCE', 'ench', '127.0.0.1', 'root', '', '2019-09-07 00:00:00', b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `menu_codigo` int(11) NOT NULL,
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `pagina_codigo` int(11) NOT NULL,
  `menu_codigo_padre` int(11) DEFAULT NULL,
  `menu_descripcion` varchar(80) DEFAULT NULL,
  `menu_orden` int(11) DEFAULT NULL,
  `menu_url` int(11) DEFAULT NULL,
  `menu_query` varchar(80) DEFAULT NULL,
  `menu_anchor` varchar(80) DEFAULT NULL,
  `menu_target` varchar(80) DEFAULT NULL,
  `menu_activo` bit(1) NOT NULL,
  `menu_icon` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`menu_codigo`, `empresa_codigo`, `sistema_codigo`, `pagina_codigo`, `menu_codigo_padre`, `menu_descripcion`, `menu_orden`, `menu_url`, `menu_query`, `menu_anchor`, `menu_target`, `menu_activo`, `menu_icon`) VALUES
(1, 2, 1, 2, NULL, 'Inicio', 1, NULL, NULL, NULL, NULL, b'1', 'home'),
(2, 2, 1, 1, NULL, 'Mantenimiento', 2, NULL, NULL, NULL, NULL, b'1', 'cube'),
(3, 2, 1, 1, NULL, 'Registros', 4, NULL, NULL, NULL, NULL, b'1', 'table'),
(5, 2, 1, 8, 2, 'Tipo de Comprobantes', 2, NULL, '', '', '', b'1', ''),
(6, 2, 1, 14, 2, 'Locales', 3, NULL, NULL, NULL, NULL, b'1', ''),
(7, 2, 1, 19, 2, 'Unidad Medida', 4, NULL, NULL, NULL, NULL, b'1', ''),
(8, 2, 1, 24, 2, 'Tallas', 5, NULL, '', '', '', b'1', ''),
(9, 2, 1, 1, NULL, 'Almacén', 3, NULL, NULL, NULL, NULL, b'1', 'tasks'),
(10, 2, 1, 29, 9, 'Categoría', 1, NULL, NULL, NULL, NULL, b'1', ''),
(11, 2, 1, 34, 9, 'SubCategoria', 2, NULL, NULL, NULL, NULL, b'1', ''),
(12, 2, 1, 39, 9, 'Productos', 3, NULL, NULL, NULL, NULL, b'1', ''),
(13, 2, 1, 48, 2, 'Cajas', 7, NULL, NULL, NULL, NULL, b'1', ''),
(14, 2, 1, 53, 2, 'Slider Principal', 8, NULL, NULL, NULL, NULL, b'1', ''),
(15, 2, 1, 58, 2, 'Personajes', 9, NULL, NULL, NULL, NULL, b'1', ''),
(16, 2, 1, 63, 2, 'Suscriptores', 10, NULL, NULL, NULL, NULL, b'1', ''),
(17, 2, 1, 76, 2, 'Empleados', 11, NULL, '', '', '', b'1', ''),
(18, 2, 1, 3, 2, 'Usuarios', 12, NULL, '', '', '', b'1', ''),
(19, 2, 1, 68, 3, 'Ventas/Compras', 1, NULL, NULL, NULL, NULL, b'1', ''),
(20, 2, 1, 75, 3, 'Kardex', 2, NULL, NULL, NULL, NULL, b'1', ''),
(21, 2, 1, 81, 2, 'Videos', 13, NULL, NULL, NULL, NULL, b'1', 'film'),
(22, 2, 1, 1, NULL, 'Caja', 14, NULL, NULL, NULL, NULL, b'1', 'inbox'),
(23, 2, 1, 86, 22, 'Aperturar Caja', 14, NULL, NULL, NULL, NULL, b'1', ''),
(24, 2, 1, 96, 2, 'Concepto', 15, NULL, '', '', '', b'1', ''),
(25, 2, 1, 1, NULL, 'Reporte', 5, NULL, NULL, NULL, NULL, b'1', 'list'),
(26, 2, 1, 103, 25, 'Reporte', 5, NULL, NULL, NULL, NULL, b'1', ''),
(31, 1, 3, 2, NULL, 'Inicio', 1, NULL, NULL, NULL, NULL, b'1', 'home'),
(32, 1, 3, 1, NULL, 'Mantenimiento', 2, NULL, NULL, NULL, NULL, b'1', 'cube'),
(33, 1, 3, 3, 32, 'Empresa', 1, NULL, NULL, NULL, NULL, b'1', ''),
(34, 1, 3, 8, 32, 'Sistema', 2, NULL, NULL, NULL, NULL, b'1', ''),
(35, 1, 3, 1, NULL, 'Seguridad', 3, NULL, '', '', '', b'1', 'language'),
(36, 1, 3, 1, NULL, 'Reporte', 4, NULL, '', '', '', b'1', 'indent'),
(37, 1, 3, 16, 35, 'Pagina', 1, NULL, '', '', '', b'1', NULL),
(38, 1, 3, 10, 36, 'REPORTE', 1, NULL, '', '', '', b'1', NULL),
(39, 1, 3, 22, 35, 'Rol', 2, NULL, '', '', '', b'1', NULL),
(40, 1, 3, 23, 35, 'Menú', 3, NULL, '', '', '', b'1', NULL),
(44, 1, 3, 28, 32, 'Cuarentena', 3, NULL, '', '', '', b'1', NULL),
(45, 1, 3, 15, 32, 'Desbloqueo', 4, NULL, '', '', '', b'1', NULL),
(46, 1, 3, 52, 32, 'Usuarios', 5, NULL, '', '', '', b'1', NULL),
(47, 2, 1, 110, 2, 'Repartidores', 17, NULL, '', '', '', b'1', NULL),
(48, 2, 1, 115, 2, 'Tablas', 18, NULL, '', '', '', b'1', NULL),
(49, 2, 1, 121, 3, 'Pedido', 3, NULL, '', '', '', b'1', NULL),
(50, 2, 1, 125, 3, 'Comisión', 4, NULL, '', '', '', b'1', NULL),
(51, 2, 1, 129, 3, 'Venta de Pedido', 5, NULL, '', '', '', b'1', NULL),
(52, 2, 1, 105, 2, 'Proveedores', 16, NULL, '', '', '', b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `pagina_codigo` int(11) NOT NULL,
  `pagina_descripcion` varchar(80) DEFAULT NULL,
  `pagina_url` varchar(255) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `pagina_activo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`empresa_codigo`, `sistema_codigo`, `pagina_codigo`, `pagina_descripcion`, `pagina_url`, `fecha_reg`, `pagina_activo`) VALUES
(1, 2, 0, 'Ninguno', 'Ninguno', '2026-01-10 02:37:14', b'1'),
(1, 3, 1, 'Ninguno', 'Ninguno', '2019-09-07 00:00:00', b'1'),
(1, 3, 2, '/seguridad/web/index.php/main/inicio', '/seguridad/web/index.php/main/inicio', '2019-09-07 00:00:00', b'1'),
(1, 3, 3, '/seguridad/web/index.php/empresa/index', '/seguridad/web/index.php/empresa/index', '2019-09-07 00:00:00', b'1'),
(1, 3, 4, '/seguridad/web/index.php/empresa/create', '/seguridad/web/index.php/empresa/create', '2019-09-07 00:00:00', b'1'),
(1, 3, 5, '/seguridad/web/index.php/empresa/update', '/seguridad/web/index.php/empresa/update', '2019-09-07 00:00:00', b'1'),
(1, 3, 6, '/seguridad/web/index.php/empresa/view', '/seguridad/web/index.php/empresa/view', '2019-09-07 00:00:00', b'1'),
(1, 3, 7, '/seguridad/web/index.php/empresa/delete', '/seguridad/web/index.php/empresa/delete', '2019-09-07 00:00:00', b'1'),
(1, 3, 8, '/seguridad/web/index.php/sistema/index', '/seguridad/web/index.php/sistema/index', '2019-09-07 00:00:00', b'1'),
(1, 3, 9, '/seguridad/web/index.php/sistema/create', '/seguridad/web/index.php/sistema/create', '2019-09-07 00:00:00', b'1'),
(1, 3, 10, '/seguridad/web/index.php/sistema/update', '/seguridad/web/index.php/sistema/update', '2019-09-07 00:00:00', b'1'),
(1, 3, 11, '/seguridad/web/index.php/sistema/view', '/seguridad/web/index.php/sistema/view', '2019-09-07 00:00:00', b'1'),
(1, 3, 12, '/seguridad/web/index.php/sistema/delete', '/seguridad/web/index.php/sistema/delete', '2019-09-07 00:00:00', b'1'),
(1, 3, 13, '/seguridad/web/index.php/sistema/asignar-responsable', '/seguridad/web/index.php/sistema/asignar-responsable', '2019-09-07 00:00:00', b'1'),
(1, 3, 14, '/seguridad/web/index.php/sistema/buscar-asignar-responsable', '/seguridad/web/index.php/sistema/buscar-asignar-responsable', '2019-10-16 00:00:00', b'1'),
(1, 3, 15, '/seguridad/web/index.php/sistema/desbloqueo', '/seguridad/web/index.php/sistema/desbloqueo', '2019-10-16 00:52:51', b'1'),
(1, 3, 16, '/seguridad/web/index.php/pagina/index', '/seguridad/web/index.php/pagina/index', '2019-10-16 00:52:51', b'1'),
(1, 3, 17, '/seguridad/web/index.php/pagina/update', '/seguridad/web/index.php/pagina/update', '2019-10-16 00:52:51', b'1'),
(1, 3, 18, '/seguridad/web/index.php/pagina/create', '/seguridad/web/index.php/pagina/create', '2019-10-16 00:52:51', b'1'),
(1, 3, 19, '/seguridad/web/index.php/pagina/view', '/seguridad/web/index.php/pagina/view', '2019-10-16 00:52:51', b'1'),
(1, 3, 20, '/seguridad/web/index.php/pagina/delete', '/seguridad/web/index.php/pagina/delete', '2019-10-16 00:52:51', b'1'),
(1, 3, 21, '/seguridad/web/index.php/pagina/importar', '/seguridad/web/index.php/pagina/importar', '2019-10-16 00:52:51', b'1'),
(1, 3, 22, '/seguridad/web/index.php/rol/index', '/seguridad/web/index.php/rol/index', '2019-10-19 18:25:43', b'1'),
(1, 3, 23, '/seguridad/web/index.php/menu/index', '/seguridad/web/index.php/menu/index', '2019-10-20 16:33:16', b'1'),
(1, 3, 24, '/seguridad/web/index.php/empleado-rol/index', '/seguridad/web/index.php/empleado-rol/index', '2019-10-21 01:03:43', b'1'),
(1, 3, 25, '/seguridad/web/index.php/sistema/eliminar-responsable', '/seguridad/web/index.php/sistema/eliminar-responsable', '2019-10-24 00:05:48', b'1'),
(1, 3, 26, '/seguridad/web/index.php/sistema/getsistemasdesbloqueo', '/seguridad/web/index.php/sistema/getsistemasdesbloqueo', '2019-10-24 00:06:48', b'1'),
(1, 3, 27, '/seguridad/web/index.php/sistema/getlistsistemascuarentena', '/seguridad/web/index.php/sistema/getlistsistemascuarentena', '2019-10-24 00:07:12', b'1'),
(1, 3, 28, '/seguridad/web/index.php/sistema/cuarentena', '/seguridad/web/index.php/sistema/cuarentena', '2019-10-24 00:07:27', b'1'),
(1, 3, 29, '/seguridad/web/index.php/rol/asignar-empleado', '/seguridad/web/index.php/rol/asignar-empleado', '2019-10-25 19:29:04', b'1'),
(1, 3, 30, '/seguridad/web/index.php/rol/eliminar-empleado', '/seguridad/web/index.php/rol/eliminar-empleado', '2019-10-25 19:29:10', b'1'),
(1, 3, 31, '/seguridad/web/index.php/rol/asignar-empleado-asignar', '/seguridad/web/index.php/rol/asignar-empleado-asignar', '2019-10-25 19:29:16', b'1'),
(1, 3, 32, '/seguridad/web/index.php/rol/buscar-asignar-empleado', '/seguridad/web/index.php/rol/buscar-asignar-empleado', '2019-10-25 19:29:24', b'1'),
(1, 3, 33, '/seguridad/web/index.php/rol/pagina', '/seguridad/web/index.php/rol/pagina', '2019-10-25 19:29:32', b'1'),
(1, 3, 34, '/seguridad/web/index.php/rol/pagina-asociar-jerarquia-proceso', '/seguridad/web/index.php/rol/pagina-asociar-jerarquia-proceso', '2019-10-25 19:29:38', b'1'),
(1, 3, 35, '/seguridad/web/index.php/rol/agregar-paginas', '/seguridad/web/index.php/rol/agregar-paginas', '2019-10-25 19:29:45', b'1'),
(1, 3, 36, '/seguridad/web/index.php/rol/guardar-eliminar', '/seguridad/web/index.php/rol/guardar-eliminar', '2019-10-25 19:29:51', b'1'),
(1, 3, 37, '/seguridad/web/index.php/menu/menu-jerarquia', '/seguridad/web/index.php/menu/menu-jerarquia', '2019-10-25 19:36:54', b'1'),
(1, 3, 38, '/seguridad/web/index.php/menu/menu-form', '/seguridad/web/index.php/menu/menu-form', '2019-10-25 19:37:01', b'1'),
(1, 3, 39, '/seguridad/web/index.php/menu/delete', '/seguridad/web/index.php/menu/delete', '2019-10-25 19:37:10', b'1'),
(1, 3, 40, '/seguridad/web/index.php/menu/up', '/seguridad/web/index.php/menu/up', '2019-10-25 19:37:17', b'1'),
(1, 3, 41, '/seguridad/web/index.php/menu/down', '/seguridad/web/index.php/menu/down', '2019-10-25 19:37:23', b'1'),
(1, 3, 42, '/seguridad/web/index.php/menu/asociar-pagina', '/seguridad/web/index.php/menu/asociar-pagina', '2019-10-25 19:37:29', b'1'),
(1, 3, 43, '/seguridad/web/index.php/menu/asignar-pagina-menu', '/seguridad/web/index.php/menu/asignar-pagina-menu', '2019-10-25 19:37:36', b'1'),
(1, 3, 44, '/seguridad/web/index.php/menu/eliminar-pagina-hijo', '/seguridad/web/index.php/menu/eliminar-pagina-hijo', '2019-10-25 19:37:43', b'1'),
(1, 3, 45, '/seguridad/web/index.php/menu/create', '/seguridad/web/index.php/menu/create', '2019-10-25 19:37:49', b'1'),
(1, 3, 46, '/seguridad/web/index.php/menu/update', '/seguridad/web/index.php/menu/update', '2019-10-25 19:37:58', b'1'),
(1, 3, 47, '/seguridad/web/index.php/empleado-rol/buscar-empleado-rol', '/seguridad/web/index.php/empleado-rol/buscar-empleado-rol', '2019-10-25 19:48:28', b'1'),
(1, 3, 48, '/seguridad/web/index.php/empleado-rol/replicar-empleado-rol', '/seguridad/web/index.php/empleado-rol/replicar-empleado-rol', '2019-10-25 19:48:36', b'1'),
(1, 3, 49, '/seguridad/web/index.php/empleado-rol/eliminar-empleado-rol', '/seguridad/web/index.php/empleado-rol/eliminar-empleado-rol', '2019-10-25 19:48:42', b'1'),
(1, 3, 50, '/seguridad/web/index.php/empleado-rol/create', '/seguridad/web/index.php/empleado-rol/create', '2019-10-25 19:48:52', b'1'),
(1, 3, 51, '/seguridad/web/index.php/empleado-rol/update', '/seguridad/web/index.php/empleado-rol/update', '2019-10-25 19:48:56', b'1'),
(1, 3, 52, '/seguridad/web/index.php/usuarios/index', '/seguridad/web/index.php/usuarios/index', '2026-01-10 23:54:30', b'1'),
(1, 3, 53, '/seguridad/web/index.php/usuarios/create', '/seguridad/web/index.php/usuarios/create', '2026-01-10 23:54:40', b'1'),
(1, 3, 54, '/seguridad/web/index.php/usuarios/update', '/seguridad/web/index.php/usuarios/update', '2026-01-10 23:54:48', b'1'),
(1, 3, 55, '/seguridad/web/index.php/usuarios/view', '/seguridad/web/index.php/usuarios/view', '2026-01-10 23:54:56', b'1'),
(1, 3, 56, '/seguridad/web/index.php/usuarios/delete', '/seguridad/web/index.php/usuarios/delete', '2026-01-10 23:55:04', b'1'),
(2, 1, 1, 'Ninguno', 'Ninguno', '2019-09-07 00:00:00', b'1'),
(2, 1, 2, 'main/inicio', 'main/inicio', '2019-09-07 00:00:00', b'1'),
(2, 1, 3, 'usuarios/index', 'usuarios/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 4, 'usuarios/create', 'usuarios/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 5, 'usuarios/update', 'usuarios/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 6, 'usuarios/view', 'usuarios/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 7, 'usuarios/delete', 'usuarios/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 8, 'tipo-comprobante/index', 'tipo-comprobante/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 9, 'tipo-comprobante/create', 'tipo-comprobante/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 10, 'tipo-comprobante/update', 'tipo-comprobante/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 11, 'tipo-comprobante/view', 'tipo-comprobante/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 12, 'tipo-comprobante/delete', 'tipo-comprobante/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 13, 'tipo-comprobante/ingresar-serie', 'tipo-comprobante/ingresar-serie', '2019-09-07 00:00:00', b'1'),
(2, 1, 14, 'locales/index', 'locales/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 15, 'locales/create', 'locales/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 16, 'locales/update', 'locales/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 17, 'locales/view', 'locales/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 18, 'locales/delete', 'locales/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 19, 'unidad-medida/index', 'unidad-medida/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 20, 'unidad-medida/create', 'unidad-medida/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 21, 'unidad-medida/update', 'unidad-medida/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 22, 'unidad-medida/view', 'unidad-medida/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 23, 'unidad-medida/delete', 'unidad-medida/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 24, 'tallas/index', 'tallas/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 25, 'tallas/create', 'tallas/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 26, 'tallas/update', 'tallas/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 27, 'tallas/view', 'tallas/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 28, 'tallas/delete', 'tallas/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 29, 'productos/index-categoria', 'productos/index-categoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 30, 'productos/view-categoria', 'productos/view-categoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 31, 'productos/create-categoria', 'productos/create-categoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 32, 'productos/update-categoria', 'productos/update-categoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 33, 'productos/delete-categoria', 'productos/delete-categoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 34, 'productos/index-subcategoria', 'productos/index-subcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 35, 'productos/view-subcategoria', 'productos/view-subcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 36, 'productos/create-subcategoria', 'productos/create-subcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 37, 'productos/update-subcategoria', 'productos/update-subcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 38, 'productos/delete-subcategoria', 'productos/delete-subcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 39, 'productos/index-producto', 'productos/index-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 40, 'productos/view-producto', 'productos/view-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 41, 'productos/create-producto', 'productos/create-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 42, 'productos/update-producto', 'productos/update-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 43, 'productos/delete-producto', 'productos/delete-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 44, 'productos/eliminar-imagen', 'productos/eliminar-imagen', '2019-09-07 00:00:00', b'1'),
(2, 1, 45, 'productos/principal-imagen', 'productos/principal-imagen', '2019-09-07 00:00:00', b'1'),
(2, 1, 46, 'productos/getlistsubcategoria', 'productos/getlistsubcategoria', '2019-09-07 00:00:00', b'1'),
(2, 1, 47, 'productos/producto-ingresar-stock', 'productos/producto-ingresar-stock', '2019-09-07 00:00:00', b'1'),
(2, 1, 48, 'cajas/index', 'cajas/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 49, 'cajas/view', 'cajas/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 50, 'cajas/create', 'cajas/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 51, 'cajas/update', 'cajas/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 52, 'cajas/delete', 'cajas/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 53, 'slide/index', 'slide/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 54, 'slide/view', 'slide/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 55, 'slide/create', 'slide/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 56, 'slide/update', 'slide/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 57, 'slide/delete', 'slide/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 58, 'personajes/index', 'personajes/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 59, 'personajes/view', 'personajes/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 60, 'personajes/create', 'personajes/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 61, 'personajes/update', 'personajes/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 62, 'personajes/delete', 'personajes/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 63, 'suscriptor/index', 'suscriptor/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 64, 'suscriptor/view', 'suscriptor/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 65, 'suscriptor/create', 'suscriptor/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 66, 'suscriptor/update', 'suscriptor/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 67, 'suscriptor/delete', 'suscriptor/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 68, 'comprobante/index', 'comprobante/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 69, 'comprobante/view', 'comprobante/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 70, 'comprobante/create', 'comprobante/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 71, 'comprobante/update', 'comprobante/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 72, 'comprobante/delete', 'comprobante/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 73, 'comprobante/listar-productos', 'comprobante/listar-productos', '2019-09-07 00:00:00', b'1'),
(2, 1, 74, 'comprobante/obtener-seriecorrelativo', 'comprobante/obtener-seriecorrelativo', '2019-09-07 00:00:00', b'1'),
(2, 1, 75, 'comprobante/kardex', 'comprobante/kardex', '2019-09-07 00:00:00', b'1'),
(2, 1, 76, 'empleados/index', 'empleados/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 77, 'empleados/view', 'empleados/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 78, 'empleados/create', 'empleados/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 79, 'empleados/update', 'empleados/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 80, 'empleados/delete', 'empleados/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 81, 'videos/index', 'videos/index', '2019-09-12 00:31:21', b'1'),
(2, 1, 82, 'videos/view', 'videos/index', '2019-09-12 00:31:24', b'1'),
(2, 1, 83, 'videos/create', 'videos/index', '2019-09-12 00:31:26', b'1'),
(2, 1, 84, 'videos/update', 'videos/index', '2019-09-12 00:31:27', b'1'),
(2, 1, 85, 'videos/delete', 'videos/index', '2019-09-12 00:31:29', b'1'),
(2, 1, 86, 'caja-apertura/index', 'caja-apertura/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 87, 'caja-apertura/view', 'caja-apertura/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 88, 'caja-apertura/create', 'caja-apertura/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 89, 'caja-apertura/update', 'caja-apertura/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 90, 'caja-apertura/delete', 'caja-apertura/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 91, 'caja-apertura/cierre-caja', 'caja-apertura/cierre-caja', '2019-09-07 00:00:00', b'1'),
(2, 1, 92, 'caja-apertura/aperturar-caja', 'caja-apertura/aperturar-caja', '2019-09-07 00:00:00', b'1'),
(2, 1, 93, 'comprobante/producto-buscar', 'comprobante/producto-buscar', '2019-09-07 00:00:00', b'1'),
(2, 1, 94, 'comprobante/get-buscar-producto', 'comprobante/get-buscar-producto', '2019-09-07 00:00:00', b'1'),
(2, 1, 95, 'caja-apertura/detalle-caja', 'caja-apertura/detalle-caja', '2019-09-07 00:00:00', b'1'),
(2, 1, 96, 'concepto/index', 'concepto/index', '2019-09-07 00:00:00', b'1'),
(2, 1, 97, 'concepto/view', 'concepto/view', '2019-09-07 00:00:00', b'1'),
(2, 1, 98, 'concepto/create', 'concepto/create', '2019-09-07 00:00:00', b'1'),
(2, 1, 99, 'concepto/update', 'concepto/update', '2019-09-07 00:00:00', b'1'),
(2, 1, 100, 'concepto/delete', 'concepto/delete', '2019-09-07 00:00:00', b'1'),
(2, 1, 101, 'caja-apertura/movimiento-caja', 'caja-apertura/movimiento-caja', '2019-09-07 00:00:00', b'1'),
(2, 1, 102, 'caja-apertura/getlistconcepto', 'caja-apertura/getlistconcepto', '2019-09-07 00:00:00', b'1'),
(2, 1, 103, 'reporte/reporte', 'reporte/reporte', '2019-09-07 00:00:00', b'1'),
(2, 1, 104, 'reporte/reporte_print', 'reporte/reporte_print', '2019-09-07 00:00:00', b'1'),
(2, 1, 105, 'proveedores/index', 'proveedores/index', '2020-08-02 17:31:11', b'1'),
(2, 1, 106, 'proveedores/create', 'proveedores/create', '2020-08-02 17:39:28', b'1'),
(2, 1, 107, 'proveedores/update', 'proveedores/update', '2020-08-02 17:39:45', b'1'),
(2, 1, 108, 'proveedores/view', 'proveedores/view', '2020-08-02 17:40:10', b'1'),
(2, 1, 109, 'proveedores/delete', 'proveedores/delete', '2020-08-02 17:40:28', b'1'),
(2, 1, 110, 'repartidores/index', 'repartidores/index', '2020-08-02 17:43:08', b'1'),
(2, 1, 111, 'repartidores/create', 'repartidores/create', '2020-08-02 17:43:18', b'1'),
(2, 1, 112, 'repartidores/update', 'repartidores/update', '2020-08-02 17:43:31', b'1'),
(2, 1, 113, 'repartidores/view', 'repartidores/view', '2020-08-02 17:43:42', b'1'),
(2, 1, 114, 'repartidores/delete', 'repartidores/delete', '2020-08-02 17:43:54', b'1'),
(2, 1, 115, 'tablas/index', 'tablas/index', '2020-08-30 22:19:36', b'1'),
(2, 1, 116, 'tablas/create', 'tablas/create', '2020-08-30 22:19:43', b'1'),
(2, 1, 117, 'tablas/update', 'tablas/update', '2020-08-30 22:19:53', b'1'),
(2, 1, 118, 'items/index', 'items/index', '2020-08-30 22:20:10', b'1'),
(2, 1, 119, 'items/create', 'items/create', '2020-08-30 22:20:18', b'1'),
(2, 1, 120, 'items/update', 'items/update', '2020-08-30 22:20:26', b'1'),
(2, 1, 121, 'pedido/index', 'pedido/index', '2020-09-03 00:12:49', b'1'),
(2, 1, 122, 'pedido/create', 'pedido/create', '2020-09-03 00:13:12', b'1'),
(2, 1, 123, 'pedido/update', 'pedido/update', '2020-09-03 00:13:24', b'1'),
(2, 1, 124, 'pedido/delete', 'pedido/delete', '2020-09-03 00:13:36', b'1'),
(2, 1, 125, 'comision/index', 'comision/index', '2020-10-11 18:41:59', b'1'),
(2, 1, 126, 'comision/create', 'comision/create', '2020-10-11 18:42:20', b'1'),
(2, 1, 127, 'comision/update', 'comision/update', '2020-10-11 18:42:32', b'1'),
(2, 1, 128, 'comision/delete', 'comision/delete', '2020-10-11 18:42:59', b'1'),
(2, 1, 129, 'pedido/venta-index', 'pedido/venta-index', '2020-11-10 16:42:12', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_menu`
--

CREATE TABLE `pagina_menu` (
  `menu_codigo` int(11) NOT NULL,
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `pagina_codigo` int(11) NOT NULL,
  `pagina_codigo_hijo` int(11) NOT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `pagina_menu_activo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina_menu`
--

INSERT INTO `pagina_menu` (`menu_codigo`, `empresa_codigo`, `sistema_codigo`, `pagina_codigo`, `pagina_codigo_hijo`, `fecha_reg`, `pagina_menu_activo`) VALUES
(1, 2, 1, 2, 2, '2026-03-11 02:25:24', b'1'),
(5, 2, 1, 8, 8, '2020-06-03 02:05:47', b'1'),
(5, 2, 1, 8, 9, '2020-06-03 02:01:25', b'1'),
(5, 2, 1, 8, 10, '2020-06-03 02:01:25', b'1'),
(5, 2, 1, 8, 11, '2020-06-03 02:01:25', b'1'),
(5, 2, 1, 8, 12, '2020-06-03 02:01:25', b'1'),
(5, 2, 1, 8, 13, '2020-06-03 02:01:25', b'1'),
(8, 2, 1, 24, 24, '2020-06-02 22:31:24', b'1'),
(8, 2, 1, 24, 25, '2020-06-02 22:31:44', b'1'),
(8, 2, 1, 24, 26, '2020-06-02 22:31:44', b'1'),
(8, 2, 1, 24, 27, '2020-06-02 22:31:44', b'1'),
(8, 2, 1, 24, 28, '2020-06-02 22:31:44', b'1'),
(17, 2, 1, 76, 76, '2019-10-29 02:35:21', b'1'),
(17, 2, 1, 76, 78, '2019-10-29 02:35:41', b'1'),
(17, 2, 1, 76, 79, '2019-10-29 02:35:41', b'1'),
(17, 2, 1, 76, 80, '2019-10-29 02:35:41', b'1'),
(18, 2, 1, 3, 3, '2020-06-03 02:27:34', b'1'),
(18, 2, 1, 3, 4, '2020-06-03 02:27:58', b'1'),
(18, 2, 1, 3, 5, '2020-06-03 02:27:58', b'1'),
(18, 2, 1, 3, 6, '2020-06-03 02:27:58', b'1'),
(18, 2, 1, 3, 7, '2020-06-03 02:27:58', b'1'),
(24, 2, 1, 96, 96, '2020-06-03 02:23:12', b'1'),
(24, 2, 1, 96, 97, '2020-06-03 02:23:31', b'1'),
(24, 2, 1, 96, 98, '2020-06-03 02:23:31', b'1'),
(24, 2, 1, 96, 99, '2020-06-03 02:23:31', b'1'),
(24, 2, 1, 96, 100, '2020-06-03 02:23:31', b'1'),
(33, 1, 3, 3, 3, '2019-10-24 00:08:21', b'1'),
(33, 1, 3, 3, 4, '2019-10-24 00:08:21', b'1'),
(33, 1, 3, 3, 5, '2019-10-24 00:08:21', b'1'),
(34, 1, 3, 8, 8, '2019-10-24 00:09:23', b'1'),
(34, 1, 3, 8, 9, '2019-10-24 00:09:23', b'1'),
(34, 1, 3, 8, 10, '2019-10-24 00:09:31', b'1'),
(34, 1, 3, 8, 13, '2019-10-24 00:09:23', b'1'),
(34, 1, 3, 8, 14, '2019-10-24 00:09:23', b'1'),
(34, 1, 3, 8, 25, '2019-10-24 00:09:23', b'1'),
(37, 1, 3, 3, 3, '2019-10-19 18:24:06', b'1'),
(37, 1, 3, 16, 16, '2019-10-19 18:41:40', b'1'),
(37, 1, 3, 16, 17, '2019-10-24 00:11:18', b'1'),
(37, 1, 3, 16, 18, '2019-10-24 00:11:18', b'1'),
(37, 1, 3, 16, 21, '2019-10-24 00:11:18', b'1'),
(37, 1, 3, 22, 22, '2019-10-19 18:28:13', b'1'),
(38, 1, 3, 10, 10, '2019-10-19 19:15:27', b'1'),
(39, 1, 3, 22, 22, '2019-10-20 16:33:36', b'1'),
(39, 1, 3, 22, 29, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 30, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 31, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 32, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 33, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 34, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 35, '2019-10-25 19:30:13', b'1'),
(39, 1, 3, 22, 36, '2019-10-25 19:30:13', b'1'),
(40, 1, 3, 23, 23, '2019-10-20 16:33:50', b'1'),
(40, 1, 3, 23, 37, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 38, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 39, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 40, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 41, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 42, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 43, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 44, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 45, '2019-10-25 19:38:11', b'1'),
(40, 1, 3, 23, 46, '2019-10-25 19:38:11', b'1'),
(42, 1, 3, 7, 7, '2019-10-20 19:32:45', b'1'),
(44, 1, 3, 2, 2, '2019-10-20 21:59:57', b'1'),
(44, 1, 3, 6, 6, '2019-10-20 20:56:15', b'1'),
(44, 1, 3, 28, 27, '2019-10-24 00:10:06', b'1'),
(44, 1, 3, 28, 28, '2019-10-24 00:09:55', b'1'),
(45, 1, 3, 15, 15, '2019-10-24 00:10:44', b'1'),
(45, 1, 3, 15, 26, '2019-10-24 00:10:53', b'1'),
(46, 1, 3, 3, 3, '2019-10-25 19:32:49', b'0'),
(46, 1, 3, 52, 52, '2026-01-10 23:55:38', b'1'),
(46, 1, 3, 52, 53, '2026-01-10 23:56:02', b'1'),
(46, 1, 3, 52, 54, '2026-01-10 23:56:02', b'1'),
(46, 1, 3, 52, 55, '2026-01-10 23:56:02', b'1'),
(46, 1, 3, 52, 56, '2026-01-10 23:56:02', b'1'),
(47, 2, 1, 110, 110, '2020-08-02 17:44:35', b'1'),
(47, 2, 1, 110, 111, '2020-08-02 17:44:49', b'1'),
(47, 2, 1, 110, 112, '2020-08-02 17:44:49', b'1'),
(47, 2, 1, 110, 113, '2020-08-02 17:44:49', b'1'),
(47, 2, 1, 110, 114, '2020-08-02 17:44:49', b'1'),
(48, 2, 1, 115, 115, '2020-08-30 22:21:05', b'1'),
(48, 2, 1, 115, 116, '2020-08-30 22:21:17', b'1'),
(48, 2, 1, 115, 117, '2020-08-30 22:21:17', b'1'),
(48, 2, 1, 115, 118, '2020-08-30 22:21:24', b'1'),
(48, 2, 1, 115, 119, '2020-08-30 22:21:24', b'1'),
(48, 2, 1, 115, 120, '2020-08-30 22:21:24', b'1'),
(49, 2, 1, 121, 121, '2020-09-03 00:14:09', b'1'),
(49, 2, 1, 121, 122, '2020-09-03 00:14:22', b'1'),
(49, 2, 1, 121, 123, '2020-09-03 00:14:22', b'1'),
(49, 2, 1, 121, 124, '2020-09-03 00:14:22', b'1'),
(50, 2, 1, 125, 125, '2020-10-11 18:43:58', b'1'),
(50, 2, 1, 125, 126, '2020-10-11 18:44:09', b'1'),
(50, 2, 1, 125, 127, '2020-10-11 18:44:09', b'1'),
(50, 2, 1, 125, 128, '2020-10-11 18:44:09', b'1'),
(51, 2, 1, 129, 129, '2020-11-10 19:44:22', b'1'),
(52, 2, 1, 105, 105, '2020-08-02 17:41:07', b'1'),
(52, 2, 1, 105, 106, '2020-08-02 17:41:22', b'1'),
(52, 2, 1, 105, 107, '2020-08-02 17:41:22', b'1'),
(52, 2, 1, 105, 108, '2020-08-02 17:41:22', b'1'),
(52, 2, 1, 105, 109, '2020-08-02 17:41:22', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_rol`
--

CREATE TABLE `pagina_rol` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `rol_codigo` int(11) NOT NULL,
  `pagina_codigo` int(11) NOT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `pagina_rol_activo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina_rol`
--

INSERT INTO `pagina_rol` (`empresa_codigo`, `sistema_codigo`, `rol_codigo`, `pagina_codigo`, `fecha_reg`, `pagina_rol_activo`) VALUES
(1, 3, 1, 1, '2019-09-07 00:00:00', b'1'),
(1, 3, 1, 2, '2019-10-26 16:08:18', b'1'),
(1, 3, 1, 3, '2019-10-26 16:07:36', b'1'),
(1, 3, 1, 4, '2019-10-26 16:07:36', b'1'),
(1, 3, 1, 5, '2019-10-26 16:07:36', b'1'),
(1, 3, 1, 6, '2019-10-26 16:08:18', b'1'),
(1, 3, 1, 7, '2019-09-07 00:00:00', b'1'),
(1, 3, 1, 8, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 9, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 10, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 11, '2019-09-07 00:00:00', b'1'),
(1, 3, 1, 12, '2019-09-07 00:00:00', b'1'),
(1, 3, 1, 13, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 14, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 15, '2019-10-26 16:40:15', b'0'),
(1, 3, 1, 16, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 17, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 18, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 19, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 20, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 21, '2019-10-16 00:57:50', b'1'),
(1, 3, 1, 22, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 23, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 24, '2019-10-26 15:44:59', b'1'),
(1, 3, 1, 25, '2019-10-26 16:06:32', b'1'),
(1, 3, 1, 26, '2026-01-10 21:44:58', b'1'),
(1, 3, 1, 27, '2019-10-26 16:08:18', b'1'),
(1, 3, 1, 28, '2019-10-26 16:08:18', b'1'),
(1, 3, 1, 29, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 30, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 31, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 32, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 33, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 34, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 35, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 36, '2019-10-25 20:21:53', b'1'),
(1, 3, 1, 37, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 38, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 39, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 40, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 41, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 42, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 43, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 44, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 45, '2019-10-26 13:51:24', b'1'),
(1, 3, 1, 46, '2019-10-26 13:51:25', b'1'),
(1, 3, 1, 47, '2019-10-26 15:45:00', b'1'),
(1, 3, 1, 48, '2019-10-26 15:45:00', b'1'),
(1, 3, 1, 49, '2019-10-26 15:45:00', b'1'),
(1, 3, 1, 50, '2019-10-26 15:45:00', b'1'),
(1, 3, 1, 51, '2019-10-26 15:45:00', b'1'),
(1, 3, 1, 52, '2026-01-10 23:57:42', b'1'),
(1, 3, 1, 53, '2026-01-10 23:57:42', b'1'),
(1, 3, 1, 54, '2026-01-10 23:57:43', b'1'),
(1, 3, 1, 55, '2026-01-10 23:57:43', b'1'),
(1, 3, 1, 56, '2026-01-10 23:57:43', b'1'),
(2, 1, 1, 1, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 2, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 3, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 4, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 5, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 6, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 7, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 8, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 9, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 10, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 11, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 12, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 13, '2020-06-03 02:07:14', b'1'),
(2, 1, 1, 14, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 15, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 16, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 17, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 18, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 19, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 20, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 21, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 22, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 23, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 24, '2020-06-03 02:14:10', b'1'),
(2, 1, 1, 25, '2020-06-03 02:14:10', b'1'),
(2, 1, 1, 26, '2020-06-03 02:14:10', b'1'),
(2, 1, 1, 27, '2020-06-03 02:14:10', b'1'),
(2, 1, 1, 28, '2020-06-03 02:14:10', b'1'),
(2, 1, 1, 29, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 30, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 31, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 32, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 33, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 34, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 35, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 36, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 37, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 38, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 39, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 40, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 41, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 42, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 43, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 44, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 45, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 46, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 47, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 48, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 49, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 50, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 51, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 52, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 53, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 54, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 55, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 56, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 57, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 58, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 59, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 60, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 61, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 62, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 63, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 64, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 65, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 66, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 67, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 68, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 69, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 70, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 71, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 72, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 73, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 74, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 75, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 76, '2019-10-29 02:36:18', b'1'),
(2, 1, 1, 77, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 78, '2019-10-29 02:36:18', b'1'),
(2, 1, 1, 79, '2019-10-29 02:36:18', b'1'),
(2, 1, 1, 80, '2019-10-29 02:36:18', b'1'),
(2, 1, 1, 81, '2019-09-12 00:31:34', b'1'),
(2, 1, 1, 82, '2019-09-12 00:31:36', b'1'),
(2, 1, 1, 83, '2019-09-12 00:31:37', b'1'),
(2, 1, 1, 84, '2019-09-12 00:31:39', b'1'),
(2, 1, 1, 85, '2019-09-12 00:31:40', b'1'),
(2, 1, 1, 86, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 87, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 88, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 89, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 90, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 91, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 92, '2020-01-19 03:34:10', b'1'),
(2, 1, 1, 93, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 94, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 95, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 96, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 97, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 98, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 99, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 100, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 101, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 102, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 103, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 104, '2019-09-07 00:00:00', b'1'),
(2, 1, 1, 105, '2020-08-02 17:41:42', b'1'),
(2, 1, 1, 106, '2020-08-02 17:41:42', b'1'),
(2, 1, 1, 107, '2020-08-02 17:41:42', b'1'),
(2, 1, 1, 108, '2020-08-02 17:41:42', b'1'),
(2, 1, 1, 109, '2020-08-02 17:41:42', b'1'),
(2, 1, 1, 110, '2020-08-02 17:45:03', b'1'),
(2, 1, 1, 111, '2020-08-02 17:45:03', b'1'),
(2, 1, 1, 112, '2020-08-02 17:45:03', b'1'),
(2, 1, 1, 113, '2020-08-02 17:45:03', b'1'),
(2, 1, 1, 114, '2020-08-02 17:45:03', b'1'),
(2, 1, 1, 115, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 116, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 117, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 118, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 119, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 120, '2020-08-30 22:21:38', b'1'),
(2, 1, 1, 121, '2020-09-10 00:08:12', b'1'),
(2, 1, 1, 122, '2020-09-10 00:08:12', b'1'),
(2, 1, 1, 123, '2020-09-10 00:08:12', b'1'),
(2, 1, 1, 124, '2020-09-10 00:08:12', b'1'),
(2, 1, 1, 125, '2020-10-11 18:44:36', b'1'),
(2, 1, 1, 126, '2020-10-11 18:44:36', b'1'),
(2, 1, 1, 127, '2020-10-11 18:44:36', b'1'),
(2, 1, 1, 128, '2020-10-11 18:44:36', b'1'),
(2, 1, 1, 129, '2020-11-10 19:45:36', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `rol_codigo` int(11) NOT NULL,
  `rol_descripcion` varchar(80) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `rol_activo` bit(1) NOT NULL,
  `rol_observaciones` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`empresa_codigo`, `sistema_codigo`, `rol_codigo`, `rol_descripcion`, `fecha_reg`, `rol_activo`, `rol_observaciones`) VALUES
(1, 2, 1, 'Administrador', NULL, b'0', NULL),
(1, 2, 2, 'Jefe', NULL, b'0', NULL),
(1, 2, 3, 'Practicante', '2026-02-16 00:37:47', b'1', 'Practicante'),
(1, 3, 1, 'Administrador', '2019-09-07 00:00:00', b'1', 'Administrador, puede visualzar todas las páginas'),
(2, 1, 1, 'Administrador', '2019-09-07 00:00:00', b'1', 'Administrador, puede visualzar todas las páginas'),
(2, 1, 2, 'Cajero', '2019-09-07 00:00:00', b'1', 'Cajero, solo puede visualizar ventas/compras'),
(2, 1, 3, 'Vendedor externo', '2020-09-03 00:15:28', b'1', 'Vendedor externo, tercero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE `sistema` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `sistema_descripcion` varchar(100) DEFAULT NULL,
  `sistema_abreviado` varchar(20) DEFAULT NULL,
  `sistema_fecha_reg` datetime DEFAULT NULL,
  `sistema_activo` bit(1) NOT NULL,
  `aplica_cuarentena_usuario` char(1) DEFAULT NULL,
  `tiempo_bloqueo` int(11) DEFAULT NULL,
  `numero_intento` int(11) DEFAULT NULL,
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
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`empresa_codigo`, `sistema_codigo`, `sistema_descripcion`, `sistema_abreviado`, `sistema_fecha_reg`, `sistema_activo`, `aplica_cuarentena_usuario`, `tiempo_bloqueo`, `numero_intento`, `tipo_proyecto`, `nombre_proyecto`, `imagen_nombre`, `sinopsis`, `genero`, `plataforma`, `idioma`, `apk`, `caracteristicas`, `url`, `cliente`, `fecha_proyecto`, `descripcion`, `estado_proyecto`, `controles`, `fecha_registro`, `id_usuario_registro`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 1, 'codaini', 'codaini', '2026-01-07 00:00:00', b'1', '0', 30, 3, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2026-01-07 20:11:29', NULL, NULL, NULL),
(1, 2, 'Sistema de Gestión de Proyecto', 'SGP', '2026-01-10 02:37:14', b'1', 'N', NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2026-01-10 02:37:14', NULL, NULL, NULL),
(1, 3, 'seguridad', 'seguridad', '2026-01-07 00:00:00', b'1', '0', 30, 3, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2026-01-07 20:11:29', NULL, NULL, NULL),
(2, 1, 'ench', 'ench', '2019-09-07 00:00:00', b'1', '0', 30, 3, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2026-03-11 02:18:34', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_imagen`
--

CREATE TABLE `sistema_imagen` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `id_correlativo` int(11) NOT NULL,
  `imagen_nombre` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fg_principal` tinyint(1) DEFAULT 0 COMMENT '1 = imagen principal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_responsable`
--

CREATE TABLE `sistema_responsable` (
  `empresa_codigo` int(11) NOT NULL,
  `sistema_codigo` int(11) NOT NULL,
  `empleado_codigo` int(11) NOT NULL,
  `sr_fecha_reg` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sistema_responsable`
--

INSERT INTO `sistema_responsable` (`empresa_codigo`, `sistema_codigo`, `empleado_codigo`, `sr_fecha_reg`) VALUES
(1, 1, 1, '2019-09-22 10:28:58'),
(1, 3, 1, '2019-09-22 10:28:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `nombre_usuario` varchar(80) NOT NULL,
  `clave_acceso` varchar(128) DEFAULT NULL,
  `estado` int(11) NOT NULL COMMENT '1 Activo, 0 Inactivo',
  `fecha_registro` datetime DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_empleado`, `email`, `nombre_usuario`, `clave_acceso`, `estado`, `fecha_registro`, `id_usuario_registro`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 1, 'bnyhamin@gmail.com', 'bnyhamin', '123456', 1, NULL, NULL, NULL, NULL),
(2, 2, 'aguilarchumpitazjeanpierre@gmail.com', 'jpierre', '123456', 1, '2026-02-16 05:27:45', 1, NULL, NULL),
(3, 3, 'ketrinix00@gmail.com', 'ketrinix00', '123456', 1, '2026-02-16 06:26:08', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vempleado_rol_pagina`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vempleado_rol_pagina` (
`empresa_codigo` int(11)
,`sistema_codigo` int(11)
,`rol_codigo` int(11)
,`empleado_codigo` int(11)
,`rol_descripcion` varchar(80)
,`pagina_codigo` int(11)
,`pagina_descripcion` varchar(80)
,`pagina_url` varchar(255)
,`cuarentena` char(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vhijos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vhijos` (
`jefe` int(11)
,`empresa_codigo` int(11)
,`sistema_codigo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vmenu_hijos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vmenu_hijos` (
`empresa_codigo` int(11)
,`sistema_codigo` int(11)
,`menu_codigo` int(11)
,`menu_descripcion` varchar(80)
,`pagina_codigo` int(11)
,`pagina_url` varchar(255)
,`menu_orden` int(11)
,`menu_codigo_padre` int(11)
,`menu_url` int(11)
,`menu_query` varchar(80)
,`menu_anchor` varchar(80)
,`menu_target` varchar(80)
,`jefe` int(11)
,`empleado_codigo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vempleado_rol_pagina`
--
DROP TABLE IF EXISTS `vempleado_rol_pagina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vempleado_rol_pagina`  AS SELECT `empleado_rol`.`empresa_codigo` AS `empresa_codigo`, `empleado_rol`.`sistema_codigo` AS `sistema_codigo`, `empleado_rol`.`rol_codigo` AS `rol_codigo`, `empleado_rol`.`empleado_codigo` AS `empleado_codigo`, `rol`.`rol_descripcion` AS `rol_descripcion`, `pagina_rol`.`pagina_codigo` AS `pagina_codigo`, `pagina`.`pagina_descripcion` AS `pagina_descripcion`, `pagina`.`pagina_url` AS `pagina_url`, `empleado_rol`.`cuarentena` AS `cuarentena` FROM (((`rol` join `pagina_rol` on(`rol`.`empresa_codigo` = `pagina_rol`.`empresa_codigo` and `rol`.`sistema_codigo` = `pagina_rol`.`sistema_codigo` and `rol`.`rol_codigo` = `pagina_rol`.`rol_codigo`)) join `pagina` on(`pagina_rol`.`empresa_codigo` = `pagina`.`empresa_codigo` and `pagina_rol`.`sistema_codigo` = `pagina`.`sistema_codigo` and `pagina_rol`.`pagina_codigo` = `pagina`.`pagina_codigo`)) join `empleado_rol` on(`rol`.`empresa_codigo` = `empleado_rol`.`empresa_codigo` and `rol`.`sistema_codigo` = `empleado_rol`.`sistema_codigo` and `rol`.`rol_codigo` = `empleado_rol`.`rol_codigo`)) WHERE `empleado_rol`.`empleado_rol_activo` = 1 AND `rol`.`rol_activo` = 1 AND `pagina_rol`.`pagina_rol_activo` = 1 AND `pagina`.`pagina_activo` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vhijos`
--
DROP TABLE IF EXISTS `vhijos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vhijos`  AS SELECT DISTINCT `menu`.`menu_codigo_padre` AS `jefe`, `menu`.`empresa_codigo` AS `empresa_codigo`, `menu`.`sistema_codigo` AS `sistema_codigo` FROM `menu` WHERE `menu`.`menu_codigo_padre` > 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vmenu_hijos`
--
DROP TABLE IF EXISTS `vmenu_hijos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmenu_hijos`  AS SELECT `m`.`empresa_codigo` AS `empresa_codigo`, `m`.`sistema_codigo` AS `sistema_codigo`, `m`.`menu_codigo` AS `menu_codigo`, `m`.`menu_descripcion` AS `menu_descripcion`, `m`.`pagina_codigo` AS `pagina_codigo`, `p`.`pagina_url` AS `pagina_url`, `m`.`menu_orden` AS `menu_orden`, CASE WHEN `m`.`menu_codigo_padre` is null THEN 0 ELSE `m`.`menu_codigo_padre` END AS `menu_codigo_padre`, CASE WHEN `m`.`menu_url` is null THEN 0 ELSE `m`.`menu_url` END AS `menu_url`, `m`.`menu_query` AS `menu_query`, `m`.`menu_anchor` AS `menu_anchor`, `m`.`menu_target` AS `menu_target`, CASE WHEN `j`.`jefe` is null THEN 0 ELSE `j`.`jefe` END AS `jefe`, `er`.`empleado_codigo` AS `empleado_codigo` FROM (((((`menu` `m` join `pagina` `p` on(`m`.`empresa_codigo` = `p`.`empresa_codigo` and `m`.`sistema_codigo` = `p`.`sistema_codigo` and `m`.`pagina_codigo` = `p`.`pagina_codigo`)) join `pagina_rol` `pr` on(`p`.`empresa_codigo` = `pr`.`empresa_codigo` and `p`.`sistema_codigo` = `pr`.`sistema_codigo` and `p`.`pagina_codigo` = `pr`.`pagina_codigo` and `pr`.`pagina_rol_activo` = 1)) join `empleado_rol` `er` on(`pr`.`empresa_codigo` = `er`.`empresa_codigo` and `pr`.`sistema_codigo` = `er`.`sistema_codigo` and `pr`.`rol_codigo` = `er`.`rol_codigo` and `er`.`empleado_rol_activo` = 1)) left join `vhijos` `j` on(`m`.`empresa_codigo` = `j`.`empresa_codigo` and `m`.`sistema_codigo` = `j`.`sistema_codigo` and `m`.`menu_codigo` = `j`.`jefe`)) join `rol` `r` on(`pr`.`empresa_codigo` = `r`.`empresa_codigo` and `pr`.`sistema_codigo` = `r`.`sistema_codigo` and `pr`.`rol_codigo` = `r`.`rol_codigo`)) WHERE `m`.`menu_codigo_padre` is not null AND `r`.`rol_activo` = 1 AND `p`.`pagina_activo` = 1 AND `pr`.`pagina_rol_activo` = 1 AND `er`.`empleado_rol_activo` = 1 GROUP BY `m`.`empresa_codigo`, `m`.`sistema_codigo`, `m`.`menu_codigo`, `m`.`menu_descripcion`, `m`.`pagina_codigo`, `p`.`pagina_url`, `m`.`menu_orden`, CASE WHEN `m`.`menu_codigo_padre` is null THEN 0 ELSE `m`.`menu_codigo_padre` END, CASE WHEN `m`.`menu_url` is null THEN 0 ELSE `m`.`menu_url` END, `m`.`menu_query`, `m`.`menu_anchor`, `m`.`menu_target`, CASE WHEN `j`.`jefe` is null THEN 0 ELSE `j`.`jefe` END, `er`.`empleado_codigo` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`,`rol_codigo`,`empleado_codigo`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_codigo`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_codigo`,`empresa_codigo`,`sistema_codigo`,`pagina_codigo`),
  ADD KEY `empresa_codigo` (`empresa_codigo`,`sistema_codigo`,`pagina_codigo`);

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`,`pagina_codigo`);

--
-- Indices de la tabla `pagina_menu`
--
ALTER TABLE `pagina_menu`
  ADD PRIMARY KEY (`menu_codigo`,`empresa_codigo`,`sistema_codigo`,`pagina_codigo`,`pagina_codigo_hijo`);

--
-- Indices de la tabla `pagina_rol`
--
ALTER TABLE `pagina_rol`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`,`rol_codigo`,`pagina_codigo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`,`rol_codigo`);

--
-- Indices de la tabla `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`);

--
-- Indices de la tabla `sistema_responsable`
--
ALTER TABLE `sistema_responsable`
  ADD PRIMARY KEY (`empresa_codigo`,`sistema_codigo`,`empleado_codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD CONSTRAINT `empleado_rol_ibfk_1` FOREIGN KEY (`empresa_codigo`,`sistema_codigo`,`rol_codigo`) REFERENCES `rol` (`empresa_codigo`, `sistema_codigo`, `rol_codigo`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`empresa_codigo`,`sistema_codigo`,`pagina_codigo`) REFERENCES `pagina` (`empresa_codigo`, `sistema_codigo`, `pagina_codigo`);

--
-- Filtros para la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `pagina_ibfk_1` FOREIGN KEY (`empresa_codigo`,`sistema_codigo`) REFERENCES `sistema` (`empresa_codigo`, `sistema_codigo`);

--
-- Filtros para la tabla `pagina_rol`
--
ALTER TABLE `pagina_rol`
  ADD CONSTRAINT `pagina_rol_ibfk_1` FOREIGN KEY (`empresa_codigo`,`sistema_codigo`,`rol_codigo`) REFERENCES `rol` (`empresa_codigo`, `sistema_codigo`, `rol_codigo`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`empresa_codigo`,`sistema_codigo`) REFERENCES `sistema` (`empresa_codigo`, `sistema_codigo`);

--
-- Filtros para la tabla `sistema`
--
ALTER TABLE `sistema`
  ADD CONSTRAINT `sistema_ibfk_1` FOREIGN KEY (`empresa_codigo`) REFERENCES `empresa` (`empresa_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
