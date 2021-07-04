stock SetInsideHouse(i, interior)
{


	//new vw = CasaInfo[i][cVirtualWorld];
    switch(interior)
    {
    	case 1: // Two level - medium
    	{
    		// Level 1
    		CreateHouseCustomObjectInterior(i, 1, 19377, 439.4535, 675.2289, 1100.0000, 0.0000, 90.0000, 0.0000); // Piso abajo - principal
    		
    		CreateHouseCustomObjectInterior(i, 11, 19377, 431.5335, 679.5979, 1103.6259, 0.0000, 90.0000, 0.0000); // Piso 2 - principal
    		CreateHouseCustomObjectInterior(i, 11, 19438, 437.5824, 676.3675, 1103.6259, 0.0000, 90.0000, -90.0000);

    		// Pared principal
    		CreateHouseCustomObjectInterior(i, 0, 19446, 444.7650, 675.0085, 1101.7953, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19400, 434.1360, 671.9195, 1101.7953, 0.0000, 0.0000, 0.0000);
            CreateHouseCustomObjectInterior(i, 0, 19446, 444.7650, 675.0085, 1101.7953, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 436.8325, 679.8985, 1101.7953, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 439.0288, 670.3360, 1101.7953, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 444.7650, 675.0085, 1105.2928, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19354, 443.2471, 679.8985, 1105.2928, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 436.8325, 679.8985, 1105.2928, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 448.6548, 670.3360, 1101.7953, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 443.1828, 674.8705, 1105.2964, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 433.9369, 674.8485, 1105.2928, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19427, 437.5786, 677.9073, 1105.2926, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19398, 427.5177, 674.8485, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19446, 426.2251, 679.7424, 1105.2926, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19427, 438.2915, 677.0162, 1105.2926, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19427, 438.2915, 675.4135, 1105.2926, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19400, 430.5865, 679.9105, 1105.2926, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19354, 427.8585, 679.8985, 1105.2926, 0.0000, 0.0000, 90.0000); 
    		CreateHouseCustomObjectInterior(i, 0, 19354, 434.1360, 675.1300, 1101.7953, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 0, 19400, 434.1360, 678.3335, 1101.7953, 0.0000, 0.0000, 0.0000);
    		
    		CreateHouseCustomObjectInterior(i, 0, 19400, 443.2471, 679.8985, 1101.7953, 0.0000, 0.0000, 90.0000);

    		// Cuarto 1 - Piso
    		CreateHouseCustomObjectInterior(i, 5, 19377, 427.2565, 669.9649, 1103.6259, 0.0000, 90.0000, 0.0000);
    		// Habitacion 1 - Paredes
    		CreateHouseCustomObjectInterior(i, 4, 19355, 430.7240, 674.6967, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19355, 432.4175, 670.1136, 1105.4448, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19447, 422.6334, 673.3235, 1105.4448, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19447, 427.5134, 668.5968, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19398, 424.3127, 674.6967, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19398, 427.5177, 674.6967, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 4, 19398, 432.4175, 673.3243, 1105.4448, 0.0000, 0.0000, 0.0000);
    		// Habitacion 2 - Paredes
    		CreateHouseCustomObjectInterior(i, 6, 19398, 424.3127, 674.8485, 1105.4448, 0.0000, 0.0000, 90.0000); 
    		CreateHouseCustomObjectInterior(i, 6, 19447, 421.4025, 683.9345, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 6, 19447, 422.6934, 679.7475, 1105.4448, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 6, 19447, 426.0029, 679.6613, 1105.4448, 0.0000, 0.0000, 0.0000);
    		// Habitacion 2 - Piso
    		CreateHouseCustomObjectInterior(i, 7, 19377, 421.0575, 679.5617, 1103.6239, 0.0000, 90.0000, 0.0000);
    		// Baño - Paredes
    		CreateHouseCustomObjectInterior(i, 2, 19447, 437.4910, 669.4628, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 2, 19447, 436.8572, 669.9548, 1105.4448, 0.0000, 0.0000, 360.0000);
    		CreateHouseCustomObjectInterior(i, 2, 19447, 437.2229, 674.6967, 1105.4448, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 2, 19355, 432.5955, 670.1136, 1105.4448, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 2, 19398, 432.5955, 673.3243, 1105.4448, 0.0000, 0.0000, 0.0000);
    		// Baño - Piso
    		CreateHouseCustomObjectInterior(i, 3, 19377, 437.7565, 669.9649, 1103.6259, 0.0000, 90.0000, 0.0000);
    		// Techo principal
			CreateHouseCustomObjectInterior(i, 10, 19375, 441.9341, 678.6729, 1107.0115, 0.0000, 90.0000, 0.0000);
			CreateHouseCustomObjectInterior(i, 10, 19375, 437.7565, 670.1450, 1103.5199, 0.0000, 90.0000, 0.0000);
			CreateHouseCustomObjectInterior(i, 10, 19375, 448.2385, 670.1449, 1103.5219, 0.0000, 90.0000, 0.0000);
			CreateHouseCustomObjectInterior(i, 10, 19375, 431.5335, 679.5979, 1103.5219, 0.0000, 90.0000, 0.0000);				
    		CreateHouseCustomObjectInterior(i, 10, 19375, 431.5335, 679.5979, 1107.0158, 0.0000, 90.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 10, 19375, 437.7565, 673.1829, 1107.0135, 0.0000, 90.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 10, 19375, 427.2565, 669.9649, 1107.0158, 0.0000, 90.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 10, 19429, 437.5824, 676.3675, 1103.5219, 0.0000, 90.0000, -90.0000);
    		CreateHouseCustomObjectInterior(i, 10, 19375, 421.0333, 679.5979, 1107.0159, 0.0000, 90.0000, 0.0000);

			CreateHouseCustomObjectInterior(i, 20, 1498, 444.69949, 672.89429, 1100.07190,   0.00000, 0.00000, 90.00000);

    		CreateHouseCustomObjectInterior(i, 12, 14874, 439.10669, 678.94971, 1101.95142, 0.00000, 0.00000, 0.00000); // Escaleras
    		// Ventanas
    		CreateHouseCustomObjectInterior(i, 9, 19362, 431.2586, 680.0542, 1106.2749, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 9, 19362, 443.1135, 680.0449, 1101.2372, 0.0000, 0.0000, 90.0000); 
    		CreateHouseCustomObjectInterior(i, 9, 19449, 433.9807, 674.9473, 1101.7959, 0.0000, 0.0000, 0.0000);
    		// Puertas
    		CreateHouseCustomObjectInterior(i, 8, 1502, 432.4583, 672.5744, 1103.7057, 0.0000, 0.0000, 90.0000);
    		CreateHouseCustomObjectInterior(i, 8, 1502, 426.7343, 674.8113, 1103.7057, 0.0000, 0.0000, 0.0000);
    		CreateHouseCustomObjectInterior(i, 8, 1502, 423.5185, 674.6719, 1103.7057, 0.0000, 0.0000, 0.0000);
    	}
	}
	return 1;
}

