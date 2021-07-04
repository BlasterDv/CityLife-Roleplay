// Callback
OpenPlayerDialogShop(playerid, type = 0)
{
	switch(type)
	{
		case 0:
		{
			ApplyAnimationEx(playerid, "COP_AMBIENT", "COPLOOK_THINK", 4.1, false, true, true, true, 0);
		}
	}

	return 1;
}

CancelPlayerDialogShop(playerid)
{
	ApplyAnimationEx(playerid, "COP_AMBIENT", "COPLOOK_OUT", 4.1, false, false, false, false, 0);
	return 1;
}


//Dialogs

Dialog:dTeleport(playerid, response, listitem, inputtext)
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			ShowPlayerDialog(playerid, Teleport1, DIALOG_STYLE_LIST, "Teleport 1", "MedicoLs1", "Seleccionar", "Cerrar");
			case 1:
			ShowPlayerDialog(playerid, Teleport2, DIALOG_STYLE_LIST, "Teleport 2", "Camionero\nBasurero\nTransportista\nTaxista\nGranjero", "Seleccionar", "Cerrar");
			case 2:
			ShowPlayerDialog(playerid, Teleport3, DIALOG_STYLE_LIST, "Teleport 3", "Aeropuerto Ls\nAeropuerto Lv", "Seleccionar", "Cerrar");
			case 3:
			ShowPlayerDialog(playerid, Teleport4, DIALOG_STYLE_LIST, "Teleport 4", "Negocios\nTrabajos\nAreas Publicas\nTiendas de Ropa", "Seleccionar", "Cerrar");
			case 5:
			Dialog_Show(playerid, dTeleport247, DIALOG_STYLE_LIST, "Teleport - 24/7", "24/7 - 1\n24/7 - 2\n24/7 - 3\n24/7 - 4\n24/7 - 5\n24/7 - 6", "Seleccionar", "Cerrar");

		}
	}
	return 1;
}
Dialog:dTeleport247(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: { SetPlayerPosEx(playerid, -25.884498,-185.868988,1003.546875, 0.0, 0, 17); }
			case 1: { SetPlayerPosEx(playerid, 6.091179,-29.271898,1003.549438, 0.0, 0, 10); }
			case 2: { SetPlayerPosEx(playerid, -30.946699,-89.609596,1003.546875, 0.0, 0, 18); }
			case 3: { SetPlayerPosEx(playerid, -25.132598,-139.066986,1003.546875, 0.0, 0, 16); }
			case 4: { SetPlayerPosEx(playerid, -27.312299,-29.277599,1003.557250, 0.0, 0, 4); }
			case 5: { SetPlayerPosEx(playerid, -26.691598,-55.714897,1003.546875, 0.0, 0, 6); }
		}
	}
	return 1;
}

Dialog:DialogSelectAge(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(18 <= strval(inputtext) <= 90)
		{
			PlayerInfo[playerid][pEdad] = strval(inputtext);
			ShowPlayerDialog(playerid, Email, DIALOG_STYLE_INPUT, "Ingresar Correo Electr�nico", "Ingresa tu Correo Electr�nico:", "Siguiente", "Cancelar");
		}
		else
		{
			Dialog_Show(playerid, DialogSelectAge, DIALOG_STYLE_INPUT, "{5EB5FF}Ingresa la edad de tu personaje", "{FFFFFF}Ingresa una edad mayor a {DE5454}18 a�os {FFFFFF}y menor a {DE5454}90 a�os", "Siguiente", "Cancelar");
		}
	} else { Kick(playerid); }
	return 1;
}

Dialog:DialogBuyServiceStore(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			{
				if(PlayerInfo[playerid][pDinero] < 20) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);
				if(AddItemInvPlayer(playerid, 198, 10, true) == -1) return CancelPlayerDialogShop(playerid);
				RemoveMoney(playerid, 20); 
				CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_SHOPTUTORIAL, "Para usar el bid�n col�cate cerca de la tapa de combustible y pulsa la tecla ~k~~CONVERSATION_YES~.", 28);
			}
		}
	}
	CancelPlayerDialogShop(playerid);
	return 1;
}

Dialog:DialogBuyWorkshopTools(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			{
				if(BuyPlayerStoreItems(playerid, 197, 0, 400))
				{
					CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_SHOPTUTORIAL, "Para usar el Kit de reparaci�n col�cate cerca del capo y~n~pulsa ~k~~CONVERSATION_YES~.", 20);
				}
			}
		}
	}
	CancelPlayerDialogShop(playerid);
	return 1;
}

Dialog:DialogBuyFoodCB(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new item = DynamicSGUI_GetValue(playerid, listitem, 0);
		new money = DynamicSGUI_GetValue(playerid, listitem, 1);

		if(!DynamicSGUI_ValidItem(playerid, listitem)) return 1;
		BuyPlayerStoreItems(playerid, item, 4, money);		
	}
	CancelPlayerDialogShop(playerid);
	return 1;
}

Dialog:DialogBuyWeapon(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		switch(listitem)
		{
			case 0:
			{
				BuyPlayerStoreItems(playerid, id, 7, 4500);
			}
			case 1:
			{
				BuyPlayerStoreItems(playerid, id, 7, 4800);
			}
			case 2:
			{
				BuyPlayerStoreItems(playerid, id, 24, 7800);
			}
			case 3:
			{
				BuyPlayerStoreItems(playerid, id, 24, 7400);
			}
			case 4:
			{
				BuyPlayerStoreItems(playerid, id, 2, 7500);
			}
			case 5:
			{
				BuyPlayerStoreItems(playerid, id, 10, 10700);
			}
			case 6:
			{
				BuyPlayerStoreItems(playerid, id, 7, 500);
			}
			case 7:
			{
				BuyPlayerStoreItems(playerid, id, 40, 1800);
			}
			case 8:
			{
				BuyPlayerStoreItems(playerid, id, 80, 2000);
			}
			case 9:
			{
				BuyPlayerStoreItems(playerid, id, 14, 2000);
			}
			case 10:
			{
				BuyPlayerStoreItems(playerid, id, 20, 2100);
			}
		}
	}
	CancelPlayerDialogShop(playerid);
	return 1;
}
Dialog:DialogBuyWeapon2(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		switch(listitem)
		{
			case 0:
			{
				BuyPlayerStoreItems(playerid, id, 0, 500);
			}
			case 1:
			{
				BuyPlayerStoreItems(playerid, id, 10000, 480);
			}
		}
	}
	CancelPlayerDialogShop(playerid);
	return 1;
}
Dialog:DialogBuyDrinkMarket(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: { BuyPlayerStoreItems(playerid, 36, 4, 40); }
			case 1: { BuyPlayerStoreItems(playerid, 39, 4, 60); }
			case 2: { BuyPlayerStoreItems(playerid, 38, 4, 60); }
			case 3: { BuyPlayerStoreItems(playerid, 54, 4, 40); }
			case 4: { BuyPlayerStoreItems(playerid, 55, 4, 40); }
			case 5: { BuyPlayerStoreItems(playerid, 56, 4, 40); }
			case 6: { BuyPlayerStoreItems(playerid, 37, 4, 60); }
			case 7: { BuyPlayerStoreItems(playerid, 38, 4, 60); }

		}
	}
	return 1;
}
Dialog:DialogRentVehicle(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, 0);
		Vehicles_Info[id][gi_vehicle_OWNER] = playerid;
		DestroyDynamic3DTextLabel(Vehicles_Info[id][gi_vehicle_LABEL][0]);

		PlayerInfoTemp[playerid][pt_TimersG][1] = SetTimerEx("CheckDistanceVehicleType", 2050, true, "iii", playerid, id, VEHICLE_TYPE_RENT);

		rBit1_Set(eBit1_PlayerInfo[p_ActiveTimeRentVehicle], playerid, true);
		PlayerInfo[playerid][p_RentSeconds] = 0;
		PlayerInfo[playerid][p_RentMinutes] = 0;

		Player.Temp[playerid][@RentVehicle] = id;

		Vehicles_Info[id][gi_vehicle_VALID] = true;
		VEHICLES_PLAYER[id][player_vehicle_VALID] = true;
		VEHICLES_PLAYER[id][player_vehicle_OWNER] = PlayerInfo[playerid][pID];
		format(Vehicles_Info[id][gi_vehicle_PLATE_NUMBER], 32, "%s%s%s%s %d%d%d", LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], random(10), random(10), random(10));

		AddPerPlayerVehicleDB(playerid, id, 10);
		AssignAreaForVehicles(id);

		new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_RENTEDVEHICLE, 52.0, 0);
		funct_CreateTextdrawTextNotifEx(playerid, i, 0, "~w~Tiempo rentado: ~n~~w~Costo total: $", 1, 0.0, 1.0, 0.240, 1.2);
		funct_CreateTextdrawTextNotifEx(playerid, i, 1, "Mant�n pulsado 2 para desrentar~n~el veh�culo.", 1, 0.0, 28.0 ,VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2);
		UpdateNotificationForPlayer(playerid, i);
	}
	else
	{
		RemovePlayerFromVehicle(playerid);
	}
	return 1;
}

Dialog:DialogChangePassword(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(!strlen(inputtext)) return Dialog_Show(playerid, DialogChangePassword, DIALOG_STYLE_PASSWORD, "{5EB5FF}Cambiar contrase�a", "{FFFFFF}Ingresa tu contrase�a actual:", "Siguiente", "Cancelar");
		
		Dialog_Show(playerid, WaitDialogChangePassword, DIALOG_STYLE_MSGBOX,"{5EB5FF}Cambiar contrase�a", "{FFFFFF}....", "....", "");
		bcrypt_verify(playerid, "OnPlayerChangePassChecked", inputtext, PlayerInfo[playerid][pPassword]);
	}
	return 1;
}

Dialog:DialogChangePasswordNew(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	}
	return 1;
}

Dialog:WaitDialogChangePassword(playerid, response, listitem, inputtext[])
{
	Dialog_Show(playerid, WaitDialogChangePassword, DIALOG_STYLE_MSGBOX, "{5EB5FF}Cambiar contrase�a", "{FFFFFF}....", ".....", "");		
	return 1;
}

Dialog:DialogBuyPizza(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(listitem == 0) { BuyPlayerStoreItems(playerid, 40, 4, 20); }
	}
	return 1;
}
Dialog:DialogBuyDrinkGeneral(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);
		switch(id)
		{
			case 0: { BuyPlayerStoreItems(playerid, 36, 4, 40); }
		}
	}
	return 1;
}


Dialog:DialogBuyVehicleP(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new model = PlayerInfoTemp[playerid][pt_VEHICLE_BUY_SELECTED_ID];

		new Float:x,Float:y,Float:z, Float:a, slot;
		GetNearbyPlayerPos(playerid, x,y,z,a);
//		new id = AddPlayerPerVehicle(playerid,model, x, y, z+0.5, a, 1, 1);
		if(PlayerInfo[playerid][p_VehicleSlot][0] == 0) { slot = 0; }
		else if(PlayerInfo[playerid][p_LEVEL] >= 4 && PlayerInfo[playerid][p_VehicleSlot][1] == 0) { slot = 1; }
		else if(PlayerInfo[playerid][p_LEVEL] >= 10 && PlayerInfo[playerid][p_VehicleSlot][2] == 0) { slot = 2; }
		else
		{
			ShowPlayerInfoTextdraw(playerid, "~r~No puedes tener mas veh�culos.", 2000);
			return 1;
		}

		if(Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_Currency] == 0)
		{
			if(PlayerInfo[playerid][pDinero] < Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_PRICE]) return SendClientMessage(playerid, Blanco, "No tienes el dinero suficiente.");
			RemoveMoney(playerid, Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_PRICE], true, true);
		}
		else
		{
			if(PlayerInfo[playerid][pLAC] < Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_PRICE]) return SendClientMessage(playerid, Blanco, "No tienes los Coins suficientes.");
			PlayerInfo[playerid][pLAC] -= Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_PRICE];
		}
		
			
		new id = AddPlayerPerVehicle(playerid,model, x, y, z+0.5, a, 1, 1, slot);
		PlayerInfo[playerid][p_VehicleSlot][slot] = id;
		
		
		
	}
	return 1;
}

Dialog:DialogSelectOptionFarmer(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(listitem == 0)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			StartMissionJobFarmer(playerid);
			CamionID[playerid] = vehicleid;
			PlayerInfoTemp[playerid][pt_TimersG][0] = SetTimerEx("CheckDistanceVehicleJob", 2050, true, "ii", playerid, WORK_TYPE_FARMER);

			VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = playerid;

			PlayerInfo[playerid][p_JobTravelT] = 1;

			funct_AddTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
			PlayerInfoTemp[playerid][pt_TimersE][7] = SetTimerEx("CheckJobMissionTimer", 1000, true, "i", playerid);
			PlayerInfo[playerid][p_JobTimeMax] = 1500;

		}
	}
	else
	{
		RemovePlayerFromVehicle(playerid);
	}
	return 1;
}

Dialog:dNewContactNumber(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		DynamicDgui_Start(playerid);
		if(sscanf(inputtext, "d", inputtext[0]))
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, -1, "Ingresa un numero valido.");
			ShowDialogEx(playerid, DIALOG_ADD_NUMBER_CONTACT);
			return 1;
		}
		if(inputtext[0] <= 0)
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, -1, "Introduce un numero valido.");
			ShowDialogEx(playerid, DIALOG_ADD_NUMBER_CONTACT);
			return 1;
		}
		DynamicDgui_AddVar(playerid, inputtext[0]);
		Dialog_Show(playerid, dNewContactName, DIALOG_STYLE_INPUT, "{5EB5FF}Agregar contacto - Nombre", "Ingresa el nombre del contacto", "Agregar", "Cancelar");
	}
	return 1;
}
Dialog:dNewContactName(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(strlen(inputtext) >= 24)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~La cantidad m�xima para el nombre~n~es de 24 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
			return 1;
		}
		new text[24];
		if(sscanf(inputtext, "s[24]", text))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Introduce un nombre para el contacto.", 4000);
			return 1;
		}

		RegisterPhoneBookContact(GetInvAmountItemSelected(playerid), strval(Player.Temp[playerid][@CalledPlayer]), text);
		
		new temp = PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED];
		HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);

		format(Player.Temp[playerid][@CalledPlayer], 9, "%d", temp);
		ShowPlayerMobilePhoneMenu(playerid, 9);
		//UpdateMobilePhoneList(playerid, 2);
	}
	return 1;
}
Dialog:dDeletePhoneBookContact(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);
		switch(listitem)
		{
			case 0:
			{
				DynamicDgui_Start(playerid);
				DynamicDgui_AddVar(playerid, id);
				ShowDialogEx(playerid, DIALOG_SEND_MESSAGE_PHONE);
			}
			case 1:
			{
				new Query[250];
				format(Query, sizeof(Query), "DELETE FROM `lac_phone_book` WHERE `id_contact`=%d;", id);
				mysql_tquery(conexion, Query);
				UpdateMobilePhoneList(playerid, 2);
			}
		}
	}
	return 1;
}

Dialog:dSendSMSPhoneContact(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(strlen(inputtext) < 1) return ShowPlayerInfoTextdraw(playerid, "~r~El mensaje debe contener por lo menos 1 caracteres.", 4000);
		
		await mysql_aquery_s(conexion, str_format("SELECT `lac_phone_book`.`number_contact`, COUNT(`lac_phone_messages`.`to_phone`) AS `messages_count` FROM `lac_phone_book`, `lac_phone_messages` WHERE `id_contact`=%d;", strval(Player.Temp[playerid][@CalledPlayer])));

		new rows;
		cache_get_row_count(rows);
		if(rows > 0)
		{
			new phone_contact, messages_count;
			cache_get_value_name_int(0, "messages_count", messages_count);
			cache_get_value_name_int(0, "number_contact", phone_contact);

			if(messages_count > 20)
			{
				new query[128];
				format(query, sizeof(query), "DELETE FROM `lac_phone_messages` WHERE `to_phone`=%d ORDER BY date ASC LIMIT 1", GetInvAmountItemSelected(playerid));
				mysql_tquery(conexion, query);
			}

			new inputtext_s[59];
			format(inputtext_s, sizeof(inputtext_s), "%s", inputtext);
			RegisterPhoneSendSMS(GetInvAmountItemSelected(playerid), phone_contact, inputtext_s);
				//UpdateMobilePhoneList(playerid, 4);

			ShowPlayerInfoTextdraw(playerid, "~g~Mensaje enviado.", 4000);
		}
	}

	return 1;
}

