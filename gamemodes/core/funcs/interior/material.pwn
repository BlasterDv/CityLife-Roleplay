LoadMaterialTexturaAll()
{
	DefineMaterialTextureType(0, "Por defecto", -1, "none",	"none", 0);

	// Paredes
	DefineMaterialTextureType(1, "Madera de pino", 16150, "ufo_bar", "sa_wood08_128", 0xFFFFFFFF);
	DefineMaterialTextureType(2, "Madera de nogal", 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	DefineMaterialTextureType(3, "Madera de avellana", 2030, "cj_tables", "cj_lightwood", 0);
	DefineMaterialTextureType(4, "Madera de abedul", 9818, "ship_brijsfw", "CJ_WOOD1", 0xFFFFFFFF);
	DefineMaterialTextureType(5, "Madera de olmo", 10987, "coveredpath_sfs", "ws_sheetwood", 0xFFFFFFFF);

	DefineMaterialTextureType(6, "Piedras marrones", 9098, "vgesvhouse01", "sw_wallbrick_06", 0xFFFFFFFF);
	DefineMaterialTextureType(7, "Piedras grises", 8671, "vegassland62", "ws_stonewall", 0xFFFFFFFF);

	DefineMaterialTextureType(8, "Ladrillos blancos", 4005, "lanblokd", "citywall1", 0xFFFFFFFF);
	DefineMaterialTextureType(9, "Ladrillos grises", 8645, "vegashsetx", "badhousewall01_128", 0xFFFFFFFF);

	DefineMaterialTextureType(10, "Verde despintado", 17542, "eastls1b_lae2", "comptwall16", 0xFFFFFFFF);
	DefineMaterialTextureType(11, "Pintura verde", 3621, "dockcargo1_las", "ws_plasterwall2", 0xFFFFFFFF);
	DefineMaterialTextureType(12, "Pintura blanca", 13701, "lahillshilhs1c", "ws_white_wall1", 0xFFFFFFFF);
	DefineMaterialTextureType(13, "Naranja oscuro", 17552, "eastls3_lae2", "motel_wall3", 0xFFFFFFFF);
	DefineMaterialTextureType(14, "Rayas oscuras", 12964, "sw_block09", "trail_wall2", 0xFFFFFFFF);

	DefineMaterialTextureType(15, "Vidrio normal", 11391, "hubprops2_sfse", "cj_sheetmetal2", 0xFF7FDBF0);
	DefineMaterialTextureType(16, "Vidrio rojo", 11391, "hubprops2_sfse", "cj_sheetmetal2", 0xFFD12A2A);
	DefineMaterialTextureType(17, "Vidrio morado", 11391, "hubprops2_sfse", "cj_sheetmetal2", 0xFF7FDBF0);
	DefineMaterialTextureType(18, "Vidrio normal", 11391, "hubprops2_sfse", "cj_sheetmetal2", 0xFF7FDBF0);

	DefineMaterialTextureType(19, "Tablas blancas", 1491, "int_doors", "CJ_W_wood", -1);
	DefineMaterialTextureType(20, "Puerta caoba", 1491, "int_doors", "CJ_WOODDOOR2", -1);
	DefineMaterialTextureType(21, "Madera verde", 1491, "int_doors", "CJ_WOODDOOR1", -1);
	DefineMaterialTextureType(22, "Naranja oscuro", 17552, "eastls3_lae2", "motel_wall3", 0xFFFFFFFF);

	DefineMaterialTextureType(23, "Baldosa blanca", 12911, "sw_farm1", "sw_walltile", -1);
	DefineMaterialTextureType(24, "Baldosa blanco y n.", 4570, "stolenbuild03", "sl_dtbuild2wall1", -1);

	DefineMaterialTextureType(25, "Blanco y negro", 16150, "ufo_bar", "dinerfloor01_128", -1);
	DefineMaterialTextureType(26, "Baldosa de cemento", 5815, "lawngrnd", "man_cellarfloor128", -1);
	DefineMaterialTextureType(27, "Alfombra roja", 8463, "vgseland", "triadcarpet2", -1);
	DefineMaterialTextureType(28, "Alfombra negra", 17946,"carter_mainmap", "mp_carter_carpet", -1);
	DefineMaterialTextureType(29, "Alfombra amarilla", 17925, "lae2fake_int", "carpet1kb", -1);
	DefineMaterialTextureType(30, "Cerámicos pequeños",12853, "cunte_gas01", "sw_floor1", -1);
	DefineMaterialTextureType(31, "Azul y amarillo", 16150,  "chairsntable", "mallfloor6", -1);
	DefineMaterialTextureType(32, "Baldosas sucias", 17946, "carter_mainmap", "ab_stripped_floor", -1);
	DefineMaterialTextureType(33, "Baldosas blancas",9169, "vgslowbuild", "concpanel_la", -1);

	DefineMaterialTextureType(34, "Tablas azules", 3310, "sw_poorhouse", "sw_barnwoodblu", -1);
	DefineMaterialTextureType(35, "Ladrillos blancos p.", 8390, "vegasemulticar", "ws_mixedbrick", -1, 40);

	DefineMaterialTextureType(36, "Amarillo", 18646, "MatColours", "yellow", 0xFFFFFFFF, 40);
	DefineMaterialTextureType(37, "Blanco", 18646, "MatColours", "white", 0xFFFFFFFF, 40);
	DefineMaterialTextureType(38, "Naranja", 18646, "MatColours", "orange", 0xFFFFFFFF, 40);
	DefineMaterialTextureType(39, "Azul", 18646, "MatColours", "blue", 0xFFFFFFFF, 40);
	DefineMaterialTextureType(40, "Verde", 18646, "MatColours", "green", 0xFFFFFFFF, 40);
}

LoadPlayerListMaterial(playerid, category, material, size)
{
	new string_price[20], price;
	new name_string[28];

	switch(category)
	{
		case 0: // Walls
		{
			for(new i = 0; i < sizeof ListMaterialWalls; i++)
			{
				price = size*Texture.Info[ ListMaterialWalls[i] ][@Price];
				format(string_price, sizeof(string_price), "~g~$%d", price);

				if(ListMaterialWalls[i] == material)
				{
					format(name_string, sizeof(name_string), "~r~%s", Texture.Info[ ListMaterialWalls[i] ][@Name]);
					vMenu_AddItems(playerid, name_string, string_price, ListMaterialWalls[i]); 
				}
				else
				{
					vMenu_AddItems(playerid, Texture.Info[ ListMaterialWalls[i] ][@Name], string_price, ListMaterialWalls[i]);
				}
			}
			MenuV_Update(playerid);
		}
		case 1: // Techo
		{
			for(new i = 0; i < sizeof ListMaterialCeiling; i++)
			{
				price = size*Texture.Info[ ListMaterialCeiling[i] ][@Price];
				format(string_price, sizeof(string_price), "~g~$%d", price);
				
				if(ListMaterialCeiling[i] == material)
				{
					format(name_string, sizeof(name_string), "~r~%s", Texture.Info[ ListMaterialCeiling[i] ][@Name]);
					vMenu_AddItems(playerid, name_string, string_price, ListMaterialCeiling[i]); 
				}
				else
				{
					vMenu_AddItems(playerid, Texture.Info[ ListMaterialCeiling[i] ][@Name], string_price, ListMaterialCeiling[i]);
				}
			}
			MenuV_Update(playerid);
		}
		case 2: // Floor
		{
			for(new i = 0; i < sizeof ListMaterialFloors; i++)
			{
				price = size*Texture.Info[ ListMaterialFloors[i] ][@Price];
				format(string_price, sizeof(string_price), "~g~$%d", price);
				
				if(ListMaterialFloors[i] == material)
				{
					format(name_string, sizeof(name_string), "~r~%s", Texture.Info[ ListMaterialFloors[i] ][@Name]);
					vMenu_AddItems(playerid, name_string, string_price, ListMaterialFloors[i]); 
				}
				else
				{
					vMenu_AddItems(playerid, Texture.Info[ ListMaterialFloors[i] ][@Name], string_price, ListMaterialFloors[i]);
				}
			}
			MenuV_Update(playerid);
		}
		case 3: // Puertas
		{
			for(new i = 0; i < sizeof ListMaterialDoors; i++)
			{
				price = size*Texture.Info[ ListMaterialDoors[i] ][@Price];
				format(string_price, sizeof(string_price), "~g~$%d", price);
				
				if(ListMaterialDoors[i] == material)
				{
					format(name_string, sizeof(name_string), "~r~%s", Texture.Info[ ListMaterialDoors[i] ][@Name]);
					vMenu_AddItems(playerid, name_string, string_price, ListMaterialDoors[i]); 
				}
				else
				{
					vMenu_AddItems(playerid, Texture.Info[ ListMaterialDoors[i] ][@Name], string_price, ListMaterialDoors[i]);
				}
			}
			MenuV_Update(playerid);
		}
		case 4: // Escaleras
		{
			for(new i = 0; i < sizeof ListMaterialStairsW; i++)
			{
				price = size*Texture.Info[ ListMaterialStairsW[i] ][@Price];
				format(string_price, sizeof(string_price), "~g~$%d", price);

				if(ListMaterialStairsW[i] == material)
				{
					format(name_string, sizeof(name_string), "~r~%s", Texture.Info[ ListMaterialStairsW[i] ][@Name]);
					vMenu_AddItems(playerid, name_string, string_price, ListMaterialStairsW[i]); 
				}
				else
				{
					vMenu_AddItems(playerid, Texture.Info[ ListMaterialStairsW[i] ][@Name], string_price, ListMaterialStairsW[i]);
				}
			}
			MenuV_Update(playerid);
		}
	}
	return 0;
}