CreateHouseCustomObjectInterior(i, slot, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if(!map_has_key(CasaInfo[i][hCustomInterior], slot)) return 0;

	new data[E_HOUSE_CUSTOMIZE_DATA];
	map_get_arr(CasaInfo[i][hCustomInterior], slot, data);

	new vw = CasaInfo[i][cVirtualWorld];
	new objectid = CreateDynamicObject(modelid, x, y, z, rx, ry, rz, vw);

	new material = data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL];
    House_SetMaterialForObject(objectid, slot, material);
    //SetDynamicObjectMaterial(objectid, 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);

	if(!pool_valid(data[E_HOUSE_CUSTOMIZE_DATA_POOL]))
	{
		data[E_HOUSE_CUSTOMIZE_DATA_POOL] = pool_new();
	}

	pool_add(data[E_HOUSE_CUSTOMIZE_DATA_POOL], objectid);

    map_set_arr(CasaInfo[i][hCustomInterior], slot, data);
    return 1;
}

House_CreateNewInterior(i, interiorid)
{
    switch(interiorid)
    {
        case 1:
        {
            House_CreateNewInteriorDB(i, 0, 12);
            House_CreateNewInteriorDB(i, 1, 28);
            House_CreateNewInteriorDB(i, 2, 12);
            House_CreateNewInteriorDB(i, 3, 28);
            House_CreateNewInteriorDB(i, 4, 12);
            House_CreateNewInteriorDB(i, 5, 28);
            House_CreateNewInteriorDB(i, 6, 12);
            House_CreateNewInteriorDB(i, 7, 28);
            House_CreateNewInteriorDB(i, 8, 0);
            House_CreateNewInteriorDB(i, 9, 15);
            House_CreateNewInteriorDB(i, 10, 12);
            House_CreateNewInteriorDB(i, 11, 28);
            House_CreateNewInteriorDB(i, 12, 0);
        }
    }
    if(!map_valid(CasaInfo[i][hCustomInterior]))
    {
        CasaInfo[i][hCustomInterior] = map_new();
    }
    new data[E_HOUSE_CUSTOMIZE_DATA];
    map_add_arr(CasaInfo[i][hCustomInterior], 20, data);
    return 1;
}