Dialog:dSendSMSPhoneMSG(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, 0);
		if(strlen(inputtext) < 4) return ShowPlayerInfoTextdraw(playerid, "~r~El mensaje debe contener por lo menos 4 caracteres.", 4000);
		if(strlen(inputtext) > 50) return ShowPlayerInfoTextdraw(playerid, "~r~El mensaje debe ser menor a 50 caracteres.", 4000);
		
		await mysql_aquery_s(conexion, str_format("SELECT lac_phone.*, COUNT(`lac_phone_messages`.`to_phone`) AS `messages_count` FROM `lac_phone`, `lac_phone_messages` WHERE `number_phone`=%d AND `to_phone`=%d;", id, id));

		new rows;
		cache_get_row_count(rows);
		if(rows > 0)
		{
			new messages_count;
			cache_get_value_name_int(0, "messages_count", messages_count);

			if(messages_count > 20)
			{
				new query[128];
				format(query, sizeof(query), "DELETE FROM `lac_phone_messages` WHERE `to_phone`=%d ORDER BY date ASC LIMIT 1", GetInvAmountItemSelected(playerid));
				mysql_tquery(conexion, query);
			}

			new inputtext_s[59];
			format(inputtext_s, sizeof(inputtext_s), "%s", inputtext);
			RegisterPhoneSendSMS(GetInvAmountItemSelected(playerid), id, inputtext_s);

			UpdateMobilePhoneList(playerid, 4);
			
			ShowPlayerInfoTextdraw(playerid, "~g~Mensaje enviado.", 4000);
		}
		else
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Error con el destinatario.", 4000);
		}
		

	}
	return 1;
}

Dialog:dSendSMSPhoneID(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		DynamicDgui_Start(playerid);
		if(sscanf(inputtext, "d", inputtext[0]))
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, -1, "Ingresa un numero valido.");
			ShowDialogEx(playerid, DIALOG_SEND_MESSAGE_PHONE_ID);
			return 1;
		}
		if(inputtext[0] <= 0)
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, -1, "Introduce un numero valido.");
			ShowDialogEx(playerid, DIALOG_SEND_MESSAGE_PHONE_ID);
			return 1;
		}

		DynamicDgui_AddVar(playerid, inputtext[0]);
		ShowDialogEx(playerid, DIALOG_SEND_MESSAGE_PHONE_MSG);
	}
	return 1;
}

Dialog:dCreateFactionRank(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(strlen(inputtext) >= 21)
		{
			SendClientMessage(playerid, -1, "{999999}Como m�ximo puedes introducir un nombre de 21 caracteres.");
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
			return 1;
		}

		new rank_name[21];
		if(sscanf(inputtext, "s[21]", rank_name))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Introduce un nombre para el rango.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
			return 1;
		}

		if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Valid])
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Este espacio ya esta en uso.", 2000);
			return 1;
		}


		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Valid] = true;
		format(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name], 24, "%s", rank_name);

		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_CHANGE_NAME] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_INVITE] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_CAST_MEMBERS] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_MODIFY_MEMBERS] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_MODIFY_RANKS] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_MODIFY_RANKS] =
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][FACTION_RANK_CHANGE_COLOR] = 0;
		RegisterNewFactionRank(playerid, Player.Faction[playerid][@Index], PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]);

		new string[128];
		format(string, sizeof(string), "Creaste un nuevo rango con el nombre de ~y~%s", rank_name);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONNEWRANK, string, 14);
		//ShowDialogEx(playerid, DIALOG_CREW_RANKS);
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_RANKS); // Temp
	return 1;
}

Dialog:dCreateFactionQuestion(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(strlen(inputtext) >= 64)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~M�ximo 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
			return 1;
		}

		new question_text[64];
		if(sscanf(inputtext, "s[64]", question_text))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Introduce un texto para la pregunta.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
			return 1;
		}  	

		await mysql_aquery_s(conexion, str_format("SELECT COUNT(`id_faction`) AS `RequestCount` FROM `lac_faction_questions` WHERE `id_faction` = %d;", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@ID]));
			
		new count, request_count;
		cache_get_row_count(count);
		if(count) cache_get_value_name_int(0, "RequestCount", request_count);

		if(request_count >= 10) return ShowPlayerInfoTextdraw(playerid, "~r~El numero m�ximo de preguntas que~n~puedes a�adir es 10.", 4000);
		
		RegisterNewFactionQuestion(playerid, Player.Faction[playerid][@Index], question_text);
		
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS); // Temp
	return 1;
}

Dialog:dDeletePhoneSMS(playerid, response, listitem, inputtext[])
{
	
	return 1;
}

Dialog:DialogFactionRanks(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes permiso.", 2000);

	if(response)
	{
		if((9-listitem) > PlayerInfo[playerid][p_FactionRank])
		{
			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][listitem][@Valid]) ShowPlayerInfoTextdraw(playerid, "~r~No puedes modificar este rango~n~ porque es superior al tuyo.", 4000);
			else ShowPlayerInfoTextdraw(playerid, "~r~No puedes crear un rango en este espacio~n~ porque es superior al tuyo.", 4000);
			return 1;
		}

		PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] = (9-listitem);
		if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][(9-listitem)][@Valid]) ShowDialogEx(playerid, DIALOG_FAC_RANK_MODIFY);
		else ShowDialogEx(playerid, DIALOG_FACTION_CREATE_RANK);
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	return 1;
}

Dialog:DialogFactionRankDelete(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No puedes hacer esto.", 2000);

		new rank = DynamicDgui_GetValue(playerid, listitem);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][rank][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Rango invalido.", 2000);

		mysql_aquery_s(conexion, str_format(
			"UPDATE `lac_users` SET `fact_rank` = %d WHERE `faction_id` = %d AND `fact_rank`= %d; \
			DELETE FROM `lac_faction_ranks` WHERE `id`=%d;", 
			rank, PlayerInfo[playerid][p_FactionMember], PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@ID]
		));

		new string[70];
		format(string, sizeof(string), "Has borrado el rango %s.", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name]);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONDELETERANK, string, 10);

		foreach(new i : Player)
		{
			if(PlayerInfoTemp[i][pt_IsLoggedIn])
			{
				if(Player.Faction[i][@Valid])
				{
					if(PlayerInfo[i][p_FactionMember] == PlayerInfo[playerid][p_FactionMember])
					{
						if(PlayerInfo[i][p_FactionRank] == PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK])
						{
							PlayerInfo[i][p_FactionRank] = rank;
						}
					}
				}
			}
		}

		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Valid] = false;
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@ID] = 0;
		FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name][0] = EOS;
		for(new i = 0; i != FACTION_RANK_MAX; i ++) FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][i] = 0;
	}
	return 1;
}

Dialog:DialogFactionQuestions(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return SendClientMessage(playerid, 0x999999AA, "No tienes permiso.");

	if(response)
	{
		/*if(listitem < PlayerInfo[playerid][p_FactionRank])
		{
			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][listitem][@Valid]) SendClientMessage(playerid, -1, "{999999}No puedes modificar este rango porque es un rango superior al tuyo.");
			else SendClientMessage(playerid, -1, "No puedes crear un rango en este puesto porque es superior al tuyo.");
			return 1;
		}*/
		new id_list = DynamicDgui_GetValue(playerid, listitem);

		if(listitem == 0)
		{
			Dialog_Show(playerid, dCreateFactionQuestion, DIALOG_STYLE_INPUT, "{5EB5FF}A�adir nueva pregunta", "{FFFFFF}Escribe una pregunta con un m�ximo de 64 caracteres:", "A�adir", "Volver");
			return 1;
		}

		PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] = listitem;
		PlayerInfoTemp[playerid][pt_DIAG_SELECTED_DB_ID] = id_list;
		if(id_list != 0) ShowDialogEx(playerid, DIALOG_FAC_QUIZ_MODIFY);
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	return 1;
}

Dialog:dModifyRankFac(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 2000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes permiso.", 2000);

	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		switch(id)
		{
			case 0:
			{
				if(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] == 9)
				{
					ShowPlayerInfoTextdraw(playerid, "~r~No se puede modificar el rango due�o.", 2000);
					return 1;
				}
				else if(IsFactionRankDefault(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]) == -1)
				{
					ShowPlayerInfoTextdraw(playerid, "~r~Acci�n no permitida.", 2000);
					return 1;
				}

				ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_PERMISS);
			}
			case 1: ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_NAME);
			case 2:
			{
				if(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] == 9)
				{
					ShowPlayerInfoTextdraw(playerid, "~r~No se puede eliminar este rango porque es el rango due�o.", 2000);
					return 1;
				}
				else if(IsFactionRankDefault(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]) != -1)
				{
					ShowPlayerInfoTextdraw(playerid, "~r~Este rango no se puede eliminar.", 2000);
					return 1;
				}
				new string[70];
				format(string, sizeof(string), "Elige un rango nuevo, para mover a los miembros del rango %s.", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name]);
				CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONDELETERANK2, string, 15);

				ShowDialogEx(playerid, DIALOG_RANKF_DELETE);
			}
		}
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_RANKS);
	return 1;
}

Dialog:dModifyQuestionFac(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 2000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes permiso.", 2000);

	if(response)
	{
		//new id = DynamicDgui_GetValue(playerid, listitem);

		switch(listitem)
		{
			
			case 0: ShowDialogEx(playerid, DIALOG_QUESTION_MODIFY_TEXT);
			case 1:
			{
				Dialog_Show(playerid, dFacQuestionDelete, DIALOG_STYLE_MSGBOX, "{5EB5FF}Confirmar", "{FFFFFF}�Estas seguro de borrar esta pregunta?", "Confirmar", "Cancelar");
			}
		}
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
	return 1;
}

Dialog:dChangeColorFaction(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 2000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~Sin permisos.", 4000);

	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] = id;

		mysql_tquery_s(conexion, str_format("UPDATE `lac_facciones` SET `Color` = %d WHERE `id` = %d;", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color], FactionCrew.Info[ Player.Faction[playerid][@Index] ][@ID]));
	} else ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	return 1;
}

Dialog:dRankModifyPermiss(playerid, response, listitem, inputext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 4000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes permiso.", 4000);

	if(response)
	{
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][listitem])
		{
			ShowPlayerInfoTextdraw(playerid, "~r~No tienes lo permisos necesarios.", 4000);
			ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_PERMISS);
			return 1;
		}

		if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][listitem]) FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][listitem] = false;
		else FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][listitem] = true;

		new DB_Query[120];
		format(DB_Query, sizeof DB_Query, "UPDATE `lac_faction_rank_perm` SET `permission_%d` = %d WHERE `id_rank` = %d;", listitem, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][listitem], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@ID]);
		mysql_tquery(conexion, DB_Query);

		ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_PERMISS);
	}
	else ShowDialogEx(playerid, FACTION_RANK_MODIFY_RANKS);
	return 1;
}

Dialog:dRankModifyName(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return SendClientMessage(playerid, -1, "No estas en ninguna banda.");
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

	if(response)
	{
		if(strlen(inputtext) >= 24)
		{
			SendClientMessage(playerid, -1, "Cantidad m�xima de caracteres {5EB5FF}24 caracteres{FFFFFF}.");
			ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_NAME);
			return 1;
		}

		new rank_name[24];
		if(sscanf(inputtext, "s[24]", rank_name))
		{
			SendClientMessage(playerid, -1, "Introduce el nuevo nombre para el rango.");
			ShowDialogEx(playerid, DIALOG_RANKF_MODIFY_NAME);
			return 1;
		}

		new string[128];
		format(string, sizeof(string), "Cambiaste el nombre del rango %s a %s.", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name], rank_name);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTRANKS, string, 4);

		format(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name], 32, "%s", rank_name);

		mysql_tquery_s(conexion, str_format("UPDATE `lac_faction_ranks` SET `RankName` = '%q' WHERE `id` = %d;", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@ID]));

		UpdateListFactionGeneral(playerid, 1);
	}
	else ShowDialogEx(playerid, FACTION_RANK_MODIFY_RANKS);
	return 1;
}

Dialog:dQuestionModifyText(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return SendClientMessage(playerid, -1, "No estas en ninguna banda.");
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

	if(response)
	{
		if(strlen(inputtext) >= 64)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_QUESTION_MODIFY_TEXT);
			return 1;
		}

		new question_text[64];
		if(sscanf(inputtext, "s[64]", question_text))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe una pregunta con un m�ximo de 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_QUESTION_MODIFY_TEXT);
			return 1;
		}

		//format(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name], 32, "%s", rank_name);

		mysql_tquery_s(conexion, str_format("UPDATE `lac_faction_questions` SET `body` = '%q' WHERE `id_question` = %d;", question_text, PlayerInfoTemp[playerid][pt_DIAG_SELECTED_DB_ID]));
		//printf("Query: %s", Query);

		ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);

		//UpdateListFactionGeneral(playerid, 1);
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
	return 1;
}

Dialog:dFacQuestionDelete(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

	if(response)
	{
		mysql_tquery_s(conexion, str_format("DELETE FROM `lac_faction_questions` WHERE `id_question` = %d;", PlayerInfoTemp[playerid][pt_DIAG_SELECTED_DB_ID]));

		ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
	return 1;
}
// Enviar mensaje banda

Dialog:dSendMsgAll(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

		if(strlen(inputtext) >= 64)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 64.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSGALL);
			return 1;
		}
		else if(strlen(inputtext) < 4)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad minima de caracteres 4.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSGALL);
			return 1;
		}

		new message[64 + 24];
		if(sscanf(inputtext, "s[64]", message))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe un mensaje con~n~un m�ximo de 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSGALL);			
			return 1;
		}

		format(message, sizeof(message), "%s: %s", PlayerInfo[playerid][p_Name], message);

		//format(query, sizeof(query), "SELECT `InGameID`, `name`, `id` FROM `lac_users` WHERE `faction_id` = %d;", PlayerInfo[playerid][p_FactionMember]);
		new rows;
		await mysql_aquery_s(conexion, str_new_static("SELECT `InGameID`, `name`, `id` FROM `lac_users` WHERE `faction_id` = ") % PlayerInfo[playerid][p_FactionMember]+str_new_static(";"));
	
		cache_get_row_count(rows);
		
		for(new i = 0; i < rows; i++) 
		{
			new name[24], player_id, player_db;
		   	
		   	cache_get_value_name(i, "name", name, 24);
		   	cache_get_value_name_int(i, "InGameID", player_id);
		   	cache_get_value_name_int(i, "id", player_db);

		   	AddPlayerMessageNotification(playerid, player_db, 0, message);

		   	if(IsPlayerLogged(player_id))
		   	{
		   		CreatePlayerNotificationSimple(player_id, VNOTI_TYPE_RECEFACTIONMESSAGE, message, 10);
		   	}
		}
	}
	else
	{
		ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	}
	return 1;
}

Dialog:dSendMsgUser(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

		if(strlen(inputtext) >= 64)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 64.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSG);
			return 1;
		}
		else if(strlen(inputtext) < 4)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad minima de caracteres 4.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSG);
			return 1;
		}

		new message[64 + 24];
		if(sscanf(inputtext, "s[64]", message))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe un mensaje con~n~un m�ximo de 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_SENDMSG);			
			return 1;
		}

		new query[128]; 

		format(query, sizeof(query), "SELECT `InGameID`, `name`, `id` FROM `lac_users` WHERE `id` = %d;", Player.Temp[playerid][@ListSelectedDBID]);
		await mysql_aquery(conexion, query);
		
		new rows;
		cache_get_row_count(rows);
		
		for(new i = 0; i < rows; i++) 
		{
			new name[24], player_id, player_db;
		   	
		   	cache_get_value_name(i, "name", name, 24);
		   	cache_get_value_name_int(i, "InGameID", player_id);
		   	cache_get_value_name_int(i, "id", player_db);

		   	AddPlayerMessageNotification(playerid, player_db, 0, message);

		   	if(IsPlayerLogged(player_id))
		   	{
		   		CreatePlayerNotificationSimple(player_id, VNOTI_TYPE_RECEFACTIONMESSAGE, message, 10);
		   	}
		}
	} else ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	return 1;
}

