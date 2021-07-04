new Float:pos_get_work_var[][6] = {
	{ 0.0, 0.0, 0.0 },
	{ 1174.9558,-1359.4973,14.3753 }, // Medico - 1
	{ -928.1723,590.7369,1014.1428 }, // Camionero - 2
	{ -927.7655, 590.9298, 1014.1427, -928.1618, 590.9899, 162.0  }, // Chalequero - 3
	{ -927.7655, 590.9298, 1014.1427, -928.1618, 590.9899, 174.0 }, // Granjero - 4
	{ -927.7655, 590.9298, 1014.1427, -928.1618, 590.9899, 173.0 } // Minero - 5

	/*CreateDynamic3DTextLabel("\t{FFFFFF}Para conseguir el trabajo de piloto, usa {00C0FF}/trabajo piloto{FFFFFF}.", -1, 1946.5291,-2223.7041,13.6406, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);*/
	/*CreateDynamic3DTextLabel("\t{FFFFFF}Para conseguir el trabajo de mecánico, escribe {00C0FF}/trabajo mecanico{FFFFFF}.", COLOR_TXT3DT, -1858.3964,140.8488,15.3312, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);*/
};

new Work_Skills_Data[][] = {
	{ }, // 0
	{ 0 },
	{ 0, 14, 40, 100, 140, 184, 200 },
	{ 0 },
	{ 0, 14, 40, 84, 118, 188 },
	{ 0, 20, 54, 148, 241, 280, 410, 440, 500, 780, 1280 }
};

/*new FACTION_RANKS_PERMISS_LIST[][] =
{
	"Cambiar nombre",
	"Invitar",
	"Solicitudes",
	"Enviar mensaje",
	"Expulsar",
	"Cambiar rangos",
	"Modificar rangos",
	"Agregar preguntas",
	"Cambiar color",
	"Iniciar guerra",
	"Eliminar banda"
};*/

new FACTION_RANKS_PERMISS[][] =
{
	"Invitar y aceptar",
	"Expulsar y enviar mensajes",
	"Cambiar rangos",
//	"Modificar rangos y preguntas",
	"Iniciar actividades"
};

new MESSAGE_AREA_TYPE[][40] = {
	"para usar.",
	"para revisar la~n~heladera."
};

new IconListLeftGPS[] = { 60, 56, 22, 17, 50, 55, 27, 34 };

new ListMaterialWalls[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 23, 24, 35, 36 };
new ListMaterialStairsW[] = { 1, 2, 3, 4, 5 };
new ListMaterialDoors[] = { 19, 20, 21, 22 };
new ListMaterialFloors[] = { 25, 26, 27, 28, 29, 30, 31, 32, 33, 34 };
new ListMaterialCeiling[] = { 1, 2, 3, 4, 5 };

new const ListMaterialFurniture_Type[][11] = 
{
	{ 0, 1, 2, 3, 4, 5, 36, 37, 38, 39, 40 },
	{ 0, 36, 37, 38, 39, 40 }, // Colors
	{ 0, 1, 2, 3, 4, 5 } // Wood
};

new ListMaterialFurnitureType[] = { 0, 1, 2, 3, 4, 5, 36, 37, 38, 39, 40 };
new ListMaterialFurnitureTypeColor[] = { 0, 36, 37, 38, 39, 40 };
new ListMaterialFurnitureTypeWood[] = { 0, 1, 2, 3, 4, 5 };

new ListFurnitureType_Couch[4];
new ListFurnitureType_Picture[16];
new ListFurnitureType_Electronics[1];
new ListFurnitureType_Tables[7];
new ListFurnitureType_Chairs[8];