new const ListFurnitureTypeBeed[] = { 1, 2, 3, 4, 5, 6, 7 };
new const ListFurnitureTypeStorage[] = { 9, 8, 10, 11, 12, 13 };
new const ListFurnitureTypeKitchen[] = { 26, 27, 24, 25, 23, 14, 15, 16, 17, 18, 19, 20, 21, 22 };
new const ListFurnitureTypeCountertops[] = { 33, 34, 35, 32, 31, 36, 28, 29, 30 };

LoadPlayerListFurniture(playerid, category)
{
	new price[20];

	switch(category)
	{
		case 1:
		{
			for(new i; i < sizeof ListFurnitureTypeStorage; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ ListFurnitureTypeStorage[i] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ ListFurnitureTypeStorage[i] ][@Name], price, ListFurnitureTypeStorage[i]);
			}
		}
		case 2:
		{
			for(new i; i < sizeof ListFurnitureTypeBeed; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ ListFurnitureTypeBeed[i] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ ListFurnitureTypeBeed[i] ][@Name], price, ListFurnitureTypeBeed[i]);
			}
		}
		case 3:
		{
			for(new i; i < sizeof ListFurnitureTypeKitchen; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ ListFurnitureTypeKitchen[i] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ ListFurnitureTypeKitchen[i] ][@Name], price, ListFurnitureTypeKitchen[i]);
			}
		}
		case 4:
		{
			new data_sort[16][2];

			for(new i; i < sizeof ListFurnitureType_Picture; i++)
			{
				data_sort[i][0] = ListFurnitureType_Picture[i];
				data_sort[i][1] = Furniture.Info[ ListFurnitureType_Picture[i] ][@Price];
			}
			SortDeepArray(data_sort, 1, .order = SORT_ASC, .size = sizeof(ListFurnitureType_Picture));
			
			for(new i; i < sizeof ListFurnitureType_Picture; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ data_sort[i][0] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ data_sort[i][0] ][@Name], price, data_sort[i][0]);
			}
		}
		case 5:
		{
			new data_sort[1][2];

			for(new i; i < sizeof ListFurnitureType_Electronics; i++)
			{
				data_sort[i][0] = ListFurnitureType_Electronics[i];
				data_sort[i][1] = Furniture.Info[ ListFurnitureType_Electronics[i] ][@Price];
			}
			SortDeepArray(data_sort, 1, .order = SORT_ASC, .size = sizeof(ListFurnitureType_Electronics));
			
			for(new i; i < sizeof ListFurnitureType_Electronics; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ data_sort[i][0] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ data_sort[i][0] ][@Name], price, data_sort[i][0]);
			}
		}
		case 7:
		{
			for(new i; i < sizeof ListFurnitureTypeCountertops; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ ListFurnitureTypeCountertops[i] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ ListFurnitureTypeCountertops[i] ][@Name], price, ListFurnitureTypeCountertops[i]);
			}
		}
		case 8:
		{
			new data_sort[8][2];

			for(new i; i < sizeof ListFurnitureType_Chairs; i++)
			{
				data_sort[i][0] = ListFurnitureType_Chairs[i];
				data_sort[i][1] = Furniture.Info[ ListFurnitureType_Chairs[i] ][@Price];
			}
			SortDeepArray(data_sort, 1, .order = SORT_ASC, .size = sizeof(ListFurnitureType_Chairs));
			
			for(new i; i < sizeof ListFurnitureType_Chairs; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ data_sort[i][0] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ data_sort[i][0] ][@Name], price, data_sort[i][0]);
			}
			
		}
		case 9:
		{
			new data_sort[4][2];

			for(new i; i < sizeof ListFurnitureType_Couch; i++)
			{
				data_sort[i][0] = ListFurnitureType_Couch[i];
				data_sort[i][1] = Furniture.Info[ ListFurnitureType_Couch[i] ][@Price];
			}
			SortDeepArray(data_sort, 1, .order = SORT_ASC, .size = sizeof(ListFurnitureType_Couch));
			
			for(new i; i < sizeof ListFurnitureType_Couch; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ data_sort[i][0] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ data_sort[i][0] ][@Name], price, data_sort[i][0]);
			}
			
		}
		case 10:
		{
			new data_sort[7][2];

			for(new i; i < sizeof ListFurnitureType_Tables; i++)
			{
				data_sort[i][0] = ListFurnitureType_Tables[i];
				data_sort[i][1] = Furniture.Info[ ListFurnitureType_Tables[i] ][@Price];
			}
			SortDeepArray(data_sort, 1, .order = SORT_ASC, .size = sizeof(ListFurnitureType_Tables));
			
			for(new i; i < sizeof ListFurnitureType_Tables; i++)
			{
				format(price, sizeof(price), "~g~$%s", FormatNumber(Furniture.Info[ data_sort[i][0] ][@Price]));
				vMenu_AddItems(playerid, Furniture.Info[ data_sort[i][0] ][@Name], price, data_sort[i][0]);
			}
		}
	}
	MenuV_Update(playerid);
	
}