Dialog:dSendMsgRequest(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

		new id = DynamicDgui_GetValue(playerid, 0);

		if(strlen(inputtext) >= 64)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 64.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_REJEREQUESTMSG);
			return 1;
		}

		new message[64 + 24];
		if(sscanf(inputtext, "s[64]", message))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe un mensaje con~n~un m�ximo de 64 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_REJEREQUESTMSG);			
			return 1;
		}

		new query[250]; 
		format(query, sizeof(query), "SELECT u.`name`, u.`InGameID`, r.`id_user` FROM `lac_faction_requests` r INNER JOIN `lac_users` u ON r.`id_user` = u.`id` WHERE r.`id_request` = %d;", id);
		await mysql_aquery(conexion, query);
		
		new rows;
		cache_get_row_count(rows);
		
		new name[24], player_id, player_db;
		if(rows) 
		{
			cache_get_value_name(0, "name", name, 24);
			cache_get_value_name_int(0, "InGameID", player_id);
			cache_get_value_name_int(0, "id_user", player_db);
		}

		new string[128];
		format(string, sizeof(string), "Rechazaste la solicitud de %s.", name);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONREJECTQUIZ, string, 4);

		if(player_id != -1)
		{
			format(string, sizeof(string), "%s: %s", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], message);
			CreatePlayerNotificationSimple(player_id, VNOTI_TYPE_FACTIONREJECTQUIZ, string, 4);
		}

		format(query, sizeof(query), "DELETE FROM `lac_faction_requests` WHERE `id_request` = %d;", id);
		mysql_tquery(conexion, query);

		AddPlayerMessageNotification(playerid, player_db, 0, string);

	}
	return 1;
}

Dialog:dOptionMemberFaction(playerid, response, listitem, inputext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);
		switch(id)
		{
			case FACTION_RANK_MAX:
			{
				//PLAYER_TEMP[playerid][pt_DIALOG_DB_LIMIT] = 10;
				//PLAYER_TEMP[playerid][pt_DIALOG_DB_PAGE] = 0;
				//ShowDialogEx(playerid, DIALOG_CREW_MEMBER_LIST);
			}
			
		/*	case CREW_RANK_CAST_MEMBERS:
			{
				if(!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS]) return SendClientMessage(playerid, 0x999999AA, "No tienes permiso.");

				PLAYER_TEMP[playerid][pt_DIALOG_DB_LIMIT] = 10;
				PLAYER_TEMP[playerid][pt_DIALOG_DB_PAGE] = 0;
				ShowDialog(playerid, DIALOG_CREW_MEMBER_LIST_DELETE);
			}*/

			case FACTION_RANK_MODIFY_MEMBERS:
			{		
				new DB_Query[256];
				format(DB_Query, sizeof DB_Query, "SELECT `name`, `fact_rank` FROM `lac_users` WHERE `id` = %d;", Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ]);
				mysql_tquery(conexion, DB_Query, "LoadFactionModifyMember", "i", playerid);

			}
			case FACTION_RANK_CAST_MEMBERS:
			{
				ShowDialogEx(playerid, DIALOG_FAC_CAST_MEMBER_CONFIRM);
				//ShowDialogEx(playerid, DIALOG_FACTION_INVITE);				
			}
		}
		//CancelSelectTextDraw(playerid);
	}
	return 1;
}

Dialog:dFactionModifyMember(playerid, response, listitem, inputttext[])
{
	if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.");
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_MEMBERS]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

	if(response)
	{
		new listitem_id = DynamicDgui_GetValue(playerid, listitem);				
		if(listitem_id > PlayerInfo[playerid][p_FactionRank])
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Solo puedes cambiar a rangos menores al tuyo.",4000);
			return 1;
		}

		new Query[320];
		format(Query, sizeof Query, "SELECT `name`, `Online`, `fact_rank` FROM `lac_users` WHERE `id` = %d;", Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ]);
		mysql_tquery(conexion, Query, "LoadFactionMemberModify", "ii", playerid, listitem);
		return 1;
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_OPTIONS_U);
	return 1;
}

Dialog_AcceptInviteFaction(playerid)
{
	task_yield(1);
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		str_clear(string);

		str_append_format(string, "{5EB5FF}%s {FFFFFF}te invita a unirte a %s", PlayerInfoTemp[playerid][pt_Name], FactionCrew.Info[Player.Temp[playerid][@InviteFactionEx][0]][@Name]);

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_MSGBOX, str_format("{5EB5FF}%s", FactionCrew.Info[Player.Temp[playerid][@InviteFactionEx][0]][@Name]), string, str_new_static("Aceptar"), str_new_static("Rechazar"));

		if(!response[E_DIALOG_RESPONSE_Response]) break;
		
		new Float:x, Float:y, Float:z;
	 	GetPlayerPos(PlayerInfoTemp[playerid][pt_INVITE_FACTION_ID], x,y,z);
		if(!IsPlayerInRangeOfPoint(playerid, 4.0, x,y,z)) return ShowPlayerInfoTextdraw(playerid, "~r~Te alejaste del jugador que te invito", 2000);
		if(PlayerInfo[playerid][p_FactionMember] != 0) return GameTextForPlayer(playerid, "~r~Ya eres miembro de una banda.", 4000, 3); 

		Player.Faction[playerid][@Index] = Player.Temp[playerid][@InviteFactionEx][0];
		Player.Faction[playerid][@Valid] = true;
		PlayerInfo[playerid][p_FactionMember] = Player.Temp[playerid][@InviteFactionEx][1];
		PlayerInfo[playerid][p_FactionRank] = 0;

		mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `faction_id`=%d, `fact_rank`=0 WHERE `id`=%d;", PlayerInfo[playerid][p_FactionMember], PlayerInfo[playerid][pID]));

		new message[98];
		format(message, sizeof(message), "%s acepto la invitaci�n de %s.", PlayerInfoTemp[playerid][pt_Name], PlayerInfoTemp[ PlayerInfoTemp[playerid][pt_INVITE_FACTION_ID] ][pt_Name]);
		foreach(new i : Player)
		{
			if(PlayerInfo[i][p_FactionMember] == Player.Temp[playerid][@InviteFactionEx][1])
			{
				if(IsPlayerLogged(i))
				{
					CreatePlayerNotificationSimple(i, VNOTI_TYPE_NEWMEMBER, message, 20);
				}
			}
		}
		FactionWarnGrafiti(playerid);

		FactionCrew.Info[Player.Temp[playerid][@InviteFactionEx][1]][@Members]++;

		Player.Temp[playerid][@InviteFactionEx][0] = 0;
		Player.Temp[playerid][@InviteFactionEx][1] = 0;
		break;
	}
	return 1;	
}

Dialog:dInvitePlayerFaction(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(sscanf(inputtext, "u", inputtext[0]))
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Ingresa un numero valido.", 4000, 3);
			ShowDialogEx(playerid, DIALOG_FACTION_INVITE);
			return 1;
		}
		if(inputtext[0] < 0)
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Ingresa un numero valido.", 4000, 3);
			ShowDialogEx(playerid, DIALOG_FACTION_INVITE);
			return 1;
		}
		new Float:pos[3]; GetPlayerPos(inputtext[0], pos[0], pos[1], pos[2]);
		if(!IsPlayerInRangeOfPoint(playerid, 2.0, pos[0], pos[1], pos[2])) return GameTextForPlayerError(playerid, "~r~Este jugador no esta cerca tuya.", 4000);
		else if(FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Members] == Player.Faction[playerid][@Index]) return GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Banda llena.", 4000, 3);
		else if(inputtext[0] == playerid) return GameTextForPlayerError(playerid, "~r~Error.", 4000);

		PlayerInfoTemp[playerid][pt_INVITE_FACTION_PID] = inputtext[0];
		PlayerInfoTemp[inputtext[0]][pt_INVITE_FACTION_ID] = playerid;

		Player.Temp[inputtext[0]][@InviteFactionEx][0] = Player.Faction[playerid][@Index];
		Player.Temp[inputtext[0]][@InviteFactionEx][1] = PlayerInfo[playerid][p_FactionMember];

		Dialog_AcceptInviteFaction(inputtext[0]);
	}
	return 1;
}

Dialog:FactionConfirmCastMember(playerid, response, listitem, inputtext[])
{
	if(PlayerInfo[playerid][p_mPanelCatActive] != 1) return 1;
	if(!Player.Faction[playerid][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 2000);
	if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
	if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS]) return ShowPlayerInfoTextdraw(playerid, "No tienes los permisos necesarios.", 4000);

	if(response)
	{
		await mysql_aquery_s(conexion, str_format("SELECT `lac_users`.`name`, `lac_users`.`Online`, `lac_users`.`InGameID`, `lac_users`.`fact_rank` FROM `lac_users` WHERE `lac_users`.`id` = %d;", Player.Temp[playerid][@PanelFactionList][PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED]]));
		
		new count, current_rank, player_id, name[24], connected, bool:found;
		cache_get_row_count(count);
		if(count)
		{
			cache_get_value_name(0, "name", name, 24);
			cache_get_value_name_int(0, "InGameID", player_id);
			cache_get_value_name_int(0, "Online", connected);
			cache_get_value_name_int(0, "fact_rank", current_rank);
			found = true;
		}
		else found = false;

		if(!found) return 1;
		if(current_rank > PlayerInfo[playerid][p_FactionRank]) return ShowPlayerInfoTextdraw(playerid, "No puedes expulsar a un rango superior al tuyo.", 4000);
		if(current_rank == 9)
		{
			await mysql_aquery_s(conexion, str_format("SELECT COUNT(*) FROM `lac_users` WHERE `faction_id` = %d AND `fact_rank` = 9;", PlayerInfo[playerid][p_FactionMember]));
			
				//new count;
			cache_get_row_count(count);
			if(count) cache_get_value_index_int(0, 0, count);

			if(count <= 1)
			{
				GameTextForPlayerError(playerid, "~r~Tiene que haber por lo menos un miembro~n~con rango due�o.", 4000);
				return 1;
			}
				//ShowDialogEx(playerid, DIALOG_FAC_CAST_MEMBER_CONFIRM);
			
			return 1;
		}
		new message[70];
		format(message, sizeof message, "%s fue expulsado de la banda por ~n~%s.", name, PlayerInfoTemp[playerid][pt_Name]);
		SendNotificationMembersFaction(PlayerInfo[playerid][p_FactionMember], VNOTI_TYPE_MODIFYRANK, message, 5000);
		
		mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `faction_id`=0, `fact_rank`=0 WHERE `id` = %d;", Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ]));
		
		FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Members] --;

		if(connected)
		{
			FactionCrew.Info[ Player.Faction[playerid][@Index] ][@OnlineMemb] --;

			Player.Faction[player_id][@Valid] = false;
			PlayerInfo[player_id][p_FactionMember] = 0;
			PlayerInfo[player_id][p_FactionRank] = 0;
			Player.Faction[player_id][@Index] = 0;

			DisableEventsFactionForPlayer(player_id);
		}

		UpdateListFactionGeneral(playerid, 1);
		
		
		return 1;
	}
	else ShowDialogEx(playerid, DIALOG_FACTION_OPTIONS_U);
	return 1;
}

Dialog:dLeavePlayerFaction(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No perteneces a ninguna banda.", 2000);

		//ShowPlayerNotificationBox(playerid, NOTIFICATION_TYPE_FACTIONMSG1, "Has abandonado tu banda.", 10, 17.0);
		new string[98];
		format(string, sizeof(string), "%s abandono la banda.", PlayerInfoTemp[playerid][pt_Name]);
	
		FactionCrew.Info[Player.Faction[playerid][@Index]][@Members]--;
		FactionCrew.Info[Player.Faction[playerid][@Index]][@OnlineMemb]--;

		mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `faction_id`=0, `fact_rank`=0 WHERE `id`=%d;", PlayerInfo[playerid][pID]));

		foreach(new i : Player)
		{
			if(PlayerInfo[i][p_FactionMember] == PlayerInfo[playerid][p_FactionMember])
			{
				if(IsPlayerLogged(i))
				{
					CreatePlayerNotificationSimple(i, VNOTI_TYPE_NEWMEMBER, string, 10);
					if(PlayerInfo[i][p_mPanelCatActive] == 1)
					{
						ShowLeftPanelGeneral(i);
					}
				}
			}
		}
		//CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_NEWMEMBER, string, 10);
		
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][4]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][5]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][6]);

		PlayerInfo[playerid][p_FactionMember] = 0;
		PlayerInfo[playerid][p_FactionRank] = 0;
		Player.Faction[playerid][@Index] = 0;
		Player.Faction[playerid][@Valid] = false;

		DisableEventsFactionForPlayer(playerid);
	}
	return 1;
}


Dialog:DialogFactionMenu(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);
		if(id == -1) return 1;

		switch(/*PLAYER_TEMP[playerid][pt_PLAYER_LISTITEM][listitem]*/id)
		{
			case FACT_LIST_RANK_MAX:
			{
			}

			case FACT_LIST_RANK_MODIFY_RANKS:
			{
				if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS]) return SendClientMessage(playerid, 0x999999AA, "No tienes permiso.");

				ShowDialogEx(playerid, DIALOG_FACTION_RANKS);
			}
			case FACT_LIST_RANK_MODIFY_QUESTIONS:
			{
				ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
			}
			case FACT_LIST_RANK_INVITE:
			{
				ShowDialogEx(playerid, DIALOG_FACTION_INVITE);				
			}
			case FACT_LIST_RANK_REQUEST:
			{
				new query[250];
				format(query, sizeof(query), "SELECT UNIX_TIMESTAMP(r.`date`) AS `date_unix`, r.`id_request`, r.`id_faction`, r.`type`, r.`id_user`, u.`name` FROM `lac_faction_requests` r, `lac_users` u WHERE r.`id_faction`=%d AND u.`id`=r.`id_user` ORDER BY `date` DESC LIMIT 24;", Player.Temp[playerid][@SelectedFactionID]);
				mysql_tquery(conexion, query, "LoadFactionListRequest", "i", playerid);
			}
			case FACT_LIST_RANK_SENDMESSAGEALL:
			{
				ShowDialogEx(playerid, DIALOG_FACTION_SENDMSGALL);
			}
			case FACT_LIST_RANK_SENDMESSAGE:
			{
				ShowDialogEx(playerid, DIALOG_FACTION_SENDMSG);
			}
			case FACT_LIST_RANK_CHANGE_COLOR:
			{
				if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CHANGE_COLOR]) return ShowPlayerInfoTextdraw(playerid, "~r~Sin permisos.", 4000);

				DynamicDgui_Start(playerid);

				new string[128];
				for(new i; i < sizeof DataE_CrewColor; i++)
				{
					DynamicDgui_AddVar(playerid, i);
					format(string, sizeof(string), "%s{%06x}Seleccionar\n", string, RGBAToRGB(DataE.CrewColor[i][@Color]));
				}
				Dialog_Show(playerid, dChangeColorFaction, DIALOG_STYLE_LIST, "{5EB5FF}Cambiar color", string, "Invitar", "Atr�s");
			}
			/*
			case CREW_RANK_DELETE:
			{
				if(!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE]) return SendClientMessage(playerid, 0x999999AA, "No tienes permiso.");

				ShowDialog(playerid, DIALOG_CREW_DELETE);
			}
			case CREW_RANK_MODIFY_MEMBERS:
			{
				if(!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS]) return SendClientMessage(playerid, 0x999999AA, "No tienes permiso.");

				PLAYER_TEMP[playerid][pt_DIALOG_DB_LIMIT] = 10;
				PLAYER_TEMP[playerid][pt_DIALOG_DB_PAGE] = 0;
				ShowDialog(playerid, DIALOG_CREW_MODIFY_MEMBERS);
			}
			}*/
		}
	}

	return 1;
}

Dialog:dFactionViewRequest(playerid, response, listitem, inputttext[])
{
	if(response)
	{
		new DBID = DynamicDgui_GetValue(playerid, listitem);

		new query[200];
		format(query, sizeof(query), "SELECT q.`body`, r.`reply_body` FROM `lac_faction_req_reply` r INNER JOIN `lac_faction_questions` q ON r.`id_question`=q.`id_question` WHERE r.`request_id`=%d ORDER BY r.`id_question` ASC;", DBID);
		mysql_tquery(conexion, query, "LoadFactionPlayerQuizInfo", "is", playerid, Player.Temp[playerid][@SelectedFactionID]);
	
		DynamicDgui_Start(playerid);
		DynamicDgui_AddVarEx(playerid, 0, DBID);
	}
	else
	{
		ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	}
	return 1;
}

