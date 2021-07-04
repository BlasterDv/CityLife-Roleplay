-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para blueroleplay
CREATE DATABASE IF NOT EXISTS `blueroleplay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `blueroleplay`;

-- Volcando estructura para tabla blueroleplay.lac_actors_robbery
CREATE TABLE IF NOT EXISTS `lac_actors_robbery` (
  `id_actor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin` smallint(6) NOT NULL,
  `time` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `a` float NOT NULL,
  `doorid` int(11) NOT NULL,
  `anim` int(11) NOT NULL,
  `money` smallint(6) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_actors_robbery: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_actors_robbery` DISABLE KEYS */;
INSERT INTO `lac_actors_robbery` (`id_actor`, `name`, `skin`, `time`, `x`, `y`, `z`, `a`, `doorid`, `anim`, `money`) VALUES
	(1, 'Pedro', 48, 0, -27.0402, -91.6209, 1003.55, 0.939619, 9, 0, 210),
	(2, 'Juanita', 150, 0, -27.0509, -91.621, 1003.55, 0.696893, 2, 0, 214),
	(3, 'Pedro', 170, 0, -112.582, 180.117, 1100.61, 176.24, 52, 1, 300),
	(4, 'Tom', 7, 0, 2309.93, -81.436, 10.7864, 0.487386, 54, 0, 240),
	(5, 'Ángela', 12, 0, 184.274, 87.8272, 999.219, 200.465, 55, 1, 340),
	(6, 'Carla', 151, 0, 1067.52, -808.783, 1081.97, 180.431, 5, 0, 208),
	(7, 'Chloe', 172, 0, -21.0913, -140.334, 1003.55, 358.079, 17, 0, 288),
	(8, 'Carl', 171, 0, 203.224, -157.83, 1000.52, 180.491, 16, 0, 348),
	(9, 'Carolina', 172, 0, 204.854, -9.13445, 1001.21, 269.542, 15, 0, 345),
	(10, 'Jorge', 72, 0, 206.37, -127.807, 1003.51, 181.461, 14, 0, 318),
	(11, 'Angel', 155, 0, 376.668, -117.279, 1001.49, 178.677, 45, 0, 248),
	(12, 'Javi', 155, 0, 372.787, -117.278, 1001.49, 178.677, 45, 0, 248),
	(13, 'Javier', 210, 0, 1067.5, -808.783, 1081.97, 181.204, 36, 0, 188),
	(14, 'Ming', 224, 0, -27.0546, -91.6216, 1003.55, 1.39507, 0, 0, 228),
	(15, 'Pamela', 205, 0, 376.662, -65.8472, 1001.51, 180.226, 64, 0, 287),
	(16, 'Jennifer', 205, 0, 375.284, -65.2688, 1001.51, 89.3581, 64, 0, 287),
	(17, 'Gabi', 205, 0, 376.654, -65.8466, 1001.51, 180.539, 65, 0, 272),
	(18, 'Adda', 205, 0, 375.284, -65.2299, 1001.51, 90.6115, 65, 0, 272),
	(19, 'Aarón', 167, 0, 368.115, -4.49278, 1001.85, 182.638, 66, 0, 238),
	(20, 'Antonio', 167, 0, 368.115, -4.49278, 1001.85, 182.638, 67, 0, 238),
	(21, 'Abel', 167, 0, 370.827, -4.49257, 1001.86, 181.072, 66, 0, 238),
	(22, 'Alex', 167, 0, 370.827, -4.49257, 1001.86, 181.072, 67, 0, 238),
	(23, 'Antonio', 7, 0, 203.298, -41.6706, 1001.8, 180.084, 8, 0, 240),
	(24, 'Fabiana', 194, 0, 208.827, -98.704, 1005.26, 179.564, 6, 0, 284),
	(25, 'Sarita', 172, 0, 162.675, -81.1917, 1001.8, 181.13, 3, 0, 359),
	(26, 'Mateo', 59, 0, 2129.95, -1163.25, 50.1892, 269.903, 72, 1, 289),
	(27, 'Wyatt', 98, 0, 595.975, -1510.74, 35.5394, 276.968, 71, 1, 389);
/*!40000 ALTER TABLE `lac_actors_robbery` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_apartaments
CREATE TABLE IF NOT EXISTS `lac_apartaments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `main_room` int(7) NOT NULL,
  `bathroom` int(11) NOT NULL,
  `room_one` int(11) NOT NULL,
  `room_two` int(11) NOT NULL,
  `room_tree` int(11) NOT NULL,
  `room_four` int(11) NOT NULL,
  `floor_main` int(11) NOT NULL,
  `floor_bathroom` int(11) NOT NULL,
  `floor_one` int(11) NOT NULL,
  `floor_two` int(11) NOT NULL,
  `floor_tree` int(11) NOT NULL,
  `floor_four` int(11) NOT NULL,
  `roof_index` int(11) NOT NULL,
  `windows_color` int(11) NOT NULL,
  `doors_style` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_apartaments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_apartaments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_apartaments` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_bad_history
CREATE TABLE IF NOT EXISTS `lac_bad_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `id2` int(11) NOT NULL,
  `text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_bad_history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_bad_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_bad_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_bad_history` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_banned
CREATE TABLE IF NOT EXISTS `lac_banned` (
  `id_user_ban` int(11) NOT NULL,
  `IP` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_history` int(11) NOT NULL,
  `expire_date` datetime DEFAULT '2038-01-01 06:06:06',
  UNIQUE KEY `IP` (`IP`),
  UNIQUE KEY `id_user_ban` (`id_user_ban`),
  KEY `id_history` (`id_history`),
  CONSTRAINT `lac_banned_ibfk_1` FOREIGN KEY (`id_history`) REFERENCES `lac_bad_history` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_banned: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_banned` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_barriers
CREATE TABLE IF NOT EXISTS `lac_barriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Object` int(9) NOT NULL DEFAULT 0,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `RX` float NOT NULL DEFAULT 0,
  `RY` float NOT NULL DEFAULT 0,
  `RZ` float NOT NULL DEFAULT 0,
  `StreamDistance` float NOT NULL DEFAULT 0,
  `DrawDistance` float NOT NULL DEFAULT 0,
  `VW` int(11) NOT NULL DEFAULT 0,
  `Interior` int(4) NOT NULL DEFAULT 0,
  `Type` int(11) NOT NULL DEFAULT 0,
  `MaxTime` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `PX` float NOT NULL DEFAULT 0,
  `PY` float NOT NULL DEFAULT 0,
  `PZ` float NOT NULL DEFAULT 0,
  `NewRY` float NOT NULL DEFAULT 0,
  `LX` float NOT NULL,
  `LY` float NOT NULL,
  `LZ` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_barriers: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_barriers` DISABLE KEYS */;