House_CreateNewInteriorDB(i, slot, material)
{
    if(!map_valid(CasaInfo[i][hCustomInterior]))
    {
        CasaInfo[i][hCustomInterior] = map_new();
    }
    new data[E_HOUSE_CUSTOMIZE_DATA];

    await mysql_aquery_s(conexion, str_format("INSERT INTO `lac_house_interior` (`houseid`, `slot`, `material`) VALUES (%d, %d, %d);", CasaInfo[i][id_property], slot, material));

    new dbid = cache_insert_id();

    data[E_HOUSE_CUSTOMIZE_DATA_DBID] = dbid;   
    data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] = material;    

    map_add_arr(CasaInfo[i][hCustomInterior], slot, data);
}

SetPlayerPosInteriorHouse(playerid, i)
{
	switch(CasaInfo[i][cInteriorID])
	{
		case 1:
		{
			//Streamer_UpdateEx(playerid, CasaInfo[i][cInteriorX],CasaInfo[i][cInteriorY],CasaInfo[i][cInteriorZ]+0.2, -1, 7);
				//SetPlayerPos(playerid,CasaInfo[i][cInteriorX],CasaInfo[i][cInteriorY],CasaInfo[i][cInteriorZ]);
				//SetInterior(playerid,CasaInfo[i][cInterior]);
				//SetPlayerFacingAngle(playerid,CasaInfo[i][cAnguloInt]);

			SetPlayerPosInt(playerid, 444.2333,673.6519,1101.0859,90.4835, 1, CasaInfo[i][cVirtualWorld]);
		}
	}
}

DefineMaterialTextureType(id, const name[], modelid, const TXD[], const Texture[], color = -1, extra = 0, price = 20)
{
	//format(InvObjectData[id][E_INV_NAME], 29, name);

	format(Texture.Info[id][@Name], 22, "%s", name);
	Texture.Info[id][@ModelID] = modelid;
	format(Texture.Info[id][@TXD], 18, "%s", TXD);
	format(Texture.Info[id][@Texture], 20, "%s", Texture);
	Texture.Info[id][@Color] = color;
	Texture.Info[id][@Extra] = extra;
    Texture.Info[id][@Price] = price;
	return id;
}

DefineFurnitureHouseType(id, modelid, price, const name[], slot = -1, slot2 = -1, slot3 = -1, type = 0, messagetype = 0, capacity = 20, Float:offsetx = 0.0, Float:offsety = -1.0)
{
    //format(InvObjectData[id][E_INV_NAME], 29, name);

    format(Furniture.Info[id][@Name], 22, "%s", name);
    Furniture.Info[id][@Model] = modelid;
    Furniture.Info[id][@Price] = price;

    Furniture.Info[ id ][@Slot] = slot;
    Furniture.Info[ id ][@Slot2] = slot2;
    Furniture.Info[ id ][@Slot3] = slot3;
    Furniture.Info[ id ][@Type] = type;
    Furniture.Info[ id ][@Message] = messagetype;
    Furniture.Info[ id ][@Capacity] = capacity;

    Furniture.Info[ id ][@OffsetX] = offsetx;
    Furniture.Info[ id ][@OffsetY] = offsety;

    return id;
}