Dialog:dViewFactionQuiz(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, 0);

    	new query[250];
    	format(query, sizeof(query), "SELECT u.`name` FROM `lac_faction_requests` r INNER JOIN `lac_users` u ON r.`id_user` = u.`id` WHERE r.`id_request` = %d;", id);
    	await mysql_aquery(conexion, query);
    	new rows;
    	cache_get_row_count(rows);

    	if(rows) 
    	{
    		new name[24], caption[40];
    		cache_get_value_name(0, "name", name, 24);

    		format(caption, sizeof(caption), "{FFFFFF}Solicitud - {5EB5FF}%s", name);
    		Dialog_Show(playerid, FactionOptionsViewQuiz, DIALOG_STYLE_LIST, caption, "Aceptar\nRechazar", "Seleccionar", "Cancelar");
    	}
    }
	return 1;
}

Dialog:FactionOptionsViewQuiz(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No eres miembro de ninguna banda.", 4000);
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_INVITE]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 2000);

		new id = DynamicDgui_GetValue(playerid, 0);

		switch(listitem)
		{
			case 0: 
			{  
				new query[250]; 
				format(query, sizeof(query), "SELECT u.`name`, u.`InGameID`, r.`id_user` FROM `lac_faction_requests` r INNER JOIN `lac_users` u ON r.`id_user` = u.`id` WHERE r.`id_request` = %d;", id);
				await mysql_aquery(conexion, query);
				
				new rows;
				cache_get_row_count(rows);
				
				new name[24], player_id, player_db;
				if(rows) 
				{
				   	cache_get_value_name(0, "name", name, 24);
				   	cache_get_value_name_int(0, "InGameID", player_id);
				   	cache_get_value_name_int(0, "id_user", player_db);
				}

				if(player_id != -1)
				{
					Player.Faction[ player_id ][@Valid] = true;
					Player.Faction[ player_id ][@Index] = Player_Faction[playerid][E_PLAYER_Faction_Index];
					PlayerInfo[ player_id ][p_FactionMember] = PlayerInfo[playerid][p_FactionMember];
					PlayerInfo[ player_id ][p_FactionRank] = 0;
				}

				mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `faction_id`=%d, `fact_rank`=0 WHERE `id`=%d;", PlayerInfo[playerid][p_FactionMember], player_db));

				mysql_tquery_s(conexion, str_format("DELETE FROM `lac_faction_requests` WHERE `id_request` = %d;", id));
				
				new string[128];
    			format(string, sizeof(string), "%s acepto a %s en la banda.",PlayerInfo[playerid][p_Name], name);
    			SendNotificationMembersFaction(PlayerInfo[playerid][p_FactionMember], VNOTI_TYPE_FACTIONREJECTQUIZ, string, 14);
   	
    			AddPlayerMessageNotification(playerid, player_db, 0, string);

			}
			case 1: 
			{  
				ShowDialogEx(playerid, DIALOG_FACTION_REJEREQUESTMSG);
			}
		}
	}
	return 1;
}

Dialog:FactionStartQuiz(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		Player.Temp[playerid][@FactionSelectExID] = Player.Temp[playerid][@SelectedFactionID]; // Prevent Bug

		mysql_tquery_s(conexion, str_format("SELECT * FROM `lac_faction_questions` WHERE `id_faction`=%d;", Player.Temp[playerid][@SelectedFactionID]), "OnFactionGetDataQuestion", "ii", playerid, 1);

		//Player.Temp[playerid][@FactionQuiz] = 1;
		//ShowDialogEx(playerid, DIALOG_FACTION_SEND_QUIZ);
	}
	else
	{
		Player.Temp[playerid][@FactionQuiz] = -1;
	}
	return 1;
}

Dialog:SendQuestionNext(playerid, response, listitem, const inputtext[])
{
	if(response)
	{

		//new Pool:pool, data[E_FAC_QUIZ_PLAYER_DATA];
		//GetPlayerDataPoolEx(pool, data);
		Player.Temp[playerid][@FactionQuiz]++;

		new List:m = _GetPlayerDataList(playerid);
		new data[E_FAC_QUIZ_PLAYER_DATA];
		if (!GetPlayerDataListQuiz(playerid, Player.Temp[playerid][@FactionQuiz]-1, data, m)) {
       		return 0;
       	}

		str_set(data[E_FAC_QUIZ_STRING], str_new(inputtext));

		list_set_arr(m, Player.Temp[playerid][@FactionQuiz]-1,data);	

		if((Player.Temp[playerid][@FactionQuiz]) == Player.Temp[playerid][@FactionQuizCount])
		{
			//new query[128];
			//format(query, sizeof(query), "SELECT * FROM `lac_faction_questions` WHERE `id_faction`=%d;", FactionCrew.Info[ Player.Temp[playerid][@SelectedFactionID] ][@ID]);
			//mysql_tquery(conexion, query, "LoadFactionConfirmQuiz", "ii", playerid, Player.Temp[playerid][@SelectedFactionID]);
			LoadFactionConfirmQuiz(playerid, Player.Temp[playerid][@SelectedFactionID]);
			return 1;
		}			
		ShowDialogEx(playerid, DIALOG_FACTION_QUIZ_NEXT);
	}
	else
	{
		ResetPlayerDataListQuiz(playerid);
		ShowDialogEx(playerid, DIALOG_START_QUIZ_FACTION);
	}
	return 1;
}

Dialog:SendRequestFaction(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(Player.Temp[playerid][@SelectedFactionID] != Player.Temp[playerid][@FactionSelectExID]) return ShowPlayerInfoTextdraw(playerid, "~r~Error.", 1000);

		await mysql_aquery_s(conexion, str_format("SELECT `id_request` FROM `lac_faction_requests` WHERE `id_user`=%d AND `id_faction`=%d;", PlayerInfo[playerid][pID], Player.Temp[playerid][@SelectedFactionID]));
		new rows;
		cache_get_row_count(rows);
		if(rows)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes una solicitud pendiente en esta banda.", 4000);
			return 1;
		}

		mysql_tquery_s(conexion, str_format(
		"INSERT INTO `lac_faction_requests` (`id_faction`, `type`, `id_user`, `date`) VALUES (%d, 0, %d, CURRENT_TIMESTAMP);", Player.Temp[playerid][@SelectedFactionID], PlayerInfo[playerid][pID]), "RegisterNewFacRequestID", "i", playerid);
	}
	else
	{
		ResetPlayerDataListQuiz(playerid);
		ShowDialogEx(playerid, DIALOG_START_QUIZ_FACTION);
	}
	return 1;
}

Dialog:SendRequestFactionEx(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(Player.Temp[playerid][@SelectedFactionID] != Player.Temp[playerid][@FactionSelectExID]) return ShowPlayerInfoTextdraw(playerid, "~r~Error.", 1000);

		await mysql_aquery_s(conexion, str_format("SELECT `id_request` FROM `lac_faction_requests` WHERE `id_user`=%d AND `id_faction`=%d;", PlayerInfo[playerid][pID], Player.Temp[playerid][@SelectedFactionID]));
		new rows;
		cache_get_row_count(rows);
		if(rows)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes una solicitud pendiente en esta banda.", 4000);
			return 1;
		}

		mysql_tquery_s(conexion, str_format(
		"INSERT INTO `lac_faction_requests` (`id_faction`, `type`, `id_user`, `date`) VALUES (%d, 0, %d, CURRENT_TIMESTAMP);", Player.Temp[playerid][@SelectedFactionID], PlayerInfo[playerid][pID]), "RegisterNewFacRequestID", "i", playerid);
	}
	return 1;
}

// Creat Faction
Dialog:dFactionCreateName(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] != 0) return 1;
		
		if(strlen(inputtext) >= 25)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 25.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_NAME);
			return 1;
		}

		new name[25];
		if(sscanf(inputtext, "s[25]", name))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe un nombre con~n~un m�ximo de 25 caracteres.", 4000);
			ShowDialogEx(playerid, DIALOG_FACTION_CREATE_NAME);			
			return 1;
		}

		new data[E_FAC_GENE_PLAYER_DATA];
		new List:m = _GetPlayerDataList(playerid);
		
		data[E_FAC_GENE_STRING] = str_acquire(str_new(name));
		list_add_arr(m, data, 0);

		Dialog_Show(playerid, dFactionCreateType, DIALOG_STYLE_LIST, "{5EB5FF}Tipo de banda", "Pandilla", "Siguiente", "Cancelar");
	}
	return 1;
}

Dialog:dFactionCreateType(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new item = listitem;
		new data[E_FAC_GENE_PLAYER_DATA];

	    if (!GetPlayerDataListGene(playerid, 0, data)) {
	        return 0;
	    }

	    data[E_FAC_GENE_DATA1] = item;
	    SetPlayerGeneListData(playerid, 0, data);

		ShowDialogEx(playerid, DIALOG_FACTION_CREATE_COLOR);
	
	}
	else
	{
		ShowDialogEx(playerid, DIALOG_FACTION_CREATE_NAME);
	}
	return 1;
}
Dialog:dFactionCreateColor(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		new data[E_FAC_GENE_PLAYER_DATA];

	    if (!GetPlayerDataListGene(playerid, 0, data)) {
	        return 0;
	    }

	    data[E_FAC_GENE_DATA2] = id;
	    SetPlayerGeneListData(playerid, 0, data);

	    ShowDialogEx(playerid, DIALOG_FACTION_CREATE_CONFIRM);
	}
	else
	{
		Dialog_Show(playerid, dFactionCreateType, DIALOG_STYLE_LIST, "{5EB5FF}Tipo de banda", "Pandilla", "Siguiente", "Cancelar");
	}
	return 1;
}

Dialog:dFactionCreateConfirm(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(PlayerInfo[playerid][p_FactionMember] != 0) return 1;

		if(110000 > PlayerInfo[playerid][pDinero])
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Necesitas $110.000 para crear la banda.", 4000);
			return 1;
		}
		RemoveMoney(playerid, 110000, true, true);

		new data[E_FAC_GENE_PLAYER_DATA];

	   	if (!GetPlayerDataListGene(playerid, 0, data)) {
	    	return 0;
	    }
	    new name[25];
		str_get(data[E_FAC_GENE_STRING], name, sizeof(name));

	    new index = -1;
	    if(count_factions_loaded < MAX_FACTION)
	    {
	    	index = GetAvaibleFactionIndex();
	    }
	    else
	    {
			index = FindUnloadFactionInactive();
	    }
	    
	    FactionCrew.Info[index][@Valid] = true;
		format(FactionCrew.Info[index][@Name], 25, "%s", name);
		FactionCrew.Info[index][@Color] = data[E_FAC_GENE_DATA2];

	    AssignValueDefaultRank(index, 9, "Lider");
	    AssignValueDefaultRank(index, 8, "Sublider");
	    AssignValueDefaultRank(index, 7, "Veterano");
	    AssignValueDefaultRank(index, 0, "Nuevo");

	    CreateFactionRegister(index, data[E_FAC_GENE_DATA1]);
	    PlayerInfo[playerid][p_FactionMember] = FactionCrew.Info[index][@ID];
	    PlayerInfo[playerid][p_FactionRank] = 9;
	    Player.Faction[playerid][@Valid] = true;
	    Player.Faction[playerid][@Index] = index;

	    new Query[140];
		format(Query, sizeof(Query), "UPDATE `lac_users` SET `faction_id`=%d, `fact_rank`=%d WHERE `id`=%d;", PlayerInfo[playerid][p_FactionMember], PlayerInfo[playerid][p_FactionRank], PlayerInfo[playerid][pID]);
		await mysql_aquery(conexion, Query);

		Player.Temp[playerid][@SelectedFactionID] = FactionCrew.Info[index][@ID];

		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
		ShowLeftPanelGeneral(playerid);

		SplitTextDrawString(name, 110.0, 0.240, 1);
		new lines = GetTextDrawLineCount(name);

		new i = vNotif_CreatePlayerBoxID(playerid, VNOTI_TYPE_FACTIONREGISTER, true);

		vNotif_CreatePlayerBoxTD(playerid, i, 38.0+(lines*VNOTI_LETTERSIZE_T_1));

		funct_CreateTextdrawTextNotifEx(playerid, i, 0, name, 1, .color = DataE.CrewColor[ data[E_FAC_GENE_DATA2] ][@Color]);
		funct_CreateTextdrawTextNotifEx(playerid, i, 1, "iTu banda fue creada!, puedes~n~invitar a otros jugadores~n~presionando 'Opciones'.", 1, 0.0, 4.0+(lines*VNOTI_LETTERSIZE_T_1), VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2);
		vNoti_SetTimeHideBox(playerid, i, 18);
		UpdateNotificationForPlayer(playerid, i);

		ResetPlayerDataListGene(playerid);
	}
	return 1;
}

// Dialog Player

Dialog:dPlayerViewNotif(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);

		new dialog[700], item_string[128];

		new query[250];
		format(query, sizeof(query), "SELECT n.`date`, n.`id_notification`, n.`type`, n.`id_user`, n.`body` FROM `lac_user_notifications` n WHERE n.`id_notification`=%d;", id);
		await mysql_aquery(conexion, query);

		new rows;
		cache_get_row_count(rows);
		if(rows)
		{
		    for(new i = 0; i < rows; i++)
		    {
		    	new body[128], type, id_notification, date[24];

		    	cache_get_value_name_int(i, "id_notification", id_notification);
		    	cache_get_value_name_int(i, "type", type);
		    	cache_get_value_name(i, "body", body, 128);
		    	cache_get_value_name(i, "date", date, 24);

		    //	new time_format[18];

		    //	ConverTime_TimeElapsed(date, time_format);

		    	format(item_string, sizeof(item_string), "{FFFFFF}%s\n\n", body);
		    	strcat(dialog, item_string);
		    	//new leng_body = strlen(body);
		    	//if(leng_body > 50) { strins(body, ); }

		    	if(type == 1)
		    	{
		    		format(item_string, sizeof(item_string), "ID: {5EB5FF}%d.", date);
		    		strcat(dialog, item_string);
		    	}
		    	format(item_string, sizeof(item_string), "Fecha: {5EB5FF}%s.", date);
		    	strcat(dialog, item_string);

		    }
		    Dialog_Show(playerid, dPlayerDetailsNotif, DIALOG_STYLE_MSGBOX, "{5EB5FF}Detalles", dialog, "Cerrar", "Atr�s");
		}
	}
	return 1;
}

Dialog:dPlayerDetailsNotif(playerid, response, listitem, inputext[])
{
	if(!response)
	{
		ShowPlayerDialogNotifications(playerid);
	}
	return 1;
}

Dialog:DialogConfirmColor(playerid, response, listitem, inputtext[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(response)
	{	

		new color = DynamicDgui_GetValue(playerid, 0);
		if(Player.Temp[playerid][@TypeBuyConfirm] == TYPE_DIALOG_CONFIRM_COLOR1_V) { Vehicles_Info[vehicleid][gi_vehicle_COLOR1] = color; }
		if(Player.Temp[playerid][@TypeBuyConfirm] == TYPE_DIALOG_CONFIRM_COLOR2_V) { Vehicles_Info[vehicleid][gi_vehicle_COLOR2] = color; }
	
		MenuV_Show(playerid, MenuChangeColorV);
	}
	else
	{
		ChangeVehicleColor(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_COLOR1], Vehicles_Info[vehicleid][gi_vehicle_COLOR2]);
		MenuV_Show(playerid, MenuChangeColorV);
	}
	return 1;
}

Dialog:LoadVehicleGas(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new value = DynamicDgui_GetValue(playerid, listitem);
		printf("Value: %d", value);
		TogglePlayerControllable(playerid, 0);
		LlenandoTanque[playerid] = SetTimerEx("GiveGasolineVehicle", /*1000*/1000, true, "iiii", playerid, GetPlayerVehicleID(playerid), Vehicles_Info[GetPlayerVehicleID(playerid)][gi_vehicle_GAS]+value, 1);	
		RemoveMoney(playerid, value*4, true);
		CargandoGasolina[playerid] = 1;
	}
	return 1;
}