INSERT INTO `lac_barriers` (`id`, `Object`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `StreamDistance`, `DrawDistance`, `VW`, `Interior`, `Type`, `MaxTime`, `Name`, `PX`, `PY`, `PZ`, `NewRY`, `LX`, `LY`, `LZ`) VALUES
	(1, 968, 67.0781, -1536.83, 4.785, 0, -90, 88, 300, 500, 0, 0, 0, 3, 'PeajeFlint', 64.9544, -1540.57, 5.04778, -14, 65.9782, -1536.89, 4.97366),
	(2, 968, 36.0236, -1524.87, 5.0941, 0, -91, 268.361, 300, 500, 0, 0, 0, 3, 'PeajeFlint', 37.223, -1521.28, 5.22983, -14, 37.3592, -1525.72, 5.22773),
	(3, 968, -1759.42, -662.631, 21.1816, -8, 89.429, 0, 300, 500, 0, 0, 0, 3, 'PeajeSFEaster', -1755.53, -664.762, 21.5097, 19, -1758.63, -663.734, 21.3627),
	(4, 968, -1760.97, -674.291, 22.8055, 8, 90, 180, 300, 500, 0, 0, 0, 3, 'PeajeSFEaster', -1764.65, -672.578, 22.5453, 7, -1761.74, -673.253, 22.6362),
	(5, 968, -11.129, -1330.55, 10.7794, 0, -89.737, 308.521, 300, 500, 0, 0, 0, 3, 'FlintRodeoPeaje1', -12.4083, -1326.78, 11.0593, -14, -10.1005, -1330.51, 11.0789),
	(6, 968, -10.3796, -1331.54, 10.7794, 0, -90, 128.042, 300, 500, 0, 0, 0, 3, 'FlintRodeoPeaje2', -6.66781, -1334.33, 11.0507, -14, 0, 0, 0),
	(7, 968, 611.942, -1204.61, 17.939, 0, 90, -160, 300, 500, 0, 0, 0, 3, 'FlintRodeoPeaje3', 608.117, -1204.59, 18.1094, 14, 0, 0, 0),
	(8, 968, 612.418, -1204.44, 17.939, 0, 90, 19.8836, 300, 500, 0, 0, 0, 3, 'FlintRodeoPeaje4', 615.414, -1202.08, 18.1094, 14, 610.65, -1200.48, 18.1542),
	(9, 968, -1387.18, 827.461, 47.4778, 0, 90, -47, 300, 500, 0, 0, 0, 3, 'SfPuentePeaje1', -1385.49, 823.217, 47.4187, 10, -1385.92, 825.214, 47.4096),
	(10, 968, -1387.18, 827.461, 47.4778, 0, 90, 136, 300, 500, 0, 0, 0, 3, 'SfPuentePeaje2', -1390.66, 828.57, 47.4162, 10, -1392.48, 831.218, 47.4356),
	(11, 968, -1406.5, 830.851, 47.4378, 0, 90, 316.5, 300, 500, 0, 0, 0, 3, 'SfPuentePeaje3', -1402.77, 830.173, 47.4609, 10, -1404.8, 831.5, 47.4563),
	(12, 968, -1406.5, 830.851, 47.4378, 0, 90, 137, 300, 500, 0, 0, 0, 3, 'SfPuentePeaje4', -1408.6, 834.94, 47.4554, 10, -1409.6, 835.859, 47.4552);
/*!40000 ALTER TABLE `lac_barriers` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_catalog_vehicles
CREATE TABLE IF NOT EXISTS `lac_catalog_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `maxvelocity` int(11) NOT NULL,
  `fuelcapacity` int(11) NOT NULL,
  `trunkcapacity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_catalog_vehicles: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_catalog_vehicles` DISABLE KEYS */;
INSERT INTO `lac_catalog_vehicles` (`id`, `model`, `price`, `currency`, `maxvelocity`, `fuelcapacity`, `trunkcapacity`) VALUES
	(1, 402, 25, 1, 188, 90, 4),
	(2, 502, 20, 1, 217, 80, 4),
	(3, 503, 20, 1, 217, 80, 4),
	(4, 494, 20, 1, 217, 80, 4),
	(5, 420, 5, 1, 217, 80, 4),
	(6, 444, 30, 1, 0, 0, 0),
	(7, 556, 30, 1, 0, 0, 0),
	(8, 557, 30, 1, 0, 0, 0),
	(9, 495, 25, 1, 0, 0, 0);
/*!40000 ALTER TABLE `lac_catalog_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_doors
CREATE TABLE IF NOT EXISTS `lac_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DoorName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExitX` float NOT NULL DEFAULT 0,
  `ExitY` float NOT NULL DEFAULT 0,
  `ExitZ` float NOT NULL DEFAULT 0,
  `EnterX` float NOT NULL DEFAULT 0,
  `EnterY` float NOT NULL DEFAULT 0,
  `EnterZ` float NOT NULL DEFAULT 0,
  `door_range` float NOT NULL DEFAULT 1,
  `DoorInterior` int(4) NOT NULL DEFAULT 0,
  `ExitVW` int(5) NOT NULL DEFAULT 0,
  `ExitInt` int(4) NOT NULL DEFAULT 0,
  `EnterVW` int(5) NOT NULL DEFAULT 0,
  `EnterInt` int(11) NOT NULL DEFAULT 0,
  `DoorType` int(2) NOT NULL DEFAULT 0,
  `DoorAngleInt` float NOT NULL DEFAULT 0,
  `DoorAngleExt` float NOT NULL DEFAULT 0,
  `MapIconID` int(5) NOT NULL DEFAULT 0,
  `Cargos` int(7) NOT NULL DEFAULT 0,
  `DoorEnabled` int(4) NOT NULL DEFAULT 0,
  `EntryLevel` int(5) NOT NULL DEFAULT 0,
  `iddoor` int(4) NOT NULL,
  `TypeDoor` int(4) NOT NULL,
  `Type_Interior` smallint(6) NOT NULL,
  `faction_owner` int(11) NOT NULL,
  `time_dispute` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_doors: ~75 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_doors` DISABLE KEYS */;
