LoadFurnitureGeneralAll()
{
	DefineFurnitureHouseType(0, 0, 0, "Por defecto");

	DefineFurnitureHouseType(1, 1802, 2000, "Cama Floreada", 0, 0, 0);
	DefineFurnitureHouseType(2, 1745, 2800, "Cama Night v4", 0, 0, 0);
	DefineFurnitureHouseType(3, 1798, 2400, "Cama Night Single");
	DefineFurnitureHouseType(4, 1793, 1200, "Colchón Bear", -1, -1, -1);
	DefineFurnitureHouseType(5, 2090, 1800, "Cama Bear Single", 0, 0, -1);
	DefineFurnitureHouseType(6, 1799, 2150, "Cama Dormilón Single", 0, 0, 0);
	DefineFurnitureHouseType(7, 1796, 1400, "Cama MiniSueños", 0, 0, 0);

	DefineFurnitureHouseType(8, 2475, 3100, "Estante", 0, -1, -1, .type = FURNITURE_IT_TYPE_SHELF, .capacity = 29);
	DefineFurnitureHouseType(9, 1741, 1000, "Cajonera", 0);
	DefineFurnitureHouseType(10, 2330, 5000, "Armario", 0);
	DefineFurnitureHouseType(11, 2140, 7500, "Alacena ProChef", 2, -1, 1, .offsetx = 1.0);
	DefineFurnitureHouseType(12, 2128, 5100, "Alacena Deluxe", 2, 0, -1, .offsetx = 1.0);
	DefineFurnitureHouseType(13, 2153, 5800, "Alacena PlusMinimal", -1, 1, -1);

	DefineFurnitureHouseType(14, 2141, 3100, "Heladera ProChef", 0, 0, -1, FURNITURE_IT_TYPE_FRIDGE, .messagetype = 1, .capacity = 25);
	DefineFurnitureHouseType(15, 2127, 10400, "Heladera Deluxe", 0, .type = FURNITURE_IT_TYPE_FRIDGE, .messagetype = 1, .offsetx = 0.5, .capacity = 25);
	DefineFurnitureHouseType(16, 2131, 9800, "Heladera ProChef Plus", 0, .type = FURNITURE_IT_TYPE_FRIDGE, .messagetype = 1, .offsetx = 0.5, .capacity = 25);
	DefineFurnitureHouseType(17, 19916, 7000, "Heladera ELEG", 0, 0, -1, .type = FURNITURE_IT_TYPE_FRIDGE, .messagetype = 1, .capacity = 25);

	DefineFurnitureHouseType(18, 2144, 2400, "Cocina SimpleCook", -1, -1, -1);
	DefineFurnitureHouseType(19, 2135, 9400, "Cocina FoodGold", -1, 0, -1);
	DefineFurnitureHouseType(20, 2294, 10000, "Cocina Deluxe", -1, 0, -1);
	DefineFurnitureHouseType(21, 19915, 9400, "Cocina BearCook", -1, -1, -1);
	DefineFurnitureHouseType(22, 19923, 11400, "Cocina MasterFood", 0);

	DefineFurnitureHouseType(23, 11743, 1100, "Cafetera", -1, -1, -1);
	DefineFurnitureHouseType(24, 2149, 559, "Microondas HotFood", -1, -1, -1);
	DefineFurnitureHouseType(25, 2421, 840, "Microondas ELEG", -1);
	DefineFurnitureHouseType(26, 19830, 199, "Licuadora ELEG", -1);
	DefineFurnitureHouseType(27, 1808, 499, "Dispensador de agua", -1);

	DefineFurnitureHouseType(28, 2336, 4100, "Lavadero GreenKitchen", -1, -1, -1);
	DefineFurnitureHouseType(29, 2130, 4800, "Lavadero Deluxe", -1, 2, -1);
	DefineFurnitureHouseType(30, 2136, 5000, "Lavadero FoodGold", -1, 2, -1);
	DefineFurnitureHouseType(31, 2132, 1450, "Lavadero PlusMinimal", -1, 1, -1);
	DefineFurnitureHouseType(32, 2154, 1200, "Lavadero Bear Kitchen ", -1, 1, 1);

	DefineFurnitureHouseType(33, 2152, 450, "Mesada Bear Kitchen", -1, 1, 0);
	DefineFurnitureHouseType(34, 2142, 580, "Mesada Bear One", 2, -1, 1);
	DefineFurnitureHouseType(35, 2157, 840, "Mesada GreenKitchen", -1, -1, -1);
	DefineFurnitureHouseType(36, 19926, 2900, "Mesada MasterFood", -1, -1, -1);

	ListFurnitureType_Picture[0] = DefineFurnitureHouseType(37, 2277, 40, "Cuadro de un gato", -1, -1, -1);
	ListFurnitureType_Picture[1] = DefineFurnitureHouseType(38, 19172, 250, "Paisaje de la ciudad", -1, -1, 1);
	ListFurnitureType_Picture[2] = DefineFurnitureHouseType(39, 2282, 80, "Cuadro atardecer", -1, -1, -1);
	ListFurnitureType_Picture[3] = DefineFurnitureHouseType(40, 2258, 290, "Cuadro de la ciudad", -1, -1, -1);
	ListFurnitureType_Picture[4] = DefineFurnitureHouseType(41, 2263, 84, "Vista a la ciudad de noche", -1, -1, -1);
	ListFurnitureType_Picture[5] = DefineFurnitureHouseType(42, 2260, 89, "Cuadro blanco y negro", -1, -1, -1);
	ListFurnitureType_Picture[6] = DefineFurnitureHouseType(43, 2272, 94, "Cuadro fabricas", -1, -1, -1);
	ListFurnitureType_Picture[7] = DefineFurnitureHouseType(44, 2276, 108, "Cuadro puente San Fierro", -1, -1, -1);
	ListFurnitureType_Picture[8] = DefineFurnitureHouseType(45, 2284, 80, "Cuadro p. inglesa", -1, -1, -1);
	ListFurnitureType_Picture[9] = DefineFurnitureHouseType(46, 2281, 105, "Cuadro de un puente", -1, -1, -1);
	ListFurnitureType_Picture[10] = DefineFurnitureHouseType(47, 2268, 109, "Foto de un gato", -1, -1, -1);
	ListFurnitureType_Picture[11] = DefineFurnitureHouseType(48, 2267, 409, "Foto grande de un barco", -1, -1, -1);
	ListFurnitureType_Picture[12] = DefineFurnitureHouseType(49, 2261, 114, "Foto vista al puente", -1, -1, -1);
	ListFurnitureType_Picture[13] = DefineFurnitureHouseType(50, 19173, 589, "Paisaje a San Fierro", -1, -1, -1);
	ListFurnitureType_Picture[14] = DefineFurnitureHouseType(51, 19174, 499, "Paisaje a Los Santos", -1, -1, -1);
	ListFurnitureType_Picture[15] = DefineFurnitureHouseType(52, 2273, 104, "Cuadro de flores", -1, -1, -1);

	ListFurnitureType_Electronics[0] = DefineFurnitureHouseType(53, 1518, 1450, "Televisor BoxMagic", -1, -1, -1);

	ListFurnitureType_Chairs[0] = DefineFurnitureHouseType(54, 2636, 110, "Silla de madera", -1, -1, -1);
	ListFurnitureType_Chairs[1] = DefineFurnitureHouseType(55, 1811, 112, "Silla SolidWood", -1, -1, -1);
	ListFurnitureType_Chairs[2] = DefineFurnitureHouseType(56, 2121, 140, "Silla metal de colores", -1, -1, -1);
	ListFurnitureType_Chairs[3] = DefineFurnitureHouseType(57, 2125, 200, "Silla central roja", -1, -1, -1);
	ListFurnitureType_Chairs[4] = DefineFurnitureHouseType(58, 2120, 450, "Silla Comodín", -1, -1, -1);
	ListFurnitureType_Chairs[5] = DefineFurnitureHouseType(59, 1806, 540, "Silla SimpleOffice", -1, -1, -1);
	ListFurnitureType_Chairs[6] = DefineFurnitureHouseType(60, 1714, 700, "Silla DeluxeOffice", -1, -1, -1);
	ListFurnitureType_Chairs[7] = DefineFurnitureHouseType(61, 2123, 510, "Silla PlusMinimal", -1, -1, -1);

	ListFurnitureType_Tables[0] = DefineFurnitureHouseType(62, 2030, 4500, "Mesa de Mármol", -1, -1, -1);
	ListFurnitureType_Tables[1] = DefineFurnitureHouseType(63, 2031, 2100, "Mesa ovalada", -1, -1, -1);
	ListFurnitureType_Tables[2] = DefineFurnitureHouseType(64, 2111, 840, "Mesa redonda", -1, -1, -1);
	ListFurnitureType_Tables[3] = DefineFurnitureHouseType(65, 1737, 1150, "Mesa cuadrada", -1, -1, -1);
	ListFurnitureType_Tables[4] = DefineFurnitureHouseType(66, 2115, 440, "Mesa de Madera", -1, -1, -1);
	ListFurnitureType_Tables[5] = DefineFurnitureHouseType(67, 2357, 4980, "Mesa larga", -1, -1, -1);
	ListFurnitureType_Tables[6] = DefineFurnitureHouseType(68, 2110, 490, "Mesa Rectangular", -1, -1, -1);

	ListFurnitureType_Couch[0] = DefineFurnitureHouseType(69, 1703, 4450, "Sofá Classic", -1, -1, -1);
	ListFurnitureType_Couch[1] = DefineFurnitureHouseType(70, 1753, 5400, "Sofá Deluxe", -1, -1, -1);
	ListFurnitureType_Couch[2] = DefineFurnitureHouseType(72, 1754, 2450, "Sillón Deluxe", -1, -1, -1);
	ListFurnitureType_Couch[3] = DefineFurnitureHouseType(73, 1763, 2400, "Sofá Económico", -1, -1, -1);
}