Dialog:DialogBuyItemsMiner(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(listitem == 0) { BuyPlayerStoreItems(playerid, 166, 0, 40); }
		if(listitem == 1) { BuyPlayerStoreItems(playerid, 167, 0, 80); }
	}
	return 1;
}

//____________

ShowDialogEx(playerid, dialogid)
{
	switch(dialogid)
	{
		case DIALOG_CONFIGPLAYERG:
		{
			new str[500], string[70];
			//format(string, sizeof(string), "Necesidades\t%s", (rBit1_Get(eBit1_PlayerInfo[p_ConfigNeedsState], playerid) ? ("Si"):("No")));
			strcat(str, string);	
		
			Dialog_Show(playerid, DialogConfigPlayer2, DIALOG_STYLE_TABLIST, "Opciones del jugador", str, "Seleccionar", "Cancelar");
	
		}
		case DIALOG_BUY_PLAYER_VEHICLE:
		{
			new str[128];
			new model = PlayerInfoTemp[playerid][pt_VEHICLE_BUY_SELECTED_ID];
			format(str, sizeof(str), "{FFFFFF}�Estas seguro de comprar un {5EB5FF}%s {FFFFFF}?\n\nCosto del veh�culo: {00E500}$%s", GetVehicleNameEx(model), FormatNumber(Vehicles_DataSale[model-400][E_VEHICLEDATA_Sale_PRICE]));
			Dialog_Show(playerid, DialogBuyVehicleP, DIALOG_STYLE_MSGBOX, "{5EB5FF}Confirmar compra", str, "Confirmar", "Cancelar");
		}
		case DIALOG_SELECT_OPTION_FARMER:
		{
			new str[128];
			format(str, sizeof(str), "Orde�ar vacas\t1 jugador");
			Dialog_Show(playerid, DialogSelectOptionFarmer, DIALOG_STYLE_TABLIST, "{5EB5FF}Selecciona un recorrido", str, "Seleccionar", "Cancelar");
		}
		case DIALOG_ADD_NUMBER_CONTACT:
		{
			Dialog_Show(playerid, dNewContactNumber, DIALOG_STYLE_INPUT, "Agregar contacto", "Ingresa el numero de contacto", "Siguiente", "Cancelar");
		}
		case DIALOG_SEND_MESSAGE_PHONE:
		{
			Dialog_Show(playerid, dSendSMSPhoneContact, DIALOG_STYLE_INPUT, "{5EB5FF}Mensaje nuevo", "Ingresa el texto:", "Enviar", "Cancelar");
		}
		case DIALOG_SEND_MESSAGE_PHONE_ID:
		{
			Dialog_Show(playerid, dSendSMSPhoneID, DIALOG_STYLE_INPUT, "{5EB5FF}Mensaje nuevo", "Ingresa el numero:", "Siguiente", "Cancelar");			
		}
		case DIALOG_SEND_MESSAGE_PHONE_MSG:
		{
			Dialog_Show(playerid, dSendSMSPhoneMSG, DIALOG_STYLE_INPUT, "{5EB5FF}Mensaje nuevo - Texto", "{FFFFFF}Ingresa el texto:", "Enviar", "Cancelar");
		}
		case DIALOG_FACTION_CREATE_RANK:
		{
			Dialog_Show(playerid, dCreateFactionRank, DIALOG_STYLE_INPUT, "{5EB5FF}Crear nuevo rango", "{FFFFFF}Ingresa el nombre:", "Agregar", "Cancelar");			
		}
		case DIALOG_FACTION_RANKS:
		{
			if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes una banda.");

			new dialog[64 * MAX_FACTION_RANKS], line_str[64];
			for(new i = 9; i != -1; --i)
			{
				if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Valid])
				{
					if(i < PlayerInfo[playerid][p_FactionRank]) format(line_str, sizeof line_str, "%d. %s\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
					else format(line_str, sizeof line_str, "%d. %s\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
				}
				else
				{
					if(i < PlayerInfo[playerid][p_FactionRank]) format(line_str, sizeof line_str, "%d. Slot disponible.\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
					else format(line_str, sizeof line_str, "{FFFFFF}%d. Slot disponible.\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
				}
				strcat(dialog, line_str);
			}
			Dialog_Show(playerid, DialogFactionRanks, DIALOG_STYLE_LIST, "{5EB5FF}Rangos", dialog, "Siguiente", "Atras");
		}
		case DIALOG_FACTION_QUESTIONS:
		{
			await mysql_aquery_s(conexion, str_format("SELECT `id_question`, `body` FROM `lac_faction_questions` WHERE `id_faction` = '%d';", PlayerInfo[playerid][p_FactionMember]));

			new rows;
			//new faction = Player.Faction[playerid][@Index];
			cache_get_row_count(rows);

			DynamicDgui_Start(playerid);
    		new dialog[74 * MAX_FACTION_RANKS], line_str[74], listitem;

    		//format(line_str, sizeof line_str, "Agregar pregunta\n");
    		strcat(dialog, "{00E500}A�adir pregunta\n");
			listitem++;

			for(new i = 0; i < rows; i++)
			{
				new id_question, question_textdb[64];

				cache_get_value_name_int(i, "id_question", id_question);
				cache_get_value_name(i, "body", question_textdb, 64);

						//new line_str[128];
				format(line_str, sizeof line_str, "{FFFFFF}%s\n", question_textdb);
				strcat(dialog, line_str);

				DynamicDgui_AddVarEx(playerid, listitem, id_question);

				listitem ++;

			}
			Dialog_Show(playerid, DialogFactionQuestions, DIALOG_STYLE_LIST, "{5EB5FF}Preguntas", dialog, "Seleccionar", "Atr�s");
			
		}
		//
		case DIALOG_RANKF_MODIFY_PERMISS:
		{
			new caption[70];
			format(caption, sizeof caption, "Modificar permisos del rango {5EB5FF}%s", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name]);
			
			new dialog[64 * (FACTION_RANK_MAX + 1)], line_str[64];
			format(dialog, sizeof dialog, "{FFFFFF}Permiso\tEstado\n");
			
			for(new i = 0; i != FACTION_RANK_MAX_SET; i ++)
			{
				if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][i]) format(line_str, sizeof line_str, "%s\t%s\n", FACTION_RANKS_PERMISS[i], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][i] ? "Si" : "No");
				else format(line_str, sizeof line_str, "{C04040}%s\t{C04040}%s\n", FACTION_RANKS_PERMISS[i], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Permission][i] ? "Si" : "No");
				
				strcat(dialog, line_str);
			}
			
			Dialog_Show(playerid, dRankModifyPermiss, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Cambiar", "Atr�s");
		}
		case DIALOG_RANKF_MODIFY_NAME:
		{
			new dialog[145];
			format(dialog, sizeof dialog, "{FFFFFF}�Quieres cambiar el nombre del rango {5EB5FF}%s{FFFFFF}?\nIndica el nuevo nombre del rango:", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK] ][@Name]);
			Dialog_Show(playerid, dRankModifyName, DIALOG_STYLE_INPUT, "{5EB5FF}Modificar rango - Renombrar", dialog, "Modificar", "Atr�s");
		}
		case DIALOG_RANKF_DELETE:
		{
			if(PlayerInfo[playerid][p_FactionMember] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes una banda.");

			DynamicDgui_Start(playerid);

			//new dialog[64 * MAX_FACTION_RANKS], line_str[64];

			new dialog[64 * MAX_FACTION_RANKS], line_str[64], listitem;
			for(new i = 9; i != -1; --i)
			{
				if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Valid]) continue;
				if(i == PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]) continue;
				
				DynamicDgui_AddVarEx(playerid, listitem, i);

				if(i < PlayerInfo[playerid][p_FactionRank]) format(line_str, sizeof line_str, "{CD2020}%d. %s\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
				else format(line_str, sizeof line_str, "{FFFFFF}%d. %s\n", i + 1, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
				strcat(dialog, line_str);
				
				listitem ++;
			}
			Dialog_Show(playerid, DialogFactionRankDelete, DIALOG_STYLE_LIST, "{5EB5FF}Cambiar rango", dialog, "Seleccionar", "Atr�s");
		}
		case DIALOG_QUESTION_MODIFY_TEXT:
		{
			Dialog_Show(playerid, dQuestionModifyText, DIALOG_STYLE_INPUT, "{5EB5FF}Modificar pregunta", "{FFFFFF}Ingresa una pregunta, menor a 64 caracteres:", "Modificar", "Atr�s");
		}
		case DIALOG_FACTION_SENDMSG:
		{
			Dialog_Show(playerid, dSendMsg, DIALOG_STYLE_INPUT, "{5EB5FF}Enviar mensaje", "{FFFFFF}Escribe un mensaje para enviar a un miembro de la banda.\n\nMensaje:", "Enviar", "Atr�s");
		}
		case DIALOG_FACTION_SENDMSGALL:
		{
			Dialog_Show(playerid, dSendMsgAll, DIALOG_STYLE_INPUT, "{5EB5FF}Enviar mensaje a todos", "{FFFFFF}Escribe un mensaje para enviar a todos los miembros de la banda.\n\nMensaje:", "Enviar", "Atr�s");
		}
		case DIALOG_FACTION_REJEREQUESTMSG:
		{
			Dialog_Show(playerid, dSendMsgRequest, DIALOG_STYLE_INPUT, "{5EB5FF}Solicitud - Enviar mensaje", "{FFFFFF}Escribe un mensaje al jugador que envi� esta solicitud\nde uni�n.\n\nMensaje:", "Enviar", "Atr�s");			
		}
		case DIALOG_FACTION_MENU:
		{
			new caption[64];
			DynamicDgui_Start(playerid);

			format(caption, sizeof caption, "{5EB5FF}Opciones");

			// Consult
			await mysql_aquery_s(conexion, str_format("SELECT COUNT(`id_request`) AS `count` FROM `lac_faction_requests` WHERE `id_faction` = %d;", PlayerInfo[playerid][p_FactionMember]));

			new count, count_request;
			new dialog[360], listitem;

			cache_get_row_count(count);
			if(count) cache_get_value_name_int(0, "count", count_request);

			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_INVITE] != 0)
			{
				strcat(dialog, "Invitar\t\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_INVITE);
				listitem ++;

				new string[40];
				if(count_request == 0) format(string, sizeof(string), "Solicitudes\tVaci�\n", count_request);
				else format(string, sizeof(string), "Solicitudes\t%d pendientes\n", count_request);
				strcat(dialog, string);
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_REQUEST);
				listitem ++;
			}
			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS] != 0)
			{
				strcat(dialog, "Enviar mensaje\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_SENDMESSAGEALL);
				listitem ++;
			}

			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CHANGE_COLOR] != 0)
			{
				strcat(dialog, "Cambiar color de la banda\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_CHANGE_COLOR);
				listitem ++;
			}
			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_RANKS] != 0)
			{
				strcat(dialog, "Modificar rangos\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_MODIFY_RANKS);
				listitem ++;
				strcat(dialog, "Preguntas\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_MODIFY_QUESTIONS);
				listitem ++;
			}

			Dialog_Show(playerid, DialogFactionMenu, DIALOG_STYLE_TABLIST, caption, dialog, "Seleccionar", "Salir");
		
		}
		case DIALOG_FAC_RANK_MODIFY:
		{
			new listitems[57], id;
			DynamicDgui_Start(playerid);

			if(IsFactionRankDefault(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]) == -1)
			{
				strcat(listitems, "Modificar permisos\n");
				DynamicDgui_AddVarEx(playerid, id, 0);
				id ++;
			}
			strcat(listitems, "Cambiar nombre\n");
			DynamicDgui_AddVarEx(playerid, id, 1);
			id ++;
			if(IsFactionRankDefault(PlayerInfoTemp[playerid][pt_FAC_SELECTED_RANK]) == -1)
			{
				strcat(listitems, "Eliminar rango\n");
				DynamicDgui_AddVarEx(playerid, id, 2);
				id ++;
			}
			Dialog_Show(playerid, dModifyRankFac, DIALOG_STYLE_LIST, "{5EB5FF}Modificar rango", listitems, "Seleccionar", "Atr�s");
		}
		case DIALOG_FAC_QUIZ_MODIFY:
		{
			new listitems[57], id;
			DynamicDgui_Start(playerid);

			strcat(listitems, "Modificar pregunta\n");
			DynamicDgui_AddVarEx(playerid, id, 1);
			id ++;
			strcat(listitems, "Eliminar pregunta\n");
			DynamicDgui_AddVarEx(playerid, id, 2);
			id ++;
			Dialog_Show(playerid, dModifyQuestionFac, DIALOG_STYLE_LIST, "{5EB5FF}Modificar pregunta", listitems, "Seleccionar", "Atr�s");
		}
		case DIALOG_FACTION_OPTIONS_U:
		{
			if(!Player.Faction[playerid][@Valid]) return 1;

			new dialog[300], listitem;
			DynamicDgui_Start(playerid);

			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_MODIFY_MEMBERS])
			{
				strcat(dialog, "Cambiar rango\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACTION_RANK_MODIFY_MEMBERS);
				listitem ++;
			}
			if(FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CAST_MEMBERS])
			{
				strcat(dialog, "Enviar mensaje\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACT_LIST_RANK_SENDMESSAGE);
				listitem ++;

				strcat(dialog, "Expulsar\n");
				DynamicDgui_AddVarEx(playerid, listitem, FACTION_RANK_CAST_MEMBERS);
				listitem ++;
			}
			
			new DBID = Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ];

			new query[250];
	    	format(query, sizeof(query), "SELECT u.`name` FROM `lac_users` u WHERE u.`id` = %d;", DBID);
	    	await mysql_aquery(conexion, query);
	    	new rows;
	    	cache_get_row_count(rows);
			
			new name[40];
	    	if(rows) 
	    	{
	    		
	    		cache_get_value_name(0, "name", name, 24);

	    		format(name, sizeof(name), "{5EB5FF}%s", name);
	    	}

			Dialog_Show(playerid, dOptionMemberFaction, DIALOG_STYLE_LIST, name, dialog, "Seleccionar", "Cancelar");
		}

		case DIALOG_FAC_MEMBER_MODIFY:
		{
		/*	new line_str[128];
			if(connected) format(line_str, sizeof line_str, "{CCCCCC}%d. %s\t{CCCCCC}%s\t{98f442}Conectado\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME]);
			else format(line_str, sizeof line_str, "{CCCCCC}%d. %s\t{CCCCCC}%s\t{CCCCCC}%s\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME], last_connection);
		
			strcat(dialog, line_str);
			listitem ++;*/
		}
		case DIALOG_FAC_CAST_MEMBER_CONFIRM:
		{
			Dialog_Show(playerid, FactionConfirmCastMember, DIALOG_STYLE_MSGBOX, "{5EB5FF}Expulsar miembro", "{FFFFFF}�Confirmas la expulsi�n se este miembro?", "Aceptar", "Cancelar"); 
		}

		case DIALOG_FACTION_INVITE:
		{
			Dialog_Show(playerid, dInvitePlayerFaction, DIALOG_STYLE_INPUT, "{5EB5FF}Invitar jugador", "{FFFFFF}Ingresa la ID del jugador o el {5EB5FF}Nombre_Apellido {FFFFFF}\nPara enviarle la invitaci�n.", "Invitar", "Cancelar");
		}
		case DIALOG_FACTION_SEND_QUIZ:
		{
			Player.Temp[playerid][@FactionQuiz] = 0;
			foreach (new i : FactionQuestionIter[ Player.Temp[playerid][@SelectedFactionID] ])
			{

				if(Player.Temp[playerid][@FactionQuiz] == i)
				{
					new query[128];
					format(query, sizeof(query), "SELECT * FROM `lac_faction_questions` WHERE `id_question`=%d;", FactionCrew.Question[ Player.Temp[playerid][@SelectedFactionID] ][i][@ID]);
					mysql_tquery(conexion, query, "OnFactionGetDataQuestion", "ii", playerid, 1);
				
					//Player.Temp[playerid][@FactionQuiz]++;
					//Player.Temp[playerid][@FactionQuiz] = 0;
					break;
				}
			}
		}
		case DIALOG_FACTION_QUIZ_NEXT:
		{
			//new List:m;

			new data[E_FAC_QUIZ_PLAYER_DATA];

			//list_get_arr(m, Player.Temp[playerid][@FactionQuiz], data);
			if (!GetPlayerDataListQuiz(playerid, Player.Temp[playerid][@FactionQuiz], data)) {
       			return 0;
       		}

			new caption[28];
			format(caption, sizeof(caption), "{5EB5FF}Preguntas - %d/%d", (Player.Temp[playerid][@FactionQuiz]+1), Player.Temp[playerid][@FactionQuizCount]);

			new info[70];
			str_get(data[E_FAC_QUIZ_STRINGDB], info, sizeof(info));
			format(info, sizeof(info), "{FFFFFF}%s", info);

			Dialog_Show(playerid, SendQuestionNext, DIALOG_STYLE_INPUT, caption, info, "Siguiente", "Limpiar");
		}
		case DIALOG_START_QUIZ_FACTION:
		{
			await mysql_aquery_s(conexion, str_format("SELECT f.`name`, COUNT(*) count FROM `lac_facciones` f, `lac_faction_questions` q WHERE f.`id`=%d AND q.`id_faction` = %d;", Player.Temp[playerid][@SelectedFactionID], Player.Temp[playerid][@SelectedFactionID]));
			
			new rows;
			cache_get_row_count(rows);
			if(rows)
			{
				new caption[24], count;
				cache_get_value_name(0, "name", caption, 24);
				cache_get_value_name_int(0, "count", count);

				format(caption, sizeof(caption), "{5EB5FF}%s", caption);

				if(count > 0)
				{
					Dialog_Show(playerid, FactionStartQuiz, DIALOG_STYLE_MSGBOX, caption, "{FFFFFF}Al continuar deber�s contestar algunas preguntas\nla respuestas ser�n enviadas al l�der.", "Siguiente", "Cancelar");
				}
				else
				{
					Dialog_Show(playerid, SendRequestFactionEx, DIALOG_STYLE_MSGBOX, caption, "{FFFFFF}Al presionar {5EB5FF}Solicitar {FFFFFF}la solicitud ser� enviada los lideres.\n�Quieres enviar la petici�n para unirte a esta banda?", "Solicitar", "Cancelar");
				}
			}
		}
		case DIALOG_FACTION_ACTIVITIES_H:
		{
			new dialog[700], list_items[70];

			strcat(dialog, "{5EB5FF}Actividad\t{5EB5FF}Tipo\t{5EB5FF}En\n");


			await mysql_aquery_s(conexion, str_format("SELECT `time` FROM `lac_faction_grafitis` WHERE `id_grafiti` ORDER BY `time` ASC limit 1;"));
			new rows_grafiti;
			cache_get_row_count(rows_grafiti);

			if(rows_grafiti)
			{
				new next_graffiti, time_string[24];

				cache_get_value_name_int(0, "time", next_graffiti);

				if(next_graffiti > 0)
				{
					ConverTime_TimeElapsedEx(next_graffiti, time_string, sizeof(time_string), 1);
					format(list_items, sizeof(list_items), "Pr�ximo graffiti\tDisputa\t{50BB50}%s\n", time_string);
				}
				else
				{
					format(list_items, sizeof(list_items), "Pr�ximo graffiti\tDisputa\t{4CD24C}Ahora mismo\n", time_string);
				}
				strcat(dialog, list_items);
			}

			format(list_items, sizeof(list_items), "Mercado negro\tDisputa\t{E82B2B}2 d�as\n");
			strcat(dialog, list_items);

			format(list_items, sizeof(list_items), "Conquista de territorio\tDisputa\t{E82B2B}Desactivado\n");
			strcat(dialog, list_items);

			format(list_items, sizeof(list_items), "{E8B224}Robo al banco (Puntos X2)\tRobo\t{E82B2B}Desactivado\n");
			strcat(dialog, list_items);

			Dialog_Show(playerid, FactionActiviesHome, DIALOG_STYLE_TABLIST_HEADERS, "{5EB5FF}Actividades - {4CD24C}(Fin de temporada en 14 d�as)", dialog, "Seleccionar", "Cancelar");
		}
		// Creat Faction
		case DIALOG_FACTION_CREATE_NAME:
		{
			if(PlayerInfo[playerid][p_FactionMember] != 0) return ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes una banda.",4000);

			new string[180];

			format(string, sizeof(string), "{FFFFFF}Para crear una nueva necesitas {00E500}$110.000{FFFFFF}.\nNecesita tener como m�nimo nivel 4.\n\nEscribe un nombre para tu banda:");

			Dialog_Show(playerid, dFactionCreateName, DIALOG_STYLE_INPUT, "{5EB5FF}Crear banda", string, "Siguiente", "Cancelar");
		}
		case DIALOG_FACTION_CREATE_COLOR:
		{
			new string[280], name[30];

			DynamicDgui_Start(playerid);

			new data[E_FAC_GENE_PLAYER_DATA];

	   	 	if (!GetPlayerDataListGene(playerid, 0, data)) {
	        	return 0;
	    	}


			str_get(data[E_FAC_GENE_STRING], name, sizeof(name));

			for(new i; i < sizeof DataE_CrewColor; i++)
			{
				DynamicDgui_AddVar(playerid, i);
				format(string, sizeof(string), "%s{%06x}%s\n", string, RGBAToRGB(DataE.CrewColor[i][@Color]), name);
			}

			Dialog_Show(playerid, dFactionCreateColor, DIALOG_STYLE_LIST, "{5EB5FF}Color de la banda", string, "Crear", "Cancelar");
		}
		case DIALOG_FACTION_CREATE_CONFIRM:
		{
			new name[30];

			new data[E_FAC_GENE_PLAYER_DATA];

	   	 	if (!GetPlayerDataListGene(playerid, 0, data)) {
	        	return 0;
	    	}


			str_get(data[E_FAC_GENE_STRING], name, sizeof(name));

			new dialog[280], item_string[58];
			format(item_string, sizeof(item_string), "{FFFFFF}Nombre: {%06x}%s\n", RGBAToRGB(DataE.CrewColor[ data[E_FAC_GENE_DATA2] ][@Color]), name);
			strcat(dialog, item_string);
			format(item_string, sizeof(item_string), "{FFFFFF}Tipo: {5EB5FF}%s\n", (data[E_FAC_GENE_DATA1] ? "Mafia" : "Pandilla"));
			strcat(dialog, item_string);
			strcat(dialog, "{FFFFFF}Costo: {00E500}$110,000");


			Dialog_Show(playerid, dFactionCreateConfirm, DIALOG_STYLE_MSGBOX, "{5EB5FF}Crear banda", dialog, "Crear", "Cancelar");
		}
	}
	return 1;
}


