MenuV:MainMenuWorkshop(playerid, MenuVType:response, itemid, itemvalue[])
{
	if(!response) return MenuV_Close(playerid);
	switch(itemid)
	{
		case 0:
		{
			MenuV_Show(playerid, MenuChangeColorV);
		}
		case 1:
		{
			ShowPlayerMenuV(playerid, MenuRepairVehicle, "Taller", true);
		    vMenu_AddItems(playerid, "Reparación", "~g~$200");
		    vMenu_AddItems(playerid, "Volver");

		    MenuV_Update(playerid);
		}
	}
	return 1;
}

MenuV:MenuRepairVehicle(playerid, MenuVType:response, itemid, itemvalue[])
{
	if(!response) return MenuV_Close(playerid);
	if(itemid == 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(PlayerInfo[playerid][pDinero] < 200) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);
		if(Vehicles_Info[vehicleid][gi_vehicle_HEALTH] >= 1000.0) return ShowPlayerInfoTextdraw(playerid, "~r~Este vehículo no necesita ser reparado.", 2000);
		RepairVehicle(vehicleid);
		PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		RemoveMoney(playerid, 200, true, false, 1);
	}
	else if(itemid == 1)
	{
		MenuV_Show(playerid, MainMenuWorkshop);
	}
	return 1;
}

MenuV:MenuChangeColorV(playerid, MenuVType:response, itemid, itemvalue[])
{
	if(response)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		switch(itemid)
		{
			case 0:
			{
				MenuV_Close(playerid, true);
				
				ShowModelSelectionMenuEx(playerid, ChangeVehicleColor, "Color primario");
				for(new i = 0; i < 255; i++)
				{
					mSelection_AddItems(playerid, Vehicles_Info[vehicleid][gi_vehicle_MODELID], 0, 0, i, Vehicles_Info[vehicleid][gi_vehicle_COLOR2], -10.0, -10.0, -10.0);
				}
				mSelection_Update(playerid);
			}
			case 1:
			{
				for(new i = 0; i < sizeof Vehicles_Free_TwoColor; i ++)
				{
					if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == Vehicles_Free_TwoColor[i])
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Este vehículo no tiene color secundario.", 2000);
						return 1;
					}
				}
				MenuV_Close(playerid, true);
				
				ShowModelSelectionMenuEx(playerid, ChangeVehicleColor2, "Color secundario");
				for(new i = 0; i < 255; i++)
				{
					mSelection_AddItems(playerid, Vehicles_Info[vehicleid][gi_vehicle_MODELID], 0, 0, Vehicles_Info[vehicleid][gi_vehicle_COLOR1], i, -10.0, -10.0, -10.0);
				}
				mSelection_Update(playerid);
			}
			case 2:
			{
				MenuV_Show(playerid, MainMenuWorkshop);
			}
		}
	}
	else
	{
		MenuV_Close(playerid);
	}
	return 1;
}

MenuV_Create:MainMenuWorkshop(playerid)
{
	ShowPlayerMenuV(playerid, MainMenuWorkshop, "Taller", true);
	vMenu_AddItems(playerid, "Colores"); 
	vMenu_AddItems(playerid, "Reparación"); 
	MenuV_Update(playerid);
	return 1;
}

MenuV_Create:MenuChangeColorV(playerid)
{
	ShowPlayerMenuV(playerid, MenuChangeColorV, "Cambiar color", true);
	vMenu_AddItems(playerid, "Color primario", "~g~$500"); 
	vMenu_AddItems(playerid, "Color secundario", "~g~$500");
	vMenu_AddItems(playerid, "Volver"); 
	MenuV_Update(playerid);
	return 1;
}

// House interior

Create_MenuPlayerHouse(playerid)
{
	ShowPlayerMenuV(playerid, MenuPlayerHouse, "Casa", true);
	vMenu_AddItems(playerid, "Editar interior", .extraid = 0);
	vMenu_AddItems(playerid, "Comprar muebles", .extraid = 1);
	vMenu_AddItems(playerid, "Editar muebles", .extraid = 4);
	vMenu_AddItems(playerid, "Vender muebles", .extraid = 5);
	vMenu_AddItems(playerid, "Vender casa", .extraid = 2); 
	vMenu_AddItems(playerid, "Cerrar", .extraid = 3); 
	MenuV_Update(playerid);
	return 1;
}

Create_MenuPlayerFurniture(playerid)
{
	ShowPlayerMenuV(playerid, BuyHouseFurniture, "Muebles", true);
	vMenu_AddItems(playerid, "Atrás", .extraid = 0);
	vMenu_AddItems(playerid, "Almacenamiento", .extraid = 1);
	vMenu_AddItems(playerid, "Camas", .extraid = 2); 
	vMenu_AddItems(playerid, "Electrodomésticos", .extraid = 3);
	vMenu_AddItems(playerid, "Cuadros", .extraid = 4);
	vMenu_AddItems(playerid, "Electrónica", .extraid = 5);
	vMenu_AddItems(playerid, "Decoración", .extraid = 6);  
	vMenu_AddItems(playerid, "Mesadas", .extraid = 7);
	vMenu_AddItems(playerid, "Sillas", .extraid = 8); 
	vMenu_AddItems(playerid, "Sillones y sofas", .extraid = 9);
	vMenu_AddItems(playerid, "Mesas", .extraid = 10); 
	MenuV_Update(playerid);
	return 1;
}