//

GetDataHouseCustomInt(Map:map, index, data[], leng = sizeof data)
{
    if(!map_has_key(map, index)) return 1;
    map_get_arr(map, index, data, leng);
    return 0;
}

ResetMenuIndexMaterialHouse(playerid)
{
    new data[E_HOUSE_CUSTOMIZE_DATA];
    GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], Player.Temp[playerid][@MenuIndexRoom], data);
    new material = data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL];

    for_pool(it : data[E_HOUSE_CUSTOMIZE_DATA_POOL])
    {
        //SetDynamicObjectMaterial(iter_get(it), 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
        House_SetMaterialForObject(iter_get(it), Player.Temp[playerid][@MenuIndexRoom], material);
    }
    Player.Temp[playerid][@MenuIndexRoom] = 0;
}

House_ChangeMaterialForIndex(playerid, i, newmaterial)
{
    new slot = Player.Temp[playerid][@MenuIndexRoom];
    if(!map_has_key(CasaInfo[i][hCustomInterior], slot)) return 0;

    new data[E_HOUSE_CUSTOMIZE_DATA];
    map_get_arr(CasaInfo[i][hCustomInterior], slot, data);

    data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] = newmaterial;
            
    map_set_arr(CasaInfo[i][hCustomInterior], slot, data);

    mysql_tquery_s(conexion, str_format("UPDATE `lac_house_interior` SET `material`=%d WHERE `interior_id`=%d;", newmaterial, data[E_HOUSE_CUSTOMIZE_DATA_DBID]));
    return 1;
}

House_SetMaterialForObject(objectid, slot, material)
{
    new index = 0;
    switch(slot)
    {
        case 8: index = 1;
        case 12: index = 1;
    }
    SetDynamicObjectMaterial(objectid, index, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
    return 1;
}

Player_BuyHouse(playerid, i)
{
    if(IsPlayerInRangeOfPoint(playerid,2.0,CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]))
    {
        //if(CasaInfo[i][cSale] == 1) return 1;
        //if(PlayerInfo[playerid][p_HouseSlot][0] != 0 && PlayerInfo[playerid][p_HouseSlot][1] != 0) return 1;
        if(CasaInfo[i][cHouseType] == 0)
        {
            if(PlayerInfo[playerid][pDinero] < CasaInfo[i][cPrecio]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes suficiente dinero.", 2000);
        }
        else
        {
            if(PlayerInfo[playerid][pLAC] < CasaInfo[i][cPrecio]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes suficientes LAC.", 2000);
        }
        if(CasaInfo[i][cSale] == 0)
        {
            if(PlayerInfo[playerid][p_LEVEL] >= CasaInfo[i][cNivel])
            {
                new string[150], slot;

                if(PlayerInfo[playerid][p_HouseSlot][0] == 0)
                {
                    PlayerInfo[playerid][p_HouseSlot][0] = i;
                    slot = 0;
                }
                else if(PlayerInfo[playerid][p_HouseSlot][1] == 0 && PlayerInfo[playerid][p_LEVEL] > 4)
                {
                    PlayerInfo[playerid][p_HouseSlot][1] = i;
                    slot = 1;
                }
                else
                {
                    ShowPlayerInfoTextdraw(playerid, "~r~No puedes tener más casas.", 4000);
                    return 1;
                }
                CasaInfo[i][cOwnerID] = PlayerInfo[playerid][pID];
                CasaInfo[i][cSale] = 1;
                mysql_tquery_s(conexion, str_format("INSERT INTO `lac_property_owner` (`id_property`, `id_user`, `slot`, `index`) VALUES (%d, %d, %d, %d);", CasaInfo[i][id_property], PlayerInfo[playerid][pID], slot, i));

                if(CasaInfo[i][cPropertyType] == 0) { format(string, sizeof(string), "Casa\n{FFFFFF}Propietario: {00C0FF}%s", PlayerInfo[playerid][p_Name]); }
                else if(CasaInfo[i][cPropertyType] == 1) { format(string, sizeof(string), "Restaurante\n{FFFFFF}Propietario: {00C0FF}%s", PlayerInfo[playerid][p_Name]); }
                else if(CasaInfo[i][cPropertyType] == 2) { format(string, sizeof(string), "Oficina\n{FFFFFF}Propietario: {00C0FF}%s", PlayerInfo[playerid][p_Name]); }
                UpdateDynamic3DTextLabelText(CasaInfo[i][cTitulo3D], COLOR_HOUSET, string);
                        /**/
                if(CasaInfo[i][cHouseType] == 0)
                {
                    RemoveMoney(playerid, CasaInfo[i][cPrecio], true, true);
                }
                else
                {
                    new query[80];
                    PlayerInfo[playerid][pLAC] -= CasaInfo[i][cPrecio];
                    format(query, sizeof(query), "UPDATE `lac_users` SET `LAC`=%d WHERE `id`=%d", PlayerInfo[playerid][pLAC], PlayerInfo[playerid][pID]);
                    mysql_tquery(conexion, query);

                }  
                CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_BUYNEWHOUSE, "iFelicidades!, compraste una nueva propiedad.", 10);
                ShowPlayerInfoTextdraw(playerid, "Entra a la propiedad y pulsa ~y~~k~~GROUP_CONTROL_BWD~", 4000);

                DestroyDynamicPickup(CasaInfo[i][cPickUp][0]);
                CasaInfo[i][cPickUp][0] = CreateDynamicPickup(19902, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-1.0);
                Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][0], E_STREAMER_EXTRA_ID, i);

            } else ShowPlayerInfoTextdraw(playerid, "~r~No tienes el nivel suficiente.", 2000);
        }
    }
    return 1;
}