ShowMessageInfoEditFurniture(playerid)
{
	if(GetPlayerOpenNotifID(playerid, VNOTI_TYPE_INFOEDITFURNITURE) != BOXNOTIF_INVALID_ID) return 1;

	new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_INFOEDITFURNITURE, true, 54.0);

	funct_CreateTextdrawTextNotifEx(playerid, i, 0, "~g~Terminar~n~~w~Rotar~n~Subir y bajar~n~Mover~n~Mover rápido", 1, 0.0, 0.0, VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2, .align = 1);
	funct_CreateTextdrawTextNotifEx(playerid, i, 1, "~k~~VEHICLE_ENTER_EXIT~_~n~~k~~GROUP_CONTROL_BWD~_~n~~k~~PED_SPRINT~+W,S_~n~W,S,A,D_~n~~k~~SNEAK_ABOUT~+W,S,A,D", 1, 110.0, 0.0, VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2, .align = 3, .color = 0x5EB5FFFF);

	UpdateNotificationForPlayer(playerid, i);

	return 1;
}

PlayerMovePositionFurniture(playerid, type, Float:speed)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(Player.Temp[playerid][@EditFurnitureObj], x,y,z);

	switch(type)
	{
		case 0: x += speed;
		case 1: y += speed;
		case 2: z += speed;
	}

	SetDynamicObjectPos(Player.Temp[playerid][@EditFurnitureObj], x,y,z);
	
	GetPointInFrontPos(playerid, x, y, Player.Temp[playerid][@EditFurnitureRot], x, y, 2.4);
	SetPlayerCameraLookAt(playerid, x, y, z);
	//SetPlayerCameraLookAt(playerid, x, y, z+1.0);
}