MenuV:MenuPlayerHouseEditInt(playerid, response, itemid, itemvalue[], extraid, titlevalue[])
{
	if(response)
	{
		if(!map_has_key(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], extraid)) return 1;

		new data[E_HOUSE_CUSTOMIZE_DATA];
		GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], extraid, data);
		
		House_SelectCameraFromInt(playerid, CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cInteriorID], extraid);

		new size = pool_size(data[E_HOUSE_CUSTOMIZE_DATA_POOL]);

		switch(extraid)
		{
			case 40:
			{
				MenuV_Close(playerid);
				Create_MenuPlayerHouse(playerid);
				return 1;
			}

			case 0, 2, 4, 6:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				LoadPlayerListMaterial(playerid, 0, data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL], size);
			}
			case 1, 3, 5, 7, 11:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				LoadPlayerListMaterial(playerid, 2, data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL], size);
			}
			case 8:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				LoadPlayerListMaterial(playerid, 3, data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL], size);
			}
			case 9:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				MenuV_Update(playerid);
			}
			case 10:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				LoadPlayerListMaterial(playerid, 1, data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL], size);
			}
			case 12:
			{
				ShowPlayerMenuV(playerid, MenuPlayerHouseIntEdit, titlevalue, true);
				vMenu_AddItems(playerid, "Atrás");
				LoadPlayerListMaterial(playerid, 4, data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL], size);	
			}

		}
		Player.Temp[playerid][@MenuIndexRoom] = extraid;
	}
	else
	{
		MenuV_Close(playerid);
		Create_MenuPlayerHouse(playerid);
	}
	return 1;
}

MenuV_Create:MenuPlayerHouseEditInt(playerid)
{
	ShowPlayerMenuV(playerid, MenuPlayerHouseEditInt, "Editar interior", true);

	vMenu_AddItems(playerid, "Atrás", .extraid = 40); 

	new data[E_HOUSE_CUSTOMIZE_DATA], int = 1;

	if(Date_InteriorRooms[int][HOUSE_INTERIOR_ROOM1] == 1)
	{
		GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 4, data);
		vMenu_AddItems(playerid, "Habitación 1 (paredes)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 4); 
		GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 5, data);
		vMenu_AddItems(playerid, "Habitación 1 (piso)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 5); 
	}
	if(Date_InteriorRooms[int][HOUSE_INTERIOR_ROOM2] == 1)
	{
		map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 6, data);
		vMenu_AddItems(playerid, "Habitación 2 (paredes)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 6);
		map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 7, data);
		vMenu_AddItems(playerid, "Habitación 2 (piso)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 7); 
		GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 12, data);
		vMenu_AddItems(playerid, "Escaleras", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 12);
	}
	if(Date_InteriorRooms[int][HOUSE_INTERIOR_BATH] == 1)
	{
		map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 2, data);
		vMenu_AddItems(playerid, "Baño (paredes)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 2); 
		map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 3, data);
		vMenu_AddItems(playerid, "Baño (piso)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 3);
	}

	GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 0, data);
	vMenu_AddItems(playerid, "Principal (paredes)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 0); 
	GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 1, data);
	vMenu_AddItems(playerid, "Principal (piso)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 1);
	GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 11, data);
	vMenu_AddItems(playerid, "Principal (piso superior)", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 11);

	map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 10, data);
	vMenu_AddItems(playerid, "Techo", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 10); 
	map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 8, data);
	vMenu_AddItems(playerid, "Puertas", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 8); 
	map_get_arr(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], 9, data);
	vMenu_AddItems(playerid, "Ventanas", Texture.Info[ data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] ][@Name], 9); 


	MenuV_Update(playerid);
	return 1;
}

MenuV:MenuPlayerHouse(playerid, response, itemid, const itemvalue[], extraid)
{
	if(response)
	{
		switch(extraid)
		{
			case 0:
			{
				//MenuV_Close(playerid, true);
				
				MenuV_Show(playerid, MenuPlayerHouseEditInt);
			}
			case 1: { Create_MenuPlayerFurniture(playerid); }
			case 2:
			{
				MenuV_Close(playerid);
				Dialog_SellHouseConfirm(playerid, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);
			}
			case 4:
			{
				MenuV_Close(playerid);
				Dialog_EditFurnitureObject(playerid, PLAYER_INTERIOR_PROPERTY, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);
			}
			case 5:
			{
				MenuV_Close(playerid);
				Dialog_SellFurnitureObject(playerid, PLAYER_INTERIOR_PROPERTY, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);
			}
			case 3:
			{
				MenuV_Close(playerid);
			}
		}
	}
	else
	{
		MenuV_Close(playerid);
	}
	return 1;
}