// Async

ShowDialogGPSVehicle(playerid)
{
	task_yield(1);
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		new data[E_PLAYER_VEHICLES_DATA], platevehicle[32];

		new vehiculos = 0;
		new slot = PlayerInfo[playerid][p_VehicleSlot][0];
		new slot2 = PlayerInfo[playerid][p_VehicleSlot][1];
		new slot3 = PlayerInfo[playerid][p_VehicleSlot][2];
		new rent = Player.Temp[playerid][@RentVehicle];

		DynamicDgui_Start(playerid);

		str_clear(string);
		str_append_format(string, "{5EB5FF}Espacio\t{5EB5FF}Veh�culo\t{5EB5FF}Matricula\n");

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 0))
		{
			str_append_format(string, "#1\tEspacio disponible.\n");
		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 0, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));
			str_append_format(string, "#1\t%s\t%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle);
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot);
		vehiculos++;

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 1))
		{
			if(PlayerInfo[playerid][p_LEVEL] < 5) str_append_format(string, "#2\t{E22222}Se desbloquea al nivel 5.\n");
			else str_append_format(string, "#2\tEspacio disponible.\n");
		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 1, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));
			str_append_format(string, "#2\t%s\t%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle);
			
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot2);
		vehiculos++;

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 2))
		{
			if(PlayerInfo[playerid][p_LEVEL] < 10) str_append_format(string, "#2\t{E22222}Se desbloquea al nivel 10.\n");
			else str_append_format(string, "#3\tEspacio disponible.\n");

		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 2, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));
			str_append_format(string, "#3\t%s\t%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle);
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot3);
		vehiculos++;

		if(Player.Temp[playerid][@RentVehicle] != -1)
		{
			str_append_format(string, "Rentado\t%s\n", VehicleName[Vehicles_Info[rent][gi_vehicle_MODELID] - 400]);
			DynamicDgui_AddVarEx(playerid, vehiculos, rent);
			vehiculos++;
		}

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Veh�culos"), string, str_new_static("Buscar"), str_new_static("Salir"));

		if(!response[E_DIALOG_RESPONSE_Response]) break;
		new listitem = response[E_DIALOG_RESPONSE_Listitem];

		new i = DynamicDgui_GetValue(playerid, listitem);
		new Float: carPos[3];
		if(IsValidVehicleEx(i))
		{
			GetVehiclePos(i, carPos[0], carPos[1], carPos[2]);
			new message[128], zone[MAX_MAP_ZONE_NAME];
			new MapZone:zonevehicle = GetVehicleMapZone(i);
			GetMapZoneName(zonevehicle, zone, sizeof(zone));

			format(message, sizeof(message), "Tu veh�culo fue localizado en %s.", zone);
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_GPSVEHICLE, message, 8);
			SetPlayerDynCP(playerid, 2, carPos[0], carPos[1], carPos[2], 5.0, CHECKPOINT_TYPE_GPSVEHICLE, false);
			Streamer_Update(playerid);
			PlayerPlaySound(playerid, 1138, 0,0,0);
			LocalizandoV[playerid] = 1;
		}
		else
		{
			GameTextForPlayerError(playerid, "~r~Veh�culo destruido.", 1000);
		}
		break;
	}
	return 1;
}

ShowDialogGPSProperty(playerid)
{
	yield 1;
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	new MapZone:zone, zone_name[28];
	
	/*GetPos3DZone(			
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp], zone, sizeof(zone)
			);*/

	for(;;)
	{
		new vehiculos = 0;
		new slot = PlayerInfo[playerid][p_HouseSlot][0];
		new slot2 = PlayerInfo[playerid][p_HouseSlot][1];
		//new slot3 = PlayerInfo[playerid][p_VehicleSlot][2];

		DynamicDgui_Start(playerid);

		str_clear(string);
		str_append_format(string, "{5EB5FF}Espacio\t{5EB5FF}Direcci�n\n");

		if(PlayerInfo[playerid][p_HouseSlot][0] == 0)
		{
			str_append_format(string, "#1\tEspacio disponible.\n");
		}
		else
		{
			zone = GetMapZoneAtPoint(CasaInfo[slot][cExteriorX], CasaInfo[slot][cExteriorY], CasaInfo[slot][cExteriorZ]);
			GetMapZoneName(zone, zone_name);

			str_append_format(string, "#1\t%s\n", zone_name);
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot);
		vehiculos++;

		if(PlayerInfo[playerid][p_HouseSlot][1] == 0)
		{
			if(PlayerInfo[playerid][p_LEVEL] < 5) str_append_format(string, "#2\t{E22222}Se desbloquea al nivel 5.\n");
			else str_append_format(string, "#2\tEspacio disponible.\n");
		}
		else
		{
			zone = GetMapZoneAtPoint(CasaInfo[slot2][cExteriorX], CasaInfo[slot2][cExteriorY], CasaInfo[slot2][cExteriorZ]);
			
			GetMapZoneName(zone, zone_name);
			str_append_format(string, "#2\t%d\n", zone_name);
			
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot2);
		vehiculos++;

		if(PlayerInfo[playerid][p_HouseSlot][2] == 0)
		{
			if(PlayerInfo[playerid][p_LEVEL] < 10) str_append_format(string, "#2\t{E22222}Se desbloquea al nivel 10.\n");
			else str_append_format(string, "#2\tEspacio disponible.\n");
		}
		else
		{
			zone = GetMapZoneAtPoint(CasaInfo[slot2][cExteriorX], CasaInfo[slot2][cExteriorY], CasaInfo[slot2][cExteriorZ]);
			
			GetMapZoneName(zone, zone_name);
			str_append_format(string, "#2\t%d\n", zone_name);
			
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, slot2);
		vehiculos++;

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Propiedades"), string, str_new_static("Buscar"), str_new_static("Salir"));

		if(!response[E_DIALOG_RESPONSE_Response]) break;
		new listitem = response[E_DIALOG_RESPONSE_Listitem];

		new i = DynamicDgui_GetValue(playerid, listitem);
		//new Float: carPos[3];
		if(IsValidVehicleEx(i))
		{
			//new message[128];
			//format(message, sizeof(message), "Tu propiedad fue localizada en %s.", zone);
			//CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_GPSVEHICLE, message, 8);
			SetPlayerDynCP(playerid, 2, CasaInfo[slot][cExteriorX], CasaInfo[slot][cExteriorY], CasaInfo[slot][cExteriorZ], 5.0, CHECKPOINT_TYPE_GPSVEHICLE, false);
			Streamer_Update(playerid);
			PlayerPlaySound(playerid, 1138, 0,0,0);
			LocalizandoV[playerid] = 1;
		}
		break;
	}
	return 1;
}

Dialog_ConfigPassword(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO];


	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_PASSWORD, "{5EB5FF}Configuraci�n", "{FFFFFF}Ingresa tu contrase�a actual:", "Siguiente", "Cancelar");

		if(!response[E_DIALOG_RESPONSE_Response]) break;

		if(isnull(response[E_DIALOG_RESPONSE_InputText]) || strlen(response[E_DIALOG_RESPONSE_InputText]) > 40) continue;
		
		//Dialog_Show(playerid, WaitDialogChangePassword, DIALOG_STYLE_MSGBOX,"{5EB5FF}Cambiar contrase�a", "{FFFFFF}....", "....", "");
		bcrypt_verify(playerid, "OnPlayerChangePassChecked", response[E_DIALOG_RESPONSE_InputText], PlayerInfo[playerid][pPassword]);
		//DialogConfigPlayer(playerid);
		break;
	}
	return 1;
}

DialogConfigPlayer(playerid)
{
	yield 1;
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		str_clear(string);
		str_append_format(string, "Correo electr�nico\t%s\n", PlayerInfo[playerid][pEmail]);
		str_append_format(string, "Contrase�a\t***********\n");
		str_append_format(string, "Opciones del jugador\t\n");
		str_append_format(string, "Generar referido\t\n");

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST, str_new_static("{5EB5FF}Configuraciones"), string, str_new_static("Seleccionar"), str_new_static("Cancelar"));

		if(!response[E_DIALOG_RESPONSE_Response]) break;

		//printf("Listitem %d", response[E_DIALOG_RESPONSE_Listitem]);
		switch(response[E_DIALOG_RESPONSE_Listitem])
		{
			case 0: { break; }
			case 1: 
			{
				Dialog_ChangePassword(playerid);
				break;
			}
			case 2: 
			{ 
				Dialog_ConfigPlayerG(playerid);
				//break;
			}
			case 3:
			{
				Dialog_CodeReferTemp(playerid);
				break;
			}
		}
		//break;
	
	}
	return 1;
}