Player_LockDoorsProperty(playerid, id)
{
    if(CasaInfo[id][cOwnerID] != PlayerInfo[playerid][pID]) return 0;
    if(CasaInfo[id][cLock])
    {
        ShowPlayerInfoTextdraw(playerid, "~g~~h~Abriste ~w~la puerta.", 4000);
        CasaInfo[id][cLock] = 0;
    }
    else
    {
        ShowPlayerInfoTextdraw(playerid, "~r~~h~Cerraste ~w~la puerta.", 4000);
        CasaInfo[id][cLock] = 1;
    }
    return 1;
}

Player_SearchHouseID(playerid, id)
{
    for(new i = 0; i < 3; i++)
    {
        if(PlayerInfo[playerid][p_HouseSlotType][i] != 0) continue;
        if(PlayerInfo[playerid][p_HouseSlot][i] == id)
        {
            return i;
        }
    }
    return -1;
}

// Sync Interior

House_UnloadInterior(id)
{
    new data[E_HOUSE_CUSTOMIZE_DATA];
    for_map(it : CasaInfo[id][hCustomInterior])
    {
        if (!iter_sizeof(it)) {
            continue;
        }
        iter_get_arr(it, data);

        if(!pool_valid(data[E_HOUSE_CUSTOMIZE_DATA_POOL])) continue;
    
        for_pool(it_pool : data[E_HOUSE_CUSTOMIZE_DATA_POOL])
        {
            DestroyDynamicObject(iter_get(it_pool));
        }
        pool_delete(data[E_HOUSE_CUSTOMIZE_DATA_POOL]);
    }
    if(pool_valid(CasaInfo[id][hPoolFurniture]))
    {
        new datafurniture[E_HOUSE_FURNITURE_DATA];
        for_pool(fi : CasaInfo[id][hPoolFurniture])
        {
            if (!iter_sizeof(fi)) {
                continue;
            }
            iter_get_arr(fi, datafurniture);

            if(datafurniture[E_HOUSE_FURNITURE_DATA_ObjID] != INVALID_STREAMER_ID)
            {
                DestroyDynamicObject(datafurniture[E_HOUSE_FURNITURE_DATA_ObjID]);
            }
            if(IsValidDynamicArea(datafurniture[E_HOUSE_FURNITURE_DATA_AREA]))
            {
                DestroyDynamicArea(datafurniture[E_HOUSE_FURNITURE_DATA_AREA]);
            }
        }
        pool_delete(CasaInfo[id][hPoolFurniture]);
    }

    CasaInfo[id][cInteriorLoaded] = 0;
    return 0;
}

