mSelect:SelectBuySkin(playerid, response, itemid, modelid, price, extraid)
{
	if(!response) return 1;
	if(PlayerInfo[playerid][pDinero] < price) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);
	

	if(SavePlayerSkinToDB(playerid, modelid)) return ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes esta ropa.", 2000);

	CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_BUYNEWSKIN, "Compraste ropa nueva. Para~n~cambiarte de ropa busca un~n~~y~ropero.", 20, false);
	RemoveMoney(playerid,price, true, true);
	return 1;
}

mSelect:ChangeVehicleColor(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		Player.Temp[playerid][@TypeBuyConfirm] = TYPE_DIALOG_CONFIRM_COLOR1_V;
		DynamicDgui_Start(playerid);

		DynamicDgui_AddVar(playerid,itemid);

		Dialog_Show(playerid, DialogConfirmColor, DIALOG_STYLE_MSGBOX, "{00C0FF}Cambiar color", "{FFFFFF}¿Quieres pintar tu vehiculo?\nCosto: {00E000}$500", "Confirmar", "Cancelar");
	
		ChangeVehicleColor(vehicleid, itemid, Vehicles_Info[vehicleid][gi_vehicle_COLOR2]);
	}
	else
	{
		MenuV_Show(playerid, MenuChangeColorV);
	}
	return 1;
}

mSelect:ChangeVehicleColor2(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		Player.Temp[playerid][@TypeBuyConfirm] = TYPE_DIALOG_CONFIRM_COLOR2_V;
		DynamicDgui_Start(playerid);

		DynamicDgui_AddVar(playerid,itemid);

		Dialog_Show(playerid, DialogConfirmColor, DIALOG_STYLE_MSGBOX, "{00C0FF}Cambiar color", "{FFFFFF}¿Quieres pintar tu vehiculo?\nCosto: {00E000}$500", "Confirmar", "Cancelar");
	
		ChangeVehicleColor(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_COLOR1], itemid);
	}
	else
	{
		MenuV_Show(playerid, MenuChangeColorV);
	}
	return 1;
}

mSelect:sBuyPhones(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		new random_number = randomEx(10000, 9999999);

		new id_slot = AddItemInvPlayerEx(playerid, ItemType_Phones[itemid], random_number);

		SaveSlotInventoryToDB(playerid, id_slot);

		RegisterNewNumberPhone(random_number);
			
		RemoveMoney(playerid,price, true, true);
	}
	return 1;
}

mSelect:sBuyVehicle1(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		PlayerInfoTemp[playerid][pt_VEHICLE_BUY_SELECTED_ID] = modelid;
		mysql_tquery_s(conexion, str_format("SELECT COUNT(`owner_id`) AS Vehicles FROM `lac_uservehicles` WHERE `owner_id` = %d;", PlayerInfo[playerid][pID]), "GetPlayerVehicleCount", "i", playerid);
	}
	return 1;
}

mSelect:BuyCapClothesPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		BuyPlayerStoreItems(playerid, extraid, 0, price);
	}
	return 1;
}

mSelect:BuyHatClothesPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		BuyPlayerStoreItems(playerid, extraid, 0, price);
	}
	return 1;
}

mSelect:BuyGlassesClothesPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		BuyPlayerStoreItems(playerid, extraid, 0, price);
	}
	return 1;
}

mSelect:BuyWatchClothesPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		BuyPlayerStoreItems(playerid, extraid, 0, price);
	}
	return 1;
}

mSelect:BuyBackpadClothingPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(!response) return 0;
	
	await mysql_aquery(conexion, "INSERT INTO `lac_item_storage` (`extra`) VALUES (0);");
	
	new dbid = cache_insert_id();

	BuyPlayerStoreItems(playerid, extraid, dbid, price);
	return 1;
}

mSelect:ChangeSkinPlayer(playerid, response, itemid, modelid, price, extraid)
{
	if(response)
	{
		SetPlayerSkin(playerid, modelid);
		PlayerInfo[playerid][pRopa] = modelid;
	}
	return 1;
}