Dialog_CodeReferTemp(playerid)
{
	yield 1;

	await mysql_aquery_s(conexion, str_format("SELECT `id_user` FROM `lac_player_betatester` WHERE `id_user`=%d;", PlayerInfo[playerid][pID]));

	new rows;
	cache_get_row_count(rows);

	if(rows)
	{
		new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
		pawn_guard(string);

		for(;;)
		{
			DynamicDgui_Start(playerid);
			str_clear(string);
			
			str_append_format(string, "{5EB5FF}C�digo\t{5EB5FF}Jugador\t{5EB5FF}Estado\n", PlayerInfo[playerid][pEmail]);
			
			await mysql_aquery_s(conexion, str_format("SELECT r.`idcode`, r.`id_user`, r.`code`, r.`ref_user`, COALESCE(u.`name`, 'Ninguno') name FROM `lac_code_register` r LEFT JOIN `lac_users` u ON r.`ref_user` = u.`id` WHERE r.`id_user`=%d;", PlayerInfo[playerid][pID]));

			new rows_code, name[24], ref_user, code[10], countlistitem;
			cache_get_row_count(rows_code);

			for(new i; i < rows_code; i++)
			{
				cache_get_value_name(i, "code", code, 10);
				cache_get_value_name(i, "name", name, 24);
				cache_get_value_name_int(i, "ref_user", ref_user);

				str_append_format(string, "{9EDA98}%s\t%s\t%s\n", code, name, (ref_user ? "{D72929}En uso" : "{27B90A}Disponible"));
				
				DynamicDgui_AddVarEx(playerid, countlistitem, 0);
				countlistitem++;
			}
			str_append_format(string, "{5EB5FF}Nuevo\n");
			DynamicDgui_AddVarEx(playerid, countlistitem, 1);
			countlistitem++;

			await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Generar referido"), string, str_new_static("Siguiente"), str_new_static("Cancelar"));

			if(!response[E_DIALOG_RESPONSE_Response]) break;

			new list = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);

			if(list != 1) break;
			else if(rows_code >= 2)
			{
				GameTextForPlayerError(playerid, "~r~No puedes generar m�s c�digos.", 4000);
				break;
			}

			new newcode[9];
			randomString(newcode, sizeof(newcode));
			mysql_tquery_s(conexion, str_format("INSERT INTO `lac_code_register` (`id_user`,`ref_user`,`code`) VALUES (%d, 0, '%q');", PlayerInfo[playerid][pID], newcode));
		}
	} else GameTextForPlayerError(playerid, "~r~Solo los miembros BetaTester pueden generar c�digos.", 4000);	
	return 1;
}

Dialog_ReferConfirmCode(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO];
	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_INPUT, "{5EB5FF}C�digo referido", "{FFFFFF}El c�digo de referido consta de 9 d�gitos, ejemplo {5EB5FF}8F9XF5L89{FFFFFF}.\nPuedes pedirle a un amigo que te invite.", "�Vamos!", "No tengo");
	
		if(!response[E_DIALOG_RESPONSE_Response]) { Kick(playerid); break; }
		
		if (strlen(response[E_DIALOG_RESPONSE_InputText]) <= 2)
		{
			Kick(playerid);
			break;
		}
		await mysql_aquery_s(conexion, str_format("SELECT r.`idcode` FROM `lac_code_register` r WHERE r.`code`='%q' AND r.`ref_user` = 0;",response[E_DIALOG_RESPONSE_InputText]));
		
		new rows;
		cache_get_row_count(rows);

		if(rows)
		{
			new dbid;
			cache_get_value_name_int(0, "idcode", dbid);
			Player_TempCodeRefer[playerid] = dbid;

			new string[120];
			format(string, sizeof(string), "{5EB5FF}%s {FFFFFF}no esta registrada.\nIngresa una contrase�a para registrarte:", PlayerInfoTemp[playerid][pt_Name]);
			ShowPlayerDialog(playerid, REGISTRO, DIALOG_STYLE_PASSWORD, "{5EB5FF}Registra una cuenta nueva", string, "Siguiente", "Salir");
			break;
		}
		else
		{
			GameTextForPlayerError(playerid, "~r~C�digo invalido.", 4000);
			KickEx(playerid, 100);
			break;
		}
	}
	return 1;
}

Dialog_ChangePassword(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO];

	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_PASSWORD, "{5EB5FF}Nueva contrase�a", "{FFFFFF}Ingresa una nueva contrase�a:", "Siguiente", "Cancelar");

		if(!response[E_DIALOG_RESPONSE_Response]) break;

		if(isnull(response[E_DIALOG_RESPONSE_InputText]) || strlen(response[E_DIALOG_RESPONSE_InputText]) > 40) continue;
		
		Dialog_ChangePasswordConfirm(playerid, response[E_DIALOG_RESPONSE_InputText]);
		break;
	}
}



Dialog_ChangePasswordConfirm(playerid, const confirm[])
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], value;

	for(;;)
	{
		if(value == 1) await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_PASSWORD, "{5EB5FF}Confirmar nueva contrase�a", "{E22222}Confirma tu nueva contrase�a:", "Confirmar", "Cancelar");
		else await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_PASSWORD, "{5EB5FF}Confirmar nueva contrase�a", "{FFFFFF}Ingresa una nueva contrase�a:", "Siguiente", "Cancelar");

		if(!response[E_DIALOG_RESPONSE_Response]) break;

		if(isnull(response[E_DIALOG_RESPONSE_InputText]) || strlen(response[E_DIALOG_RESPONSE_InputText]) > 40) continue;
		
		if(strcmp(response[E_DIALOG_RESPONSE_InputText], confirm, true)) { value = 1; continue; }
		bcrypt_hash(playerid, "PlayerChangePasswordHash", response[E_DIALOG_RESPONSE_InputText], BCRYPT_COST);
		break;
	}
	return 1;
}

Dialog_ConfigPlayerG(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);
	for(;;)
	{
		str_clear(string);
		str_append_format(string, "Ver canal de dudas\t%s\n", (rBit1_Get(eBit1_PlayerInfo[p_ConfigChannelDudeState], playerid) ? ("{E22222}No"):("{4CD24C}Si")));

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST, str_new_static("{5EB5FF}Opciones del jugador"), string, str_new_static("Seleccionar"), str_new_static("Regresar"));
	
		if(!response[E_DIALOG_RESPONSE_Response]) break;
		switch(response[E_DIALOG_RESPONSE_Listitem])
		{
			case 0:
			{
				new configstate = rBit1_Get(eBit1_PlayerInfo[p_ConfigChannelDudeState], playerid);
				rBit1_Set(eBit1_PlayerInfo[p_ConfigChannelDudeState], playerid, !configstate);
				continue;
			}
		}
		break;
	}
	//return 1;
}

Dialog_SellVehicle(playerid)
{
	yield 1;


	new vehiculos = 0, modelid, price;
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);
	for(;;)
	{
		new data[E_PLAYER_VEHICLES_DATA], platevehicle[32];
		
		DynamicDgui_Start(playerid);

		str_clear(string);
		str_append_format(string, "{5EB5FF}Espacio\t{5EB5FF}Veh�culo\t{5EB5FF}Matricula\t{5EB5FF}Pago\n");

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 0))
		{			
			str_append_format(string, "#1\tVaci�.\n");
		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 0, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));

			modelid = data[E_PLAYER_VEHICLES_DATA_Model];
			price = floatround(Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE]*0.7);
			str_append_format(string, "#1\t%s\t%s\t{4CD24C}$%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle, FormatNumber(price));

		}
		DynamicDgui_AddVarEx(playerid, vehiculos, 0);
		vehiculos++;

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 1))
		{			
			str_append_format(string, "#2\tVaci�.\n");
		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 1, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));

			modelid = data[E_PLAYER_VEHICLES_DATA_Model];
			price = floatround(Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE]*0.7);
			str_append_format(string, "#2\t%s\t%s\t{4CD24C}$%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle, FormatNumber(price));
			
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, 1);
		vehiculos++;

		if(!map_has_key(Player.Temp[playerid][@DataVehicles], 2))
		{			
			str_append_format(string, "#3\tVaci�.\n");
		}
		else
		{
			map_get_arr(Player.Temp[playerid][@DataVehicles], 2, data);
			str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));

			modelid = data[E_PLAYER_VEHICLES_DATA_Model];
			price = floatround(Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE]*0.7);

			str_append_format(string, "#3\t%s\t%s\t{4CD24C}$%s\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle, FormatNumber(price));
		}
		DynamicDgui_AddVarEx(playerid, vehiculos, 2);
		vehiculos++;

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Vender veh�culo"), string, str_new_static("Vender"), str_new_static("Cerrar"));
	
		if(!response[E_DIALOG_RESPONSE_Response])
		{
			ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);
			break;
		}
		new item = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);
		if(Player_VehiclesDBID[playerid][item] == 0) break; 
		Dialog_SellVehicleConfirm(playerid, item);
		break;
	}
	return 1;
}

Dialog_CraneVehicle(playerid)
{
	task_yield(1);
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		new data[E_PLAYER_VEHICLES_DATA], platevehicle[32];

		new vehiculos = 0;

		DynamicDgui_Start(playerid);

		str_clear(string);
		str_append_format(string, "{5EB5FF}Veh�culo\t{5EB5FF}Entrega\t{5EB5FF}Costo\t{5EB5FF}Estado\n");

		for_map(i : Player.Temp[playerid][@DataVehicles])
	    {
	    	if (!iter_sizeof(i)) {
	            continue;
	        }
	        iter_get_arr(i, data);

	        new Float:percentage, Float:vehiclehealth; 
	        new slot = iter_get_key(i);

	        if(PlayerInfo[playerid][p_VehicleSlot][slot] != 0)
	        {
				GetVehicleHealth(PlayerInfo[playerid][p_VehicleSlot][slot], vehiclehealth);
	        	percentage = (((vehiclehealth - 350.0) / (1000.0 - 350.0)) * 100.0);
	        }
	        str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));
			if(Vehicles_Info[ PlayerInfo[playerid][p_VehicleSlot][slot] ][gi_vehicle_HEALTH] == 0.0) str_append_format(string, "%s (%s)\t4 minutos\t{44AA44}$400\tdestruido\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle, percentage);
	    	else str_append_format(string, "%s (%s)\t4 minutos\t{44AA44}$400\t%.0f%%\n", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), platevehicle, percentage); 
	    	DynamicDgui_AddVarEx(playerid, vehiculos, slot);
	    	vehiculos++;
	    }
	    if(!vehiculos)
		{
			GameTextForPlayerError(playerid, "~r~No tienes ning�n veh�culo.", 4000);
			ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);
			break;
		}   

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Seleccionar un veh�culo para recuperar"), string, str_new_static("Recuperar"), str_new_static("Salir"));

		if(!response[E_DIALOG_RESPONSE_Response])
		{
			ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);
			break;
		}

		new slot = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);
		Dialog_CraneVehicleConfirm(playerid, slot);
		break;
	}
	return 1;
}

Dialog_CraneVehicleConfirm(playerid, slot)
{
	task_yield(1);
	
	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		str_clear(string);

		new data[E_PLAYER_VEHICLES_DATA];

		map_get_arr(Player.Temp[playerid][@DataVehicles], slot, data);

		new Float:percentage, Float:vehiclehealth;

		if(PlayerInfo[playerid][p_VehicleSlot][slot] != 0)
		{
			GetVehicleHealth(PlayerInfo[playerid][p_VehicleSlot][slot], vehiclehealth);
			percentage = (((vehiclehealth - 350.0) / (1000.0 - 350.0)) * 100.0);
		}

		str_append_format(string, "{FFFFFF}Costo: {44AA44}$400\n{FFFFFF}Tiempo de entrega: {2B7BB4}4 minutos\n\n{FFFFFF}La entrega del veh�culo se realizara en el estacionamiento\nde �ste mismo establecimiento.\n\nRecibir�s una notificaci�n cuando el veh�culo haya llegado al estacionamiento.");
		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_MSGBOX, str_format("{5EB5FF}Recuperar %s", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model])), string, str_new_static("Confirmar"), str_new_static("Atr�s"));

		if(!response[E_DIALOG_RESPONSE_Response])
		{
			Dialog_CraneVehicle(playerid);
			break;
		}
		Player_VehiclesTime[playerid][slot] = gettime() + 240;
		mysql_tquery_s(conexion, str_format("UPDATE `lac_uservehicles` SET `respawntime` = %d WHERE `Car_ID`=%d;", Player_VehiclesTime[playerid][slot], Player_VehiclesDBID[playerid][slot]));
		ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);

		RemoveMoney(playerid, 400 - floatround(percentage), true, true);

		new message[128];
		format(message, sizeof(message), "Tu %s sera remolcado al estacionamiento en 4 minutos. Te enviaremos una notificaci�n cuando llegue.", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]));
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_CRANEVEHICLEINFO, message, 14);
		break;
	}
}

Dialog_SellVehicleConfirm(playerid, slot)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], string[240], modelid, price;
	new data[E_PLAYER_VEHICLES_DATA];

	map_get_arr(Player.Temp[playerid][@DataVehicles], slot, data);
	//str_get(data[E_PLAYER_VEHICLES_DATA_Plate], platevehicle, sizeof(platevehicle));

	modelid = data[E_PLAYER_VEHICLES_DATA_Model];
	price = floatround(Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE]*0.7);
	format(string, sizeof(string), "{FFFFFF}Al vender tu veh�culo recuperaras el 70% del costo original.\n{E22222}Lo objetos en el maletero se perder�n y no se podr�n recuperar.\n\n{FFFFFF}�Quieres vender tu %s por {4CD24C}$%s{FFFFFF}?", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), FormatNumber(price));

	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_MSGBOX, "{5EB5FF}Confirmar venta", string, "Confirmar", "Cancelar");
	
		if(!response[E_DIALOG_RESPONSE_Response]) break;

		if(Player_VehiclesDBID[playerid][slot] == 0) break;		

		RemovePlayerVehicleData(playerid, slot);
		mysql_tquery_s(conexion, str_format("DELETE FROM `lac_uservehicles` WHERE `Car_ID`=%d;", Player_VehiclesDBID[playerid][slot]));
	
		Player_VehiclesDBID[playerid][slot] = 0;

		new message[100];
		format(message, sizeof(message), "Has vendido tu %s por %s.", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]), FormatNumber(price));		
	
		GivePlayerMoneyEx(playerid, price, true, true);
		ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);
		
		AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, message);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_SELLVEHICLE, message, 10);

		if(PlayerInfo[playerid][p_VehicleSlot][slot] != 0)
		{
			DestroyVehicleEx(PlayerInfo[playerid][p_VehicleSlot][slot]);
			PlayerInfo[playerid][p_VehicleSlot][slot] = 0;
		}
		break;
	}
}

Dialog_ShareKeyVehicleList(playerid, vehicleid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		str_clear(string);
		DynamicDgui_Start(playerid);

		await mysql_aquery_s(conexion, str_format("SELECT s.`idsharedkey`, u.`name`, u.`InGameID`, u.`id` FROM `lac_vehicle_sharedkeys` s INNER JOIN `lac_users` u ON s.`id_user` = u.`id` WHERE s.`id_vehicle` = %d;", VEHICLES_PLAYER[vehicleid][player_vehicle_ID]));
		
		new rows, player_db[4], player_id[4];
		cache_get_row_count(rows);
		for(new i = 0; i < rows; i++)
		{
			new name[25], keyid;
			cache_get_value_name_int(i, "idsharedkey", keyid);
			cache_get_value_name(i, "name", name, sizeof(name));
			cache_get_value_name_int(i, "InGameID", player_id[i]);
			cache_get_value_name_int(i, "id", player_db[i]);

			str_append_format(string, "Quitar llave %s\n", name);
			DynamicDgui_AddVar(playerid, keyid);
		}
		str_append_format(string, "{5EB5FF}Compartir llave");
		DynamicDgui_AddVar(playerid, -1);
		
		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_LIST, str_new_static("{5EB5FF}Compartir llave"), string, str_new_static("Seleccionar"), str_new_static("Regresar"));
	
		if(!response[E_DIALOG_RESPONSE_Response]) break;

		new listitem = response[E_DIALOG_RESPONSE_Listitem];
		new id = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);

		if(id == -1)
		{
			Dialog_VehicleShareNewKey(playerid, vehicleid);
		}
		else
		{
			mysql_tquery_s(conexion, str_format("DELETE FROM `lac_vehicle_sharedkeys` WHERE `idsharedkey`=%d;", id));		
			Vehicles_Info[vehicleid][gi_vehicle_KEYS][listitem] = 0;

			new message[100];
			format(message, sizeof(message), "%s cambio la cerradura de su %s.", PlayerInfo[playerid][p_Name], VehicleName[Vehicles_Info[vehicleid][gi_vehicle_MODELID] - 400]);
			AddPlayerMessageNotification(playerid, player_db[listitem], 0, message);
			if(IsPlayerLogged(player_id[listitem]))
			{
				CreatePlayerNotificationSimple(player_id[listitem], VNOTI_TYPE_REMOVEVEHICLEKEY, message, 10);
			}
			continue;
		}

	}
}