SaveNewFurnitureObject(playerid, id, type)
{
	new objectid;
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(Player.Temp[playerid][@PrevFurnitureObj], x, y, z);
	
	DestroyDynamicObject(Player.Temp[playerid][@PrevFurnitureObj]);
	Player.Temp[playerid][@PrevFurnitureObj] = INVALID_STREAMER_ID;

	objectid = CreateDynamicObject(Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Model], x, y, z, 0.0, 0.0, Player.Temp[playerid][@EditFurnitureRot], CasaInfo[id][cVirtualWorld]);

	new material, material2, material3;

	if(Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot] != -1)
	{
		material = ListMaterialFurniture_Type[ Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot] ][ Player.Temp[playerid][@MaterialSelect][0] ];
		SetDynamicObjectMaterial(objectid, 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
	}
	if(Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot2] != -1)	
	{
		material2 = ListMaterialFurniture_Type[ Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot2] ][ Player.Temp[playerid][@MaterialSelect][1] ];
		SetDynamicObjectMaterial(objectid, 1, Texture.Info[ material2 ][@ModelID], Texture.Info[ material2 ][@TXD], Texture.Info[ material2 ][@Texture], Texture.Info[ material2 ][@Color]);
	}
	if(Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot3] != -1)
	{
		material3 = ListMaterialFurniture_Type[ Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot3] ][ Player.Temp[playerid][@MaterialSelect][2] ];
		SetDynamicObjectMaterial(objectid, 2, Texture.Info[ material3 ][@ModelID], Texture.Info[ material3 ][@TXD], Texture.Info[ material3 ][@Texture], Texture.Info[ material3 ][@Color]);
	}

	switch(type)
	{
		case 0:
		{
			if(!pool_valid(CasaInfo[id][hPoolFurniture]))
			{
				CasaInfo[id][hPoolFurniture] = pool_new();
			}
			new data[E_HOUSE_FURNITURE_DATA];

			data[E_HOUSE_FURNITURE_DATA_ObjID] = objectid;
			data[E_HOUSE_FURNITURE_DATA_MODEL] = Player.Temp[playerid][@MenuSelected][0];
			data[E_HOUSE_FURNITURE_DATA_X] = x;
			data[E_HOUSE_FURNITURE_DATA_Y] = y;
			data[E_HOUSE_FURNITURE_DATA_Z] = z;
			data[E_HOUSE_FURNITURE_DATA_RotZ] = Player.Temp[playerid][@EditFurnitureRot];
			data[E_HOUSE_FURNITURE_DATA_DATE] = gettime();

			await mysql_aquery_s(conexion, str_format("INSERT INTO `lac_house_furniture` (`houseid`, `model`, `posx`, `posy`, `posz`, `rotz`, `slot`, `slot2`, `slot3`, `date`) VALUES (%d, %d, %f, %f, %f, %f, %d, %d, %d, CURRENT_TIMESTAMP);",
				CasaInfo[id][id_property], Player.Temp[playerid][@MenuSelected][0], x, y, z, Player.Temp[playerid][@EditFurnitureRot],  material, material2, material3));
		
			data[E_HOUSE_FURNITURE_DATA_DBID] = cache_insert_id();

			new idfurniture = pool_add_arr(CasaInfo[id][hPoolFurniture], data);

			Player.Temp[playerid][@EditFurnitureIn] = idfurniture;
			RegisterNewStorageFurniture(Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type], idfurniture, CasaInfo[id][hPoolFurniture]);
		}
	}

	Streamer_Update(playerid);

	Player.Temp[playerid][@EditFurniture] = 1;
	Player.Temp[playerid][@EditFurnitureObj] = objectid;
}

SaveEditFurnitureObject(playerid, id, type)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(Player.Temp[playerid][@EditFurnitureObj], x, y, z);

	switch(type)
	{
		case 0:
		{
			if(!pool_valid(CasaInfo[id][hPoolFurniture]))
			{
				CasaInfo[id][hPoolFurniture] = pool_new();
			}
			new data[E_HOUSE_FURNITURE_DATA];
			pool_get_arr(CasaInfo[id][hPoolFurniture], Player.Temp[playerid][@EditFurnitureIn], data);

			data[E_HOUSE_FURNITURE_DATA_X] = x;
			data[E_HOUSE_FURNITURE_DATA_Y] = y;
			data[E_HOUSE_FURNITURE_DATA_Z] = z;
			data[E_HOUSE_FURNITURE_DATA_RotZ] = Player.Temp[playerid][@EditFurnitureRot];
			data[E_HOUSE_FURNITURE_DATA_DATE] = gettime();

			pool_set_arr(CasaInfo[id][hPoolFurniture], Player.Temp[playerid][@EditFurnitureIn], data);

			AssignFeaturesFurnitureType(playerid, Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type], data[E_HOUSE_FURNITURE_DATA_Extra], CasaInfo[id][cVirtualWorld], x, y, z, data[E_HOUSE_FURNITURE_DATA_RotZ]);

			mysql_tquery_s(conexion, str_format("UPDATE `lac_house_furniture` SET `posx`=%f, `posy`=%f, `posz`=%f, `rotz` = %f, `date` = CURRENT_TIMESTAMP WHERE `idfurniture`=%d;",
				x, y, z, Player.Temp[playerid][@EditFurnitureRot], data[E_HOUSE_FURNITURE_DATA_DBID]));

			
		}
	}
}