MenuV:MenuPlayerHouseIntEdit(playerid, response, itemid, itemvalue[], extraid)
{
	if(response)
	{
		if(itemid == 0)
		{
			ResetMenuIndexMaterialHouse(playerid);
			MenuV_Close(playerid);
			MenuV_Show(playerid, MenuPlayerHouseEditInt);
			HideDialogLeftMenuShop(playerid);
			SetCameraBehindPlayer(playerid);
		}
		else
		{
			new material = extraid;

			new data[E_HOUSE_CUSTOMIZE_DATA];
			GetDataHouseCustomInt(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][hCustomInterior], Player.Temp[playerid][@MenuIndexRoom], data);
			
			for_pool(it : data[E_HOUSE_CUSTOMIZE_DATA_POOL])
			{
				//SetDynamicObjectMaterial(iter_get(it), 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
				 House_SetMaterialForObject(iter_get(it), Player.Temp[playerid][@MenuIndexRoom], material);
			}
			Player.Temp[playerid][@MenuSelectedType] = 1;
			Player.Temp[playerid][@MenuSelected][0] = material;
			new price[14];

			format(price, sizeof(price), "%s", itemvalue);
			strdel(price, 0, 4);
			Player.Temp[playerid][@MenuSelected][1] = strval(price);

			OpenDialogLeftMenuShop(playerid, Texture.Info[ extraid ][@Name], "Sin descripción.", Player.Temp[playerid][@MenuSelected][1]);
		}
	}
	else
	{
		ResetMenuIndexMaterialHouse(playerid);
		MenuV_Close(playerid);
		MenuV_Show(playerid, MenuPlayerHouseEditInt);
		HideDialogLeftMenuShop(playerid);
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}

MenuV:BuyHouseFurniture(playerid, response, itemid, const itemvalue[], extraid, const titlevalue[])
{
	if(response)
	{
		ShowPlayerMenuV(playerid, MenuSelectItemFurniture, titlevalue, true);
		vMenu_AddItems(playerid, "Atrás");
		LoadPlayerListFurniture(playerid, extraid);
	}
	else
	{
		MenuV_Close(playerid);
		Create_MenuPlayerHouse(playerid);
	}
	return 1;
}

MenuV:MenuSelectItemFurniture(playerid, response, itemid, const itemvalue[], extraid, const titlevalue[])
{
	if(!response || itemid == 0)
	{
		Player.Temp[playerid][@EditFurniture] = 0;
		MenuV_Close(playerid);
		Create_MenuPlayerFurniture(playerid);
		DestroyDynamicObject(Player.Temp[playerid][@PrevFurnitureObj]);
		HideDialogLeftMenuShop(playerid);
		SetCameraBehindPlayer(playerid);
		TogglePlayerControllableEx(playerid, true);
	}
	else
	{
		TogglePlayerControllableEx(playerid, false);

		new Float:x, Float:y, Float:z, Float:newx, Float:newy;
		GetPlayerPos(playerid, x, y, z);
		new Float:angle;
		GetPlayerFacingAngle(playerid, angle);

		SetPlayerCameraPos(playerid, x, y, z + 1.4);
		
		GetPointInFrontPos(playerid, x, y, angle, newx, newy, 2.0);

		new Float:rotz = absoluteangle_func(GetAngleToPoint(x, y, newx, newy));

		DestroyDynamicObject(Player.Temp[playerid][@PrevFurnitureObj]);
		Player.Temp[playerid][@PrevFurnitureObj] = CreateDynamicObject(Furniture.Info[extraid][@Model], newx, newy, z - 0.96, 0.0, 0.0, rotz, -1, -1, playerid);
		Streamer_Update(playerid);
		
		Player.Temp[playerid][@EditFurniture] = 1;
		Player.Temp[playerid][@EditFurnitureRot] = rotz;

		SetPlayerCameraLookAt(playerid, newx, newy, (z-0.96)+1.0);

		Player.Temp[playerid][@MenuSelectedType] = 2;
		Player.Temp[playerid][@MenuSelected][0] = extraid;
		Player.Temp[playerid][@MenuSelected][1] = Furniture.Info[extraid][@Price];
		
		HideDialogLeftMenuShop(playerid, 1);
		if(Furniture.Info[ extraid ][@Slot] != -1)
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][3]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][4]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][4], playerid, "Por defecto");
			Player.Temp[playerid][@MaterialSelect][0] = 0;
		}
		if(Furniture.Info[ extraid ][@Slot2] != -1)
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][6]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][7]);
			Player.Temp[playerid][@MaterialSelect][1] = 0;
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][7], playerid, "Por defecto");
		}
		if(Furniture.Info[ extraid ][@Slot3] != -1)
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][8]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][9]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][9], playerid, "Por defecto");
			Player.Temp[playerid][@MaterialSelect][2] = 0;
		}
		OpenDialogLeftMenuShop(playerid, Furniture.Info[ extraid ][@Name], "Sin descripción.", Player.Temp[playerid][@MenuSelected][1]);
	}
	return 1;
}