House_PlayerLoadInterior(id)
{
    CasaInfo[id][cInteriorLoaded] = 1;

    SetInsideHouse(id, CasaInfo[id][cInteriorID]);
    mysql_tquery_s(conexion, str_format("SELECT UNIX_TIMESTAMP(f.`date`) AS `date_unix`, f.* FROM `lac_house_furniture` f WHERE f.`houseid`=%d;", CasaInfo[id][id_property]),
        "LoadFurnitureHouseDB", "i", id);
    return 1;
}

// Cameras

House_SelectCameraFromInt(playerid, interior, selectroom)
{
    switch(interior)
    {
        case 1:
        {
            switch(selectroom)
            {
                case 0:
                {
                    SetPlayerCameraPos(playerid, 434.606414, 671.165588, 1102.616577);
                    SetPlayerCameraLookAt(playerid, 439.349761, 672.643493, 1102.054077, CAMERA_CUT);
                }
                case 1:
                {
                    SetPlayerCameraPos(playerid, 443.702728, 670.881591, 1103.456542);
                    SetPlayerCameraLookAt(playerid, 440.218048, 673.544189, 1101.054931, CAMERA_CUT);
                }
                case 2:
                {
                    SetPlayerCameraPos(playerid, 432.849456, 669.672546, 1106.746215);
                    SetPlayerCameraLookAt(playerid, 435.091949, 673.910217, 1105.327270, CAMERA_CUT);
                }
                case 3:
                {
                    SetPlayerCameraPos(playerid, 433.112121, 669.933532, 1107.049072);
                    SetPlayerCameraLookAt(playerid, 435.237091, 672.759216, 1103.513549, CAMERA_CUT);
                }
                case 4:
                {
                    SetPlayerCameraPos(playerid, 431.797180, 668.950195, 1105.500488);
                    SetPlayerCameraLookAt(playerid, 427.229309, 670.954162, 1105.155761, CAMERA_CUT);
                }
                case 5:
                {
                    SetPlayerCameraPos(playerid, 431.665649, 669.252258, 1106.898315);
                    SetPlayerCameraLookAt(playerid, 428.329101, 670.985290, 1103.602294, CAMERA_CUT);
                }
                case 6:
                {
                    SetPlayerCameraPos(playerid, 425.355194, 675.459228, 1106.600219);
                    SetPlayerCameraLookAt(playerid, 424.469696, 680.278625, 1105.605712, CAMERA_CUT);
                }
                case 7:
                {
                    SetPlayerCameraPos(playerid, 425.167968, 675.653564, 1106.808837);
                    SetPlayerCameraLookAt(playerid, 424.655914, 679.341674, 1103.471801, CAMERA_CUT);
                }
                case 8:
                {
                    SetPlayerCameraPos(playerid, 427.708190, 680.058227, 1106.509887);
                    SetPlayerCameraLookAt(playerid, 427.362243, 675.343139, 1104.882568, CAMERA_CUT);
                }
                case 9:
                {
                    SetPlayerCameraPos(playerid, 439.438354, 671.958435, 1103.166503);
                    SetPlayerCameraLookAt(playerid, 434.630035, 671.844238, 1101.800048, CAMERA_CUT);
                }
                case 10:
                {
                    SetPlayerCameraPos(playerid, 444.495635, 670.856323, 1101.044799);
                    SetPlayerCameraLookAt(playerid, 440.557586, 672.457031, 1103.677124, CAMERA_CUT);
                }
                case 11:
                {
                    SetPlayerCameraPos(playerid, 438.844055, 679.413452, 1106.685302);
                    SetPlayerCameraLookAt(playerid, 434.541381, 678.439819, 1104.331787, CAMERA_CUT);
                }
                case 12:
                {
                    SetPlayerCameraPos(playerid, 444.194641, 673.994323, 1103.326538);
                    SetPlayerCameraLookAt(playerid, 440.697601, 677.367004, 1102.145141, CAMERA_CUT);
                }
            }
        }
    }
}