SetPlayerFurnitureTypeTexture(playerid, slot, next)
{
	new id = 0;

	switch(slot)
	{
		case 0:
		{
			if(Player.Temp[playerid][@MaterialSelect][next] < sizeof(ListMaterialFurnitureType)-1) { Player.Temp[playerid][@MaterialSelect][next]++; } else { Player.Temp[playerid][@MaterialSelect][next] = 0; }
			id = ListMaterialFurnitureType[ Player.Temp[playerid][@MaterialSelect][next] ];
		}
		case 1:
		{
			if(Player.Temp[playerid][@MaterialSelect][next] < sizeof(ListMaterialFurnitureTypeColor)-1) { Player.Temp[playerid][@MaterialSelect][next]++; } else { Player.Temp[playerid][@MaterialSelect][next] = 0; }
			id = ListMaterialFurnitureTypeColor[ Player.Temp[playerid][@MaterialSelect][next] ];
		}
		case 2:
		{
			if(Player.Temp[playerid][@MaterialSelect][next] < sizeof(ListMaterialFurnitureTypeWood)-1) { Player.Temp[playerid][@MaterialSelect][next]++; } else { Player.Temp[playerid][@MaterialSelect][next] = 0; }
			id = ListMaterialFurnitureTypeWood[ Player.Temp[playerid][@MaterialSelect][next] ];
		}
	}
	return id;
}

AssignInteractiveFurniture(id, item, type)
{
	new Pool:pool, vw;
	GetFurnitureTypeProperty(type, id, pool, vw);

	new data[E_HOUSE_FURNITURE_DATA];
	pool_get_arr(pool, item, data);

	new furniture = data[E_HOUSE_FURNITURE_DATA_MODEL];

	if(Furniture.Info[ furniture ][@Type] == 0) return -1;

	new area = CreateDynamicSphere(0.0, 0.0, 0.0, 1.0, vw);
	new array[2];
	array[0] = AREA_TYPE_ZONE_IT_OBJECT;
	array[1] = item;
	Streamer_SetArrayData(STREAMER_TYPE_AREA, area, E_STREAMER_EXTRA_ID, array);

	AttachDynamicAreaToObject(area, data[E_HOUSE_FURNITURE_DATA_ObjID], .offsetx = Furniture.Info[furniture][@OffsetX], .offsety = Furniture.Info[furniture][@OffsetY]);

	data[E_HOUSE_FURNITURE_DATA_AREA] = area;
	pool_set_arr(pool, item, data);

	return area;
}

LoadFeaturesFurnitureType(type, item, id, vw, Pool:pool)
{
	switch(type)
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			//mysql_tquery_s(conexion, str_format("SELECT s2.`id` idmisc, s2.`storageid`, s2.`slot`, s2.`itemid`, s2.`amount` FROM `lac_item_storage` s INNER JOIN `lac_item_misc` s2 ON s.`id` = s2.`storageid` WHERE s.`id` = %d;", id),
			//	"LoadStorageForFurniture", "iii", item, vw, _:pool);
			new data[E_HOUSE_FURNITURE_DATA];
			pool_get_arr(pool, item, data);
			
			inline LoadStorageForFurniture()
			{
				if(!map_valid(ServerGeneral_StorageMap))
				{
					ServerGeneral_StorageMap = map_new();
				}

				new rows;
				cache_get_row_count(rows);

				new datainv[E_SVGENERAL_STORAGE_INFO], slot;

				for(new i = 0; i < rows; i++)
				{
					cache_get_value_name_int(i, "slot", slot);
					cache_get_value_name_int(i, "idmisc", datainv[E_SVGENERAL_STORAGE_ID][slot]);
					cache_get_value_name_int(i, "itemid", datainv[E_SVGENERAL_STORAGE_Item][slot]);
					cache_get_value_name_int(i, "amount", datainv[E_SVGENERAL_STORAGE_Amount][slot]);
					datainv[E_SVGENERAL_STORAGE_Object][slot] = AssignShelfObjectPosition(slot, datainv[E_SVGENERAL_STORAGE_Item][slot], data[E_HOUSE_FURNITURE_DATA_X], data[E_HOUSE_FURNITURE_DATA_Y], data[E_HOUSE_FURNITURE_DATA_Z], data[E_HOUSE_FURNITURE_DATA_RotZ], vw);
				}
				map_add_arr(ServerGeneral_StorageMap, data[E_HOUSE_FURNITURE_DATA_Extra], datainv);
			}
			MySQL_TQueryInline(conexion, using inline LoadStorageForFurniture, "SELECT s2.`id` idmisc, s2.`storageid`, s2.`slot`, s2.`itemid`, s2.`amount` FROM `lac_item_storage` s INNER JOIN `lac_item_misc` s2 ON s.`id` = s2.`storageid` WHERE s.`id` = %d;", id);
		}
	}
	return 1;
}