INSERT INTO `lac_doors` (`id`, `DoorName`, `description`, `ExitX`, `ExitY`, `ExitZ`, `EnterX`, `EnterY`, `EnterZ`, `door_range`, `DoorInterior`, `ExitVW`, `ExitInt`, `EnterVW`, `EnterInt`, `DoorType`, `DoorAngleInt`, `DoorAngleExt`, `MapIconID`, `Cargos`, `DoorEnabled`, `EntryLevel`, `iddoor`, `TypeDoor`, `Type_Interior`, `faction_owner`, `time_dispute`) VALUES
	(1, '24/7', ' ', 1833.77, -1842.61, 13.5781, -31.0345, -92.0101, 1003.55, 1, 0, 0, 0, 100, 18, 2, 361.273, 454.722, 17, 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 'Comisaria Los Santos', ' ', 1555.5, -1675.64, 16.1953, 246.84, 62.327, 1003.64, 1, 0, 0, 0, 102, 6, 1, 358.189, 451.418, 30, 0, 0, 0, 0, 0, 0, 0, 0),
	(3, '24/7', ' ', 1315.52, -897.682, 39.5781, -31.0345, -92.0101, 1003.55, 1, 0, 0, 0, 103, 18, 2, 361.273, 180.168, 17, 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 'Tienda de Ropa Zip', ' ', 1456.49, -1137.59, 23.9483, 161.425, -97.1036, 1001.8, 1, 0, 0, 0, 400, 18, 2, 0, 219.227, 45, 0, 0, 0, 0, 0, 0, 0, 0),
	(5, 'Hospital General de Los Santos', ' ', 1172.08, -1323.3, 15.4029, 1188.79, -1317.06, 1334.21, 1, 0, 0, 0, 105, 3, 1, 448.531, 268.907, 0, 3, 1, 0, 0, 0, 3, 0, 0),
	(6, '7-Eleven', ' ', 1000.6, -919.952, 42.3281, 1065.45, -815.453, 1081.97, 1, 0, 0, 0, 106, 9, 2, 269.213, 459.409, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 'Tienda de Ropa Binco', ' ', 2244.3, -1665.54, 15.4766, 207.641, -111.266, 1005.13, 1, 0, 0, 0, 700, 15, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 'GYM Ganton', ' ', 2229.93, -1721.29, 13.5616, 772.296, -5.51421, 1000.73, 1, 0, 0, 0, 108, 5, 1, 0, 493.48, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 'Tienda de Ropa SubUrban', ' ', 2112.81, -1211.46, 23.9644, 203.754, -50.6628, 1001.8, 1, 0, 0, 0, 900, 1, 2, 0, 539.788, 45, 0, 0, 0, 0, 0, 0, 0, 0),
	(10, '24/7', ' ', 1104.83, -1370.03, 13.9844, -31.0288, -92.0101, 1003.55, 1, 0, 0, 0, 109, 18, 2, 361.26, 180, 17, 0, 0, 0, 0, 0, 0, 0, 0),
	(11, '24/7', ' ', 2424.23, -1742.79, 13.5457, -26.6071, -58.2668, 1003.55, 1, 0, 0, 0, 111, 6, 2, 359.516, 403.821, 17, 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 'Bar', ' ', 2310.07, -1643.52, 14.827, 501.921, -67.5635, 998.758, 1, 0, 0, 0, 112, 11, 2, 176.985, 492.861, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(13, 'Club', ' ', 1837.04, -1682.39, 13.3228, 493.481, -24.9612, 1000.67, 1, 0, 0, 0, 113, 17, 2, 359.064, 449.402, 48, 0, 0, 0, 0, 0, 0, 0, 0),
	(14, 'Estación de Radio y Televisión', ' ', -2521.13, -624.953, 132.784, 420.304, 64.2962, 1020.39, 1, 0, 0, 0, 114, 6, 2, 0.982977, 361.88, 0, 0, 0, 2, 0, 0, 0, 0, 0),
	(15, 'Tienda de Prolaps', ' ', 499.504, -1360.62, 16.3691, 207.029, -140.373, 1003.51, 1, 0, 0, 0, 115, 3, 2, 1.05758, 337.896, 45, 0, 0, 0, 0, 0, 0, 0, 0),
	(16, 'Tienda de Ropa Victim', ' ', 461.705, -1500.81, 31.0452, 227.505, -8.15799, 1002.21, 1, 0, 0, 0, 116, 5, 2, 89.7978, 461.516, 45, 0, 0, 0, 0, 0, 0, 0, 0),
	(17, 'Tienda de Ropa Didier Sachs', ' ', 454.211, -1478, 30.8146, 204.288, -168.858, 1000.52, 1, 0, 0, 0, 117, 14, 2, 0.086229, 471.241, 45, 0, 0, 0, 0, 0, 0, 0, 0),
	(18, '24/7', ' ', 1352.42, -1759.25, 13.5078, -25.1907, -141.549, 1003.55, 1, 0, 0, 0, 118, 16, 2, 358.368, 358.992, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19, 'Bar', ' ', -89.6004, 1378.18, 10.4698, -229.295, 1401.15, 27.7656, 1, 0, 0, 0, 119, 18, 2, 268.771, 280.712, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20, 'Banco Plaza', ' ', 1498.45, -1581.97, 13.5498, 834.668, 7.42909, 1004.19, 1, 0, 0, 0, 120, 3, 2, 448.764, 539.013, 52, 0, 0, 0, 0, 0, 0, 0, 0),
	(21, 'Oficina Taxista', ' ', 1752.5, -1894.12, 13.5574, 1494.41, 1303.58, 1093.29, 1, 0, 0, 0, 121, 3, 1, 359.275, 269.076, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22, 'Comisaria Central de San Fierro', ' ', -1605.56, 710.272, 13.8672, 246.42, 107.299, 1003.22, 1, 0, 0, 0, 122, 10, 1, 360.269, 358.606, 30, 0, 0, 0, 0, 0, 0, 0, 0),
	(23, 'Sex Shop', ' ', 953.909, -1336.83, 13.5389, -100.415, -25.0377, 1000.72, 1, 0, 0, 0, 123, 3, 2, 359.956, 360.695, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24, 'Sex Shop', ' ', 1087.69, -922.481, 43.3906, -100.446, -25.0383, 1000.72, 1, 0, 0, 0, 124, 3, 2, 360.298, 539.632, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25, 'Sex Shop', ' ', 1940, -2115.97, 13.6953, -100.425, -25.0378, 1000.72, 1, 0, 0, 0, 125, 3, 2, 360.667, 268.547, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26, 'Sex Shop', ' ', 2421.59, -1219.24, 25.5614, -100.441, -25.0386, 1000.72, 1, 0, 0, 0, 126, 3, 2, 361.508, 539.421, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27, 'Sex Shop', ' ', 2085.12, 2074.06, 11.0547, -100.431, -25.0386, 1000.72, 1, 0, 0, 0, 127, 3, 2, 360.38, 270.622, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28, '24/7', ' ', 2194.94, 1990.92, 12.2969, -25.2126, -141.558, 1003.55, 1, 0, 0, 0, 128, 16, 2, 359.892, 449.761, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29, 'Sex Shop', ' ', 1137.99, -1365.34, 13.9844, -100.446, -25.0383, 1000.72, 1, 0, 0, 0, 129, 3, 2, 360.298, 269.872, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(30, 'Tienda Tuning', ' ', 2318.88, -88.4182, 26.4844, 2308.84, -72.7295, 10.7795, 1, 0, 0, 0, 130, 3, 2, 268.401, 539.623, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31, 'Hospital San Fierro', ' ', -2655.05, 640.166, 14.4545, -2682.43, 629.83, 1297.15, 1, 0, 0, 0, 131, 20, 1, 312.7, 180.242, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32, 'Hospital County General', ' ', 2038.14, -1404.79, 17.2504, 1682.51, -1184.03, 1235.79, 1, 0, 0, 0, 132, 15, 1, 539.956, 450.094, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33, 'Hospital Las Venturas', ' ', 1607.48, 1815.24, 10.8203, 1682.51, -1184.03, 1235.79, 1, 0, 0, 0, 133, 15, 1, 539.956, 360.261, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34, '24/7', ' ', -2442.66, 755.416, 35.1719, -31.0678, -92.0107, 1003.55, 1, 0, 0, 0, 134, 18, 2, 362.504, 180.298, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35, '24/7', ' ', 1582.27, -1171.42, 24.0953, -31.0345, -92.0101, 1003.55, 1, 0, 0, 0, 135, 18, 2, 361.273, 358.769, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36, '7-Eleven', ' ', -78.3825, -1169.92, 2.13544, 1065.45, -815.463, 1081.97, 1, 0, 0, 0, 136, 9, 2, 270.87, 425.182, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37, '7-Eleven', ' ', 1928.58, -1776.29, 13.5469, 1065.45, -815.468, 1081.97, 1, 0, 0, 0, 137, 9, 2, 270.87, 270.67, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38, '7-Eleven', ' ', 1600.01, -2169.91, 13.5587, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 138, 9, 2, 269.909, 449.764, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39, '7-Eleven', ' ', -1676.14, 432.224, 7.17969, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 139, 9, 2, 269.909, 224.79, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40, '7-Eleven', ' ', -2420.16, 969.902, 45.2969, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 140, 9, 2, 269.909, 269.662, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41, '7-Eleven', ' ', -1271.37, 2713.33, 50.2663, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 141, 9, 2, 269.909, 478.118, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42, '7-Eleven', ' ', -1465.75, 1873.42, 32.6328, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 142, 9, 2, 269.909, 184.447, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43, '7-Eleven', ' ', 663.124, 1716.34, 7.1875, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 143, 9, 2, 269.909, 401.346, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44, '7-Eleven', ' ', -1566.56, -2730.32, 48.7435, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 144, 9, 2, 269.909, 416.236, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(45, '7-Eleven', ' ', -2231.48, -2558.3, 31.9219, 1065.45, -815.426, 1081.97, 1, 0, 0, 0, 145, 9, 2, 269.909, 419.244, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46, 'The Well Stacked Pizza	', ' ', 2105.49, -1806.49, 13.5547, 372.303, -133.524, 1001.49, 1, 0, 0, 0, 146, 5, 2, 361.072, 449.154, 50, 0, 0, 0, 1, 1, 0, 0, 0),
	(47, 'Renta de vehículos Whetstone', ' ', -1450.28, -1467.45, 101.758, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 447.178, 34, 0, 0, 0, 0, 0, 0, 0, 0),
	(48, 'Renta de vehículos Quarry', ' ', 905.372, 692.356, 12.2485, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 381.551, 34, 0, 0, 0, 0, 0, 0, 0, 0),
	(49, 'Banco Central de Los Santos', ' ', 1382.15, -1088.8, 28.2123, 644.475, 162.183, 1043.07, 1, 0, 0, 0, 161, 4, 1, 181.177, 451.951, 52, 0, 0, 0, 0, 0, 0, 0, 0),
	(50, 'Trafico de armas', ' ', 1425.96, -1311.73, 13.5547, -85.3645, 290.593, 1009.79, 1, 0, 0, 0, 161, 5, 2, 361.385, 451.472, 19, 0, 0, 0, 0, 0, 0, 0, 0),
	(51, 'Empresa de transportes RS Haul', '~r~~h~iEmpleo!~n~~w~Se ofrece empleo como conductor de un camión.', 2158.72, -2303.77, 13.5228, -931.529, 594.906, 1014.14, 1, 0, 0, 0, 162, 1, 2, 180.147, 316.716, 60, 0, 0, 0, 0, 0, 0, 0, 0),
	(52, 'Verdant Bluffs Car\'s', '~p~~h~iBarato!~n~~w~¿Necesitas un vehículo barato?, nosotros te lo ofrecemos.', 1666.8, -2167.61, 13.5787, -108.84, 176.548, 1100.61, 1, 0, 0, 0, 163, 1, 2, 450.036, 405.298, 55, 0, 0, 0, 0, 0, 2, 0, 0),
	(53, 'City Apartments Basic', ' ', 1492.3, -1135.76, 24.0781, 201.781, 141.533, 1201.94, 1, 0, 0, 0, 164, 1, 2, 271.447, 446.561, 56, 0, 0, 0, 0, 0, 0, 0, 0),
	(54, 'Tienda de electrónica', ' ', 1579.02, -1838.04, 13.4415, 2308.84, -72.7119, 10.7795, 1, 0, 0, 0, 165, 3, 2, 270.104, 449.775, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(55, 'Grotti Car\'s', ' ', 555.362, -1293.86, 17.2482, 555.496, -1294.99, 17.2434, 1, 0, 0, 0, 0, 0, 2, 181.565, 360.219, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56, 'Grotti Car\'s', ' ', 563.473, -1303.33, 17.2454, 187.858, 83.616, 999.219, 1, 0, 0, 0, 167, 1, 2, 360.195, 358.929, 55, 0, 0, 0, 0, 0, 0, 0, 0),
	(57, 'Mina', ' ', 833.541, 934.678, 13.3516, 802.679, 840.343, 8.82222, 1, 0, 0, 0, 168, 1, 2, 470.765, 195.98, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58, 'Planta 2', ' ', 766.5, 797.491, 1.96477, 747.563, 766.434, -3.53339, 1, 0, 168, 1, 169, 1, 2, 471.716, 337.531, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59, 'Planta 3', ' ', 659.454, 748.425, -9.78623, 658.449, 747.81, -9.98085, 1, 0, 169, 1, 170, 1, 2, 459.315, 281.757, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60, 'Planta 4', ' ', 581.242, 770.26, -16.0238, 580.137, 770.39, -16.069, 1, 0, 170, 1, 171, 1, 2, 430.199, 249.484, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61, 'Mercado negro', ' ', 2139.63, -1733.94, 17.2891, -128.529, 67.0395, 1001.86, 1, 0, 0, 0, 172, 1, 3, 359.032, 359.867, 19, 0, 0, 0, 0, 0, 0, 1, 0),
	(62, 'Minería Hunter Quarry', ' ', 884.174, 823.837, 14.3422, -931.531, 594.907, 1014.14, 1, 0, 0, 0, 173, 1, 2, 539.595, 348.238, 60, 0, 0, 0, 0, 0, 0, 0, 0),
	(63, 'Granja Whetstone', ' ', -1449.5, -1530.6, 101.758, -931.536, 594.906, 1014.14, 1, 0, 0, 0, 174, 1, 2, 181.566, 269.301, 60, 0, 0, 0, 0, 0, 4, 0, 0),
	(64, 'Burger Shot', ' ', 1199.28, -918.14, 43.1231, 362.863, -75.1611, 1001.51, 1, 0, 0, 0, 175, 10, 2, 317.241, 186.566, 50, 0, 0, 0, 0, 0, 0, 0, 0),
	(65, 'Burger Shot', ' ', 810.486, -1616.2, 13.5469, 362.863, -75.1611, 1001.51, 1, 0, 0, 0, 176, 10, 2, 317.241, 269.19, 50, 0, 0, 0, 0, 0, 0, 0, 0),
	(66, 'Cluckin\' Bell', ' ', 928.92, -1352.96, 13.3438, 365.629, -11.8438, 1001.85, 1, 0, 0, 0, 177, 9, 2, 360.445, 455.871, 50, 0, 0, 0, 0, 0, 0, 0, 0),
	(67, 'Cluckin\' Bell', ' ', 2398.51, -1899.2, 13.5469, 365.629, -11.8438, 1001.85, 1, 0, 0, 0, 178, 9, 2, 360.445, 362.972, 50, 0, 0, 0, 0, 0, 0, 0, 0),
	(68, 'Taller Verdant Bluffs', ' ', 1554, -2159.46, 13.5587, 1553.89, -2158.52, 13.6856, 1, 0, 0, 0, 0, 0, 2, 361.398, 180.605, 27, 0, 0, 0, 0, 0, 0, 0, 0),
	(69, 'Renta de vehículos Market', ' ', 1231.69, -1422.08, 13.4382, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 181.469, 34, 0, 0, 0, 0, 0, 0, 0, 0),
	(70, 'Renta de vehículos Ocean Docks', ' ', 2280.14, -2209.78, 13.5469, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 494.492, 34, 0, 0, 0, 0, 0, 0, 0, 0),
	(71, 'BikerShop', ' ', 612.571, -1501.83, 14.8995, 611.15, -1501.94, 14.9078, 1, 0, 0, 0, 0, 0, 2, 450.768, 269.817, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72, 'BikerShop', ' ', 602.342, -1512.05, 15.027, 601.609, -1511.89, 35.5394, 1, 0, 0, 0, 171, 1, 2, 449.759, 270.084, 55, 0, 0, 0, 0, 0, 0, 0, 0),
	(73, 'Coutt And Schutz', ' ', 2131.82, -1151.32, 24.0601, 2132.07, -1170.5, 50.1892, 1, 0, 0, 0, 172, 1, 2, 359.601, 363.988, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74, 'Seguros Los Santos', ' ', 1648.33, -1493.85, 13.5469, 1083.57, -1775.66, 1013.68, 1, 0, 0, 0, 173, 1, 2, 180.502, 271.033, 0, 0, 0, 0, 0, 0, 5, 0, 0),
	(75, 'Estacionamiento', ' ', -154.1, 33.1051, 1099.63, 1093.23, -1778.66, 1013.68, 1, 0, 174, 1, 173, 1, 2, 450.502, 449.875, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `lac_doors` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_facciones
CREATE TABLE IF NOT EXISTS `lac_facciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed_load` smallint(11) NOT NULL,
  `Type` int(2) NOT NULL DEFAULT 0,
  `LastUserActivity` int(11) NOT NULL,
  `State` smallint(6) NOT NULL,
  `GameSlot` smallint(4) NOT NULL DEFAULT -1,
  `Points` smallint(6) NOT NULL,
  `Color` smallint(6) NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `slots` smallint(2) NOT NULL DEFAULT 20,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_facciones: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_facciones` DISABLE KEYS */;
INSERT INTO `lac_facciones` (`id`, `Name`, `fixed_load`, `Type`, `LastUserActivity`, `State`, `GameSlot`, `Points`, `Color`, `description`, `creation_date`, `slots`) VALUES
	(1, 'S.A.P.D', 1, 0, 1606954640, 1, 0, 0, 0, 'Departamento de policía de San Andreas. ', '2019-11-02 10:58:01', 20),
	(2, 'F.B.I', 1, 0, 1575539801, 1, 1, 0, 0, 'Departamento de policía de San Andreas.', '2019-11-02 10:58:01', 20);
/*!40000 ALTER TABLE `lac_facciones` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_grafitis
CREATE TABLE IF NOT EXISTS `lac_faction_grafitis` (
  `id_grafiti` int(11) NOT NULL AUTO_INCREMENT,
  `id_faction` int(11) NOT NULL,
  `zone` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `RZ` float NOT NULL DEFAULT 0,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  PRIMARY KEY (`id_grafiti`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_grafitis: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_grafitis` DISABLE KEYS */;
INSERT INTO `lac_faction_grafitis` (`id_grafiti`, `id_faction`, `zone`, `time`, `X`, `Y`, `Z`, `RZ`, `posx`, `posy`, `posz`) VALUES
	(1, 8, 'Willowfield 1', 0, 2014.49, -2125.39, 14.0073, -179.64, 2014.15, -2125.42, 13.5469),
	(2, 0, 'Market 1', 3400, 1131.62, -1340.36, 14.563, -0.139904, 1131.95, -1340.25, 13.9844),
	(3, 0, 'Idlewood 1', 6800, 2015.93, -1778.31, 13.8775, 0, 2016.25, -1778.1, 13.5478),
	(4, 4, 'Idlewood 2', 10200, 2192.43, -1494.82, 24.471, -90.2498, 2192.6, -1495.18, 23.9908),
	(5, 4, 'Temple 1', 13600, 1010.4, -1021.92, 33.0158, 0, 1010.8, -1021.81, 32.1018),
	(6, 0, '', 17000, 2687.52, -1100.45, 70.1084, -179.64, 2687.22, -1100.68, 69.3491),
	(7, 0, '', 20400, 2752.71, -1365.77, 41.843, 179.96, 2752.39, -1365.95, 40.8387),
	(8, 0, '', 23800, 2677.86, -1396.29, 31.5165, -51.0399, 2678.23, -1396.42, 30.5757),
	(9, 0, '', 27200, 1969.54, -1226.12, 20.7221, 96.8601, 1969.33, -1225.84, 20.0234),
	(10, 0, '', 30600, 2452.44, -1942.32, 14.5825, 90.3602, 2452.15, -1941.99, 13.5391),
	(11, 0, '', 34000, 2440.95, -1997.91, 14.3241, -89.8398, 2441.42, -1998.22, 13.5469),
	(12, 8, '', 37400, 2091.6, -1876.39, 14.2315, 179.96, 2091.31, -1876.46, 13.5469),
	(13, 8, '', 40800, 1994.31, -2063.65, 14.0508, 179.96, 1994.03, -2063.94, 13.368),
	(14, 0, '', 44200, 2339.82, -1291.11, 25.0302, -89.9397, 2339.78, -1291.43, 24.2112),
	(15, 0, '', 47600, 2017.12, -1030.15, 25.4089, 179.06, 2016.76, -1030.08, 24.8049),
	(16, 0, '', 51000, 1654.71, 1003.03, 24.7979, -57.0398, 1654.85, -1003.3, 24.0531),
	(17, 0, '', 54400, 1201.34, -1201.61, 20.5006, -90.1397, 1201.31, -1201.9, 19.8881),
	(18, 0, '', 57800, 964.613, -1422.3, 14.3258, -179.94, 964.315, -1422.26, 13.5489);
/*!40000 ALTER TABLE `lac_faction_grafitis` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_questions
CREATE TABLE IF NOT EXISTS `lac_faction_questions` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `id_faction` int(11) DEFAULT NULL,
  `body` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_questions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_faction_questions` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_ranks
CREATE TABLE IF NOT EXISTS `lac_faction_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_faction` int(11) DEFAULT NULL,
  `rank_pos` int(11) DEFAULT NULL,
  `RankName` varchar(21) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_faction` (`id_faction`),
  CONSTRAINT `lac_faction_ranks_ibfk_1` FOREIGN KEY (`id_faction`) REFERENCES `lac_facciones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_ranks: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_faction_ranks` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_rank_perm
CREATE TABLE IF NOT EXISTS `lac_faction_rank_perm` (
  `id_rank` int(11) NOT NULL,
  `permission_0` smallint(2) NOT NULL,
  `permission_1` smallint(2) NOT NULL,
  `permission_2` smallint(2) NOT NULL,
  `permission_3` smallint(2) NOT NULL,
  PRIMARY KEY (`id_rank`),
  CONSTRAINT `lac_faction_rank_perm_ibfk_1` FOREIGN KEY (`id_rank`) REFERENCES `lac_faction_ranks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_rank_perm: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_rank_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_faction_rank_perm` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_requests
CREATE TABLE IF NOT EXISTS `lac_faction_requests` (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_faction` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_request`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_requests: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_faction_requests` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_faction_req_reply
CREATE TABLE IF NOT EXISTS `lac_faction_req_reply` (
  `id_reply` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `reply_body` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reply`),
  KEY `id_request` (`request_id`),
  KEY `id_question` (`id_question`),
  CONSTRAINT `lac_faction_req_reply_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `lac_faction_requests` (`id_request`) ON DELETE CASCADE,
  CONSTRAINT `lac_faction_req_reply_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `lac_faction_questions` (`id_question`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_faction_req_reply: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_faction_req_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_faction_req_reply` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_houses
CREATE TABLE IF NOT EXISTS `lac_houses` (
  `id_casa` int(20) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `pos_x` float NOT NULL DEFAULT 0,
  `pos_y` float NOT NULL DEFAULT 0,
  `pos_z` float NOT NULL DEFAULT 0,
  `pos_a` float NOT NULL,
  `vw` int(11) NOT NULL DEFAULT 0,
  `interior` int(5) NOT NULL DEFAULT 0,
  `house_lock` smallint(2) NOT NULL DEFAULT 0,
  `interior_id` int(4) NOT NULL DEFAULT 0,
  `coins` int(4) NOT NULL DEFAULT 0,
  `property_type` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_casa`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_houses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_houses` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_house_furniture
CREATE TABLE IF NOT EXISTS `lac_house_furniture` (
  `idfurniture` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` int(11) NOT NULL,
  `model` smallint(6) NOT NULL,
  `extra` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `rotz` float NOT NULL,
  `slot` smallint(6) NOT NULL DEFAULT 0,
  `slot2` smallint(6) NOT NULL DEFAULT 0,
  `slot3` smallint(6) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idfurniture`),
  KEY `houseid` (`houseid`),
  CONSTRAINT `lac_house_furniture_ibfk_1` FOREIGN KEY (`houseid`) REFERENCES `lac_houses` (`id_casa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_house_furniture: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_house_furniture` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_house_furniture` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_house_interior
CREATE TABLE IF NOT EXISTS `lac_house_interior` (
  `interior_id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `material` int(11) NOT NULL,
  PRIMARY KEY (`interior_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_house_interior: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_house_interior` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_house_interior` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_item_misc
CREATE TABLE IF NOT EXISTS `lac_item_misc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storageid` int(11) NOT NULL,
  `slot` smallint(6) NOT NULL,
  `itemid` smallint(6) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storageid_slot` (`storageid`,`slot`),
  CONSTRAINT `lac_item_misc_ibfk_1` FOREIGN KEY (`storageid`) REFERENCES `lac_item_storage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_item_misc: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_item_misc` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_item_misc` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_item_storage
CREATE TABLE IF NOT EXISTS `lac_item_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla blueroleplay.lac_item_storage: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_item_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_item_storage` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_parkings
CREATE TABLE IF NOT EXISTS `lac_parkings` (
  `id_parking` int(11) NOT NULL AUTO_INCREMENT,
  `Precio` int(11) NOT NULL DEFAULT 0,
  `Nivel` int(11) NOT NULL DEFAULT 0,
  `ExteriorX` float NOT NULL DEFAULT 0,
  `ExteriorY` float NOT NULL DEFAULT 0,
  `ExteriorZ` float NOT NULL DEFAULT 0,
  `ExteriorA` float NOT NULL DEFAULT 0,
  `Vendida` int(2) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `Owner` varchar(25) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `InteriorExt` int(5) NOT NULL DEFAULT 0,
  `VirtualWorldExt` int(11) NOT NULL DEFAULT 0,
  `InteriorID` int(4) NOT NULL DEFAULT 0,
  `Moneda` int(2) NOT NULL DEFAULT 0,
  `ParkingType` int(2) NOT NULL DEFAULT 0,
  `InteriorInt` int(5) NOT NULL DEFAULT 0,
  `VWInt` int(11) NOT NULL DEFAULT 0,
  `IntX` float NOT NULL DEFAULT 0,
  `IntY` float NOT NULL DEFAULT 0,
  `IntZ` float NOT NULL DEFAULT 0,
  `IntA` float NOT NULL,
  PRIMARY KEY (`id_parking`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_parkings: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_parkings` DISABLE KEYS */;
INSERT INTO `lac_parkings` (`id_parking`, `Precio`, `Nivel`, `ExteriorX`, `ExteriorY`, `ExteriorZ`, `ExteriorA`, `Vendida`, `OwnerID`, `Owner`, `InteriorExt`, `VirtualWorldExt`, `InteriorID`, `Moneda`, `ParkingType`, `InteriorInt`, `VWInt`, `IntX`, `IntY`, `IntZ`, `IntA`) VALUES
	(1, 1000000, 7, 1655.04, -1860.88, 13.5491, 539.952, 0, 0, 'Gobierno', 0, 0, 0, 0, 0, 5, 100001, 1483.51, -1505.64, -53.3867, 70.8826),
	(2, 2000000, 4, 1442.39, -1468.29, 13.5295, 260.336, 0, 0, 'Gobierno', 0, 0, 0, 0, 0, 5, 100002, 1483.51, -1505.64, -53.3867, 70.8826),
	(3, 1000000, 5, -1721.11, -116.954, 3.54892, 494.43, 0, 0, 'Gobierno', 0, 0, 0, 0, 0, 5, 0, 1483.51, -1505.64, -53.3867, 70.8826),
	(4, 0, 1, 1643.73, -1520.74, 13.5584, 539.98, 0, 0, '', 0, 0, 0, 0, 0, 1, 174, -168.994, 13.9354, 1099.63, 0.860937),
	(5, 0, 1, 1636.77, -1520.78, 13.5967, 539.373, 0, 0, '', 0, 0, 0, 0, 0, 1, 174, -180.906, 13.9388, 1099.63, 2.92596);
/*!40000 ALTER TABLE `lac_parkings` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_phone
CREATE TABLE IF NOT EXISTS `lac_phone` (
  `number_phone` int(11) NOT NULL,
  `phone_state` int(11) NOT NULL,
  `phone_game` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`number_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_phone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_phone` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_phone_book
CREATE TABLE IF NOT EXISTS `lac_phone_book` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `id_phone` int(11) NOT NULL,
  `number_contact` int(11) DEFAULT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `id_phone` (`id_phone`),
  CONSTRAINT `lac_phone_book_ibfk_1` FOREIGN KEY (`id_phone`) REFERENCES `lac_phone` (`number_phone`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_phone_book: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_phone_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_phone_book` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_phone_messages
CREATE TABLE IF NOT EXISTS `lac_phone_messages` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `by_phone` int(11) NOT NULL,
  `to_phone` int(11) NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_phone_messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_phone_messages` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_player_betatester
CREATE TABLE IF NOT EXISTS `lac_player_betatester` (
  `id_user` int(11) DEFAULT NULL,
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_player_betatester_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_player_betatester: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_player_betatester` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_player_betatester` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_player_referred
CREATE TABLE IF NOT EXISTS `lac_player_referred` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `referredid` int(11) NOT NULL,
  `completed` smallint(6) DEFAULT 0,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`refid`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_player_referred_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_player_referred: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_player_referred` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_player_referred` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_player_skins
CREATE TABLE IF NOT EXISTS `lac_player_skins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `skinid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_player_skins_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_player_skins: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_player_skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_player_skins` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_property_owner
CREATE TABLE IF NOT EXISTS `lac_property_owner` (
  `id_property` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `slot` tinyint(4) NOT NULL DEFAULT 0,
  `index` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_property`) USING BTREE,
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_property_owner_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_property_owner: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_property_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_property_owner` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_servergral_witems
CREATE TABLE IF NOT EXISTS `lac_servergral_witems` (
  `id_index` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_servergral_witems: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_servergral_witems` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_servergral_witems` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_transactions_bank
CREATE TABLE IF NOT EXISTS `lac_transactions_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `by_user` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `transaction_type` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_transactions_bank_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_transactions_bank: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_transactions_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_transactions_bank` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_transactions_money
CREATE TABLE IF NOT EXISTS `lac_transactions_money` (
  `id_transactions` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `by_user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_transactions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_transactions_money: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_transactions_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_transactions_money` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_users
CREATE TABLE IF NOT EXISTS `lac_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(4) NOT NULL DEFAULT 0,
  `skin` smallint(5) NOT NULL,
  `health` float NOT NULL,
  `armour` float NOT NULL,
  `level` smallint(5) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `money` int(11) NOT NULL,
  `thirst` smallint(5) NOT NULL,
  `hungry` smallint(5) NOT NULL,
  `interior` smallint(5) NOT NULL,
  `virtualworld` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `age` smallint(4) NOT NULL DEFAULT 0,
  `gender` smallint(1) NOT NULL DEFAULT 0,
  `email` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_connection` datetime NOT NULL,
  `Job` int(2) NOT NULL DEFAULT 0,
  `ip` varchar(18) CHARACTER SET latin1 NOT NULL,
  `registration_IP` varchar(18) CHARACTER SET latin1 NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `faction_id` int(5) NOT NULL DEFAULT 0,
  `fact_rank` int(2) NOT NULL DEFAULT 0,
  `jailtime` int(3) NOT NULL DEFAULT 0,
  `placecarcel` int(5) NOT NULL DEFAULT 0,
  `Agonizando` int(1) NOT NULL DEFAULT 0,
  `wantedlevel` int(4) NOT NULL DEFAULT 0,
  `BankBalance` int(11) NOT NULL DEFAULT 0,
  `BankNumber` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `player_exp` smallint(4) NOT NULL DEFAULT 0,
  `HoursPlayed` int(10) NOT NULL DEFAULT 0,
  `MinutesPlayed` int(10) NOT NULL DEFAULT 0,
  `SecondsPlayed` int(10) NOT NULL DEFAULT 0,
  `Online` int(2) NOT NULL DEFAULT 0,
  `InGameID` int(11) NOT NULL DEFAULT -1,
  `type_registry` smallint(2) NOT NULL DEFAULT 0,
  `QuestionTime` int(11) NOT NULL DEFAULT 0,
  `WorkTravel` smallint(5) NOT NULL DEFAULT 0,
  `JobTravelT` smallint(6) NOT NULL DEFAULT 0,
  `JobTravel` smallint(6) NOT NULL DEFAULT 0,
  `JobTravelNext` smallint(6) NOT NULL DEFAULT 0,
  `JobMissionState` smallint(6) NOT NULL DEFAULT 0,
  `JobCheckTime` int(11) NOT NULL DEFAULT 0,
  `JobTimeRem` int(11) NOT NULL DEFAULT 0,
  `LastState` smallint(6) NOT NULL DEFAULT 0,
  `tutorial` smallint(6) NOT NULL DEFAULT 0,
  `syncupdate` smallint(6) NOT NULL DEFAULT 0,
  `RentMinutes` smallint(6) NOT NULL DEFAULT 0,
  `RentSeconds` smallint(6) NOT NULL DEFAULT 0,
  `LimitShopRobbery` smallint(6) NOT NULL DEFAULT 0,
  `interior_type` smallint(6) NOT NULL DEFAULT 0,
  `interior_extra` smallint(6) NOT NULL DEFAULT 0,
  `configdudeoff` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_users` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_uservehicles
CREATE TABLE IF NOT EXISTS `lac_uservehicles` (
  `Car_ID` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(4) NOT NULL DEFAULT 0,
  `pos_x` float NOT NULL DEFAULT 0,
  `pos_y` float NOT NULL DEFAULT 0,
  `pos_z` float NOT NULL DEFAULT 0,
  `pos_angle` float NOT NULL DEFAULT 0,
  `interior` smallint(6) NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `color_1` int(4) NOT NULL DEFAULT 0,
  `color_2` int(4) NOT NULL DEFAULT 0,
  `spawn_x` float NOT NULL DEFAULT 0,
  `spawn_y` float NOT NULL DEFAULT 0,
  `spawn_z` float NOT NULL DEFAULT 0,
  `spawn_a` float NOT NULL,
  `spawn_int` smallint(6) NOT NULL,
  `spawn_vw` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `lock_state` int(2) NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 0,
  `damage_panels` int(10) NOT NULL DEFAULT 0,
  `damage_doors` int(10) NOT NULL DEFAULT 0,
  `damage_lights` int(10) NOT NULL DEFAULT 0,
  `damage_tires` int(10) NOT NULL DEFAULT 0,
  `paintjob` int(5) NOT NULL DEFAULT 0,
  `price` smallint(9) NOT NULL,
  `coins` smallint(2) NOT NULL,
  `plate` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gasoline` int(5) NOT NULL DEFAULT 0,
  `respawntime` int(9) NOT NULL DEFAULT 0,
  `alarm` int(2) NOT NULL DEFAULT 0,
  `type` smallint(6) NOT NULL,
  `slot` smallint(6) NOT NULL,
  `component0` smallint(4) NOT NULL DEFAULT 0,
  `component1` smallint(4) NOT NULL DEFAULT 0,
  `component2` smallint(4) NOT NULL DEFAULT 0,
  `component3` smallint(4) NOT NULL DEFAULT 0,
  `component4` smallint(4) NOT NULL DEFAULT 0,
  `component5` smallint(4) NOT NULL DEFAULT 0,
  `component6` smallint(4) NOT NULL DEFAULT 0,
  `component7` smallint(4) NOT NULL DEFAULT 0,
  `component8` smallint(4) NOT NULL DEFAULT 0,
  `component9` smallint(4) NOT NULL DEFAULT 0,
  `component10` smallint(4) NOT NULL DEFAULT 0,
  `component11` smallint(4) NOT NULL DEFAULT 0,
  `component12` smallint(4) NOT NULL DEFAULT 0,
  `component13` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Car_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_uservehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_uservehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_uservehicles` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_user_inventory
CREATE TABLE IF NOT EXISTS `lac_user_inventory` (
  `id_user` int(11) NOT NULL,
  `index` smallint(6) NOT NULL,
  `item` int(11) NOT NULL,
  `amount` int(8) NOT NULL,
  PRIMARY KEY (`id_user`,`index`),
  UNIQUE KEY `id_user` (`id_user`,`index`),
  CONSTRAINT `lac_user_inventory_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_user_inventory: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_user_inventory` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_user_login_log
CREATE TABLE IF NOT EXISTS `lac_user_login_log` (
  `id_log_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `IP` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log_login`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_user_login_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_user_login_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_user_login_log` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_user_notifications
CREATE TABLE IF NOT EXISTS `lac_user_notifications` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `extra` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL,
  `body` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_user_notifications: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_user_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_user_notifications` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_user_skills
CREATE TABLE IF NOT EXISTS `lac_user_skills` (
  `id_user` int(11) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT 4,
  `skill` smallint(4) DEFAULT 0,
  KEY `id_user` (`id_user`),
  CONSTRAINT `lac_user_skills_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `lac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_user_skills: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_user_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_user_skills` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_vehicles
CREATE TABLE IF NOT EXISTS `lac_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` int(5) NOT NULL DEFAULT 0,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `a` float NOT NULL DEFAULT 0,
  `color1` int(4) NOT NULL DEFAULT 0,
  `color2` int(4) NOT NULL DEFAULT 0,
  `respawndelay` int(9) NOT NULL DEFAULT 900,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `moneda` int(5) NOT NULL DEFAULT 0,
  `IDVeh` int(11) NOT NULL DEFAULT 0,
  `WhereV` int(4) NOT NULL DEFAULT 0,
  `Job` int(4) NOT NULL DEFAULT 0,
  `membership` int(2) NOT NULL DEFAULT 0,
  `typeload` int(3) NOT NULL DEFAULT 0,
  `precio` int(11) NOT NULL DEFAULT 0,
  `velocitymax` int(5) NOT NULL DEFAULT 0,
  `fuelcapacity` int(5) NOT NULL DEFAULT 0,
  `trunkcapacity` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_vehicles: ~69 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_vehicles` DISABLE KEYS */;
INSERT INTO `lac_vehicles` (`id`, `modelo`, `x`, `y`, `z`, `a`, `color1`, `color2`, `respawndelay`, `sale`, `moneda`, `IDVeh`, `WhereV`, `Job`, `membership`, `typeload`, `precio`, `velocitymax`, `fuelcapacity`, `trunkcapacity`) VALUES
	(19, 596, 1570.23, -1711.02, 5.61998, 359.612, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20, 596, 1545.92, -1659.26, 5.61446, 270.862, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21, 596, 1587.47, -1710.85, 5.58831, 0.782108, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22, 596, 1595.52, -1710.77, 5.60784, 359.879, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23, 596, 1601.87, -1704.37, 5.60687, 89.5745, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24, 596, 1601.93, -1696.4, 5.60935, 89.235, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25, 528, 1601.67, -1684.08, 5.9331, 89.0623, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26, 596, 1584.01, -1606.15, 13.104, 179.211, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27, 596, 1576.98, -1606.06, 13.1037, 177.704, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28, 596, 1570.17, -1606.09, 13.1043, 176.792, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29, 596, 1562.39, -1605.9, 13.1037, 177.016, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(30, 528, 1544.08, -1613.55, 13.4309, 269.886, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31, 528, 1544.28, -1606.46, 13.4267, 269.67, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32, 596, 1535.83, -1677.87, 13.1041, 359.937, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33, 596, 1535.84, -1667.3, 13.1051, 359.934, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59, 598, 2273.37, 2442.75, 10.5673, 359.926, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60, 598, 2256.15, 2476.85, 10.5661, 179.876, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61, 598, 2260.36, 2442.83, 10.5681, 359.421, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62, 597, -1593.63, 651.072, 6.95716, 1.04006, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63, 597, -1610.92, 651.266, 6.96692, 1.41998, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64, 597, -1634.61, 651.22, 6.94573, 359.628, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70, 598, 2277.77, 2477.62, 10.5655, 179.135, -1, -1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(80, 567, 2119.63, -1157.8, 24.0862, 359.879, 0, 0, 900, 1, 0, 0, 0, 0, 0, 0, 18000, 0, 0, 0),
	(81, 536, 2135.75, -1128.4, 25.333, 90.096, 1, 1, 900, 1, 0, 0, 0, 0, 0, 0, 15600, 0, 0, 0),
	(82, 535, 2136.1, -1140.73, 25.0341, 87.3208, 119, 119, 900, 1, 0, 0, 0, 0, 0, 0, 15000, 0, 0, 0),
	(83, 412, 2126.38, -1150.27, 24.0205, 1.29872, 7, 7, 900, 1, 0, 0, 0, 0, 0, 0, 12000, 0, 0, 0),
	(84, 534, 2118.67, -1143.13, 24.526, 265.375, 53, 53, 900, 1, 0, 0, 0, 0, 0, 0, 13500, 0, 0, 0),
	(85, 485, 1668.11, -2404.22, 13.2123, 73.6488, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86, 485, 1665.64, -2412.23, 13.2027, 72.0163, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(87, 485, 1666.77, -2408.36, 13.2012, 72.7891, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101, 451, 562.853, -1291.13, 16.9569, 0.059348, 79, 79, 900, 1, 0, 0, 0, 0, 0, 0, 1200000, 0, 0, 0),
	(103, 411, 549.061, -1291.18, 16.9906, 359.547, 112, 112, 900, 1, 0, 0, 0, 0, 0, 0, 1400000, 0, 0, 0),
	(113, 485, -1486.62, -479.419, 5.65665, 6.81025, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114, 485, -1482.91, -478.886, 5.65611, 7.46681, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115, 485, -1479.12, -478.346, 5.65591, 6.99182, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116, 485, -1475.46, -477.823, 5.6578, 8.37893, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117, 485, -1411.22, -180.26, 13.8044, 339.712, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118, 485, -1414.64, -179.013, 13.8049, 339.85, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(119, 485, -1418.01, -177.784, 13.8059, 340.82, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120, 485, -1421.33, -176.572, 13.8056, 340.235, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121, 485, -1425.01, -175.229, 13.8058, 339.564, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122, 485, -1428.54, -173.944, 13.806, 339.546, 1, 1, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(136, 462, 610.055, -1504.98, 14.4955, -120, 7, 7, 900, 1, 0, 0, 0, 0, 0, 0, 30000, 0, 0, 0),
	(137, 586, 610.055, -1511.3, 14.4955, -109, 51, 0, 900, 1, 0, 0, 0, 0, 0, 0, 60000, 0, 0, 0),
	(138, 522, 610.055, -1506.62, 14.4955, -120, 88, 40, 900, 1, 0, 0, 0, 0, 0, 0, 31000, 0, 0, 0),
	(139, 521, 610.055, -1508.49, 14.4955, -59, 71, 71, 900, 1, 0, 0, 0, 0, 0, 0, 92000, 0, 0, 0),
	(140, 500, -1961.06, 258.5, 35.5787, 87.733, 21, 21, 900, 1, 0, 0, 0, 0, 0, 0, 35000, 0, 0, 0),
	(141, 429, 542.173, -1291.39, 16.9235, 0.044234, 3, 1, 900, 1, 1, 0, 0, 0, 0, 0, 17, 0, 0, 0),
	(142, 587, 535.433, -1291.26, 16.9679, 358.638, 40, 1, 900, 1, 0, 0, 0, 0, 0, 0, 70000, 0, 0, 0),
	(143, 506, 528.472, -1291.4, 16.9466, 358.045, 6, 6, 900, 1, 0, 0, 0, 0, 0, 0, 100000, 0, 0, 0),
	(169, 549, 2118.35, -1136.98, 24.7412, 261.515, 10, 10, 1, 1, 0, 0, 0, 0, 0, 0, 8000, 0, 0, 0),
	(192, 525, -1954.1, 259.278, 40.922, 83.4324, 8, 7, 900, 1, 0, 0, 0, 0, 0, 0, 110000, 0, 0, 0),
	(193, 466, 1624.91, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(194, 445, 1629.68, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(195, 422, 1634.9, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(196, 543, 1640.01, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(197, 549, 1644.89, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(198, 551, 1649.77, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(199, 600, 1654.65, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(200, 542, 1659.54, -2167.12, 13.2978, 180, -1, -1, 900, 1, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0),
	(201, 402, 522.539, -1300.41, 17.0751, 333.929, 201, 201, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(202, 415, 529.735, -1301.03, 17.0147, 332.252, 210, 210, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(203, 541, 535.156, -1301.23, 16.8683, 327.515, 188, 190, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(204, 579, 520.521, -1297.01, 21.2666, 37.1408, 78, 78, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(205, 400, 530.694, -1296.76, 21.4311, 321.865, 124, 1, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(206, 554, 545.765, -1297.84, 21.4227, 270.67, 15, 15, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(207, 560, 543.269, -1301.03, 16.9484, 328.418, 10, 10, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(208, 477, 549.534, -1300.64, 16.9993, 324.164, 94, 94, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(209, 603, 563.484, -1297, 17.0835, 89.929, 70, 1, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `lac_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_vehicle_boot
CREATE TABLE IF NOT EXISTS `lac_vehicle_boot` (
  `id_vehicle` int(11) NOT NULL,
  `slot` smallint(5) NOT NULL DEFAULT 0,
  `item` smallint(6) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_vehicle`,`slot`),
  KEY `id_vehicle` (`id_vehicle`),
  CONSTRAINT `lac_vehicle_boot_ibfk_1` FOREIGN KEY (`id_vehicle`) REFERENCES `lac_uservehicles` (`Car_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_vehicle_boot: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_vehicle_boot` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_vehicle_boot` ENABLE KEYS */;

-- Volcando estructura para tabla blueroleplay.lac_vehicle_sharedkeys
CREATE TABLE IF NOT EXISTS `lac_vehicle_sharedkeys` (
  `idsharedkey` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehicle` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`idsharedkey`),
  KEY `id_vehicle` (`id_vehicle`),
  CONSTRAINT `lac_vehicle_sharedkeys_ibfk_1` FOREIGN KEY (`id_vehicle`) REFERENCES `lac_uservehicles` (`Car_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla blueroleplay.lac_vehicle_sharedkeys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lac_vehicle_sharedkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `lac_vehicle_sharedkeys` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