Dialog_VehicleShareNewKey(playerid, vehicleid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], string[280];
	strcat(string, "{FFFFFF}Compartir llaves.\n\n");
	strcat(string, "La persona a la que compartas tendra acceso a:\n");
	strcat(string, " {5EB5FF}- {FFFFFF}Personalizar el veh�culo.\n");
	strcat(string, " {5EB5FF}- {FFFFFF}Abrir y cerrar las puertas.\n");
	strcat(string, " {5EB5FF}- {FFFFFF}Acceso completo al maletero.\n\n");
	strcat(string, "Escribe el nombre del jugador (Nombre_Apellido):");
	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_INPUT, "{5EB5FF}Escribe un nombre para compartir", string, "Compartir", "Regresar");
	
		if(!response[E_DIALOG_RESPONSE_Response]) break;

		new id_inputtext;
		if(sscanf(response[E_DIALOG_RESPONSE_InputText], "u", id_inputtext))
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Error.", 4000, 3);
			continue;
			
		}
		if(id_inputtext < 0)
		{
			PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Error.", 4000, 3);
			continue;
		}

		if(!PlayerInfoTemp[id_inputtext][pt_IsLoggedIn]) continue;

		new id = GetVehicleSharedKeysFree(vehicleid, PlayerInfo[id_inputtext][pID]);
		if(id == -1)
		{
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Intenta de nuevo.", 4000, 3);
			continue;
		}
		/*if(id == -1)
		{
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~r~Intenta de nuevo.", 4000, 3);
			continue;
		}*/
		else if(Vehicles_Info[vehicleid][gi_vehicle_KEYS][id] == 0)
		{
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~w~Compartido.", 4000, 3);
			mysql_tquery_s(conexion, str_format("INSERT INTO `lac_vehicle_sharedkeys` (`id_vehicle`, `id_user`) VALUES (%d, %d);", VEHICLES_PLAYER[vehicleid][player_vehicle_ID], PlayerInfo[id_inputtext][pID]));
			
			Vehicles_Info[vehicleid][gi_vehicle_KEYS][id] = PlayerInfo[id_inputtext][pID];
			//Dialog_ShareKeyVehicleList(playerid, vehicleid);
			break;
			
		}
	}
}

Dialog_SellHouseConfirm(playerid, housesell)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], string[240], price;
	price = floatround(CasaInfo[housesell][cPrecio]*0.7);
	format(string, sizeof(string), "{E22222}Los objetos en estantes y armarios se perder�n y no se podr�n recuperar.\n\n{FFFFFF}Valor de la casa: {4CD24C}$%s", FormatNumber(price));

	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_MSGBOX, "{5EB5FF}Vender casa", string, "Vender", "Volver");
	
		if(!response[E_DIALOG_RESPONSE_Response]) { MenuV_Show(playerid, MenuPlayerHouse); break; }

		if(PlayerInfo[playerid][p_INTERIOR_TYPE] != PLAYER_INTERIOR_PROPERTY) break;
		new id = Player_SearchHouseID(playerid, housesell);
		if(CasaInfo[housesell][cOwnerID] != PlayerInfo[playerid][pID]) break;

		mysql_tquery_s(conexion, str_format("DELETE FROM `lac_property_owner` WHERE `id_property` = %d;", CasaInfo[housesell][id_property]));
		CasaInfo[housesell][cSale] = 0;
		CasaInfo[housesell][cLock] = 0;
		CasaInfo[housesell][cOwnerID] = 0;

		PlayerInfo[playerid][p_HouseSlot][id] = 0;

		DestroyDynamicPickup(CasaInfo[housesell][cPickUp][0]);

		UpdateLabelHouse(housesell);

		new MapZone:zone, zone_name[MAX_MAP_ZONE_NAME];
		zone = GetMapZoneAtPoint(CasaInfo[housesell][cExteriorX], CasaInfo[housesell][cExteriorY], CasaInfo[housesell][cExteriorZ]);
		GetMapZoneName(zone, zone_name);
		
		new message[100];
		price = floatround(CasaInfo[housesell][cPrecio]*0.7);
		GivePlayerMoneyEx(playerid, price, true, true);

		format(message, sizeof(message), "Vendiste tu casa en %s por $%s.", zone_name, FormatNumber(price));

		AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, message);
		if(IsPlayerLogged(playerid))
		{
			CreatePlayerNotificationSimple(playerid, VNOTY_TYPE_SELLHOUSE, message, 10);
		}
		break;
	}
	return 1;
}

Dialog_RadioStations(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		str_clear(string);
		str_append_format(string, "{5EB5FF}Nombre\t{5EB5FF}G�nero\n");
		for(new i = 1; i < sizeof RADIO_STATION_DATA; i++)
		{
			str_append_format(string, "%s\t%s\n", RADIO_STATION_DATA[i][E_RADIO_STATION_DATA_NAME], RADIO_STATION_DATA[i][E_RADIO_STATION_DATA_TYPE]);
		}
		str_append_format(string, "{5EB5FF}Apagar");
		
		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Estaciones de radio"), string, str_new_static("Seleccionar"), str_new_static("Regresar"));
		if(!response[E_DIALOG_RESPONSE_Response]) break;

		new listitem = response[E_DIALOG_RESPONSE_Listitem];
		if(listitem != 2)
		{
			foreach(new player : Player)
			{
				if(GetPlayerVehicleID(player) != GetPlayerVehicleID(playerid)) continue;
				PlayAudioStreamForPlayer(player, RADIO_STATION_DATA[listitem+1][E_RADIO_STATION_DATA_URL]);
				ListeningR[player] = listitem+1;
			}
			Vehicles_Info[GetPlayerVehicleID(playerid)][gi_vehicle_RADIO] = listitem+1;
		}
		else
		{
			foreach(new player : Player)
			{
				if(GetPlayerVehicleID(player) != GetPlayerVehicleID(playerid)) continue;
				StopAudioStreamForPlayer(playerid);
				ListeningR[player] = 0;
			}
			Vehicles_Info[GetPlayerVehicleID(playerid)][gi_vehicle_RADIO] = 0;
		}
	}
}

Dialog_EditFurnitureObject(playerid, type, house)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	new data[E_HOUSE_FURNITURE_DATA], time_format[14];
	new data_sort[19][E_HOUSE_FURNITURE_DATA_SORT];

	pawn_guard(string);

	for(;;)
	{
		str_clear(string);
		DynamicDgui_Start(playerid);

		new count = 0, Float:dist;
		str_append_format(string, "{5EB5FF}Mueble\t{5EB5FF}Distancia\t{5EB5FF}Ultima edici�n\n");

		new Pool:pool;
		GetFurnitureTypeProperty(type, house, pool);

		if(!pool_valid(pool) || !pool_size(pool)) { GameTextForPlayerError(playerid, "~r~No tienes ning�n mueble para mover.", 4000); break; }

		for_pool(i : pool)
		{
			if(count > 18) break;

			if (!iter_sizeof(i)) {
            	continue;
            }

			iter_get_arr(i, data);

			dist = GetPlayerDistanceFromPoint(playerid, data[E_HOUSE_FURNITURE_DATA_X], data[E_HOUSE_FURNITURE_DATA_Y], data[E_HOUSE_FURNITURE_DATA_Z]);
			if(dist > 10.0) continue;
		
			data_sort[count][E_HOUSE_FURNITURE_SORT_Dist] = dist;
			data_sort[count][E_HOUSE_FURNITURE_SORT_Model] = data[E_HOUSE_FURNITURE_DATA_MODEL];
			data_sort[count][E_HOUSE_FURNITURE_SORT_Date] = data[E_HOUSE_FURNITURE_DATA_DATE];
			data_sort[count][E_HOUSE_FURNITURE_SORT_Item] = iter_get_key(i);
			
			count++;
		}
		
		SortDeepArray(data_sort, E_HOUSE_FURNITURE_SORT_Dist, .order = SORT_ASC, .size = count);
		
		for(new i = 0; i < count; i++)
		{
			if(data_sort[i][E_HOUSE_FURNITURE_SORT_Dist])
			{
				ConverTime_TimeElapsed(data_sort[i][E_HOUSE_FURNITURE_SORT_Date], time_format);
				str_append_format(string, "%s\t%.1f metros\t%s\n", Furniture.Info[ data_sort[i][E_HOUSE_FURNITURE_SORT_Model] ][@Name], data_sort[i][E_HOUSE_FURNITURE_SORT_Dist], time_format);
				DynamicDgui_AddVarEx(playerid, i, data_sort[i][E_HOUSE_FURNITURE_SORT_Item]);
			}
		}
		
		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Selecciona el mueble para editar"), string, str_new_static("Seleccionar"), str_new_static("Regresar"));
		
		if(response[E_DIALOG_RESPONSE_Response])
		{
			if(CasaInfo[house][cOwnerID] != PlayerInfo[playerid][pID]) break;
			new id = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);

			Furniture_ObjectEditModePool(playerid, id, pool);
			break;
		}
		else
		{
			Create_MenuPlayerHouse(playerid);
			break;
		}
		
	}
	return 1;
}

Dialog_SellFurnitureObject(playerid, type, house)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	new data[E_HOUSE_FURNITURE_DATA], time_format[14];

	new data_sort[19][E_HOUSE_FURNITURE_DATA_SORT];

	pawn_guard(string);

	for(;;)
	{
		str_clear(string);
		DynamicDgui_Start(playerid);

		str_append_format(string, "{5EB5FF}Mueble\t{5EB5FF}Distancia\t{5EB5FF}Ultima edici�n\n");

		new Pool:pool;
		GetFurnitureTypeProperty(type, house, pool);

		if(!pool_valid(pool) || !pool_size(pool)) { GameTextForPlayerError(playerid, "~r~No tienes ning�n mueble para vender.", 4000); break; }

		new count = 0, Float:dist;
		for_pool(i : pool)
		{
			if(count > 18) break;

			if (!iter_sizeof(i)) {
            	continue;
            }

			iter_get_arr(i, data);

			dist = GetPlayerDistanceFromPoint(playerid, data[E_HOUSE_FURNITURE_DATA_X], data[E_HOUSE_FURNITURE_DATA_Y], data[E_HOUSE_FURNITURE_DATA_Z]);
			if(dist > 10.0) continue;
			
			data_sort[count][E_HOUSE_FURNITURE_SORT_Dist] = dist;
			data_sort[count][E_HOUSE_FURNITURE_SORT_Model] = data[E_HOUSE_FURNITURE_DATA_MODEL];
			data_sort[count][E_HOUSE_FURNITURE_SORT_Date] = data[E_HOUSE_FURNITURE_DATA_DATE];
			data_sort[count][E_HOUSE_FURNITURE_SORT_Item] = iter_get_key(i);
			
			count++;
		}
		SortDeepArray(data_sort, E_HOUSE_FURNITURE_SORT_Dist, .order = SORT_ASC, .size = count);
		for(new i = 0; i < count; i++)
		{
			if(data_sort[i][E_HOUSE_FURNITURE_SORT_Dist])
			{
				ConverTime_TimeElapsed(data_sort[i][E_HOUSE_FURNITURE_SORT_Date], time_format);
				str_append_format(string, "%s\t%.1f metros\t%s\n", Furniture.Info[ data_sort[i][E_HOUSE_FURNITURE_SORT_Model] ][@Name], data_sort[i][E_HOUSE_FURNITURE_SORT_Dist], time_format);
				DynamicDgui_AddVarEx(playerid, i, data_sort[i][E_HOUSE_FURNITURE_SORT_Item]);
			}
		}

		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST_HEADERS, str_new_static("{5EB5FF}Selecciona un mueble para vender"), string, str_new_static("Seleccionar"), str_new_static("Regresar"));
		if(CasaInfo[house][cOwnerID] != PlayerInfo[playerid][pID]) break;
		if(response[E_DIALOG_RESPONSE_Response])
		{

			new id = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);
			Dialog_SellFurnitureConfirm(playerid, house, id, pool);
			break;
		}
		else
		{
			Create_MenuPlayerHouse(playerid);
			break;
		}
		
	}
}

Dialog_SellFurnitureConfirm(playerid, houseid, item, Pool:pool)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO];
	
			
	new string_other[70];

	new data[E_HOUSE_FURNITURE_DATA];
	pool_get_arr(pool, item, data);
		
	for(;;)
	{
		format(string_other, sizeof(string_other), "{FFFFFF}�Seguro quieres vender este mueble por $%s?", FormatNumber(Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Price]));
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_MSGBOX, "{5EB5FF}Vender", string_other, "Vender", "Cancelar");

		if(response[E_DIALOG_RESPONSE_Response])
		{
			if(CasaInfo[houseid][cOwnerID] != PlayerInfo[playerid][pID]) break;

			DestroyDynamicObject(data[E_HOUSE_FURNITURE_DATA_ObjID]);
			
			mysql_tquery_s(conexion, str_format("DELETE FROM `lac_house_furniture` WHERE `idfurniture`=%d;", data[E_HOUSE_FURNITURE_DATA_DBID]));
			
			DestroyFeaturesFurnitureType(Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type], item, pool);

			pool_remove(pool, item);

			GivePlayerMoneyEx(playerid, Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Price], true, true);
			break;
		}
		else
		{
			Create_MenuPlayerHouse(playerid);
			break;
		}
	}
}

Dialog_FactionDescModify(playerid)
{
	yield 1;

	new response[e_DIALOG_RESPONSE_INFO];

	for(;;)
	{
		await_arr(response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_INPUT, "{5EB5FF}Modificar descripci�n", "{FFFFFF}Ingresa una descripci�n menor a 50 caracteres.\n\nDescripci�n:", "Modificar", "Cancelar");
		
		if(!response[E_DIALOG_RESPONSE_Response]) break;
		
		if(PlayerInfo[playerid][p_FactionMember] == 0) return SendClientMessage(playerid, -1, "No estas en ninguna banda.");
		if(!FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Valid]) return ShowPlayerInfoTextdraw(playerid, "~r~Esa banda no existe.", 4000);
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CHANGE_NAME]) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes los permisos necesarios.", 4000);
		if(PlayerInfo[playerid][p_FactionMember] != GetPlayerFactionSelectedID(playerid)) return 1;

		
		if(strlen(response[E_DIALOG_RESPONSE_InputText]) >= 50)
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Cantidad m�xima de caracteres 50 caracteres.", 4000);
			continue;
		}

		new desc_string[50];
		if(sscanf(response[E_DIALOG_RESPONSE_InputText], "s[50]", desc_string))
		{
			ShowPlayerInfoTextdraw(playerid, "~r~Escribe una pregunta con un m�ximo de 50 caracteres.", 4000);
			continue;
		}
		mysql_aquery_s(conexion, str_format("UPDATE `lac_facciones` SET `description` = '%q' WHERE `id` = %d;", desc_string, PlayerInfo[playerid][p_FactionMember]));

		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], desc_string);
		
		break;
	}	
	return 1;
}


ShowDialogPlayerEx(playerid, dialogid)
{
	switch(dialogid)
	{
		case DIALOG_BANCO1:
		{
			ShowPlayerDialog(playerid,DIALOG_BANCO1, DIALOG_STYLE_INPUT, "Retirar Dinero", "Ingresa la cantidad que quieres retirar:", "Retirar", "Cancelar");
		}
		case DIALOG_BANCO2:
		{
			ShowPlayerDialog(playerid,DIALOG_BANCO2, DIALOG_STYLE_INPUT, "Depositar Dinero", "Ingresa la cantidad que quieres depositar:", "Depositar", "Cancelar");
		}
		case DIALOG_TRANSFER_BANK:
		{
			if(PlayerInfo[playerid][p_LEVEL] < 3) return SendClientMessage(playerid, -1, "Necesitas ser nivel 3 para poder hacer transferencias de dinero.");
			ShowPlayerDialog(playerid,dialogid, DIALOG_STYLE_INPUT, "Transferir Dinero", "Ingresa la id del jugador al que le quieres transferir el dinero", "Siguiente", "Cancelar");
		}
		case DIALOG_TRANSFER_BANK_SEND:
		{
			new str_title[24+50];
			format(str_title, sizeof(str_title), "Transferir dinero - %s", PlayerInfoTemp[TransferBankID[playerid]][pt_Name]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, str_title, "Ingresa la cantidad de dinero que le quieres transferir al jugador.", "Transferir", "Cancelar");
		}
	}
	return 1;
}

/*Dialog:ConfigProperty(playerid, response, listitem, inputtext)
{
	if(response)
	{
		new id = DynamicDgui_GetValue(playerid, listitem);	
		switch()
	}
	return 1;
}
*/