AssignFeaturesFurnitureType(playerid, type, storageid, vw, Float:x, Float:y, Float:z, Float:rotz)
{
	switch(type)
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			if(!map_has_key(ServerGeneral_StorageMap, storageid)) return 0;
			new datainv[E_SVGENERAL_STORAGE_INFO];
			map_get_arr(ServerGeneral_StorageMap, storageid, datainv);

			for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
			{
				if(datainv[E_SVGENERAL_STORAGE_Item][i] != 0)
				{
					datainv[E_SVGENERAL_STORAGE_Object][i] = AssignShelfObjectPosition(i, datainv[E_SVGENERAL_STORAGE_Item][i], x, y, z, rotz, vw);
				}
			}
			map_set_arr(ServerGeneral_StorageMap, storageid, datainv);
			Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
		}
	}
	return 1;
}

EditFeaturesFurnitureType(type, item, Pool:pool)
{
	switch(type)
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			new data[E_HOUSE_FURNITURE_DATA];
			pool_get_arr(pool, item, data);

			new datainv[E_SVGENERAL_STORAGE_INFO];
			map_get_arr(ServerGeneral_StorageMap, data[E_HOUSE_FURNITURE_DATA_Extra], datainv);

			for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
			{
				if(datainv[E_SVGENERAL_STORAGE_Item][i] != 0)
				{
					DestroyDynamicObject(datainv[E_SVGENERAL_STORAGE_Object][i]);
				}
			}
		}
	}
	return 1;
}

DestroyFeaturesFurnitureType(type, item, Pool:pool)
{
	new data[E_HOUSE_FURNITURE_DATA];
	pool_get_arr(pool, item, data);

	switch(type)
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			if(map_has_key(ServerGeneral_StorageMap, data[E_HOUSE_FURNITURE_DATA_Extra]))
			{
				new datainv[E_SVGENERAL_STORAGE_INFO];
				map_get_arr(ServerGeneral_StorageMap, data[E_HOUSE_FURNITURE_DATA_Extra], datainv);

				for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
				{
					if(datainv[E_SVGENERAL_STORAGE_Item][i] != 0)
					{
						DestroyDynamicObject(datainv[E_SVGENERAL_STORAGE_Object][i]);
					}
				}
			}
			mysql_tquery_s(conexion, str_format("DELETE FROM `lac_item_storage` WHERE `id`=%d;", data[E_HOUSE_FURNITURE_DATA_Extra]));
		}
		case FURNITURE_IT_TYPE_FRIDGE:
		{
			mysql_tquery_s(conexion, str_format("DELETE FROM `lac_item_storage` WHERE `id`=%d;", data[E_HOUSE_FURNITURE_DATA_Extra]));
		}
	}
	return 1;
}

GetFurnitureTypeProperty(type, id, &Pool:pool = INVALID_POOL, &vw = -1)
{
	switch(type)
	{
		case PLAYER_INTERIOR_PROPERTY:
		{
			pool = CasaInfo[id][hPoolFurniture];
			vw = CasaInfo[id][cVirtualWorld];
		}
	}
	return type;
}