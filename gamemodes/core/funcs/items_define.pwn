CreateItemsInventoryAll()
{
	DefineItemInvType(0, INV_TYPE_NONE, 0, "Vació", false, 19382/*11392*/, 0, -1);
	DefineItemInvType(1, INV_TYPE_WEAPON2, 2, "Palo de golf", false, 333, 1, -1, 2, .extratype = 8);
	DefineItemInvType(2, INV_TYPE_WEAPON2, 3, "Palo de policía", false, 334, 1, -1, 2, .extratype = 8);
	DefineItemInvType(3, INV_TYPE_WEAPON2, 4, "Cuchillo", false, 335, 1, -1, 2, .extratype = 8);
	DefineItemInvType(4, INV_TYPE_WEAPON2, 5, "Bate de béisbol", false, 336, 1, -1, 2, .extratype = 8);
	DefineItemInvType(5, INV_TYPE_WEAPON2, 6, "Pala", false, 352, 1, -1, .extratype = 8);
	DefineItemInvType(6, INV_TYPE_WEAPON2, 7, "Pool", false, 351, 1, -1, .extratype = 8);
	DefineItemInvType(7, INV_TYPE_WEAPON2, 8, "Katana", false, 339, 1, -1, .extratype = 8);
	DefineItemInvType(8, INV_TYPE_WEAPON2, 9, "Motocierra", false, 341, 1, -1, .extratype = 8);
	DefineItemInvType(9, INV_TYPE_WEAPON2, 10, "Dildo morado", false, 321, 1, -1, .extratype = 6);
	DefineItemInvType(10, INV_TYPE_WEAPON2, 11, "Dildo", false, 322, 1, -1, .extratype = 6);
	DefineItemInvType(11, INV_TYPE_WEAPON2, 12, "Vibrador", false, 323, 1, -1, .extratype = 6);
	DefineItemInvType(12, INV_TYPE_WEAPON2, 13, "Vibrador plata", false, 324, 1, -1, .extratype = 6);
	DefineItemInvType(13, INV_TYPE_WEAPON2, 14, "Flores", false, 325, 1, -1, .extratype = 6);
	DefineItemInvType(14, INV_TYPE_WEAPON2, 15, "Baston", false, 326, 1, -1, .extratype = 6);
	DefineItemInvType(15, INV_TYPE_WEAPON2, 16, "Granada", false,342, 1, -1, .extratype = 6);
	DefineItemInvType(16, INV_TYPE_WEAPON2, 17, "Granada de gas", false, 343, 1, -1, 2);
	DefineItemInvType(17, INV_TYPE_WEAPON2, 18, "Motolov", false, 344, 1, -1, 2);
	DefineItemInvType(18, INV_TYPE_WEAPON, 22, "9mm", false, 346, 1, -1, 2, .extratype = 1, .typeinfo = 1);
	DefineItemInvType(19, INV_TYPE_WEAPON, 23, "9mm con silenciador", false, 347, 1, -1, 2, .extratype = 1, .typeinfo = 1);
	DefineItemInvType(20, INV_TYPE_WEAPON, 24, "Desert Eagle", false, 348, 1, -1, .extratype = 1, .typeinfo = 1);
	DefineItemInvType(21, INV_TYPE_WEAPON, 25, "Escopeta", false, 349, 1, -1, .extratype = 2, .typeinfo = 1);
	DefineItemInvType(22, INV_TYPE_WEAPON, 26, "Recortada", false, 350, 1, -1, .extratype = 2, .typeinfo = 1);
	DefineItemInvType(23, INV_TYPE_WEAPON, 27, "EDC", false, 339, 1, -1, .extratype = 2, .typeinfo = 1);
	DefineItemInvType(24, INV_TYPE_WEAPON, 28, "Micro/Uzi", false, 352, 2, -1, .extratype = 3, .typeinfo = 1);
	DefineItemInvType(25, INV_TYPE_WEAPON, 29, "MP5", false, 353, 1, -1, .extratype = 3, .typeinfo = 1);
	DefineItemInvType(26, INV_TYPE_WEAPON, 30, "AK-47", false, 322, 1, -1, .typeinfo = 1);
	DefineItemInvType(27, INV_TYPE_WEAPON, 31, "M4", false, 323, 1, -1, .typeinfo = 1);
	DefineItemInvType(28, INV_TYPE_WEAPON, 32, "Tec-9", false, 372, 2, -1, .extratype = 3, .typeinfo = 1);
	DefineItemInvType(29, INV_TYPE_WEAPON, 33, "Rifle", false, 357, 4, -1, .extratype = 4, .typeinfo = 1);
	DefineItemInvType(30, INV_TYPE_WEAPON, 34, "Sniper Rifle", false,326, 1, -1);
	DefineItemInvType(31, INV_TYPE_WEAPON, 35, "Rocket", false,326, 1, -1);
	DefineItemInvType(32, INV_TYPE_WEAPON, 38, "Minigun", false,362, 1, -1);
	DefineItemInvType(33, INV_TYPE_WEAPON2, 41, "Spray", false,365, 1, -1, .extratype = 7);
	DefineItemInvType(34, INV_TYPE_WEAPON, 42, "Extintor", false,326, 1, -1);
	DefineItemInvType(35, INV_TYPE_WEAPON, 43, "Camara", false,326, 1, -1);

	DefineItemInvType(36, INV_TYPE_DRINK, 1546, "Sprunk", false, 1546, 1, -1, .extratype = 0, .typeinfo = 2);
	DefineItemInvType(37, INV_TYPE_DRINK, 1543, "Cerveza", false, 1543, 1, -1, .typeinfo = 2);
	DefineItemInvType(38, INV_TYPE_DRINK, 1509, "Vino", false, 1509, 1, -1, .typeinfo = 2);
	DefineItemInvType(39, INV_TYPE_DRINK, 19570, "Leche grande", false, 19570, 1, -1, .typeinfo = 2);
	DefineItemInvType(40, INV_TYPE_FOOD, 2702, "Porción de pizza", false, 2702, 1, -1, 1, .extratype = 1, .typeinfo = 2);
	DefineItemInvType(41, INV_TYPE_FOOD, 2769, "Taco de pollo", false, 2769, 1, -1, .extratype = 3, .typeinfo = 2);
	DefineItemInvType(42, INV_TYPE_DRINK, 19820, "Botella de alcohol", false, 19820, 1, -1, .typeinfo = 2);
	DefineItemInvType(43, INV_TYPE_DRINK, 19821, "Vodka", false, 19821, 1, -1, .typeinfo = 2);

	DefineItemInvType(44, INV_TYPE_CAP, 18941, "Gorra negra", false, 18941, 1, -1, 4, true, 0, false, 0.1);
	DefineItemInvType(45, INV_TYPE_HELMET, 1546, "", false, 353, 1, -1);
	DefineItemInvType(46, INV_TYPE_FOOD, 19847, "Pierna ahumada", false, 19847, 1, -1);

	DefineItemInvType(47, INV_TYPE_HELMET, 19107, "Casco camuflado", false, 19107, 1, -1, 0, true, 0);
	DefineItemInvType(48, INV_TYPE_FOOD, 19577, "Tomate fresco", false, 19577, 1, -1, .typeinfo = 2);
	DefineItemInvType(49, INV_TYPE_FOOD, 19574, "Naranja", false, 19574, 1, -1, .typeinfo = 2);
	DefineItemInvType(50, INV_TYPE_FOOD, 19575, "Manzana roja", false, 19575, 1, -1, .typeinfo = 2);
	DefineItemInvType(51, INV_TYPE_FOOD, 19576, "Manzana verde", false, 19576, 1, -1, .typeinfo = 2);
	DefineItemInvType(52, INV_TYPE_FOOD, 19578, "Banana", false, 19578, 1, -1, .typeinfo = 2);
	DefineItemInvType(53, INV_TYPE_DRINK, 2647, "Vaso de cola", false, 2647, 1, -1, .typeinfo = 2);
	DefineItemInvType(54, INV_TYPE_DRINK, 19564, "Jugo de manzana", false, 19564, 1, -1, 5, .typeinfo = 2);
	DefineItemInvType(55, INV_TYPE_DRINK, 19563, "Jugo de naranja", false, 19563, 1, -1, 5, .typeinfo = 2);
	DefineItemInvType(56, INV_TYPE_DRINK, 19569, "Caja de leche", false, 19569, 1, -1, .typeinfo = 2);
	DefineItemInvType(57, INV_TYPE_DRINK, 19835, "Vaso con café", false, 19835, 1, -1, .typeinfo = 2);
	DefineItemInvType(58, INV_TYPE_BACKPAD, 3026, "Mochila", false, 3026, 2, -1, 0, true, 1, false, 0.1, .timedestroy = 0);

	DefineItemInvType(59, INV_TYPE_CARRY_FARMER, 19812, "Leche", false, 19812, 4, -1, 3, false, 0, true);

	ItemType_Phones[0] = DefineItemInvType(60, INV_TYPE_PHONE, 18868, "Celular", false, 18868, 1, -1, .color2 = 0xFF0A0A04);

	DefineItemInvType(61, INV_TYPE_CAP3, 18961, "Gorra de camionero", false, 18961, 1, -1, 0, true, 0);
	DefineItemInvType(62, INV_TYPE_CAP, 18926, "Gorra verde", false, 18926, 1, -1, 0, true, 0);
	DefineItemInvType(63, INV_TYPE_CAP, 18958, "Gorra naranja", false, 18958, 1, -1, 0, true, 0);
	DefineItemInvType(64, INV_TYPE_CAP, 18927, "Gorra azul", false, 18927, 1, -1, 0, true, 0);
	DefineItemInvType(65, INV_TYPE_CAP, 18931, "Gorra azul", false, 18931, 1, -1, 0, true, 0);
	DefineItemInvType(66, INV_TYPE_CAP, 18955, "Gorra naranja", false, 18955, 1, -1, 0, true, 0);
	DefineItemInvType(67, INV_TYPE_CAP2, 18943, "Gorra verde", false, 18943, 1, -1, 0, true, 0);
	DefineItemInvType(68, INV_TYPE_CAP2, 18942, "Gorra gris", false, 18942, 1, -1, 0, true, 0);
	DefineItemInvType(69, INV_TYPE_CAP, 18929, "Gorra verde 1", false, 18929, 1, -1, 0, true, 0);

	DefineItemInvType(70, INV_TYPE_HAT, 18946, "Sombrero gris y rojo", false, 18946, 1, -1, 0, true, 0);
	DefineItemInvType(71, INV_TYPE_HAT, 18947, "Sombrero negro", false, 18947, 1, -1, 0, true, 0);
	DefineItemInvType(72, INV_TYPE_HAT, 18948, "Sombrero azul claro", false, 18948, 1, -1, 0, true, 0);
	DefineItemInvType(73, INV_TYPE_HAT, 18949, "Sombrero verde", false, 18949, 1, -1, 0, true, 0);
	DefineItemInvType(74, INV_TYPE_HAT, 18950, "Sombrero rojo", false, 18950, 1, -1, 0, true, 0);
	DefineItemInvType(75, INV_TYPE_HAT, 18951, "Sombrero amarillo", false, 18951, 1, -1, 0, true, 0);
	DefineItemInvType(76, INV_TYPE_HAT, 19097, "S.Vaquero", false, 19097, 1, -1, 0, true, 0);
	DefineItemInvType(77, INV_TYPE_HAT, 18971, "S.Vaquero rojo", false, 18971, 1, -1, 0, true, 0);
	DefineItemInvType(78, INV_TYPE_HAT, 19098, "S.Vaquero marrón", false, 19098, 1, -1, 0, true, 0);
	DefineItemInvType(79, INV_TYPE_HAT, 18969, "Sombrero amarillo y naranja", false, 18969, 1, -1, 0, true, 0);
	DefineItemInvType(80, INV_TYPE_HAT, 18970, "Sombrero Tigre ", false, 18970, 1, -1, 0, true, 0);
	DefineItemInvType(81, INV_TYPE_HAT, 18971, "Sombrero Cool ", false, 18971, 1, -1, 0, true, 0);
	DefineItemInvType(82, INV_TYPE_HAT, 18972, "Sombrero Cool Naranja ", false, 18972, 1, -1, 0, true, 0);
	DefineItemInvType(83, INV_TYPE_HAT, 18973, "Sombrero Cool Amarillo ", false, 18973, 1, -1, 0, true, 0);
	DefineItemInvType(84, INV_TYPE_HAT, 19095, "Vaquero marrón", false, 19095, 1, -1, 0, true, 0);
	DefineItemInvType(85 ,INV_TYPE_HAT, 18967, "Casco negro ", false, 18967, 1, -1, 0, true, 0);
	DefineItemInvType(86, INV_TYPE_HAT, 18968, "Gris Panamá", false, 18968, 1, -1, 0, true, 0);
	DefineItemInvType(87, INV_TYPE_HAT, 18969, "Casco naranja y amarillo", false, 18969, 1, -1, 0, true, 0);
	DefineItemInvType(88, INV_TYPE_HAT, 19488, "Sombrero blanco", false, 19488, 1, -1, 0, true, 0);

	DefineItemInvType(89, INV_TYPE_CAP2, 18940, "Gorra azul", false, 18940, 1, -1, 0, true, 0); // Atras
	DefineItemInvType(90, INV_TYPE_CAP2, 18939, "Gorra azul mar", false, 18939, 1, -1, 0, true, 0);

	ItemType_Glasses[0] = DefineItemInvType(91, INV_TYPE_GLASSES, 19006, "Lentes rojos", false, 19006, 1, -1, 0, true, 3);
	ItemType_Glasses[1] = DefineItemInvType(92, INV_TYPE_GLASSES, 19007, "Lentes naranjas", false, 19007, 1, -1, 0, true, 3);
	ItemType_Glasses[2] = DefineItemInvType(93, INV_TYPE_GLASSES, 19008, "Lentes verdes", false, 19008, 1, -1, 0, true, 3);
	ItemType_Glasses[3] = DefineItemInvType(94, INV_TYPE_GLASSES, 19009, "Lentes azul", false, 19009, 1, -1, 0, true, 3);
	ItemType_Glasses[4] = DefineItemInvType(95, INV_TYPE_GLASSES, 19010, "Lentes rosa", false, 19010, 1, -1, 0, true, 3);
	ItemType_Glasses[5] = DefineItemInvType(96, INV_TYPE_GLASSES, 19011, "Lentes espirales", false, 19011, 1, -1, 0, true, 3);
	ItemType_Glasses[6] = DefineItemInvType(97, INV_TYPE_GLASSES, 19012, "Lentes negros claro", false, 19012, 1, -1, 0, true, 3);
	ItemType_Glasses[7] = DefineItemInvType(98, INV_TYPE_GLASSES, 19013, "Lentes circulos blancos", false, 19013, 1, -1, 0, true, 3);
	ItemType_Glasses[8] = DefineItemInvType(99, INV_TYPE_GLASSES, 19014, "Lentes cuadros negros", false, 19014, 1, -1, 0, true, 3);
	ItemType_Glasses[9] = DefineItemInvType(100, INV_TYPE_GLASSES, 19015, "Lentes transparentes", false, 19015, 1, -1, 0, true, 3);
	ItemType_Glasses[10] = DefineItemInvType(101, INV_TYPE_GLASSES, 19016, "Lentes x-ray", false, 19016, 1, -1, 0, true, 3);
	ItemType_Glasses[11] = DefineItemInvType(102, INV_TYPE_GLASSES, 19017, "Lentes amarillos", false, 19017, 1, -1, 0, true, 3);
	ItemType_Glasses[12] = DefineItemInvType(103, INV_TYPE_GLASSES, 19018, "Lentes naranjas", false, 19018, 1, -1, 0, true, 3);
	ItemType_Glasses[13] = DefineItemInvType(104, INV_TYPE_GLASSES, 19019, "Lentes rojos", false, 19019, 1, -1, 0, true, 3);
	ItemType_Glasses[14] = DefineItemInvType(105, INV_TYPE_GLASSES, 19020, "Lentes celestes", false, 19020, 1, -1, 0, true, 3);
	ItemType_Glasses[15] = DefineItemInvType(106, INV_TYPE_GLASSES, 19021, "Lentes negros claro", false, 19021, 1, -1, 0, true, 3);
	ItemType_Glasses[16] = DefineItemInvType(107, INV_TYPE_GLASSES, 19022, "Lentes r.grises", false, 19022, 1, -1, 0, true, 3);
	ItemType_Glasses[17] = DefineItemInvType(108, INV_TYPE_GLASSES, 19023, "Lentes r.azules", false, 19023, 1, -1, 0, true, 3);
	ItemType_Glasses[18] = DefineItemInvType(109, INV_TYPE_GLASSES, 19024, "Lentes r.morados", false, 19024, 1, -1, 0, true, 3);
	ItemType_Glasses[19] = DefineItemInvType(110, INV_TYPE_GLASSES, 19025, "Lentes r.rosas", false, 19025, 1, -1, 0, true, 3);
	ItemType_Glasses[20] = DefineItemInvType(111, INV_TYPE_GLASSES, 19026, "Lentes r.rojos", false, 19026, 1, -1, 0, true, 3);
	ItemType_Glasses[21] = DefineItemInvType(112, INV_TYPE_GLASSES, 19027, "Lentes r.naranjas", false, 19027, 1, -1, 0, true, 3);
	ItemType_Glasses[22] = DefineItemInvType(113, INV_TYPE_GLASSES, 19028, "Lentes r.amarillos", false, 19028, 1, -1, 0, true, 3);
	ItemType_Glasses[23] = DefineItemInvType(114, INV_TYPE_GLASSES, 19029, "Lentes r.verdes", false, 19029, 1, -1, 0, true, 3);
	ItemType_Glasses[24] = DefineItemInvType(115, INV_TYPE_GLASSES, 19030, "Lentes gris claro", false, 19030, 1, -1, 0, true, 3);
	ItemType_Glasses[25] = DefineItemInvType(116, INV_TYPE_GLASSES, 19031, "Lentes amarillo claro ", false, 19031, 1, -1, 0, true, 3);
	ItemType_Glasses[26] = DefineItemInvType(117, INV_TYPE_GLASSES, 19032, "Lentes rojo claro", false, 19032, 1, -1, 0, true, 3);
	ItemType_Glasses[27] = DefineItemInvType(118, INV_TYPE_GLASSES, 19033, "Lentes negros", false, 19033, 1, -1, 0, true, 3);
	ItemType_Glasses[28] = DefineItemInvType(119, INV_TYPE_GLASSES, 19034, "Lentes cuadrado.p negros", false, 19034, 1, -1, 0, true, 3);
	ItemType_Glasses[29] = DefineItemInvType(120, INV_TYPE_GLASSES, 19035, "Lentes azul eléctrico", false, 19035, 1, -1, 0, true, 3);
	ItemType_Glasses[30] = DefineItemInvType(121, INV_TYPE_GLASSES, 19138, "Lentes policía negros", false, 19138, 1, -1, 0, true, 3);
	ItemType_Glasses[31] = DefineItemInvType(122, INV_TYPE_GLASSES, 19139, "Lentes policía rojos", false, 19139, 1, -1, 0, true, 3);
	ItemType_Glasses[32] = DefineItemInvType(123, INV_TYPE_GLASSES, 19140, "Lentes policía azules", false, 19140, 1, -1, 0, true, 3);
	ItemType_Masks[0] = DefineItemInvType(124, INV_TYPE_MASK, 18911, "Bandana negra", false, 18911, 1, -1, 0, true, 4);
	ItemType_Masks[1] = DefineItemInvType(125, INV_TYPE_MASK, 18912, "Bandana negra y blanco", false, 18912, 1, -1, 0, true, 4);
	ItemType_Masks[2] = DefineItemInvType(126, INV_TYPE_MASK, 18913, "Bandana verde oscuro", false, 18913, 1, -1, 0, true, 4);
	ItemType_Masks[3] = DefineItemInvType(127, INV_TYPE_MASK, 18914, "Bandana verde camuflado", false, 18914, 1, -1, 0, true, 4);
	ItemType_Masks[4] = DefineItemInvType(128, INV_TYPE_MASK, 18915, "Bandana rosa", false, 18915, 1, -1, 0, true, 4);
	ItemType_Masks[5] = DefineItemInvType(129, INV_TYPE_MASK, 18916, "Bandana amarilla", false, 18916, 1, -1, 0, true, 4);
	ItemType_Masks[6] = DefineItemInvType(130, INV_TYPE_MASK, 18917, "Bandana azul y blanco", false, 18917, 1, -1, 0, true, 4);
	ItemType_Masks[7] = DefineItemInvType(131, INV_TYPE_MASK, 18918, "Bandana verde musgo", false, 18918, 1, -1, 0, true, 4);
	ItemType_Masks[8] = DefineItemInvType(132, INV_TYPE_MASK, 18919, "Bandana blanco y negro", false, 18919, 1, -1, 0, true, 4);
	ItemType_Masks[9] = DefineItemInvType(133, INV_TYPE_MASK, 18920, "Bandana floreada", false, 18920, 1, -1, 0, true, 4);
	// Reloj
	ItemType_Watches[0] = DefineItemInvType(134, INV_TYPE_WATCH, 19039, "Reloj oro", false, 19039, 1, -1, 0, true, 5);
	ItemType_Watches[1] = DefineItemInvType(135, INV_TYPE_WATCH, 19040, "Reloj plata ", false, 19040, 1, -1, 0, true, 5);
	ItemType_Watches[2] = DefineItemInvType(136, INV_TYPE_WATCH, 19041, "Reloj oro falso", false, 19041, 1, -1, 0, true, 5);
	ItemType_Watches[3] = DefineItemInvType(137, INV_TYPE_WATCH, 19042, "Reloj oro y negro", false, 19042, 1, -1, 0, true, 5);
	ItemType_Watches[4] = DefineItemInvType(138, INV_TYPE_WATCH, 19043, "Reloj plata y blanco", false, 19043, 1, -1, 0, true, 5);
	ItemType_Watches[5] = DefineItemInvType(139, INV_TYPE_WATCH, 19044, "Reloj morado", false, 19044, 1, -1, 0, true, 5);
	ItemType_Watches[6] = DefineItemInvType(140, INV_TYPE_WATCH, 19045, "Reloj rojo", false, 19045, 1, -1, 0, true, 5);
	ItemType_Watches[7] = DefineItemInvType(141, INV_TYPE_WATCH, 19046, "Reloj verde", false, 19046, 1, -1, 0, true, 5);
	ItemType_Watches[8] = DefineItemInvType(142, INV_TYPE_WATCH, 19047, "Reloj morado oscuro", false, 19047, 1, -1, 0, true, 5);
	ItemType_Watches[9] = DefineItemInvType(143, INV_TYPE_WATCH, 19048, "Reloj azul y negro", false, 19048, 1, -1, 0, true, 5);
	ItemType_Watches[10] = DefineItemInvType(144, INV_TYPE_WATCH, 19049, "Reloj naranja y morado", false, 19049, 1, -1, 0, true, 5);
	ItemType_Watches[11] = DefineItemInvType(145, INV_TYPE_WATCH, 19050, "Reloj azul y celeste", false, 19050, 1, -1, 0, true, 5);
	ItemType_Watches[12] = DefineItemInvType(146, INV_TYPE_WATCH, 19051, "Reloj naranja y negro", false, 19051, 1, -1, 0, true, 5);
	ItemType_Watches[13] = DefineItemInvType(147, INV_TYPE_WATCH, 19052, "Reloj rosa y rojo", false, 19052, 1, -1, 0, true, 5);
	ItemType_Watches[14] = DefineItemInvType(148, INV_TYPE_WATCH, 19053, "Reloj musgo y negro", false, 19053, 1, -1, 0, true, 5);

	DefineItemInvType(149, INV_TYPE_CAP, 18928, "Gorra colorida", false, 18928, 1, -1, 0, true, 0);
	DefineItemInvType(150, INV_TYPE_CAP, 18929, "Gorra verde estampados", false, 18929, 1, -1, 0, true, 0);
	DefineItemInvType(151, INV_TYPE_CAP, 18930, "Gorra naranja manchas", false, 18930, 1, -1, 0, true, 0);
	DefineItemInvType(152, INV_TYPE_CAP, 18932, "Gorra naranja con rayas", false, 18932, 1, -1, 0, true, 0);
	DefineItemInvType(153, INV_TYPE_CAP, 18933, "Gorra blanca con negro", false, 18933, 1, -1, 0, true, 0);
	DefineItemInvType(154, INV_TYPE_CAP, 18934, "Gorra roja", false, 18934, 1, -1, 0, true, 0);
	DefineItemInvType(155, INV_TYPE_CAP, 18935, "Gorra amarilla", false, 18935, 1, -1, 0, true, 0);

	DefineItemInvType(156, INV_TYPE_BERET, 18921, "Boina negra", false, 18921, 1, -1, 0, true, 0);
	DefineItemInvType(157, INV_TYPE_BERET, 18922, "Boina roja", false, 18922, 1, -1, 0, true, 0);
	DefineItemInvType(158, INV_TYPE_BERET, 18923, "Boina azul", false, 18923, 1, -1, 0, true, 0);
	DefineItemInvType(159, INV_TYPE_BERET, 18924, "Boina camuflada", false, 18924, 1, -1, 0, true, 0);
	DefineItemInvType(160, INV_TYPE_BERET, 18925, "Boina roja brillante", false, 18925, 1, -1, 0, true, 0);

	DefineItemInvType(161, INV_TYPE_OBJECTTHIEVES, 19894, "Laptop", false, 19894, 9, -1, 0, false, 0);
	DefineItemInvType(162, INV_TYPE_OBJECTTHIEVES, 2190, "PC 1", false, 2190, 9, -1, 0, false, 0, true);
	DefineItemInvType(163, INV_TYPE_OBJECTTHIEVES, 2226, "Radio portátil", false, 2226, 9, -1, 0, false, 0, true);
	DefineItemInvType(164, INV_TYPE_OBJECTTHIEVES, 2028, "PlayGame 4", false, 2028, 9, -1, 0, false, 0, true);
	DefineItemInvType(165, INV_TYPE_OBJECTTHIEVES, 2317, "TV 1", false, 2317, 9, -1, 0, false, 0, true);

	DefineItemInvType(166, INV_TYPE_HAMMERMINER, 19631, "Mazo", false, 19631, 1, -1);
	DefineItemInvType(167, INV_TYPE_HAT2, 18638, "Casco seguridad", false, 18638, 1, -1, 0, true, 0);

	ItemType_Minerals[0] = DefineItemInvType(168, INV_TYPE_MIN_COPPER, 3930, "Cobre", false, 3930, 7, 0xFFA44F00, 0, false, 0, true);
	ItemType_Minerals[1] = DefineItemInvType(169, INV_TYPE_MIN_GRANITE, 3930, "Granito", false, 3930, 7, 0xFFCBA27C, 0, false, 0, true);
	ItemType_Minerals[2] = DefineItemInvType(170, INV_TYPE_MIN_NATURALGRAP, 3930, "Grafito natural", false, 3930, 7, 0xFF343434, 0, false, 0, true);
	ItemType_Minerals[3] = DefineItemInvType(171, INV_TYPE_MIN_IRON, 3930, "Hierro", false, 3930, 7, 0xFFB4B4B4, 0, false, 0, true);
	ItemType_Minerals[4] = DefineItemInvType(172, INV_TYPE_MIN_COAL, 3930, "Carbón", false, 3930, 7, 0xFF242424, 0, false, 0, true);
	ItemType_Minerals[5] = DefineItemInvType(173, INV_TYPE_MIN_SULFUR, 3930, "Sulfuro", false, 3930, 7, 0xFFDAD57B, 0, false, 0, true);
	ItemType_Minerals[6] = DefineItemInvType(174, INV_TYPE_MIN_LEAD, 3930, "Plomo", false, 3930, 7, 0xFF7C7C7C, 0, false, 0, true);
	ItemType_Minerals[7] = DefineItemInvType(175, INV_TYPE_MIN_SILVER, 3930, "Plata", false, 3930, 7, 0xFFE4E4E4FF, 0, false, 0, true);
	ItemType_Minerals[8] = DefineItemInvType(176, INV_TYPE_MIN_MAGNESIUM, 3930, "Magnesio", false, 3930, 7, 0xFFCFCFCF, 0, false, 0, true);
	ItemType_Minerals[9] = DefineItemInvType(177, INV_TYPE_MIN_DIAMOND, 3930, "Diamante", false, 3930, 7, 0xFF40B8D0, 0, false, 0, true);

	ItemType_Phones[1] = DefineItemInvType(178, INV_TYPE_PHONE, 18865, "Celular", false, 18865, 1, -1, .color2 = 0xFFF17907);
	ItemType_Phones[2] = DefineItemInvType(179, INV_TYPE_PHONE, 18866, "Celular", false, 18866, 1, -1, .color2 = 0xFF376A82);
	ItemType_Phones[3] = DefineItemInvType(180, INV_TYPE_PHONE, 18867, "Celular", false, 18867, 1, -1, .color2 = 0xFFD84211);
	ItemType_Phones[4] = DefineItemInvType(181, INV_TYPE_PHONE, 18869, "Celular", false, 18869, 1, -1, .color2 = 0xFFF182B5);
	ItemType_Phones[5] = DefineItemInvType(182, INV_TYPE_PHONE, 18870, "Celular", false, 18870, 1, -1, .color2 = 0xFFC00801);
	ItemType_Phones[6] = DefineItemInvType(183, INV_TYPE_PHONE, 18871, "Celular", false, 18871, 1, -1, .color2 = 0xFF0B8501);
	ItemType_Phones[7] = DefineItemInvType(184, INV_TYPE_PHONE, 18872, "Celular", false, 18872, 1, -1, .color2 = 0xFF001737);
	ItemType_Phones[8] = DefineItemInvType(185, INV_TYPE_PHONE, 18873, "Celular", false, 18873, 1, -1, .color2 = 0xFFF4E212);
	ItemType_Phones[9] = DefineItemInvType(186, INV_TYPE_PHONE, 18874, "Celular", false, 18874, 1, -1, .color2 = 0xFFF2E7CB);

	DefineItemInvType(187, INV_TYPE_WEAPONAMMO, 19995, "Cargador pistola", false, 19995, 1, -1, .typeinfo = 1);	
	DefineItemInvType(188, INV_TYPE_WEAPONAMMO, 3052, "Munición pistola", false, 3052, 1, 0xFF2F2F2F, .typeinfo = 1);	
	DefineItemInvType(189, INV_TYPE_WEAPONAMMO2, 3052, "Munición Subfusil", false, 3052, 1, 0xFFCFCFCF, .typeinfo = 1);	
	DefineItemInvType(190, INV_TYPE_WEAPONAMMO3, 3052, "Munición Escopeta", false, 3052, 1, 0xFFC17111, .typeinfo = 1);	
	DefineItemInvType(191, INV_TYPE_WEAPONAMMO4, 3052, "Cargador Rifle", false, 3052, 1, 0xFF8D2F2F, .typeinfo = 1);

	DefineItemInvType(192, INV_TYPE_BANDAGES, 11747, "Vendaje", false, 11747, 1 -1, .typeinfo = 1);	
	DefineItemInvType(193, INV_TYPE_KITMEDIC, 11738, "Botiquín", false, 11738, 1, -1);	
	DefineItemInvType(194, INV_TYPE_ANALGESICS, 11736, "Anestésico", false, 11736, -1, .typeinfo = 1);

	DefineItemInvType(195, INV_TYPE_HAT3, 18964, "Gorro de negro", false, 19064, 1, -1, 0, true, 0);
	DefineItemInvType(196, INV_TYPE_HAT3, 18965, "Gorro de negro", false, 18965, 1, -1, 0, true, 0);

	DefineItemInvType(197, INV_TYPE_REPAIRKIT, 19921, "Kit de reparación", false, 19921, 2, -1, 7);	
	DefineItemInvType(198, INV_TYPE_PETROLCAN, 1650, "Bidón", false, 1650, 2, -1, .typeinfo = 2);

	DefineItemInvType(199, INV_TYPE_DRINK, 2647, "Vaso de cola", false, 2647, 1, -1, .extratype = 0);
	DefineItemInvType(200, INV_TYPE_FOOD, 2703, "Hamburguesa", false, 2703, 1, -1, .extratype = 2);

	DefineItemInvType(201, INV_TYPE_HAT3, 19064, "Gorro de navidad", false, 19064, 1, -1, 0, true, 0);
	DefineItemInvType(202, INV_TYPE_HAT3, 19065, "Gorro de navidad", false, 19065, 1, -1, 0, true, 0);
	DefineItemInvType(203, INV_TYPE_HAT3, 19066, "Gorro de navidad", false, 19066, 1, -1, 0, true, 0);
	DefineItemInvType(204, INV_TYPE_HAT3, 18966, "Gorro colorido", false, 18966, 1, -1, 0, true, 0);

	DefineItemInvType(205, INV_TYPE_FARMER_MILKEBUCKET, 19468, "Balde con leche", false, 19468, 1, -1, 3, false, 0, true);
}