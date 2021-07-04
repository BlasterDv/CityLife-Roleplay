ckfs_EnterPlayer(playerid)
{
	//new pickupID = Player.Temp[playerid][@PickedUpArea];
	new pickupID = PlayerInfo[playerid][p_PickedUpPickup];
	if(pickupID != INVALID_STREAMER_ID)
	{
		//new data[2];
		//Streamer_GetArrayData(STREAMER_TYPE_PICKUP, pickupID, E_STREAMER_EXTRA_ID, data);
		new id = Streamer_GetIntData(STREAMER_TYPE_PICKUP, pickupID, E_STREAMER_EXTRA_ID);

		//new id = data[1];

		if(pickupID == CasaInfo[id][cPickUp][0]) { ckfs_EnterPlayerF(playerid, 0, id); }
		else if(pickupID == CasaInfo[id][cPickUp][1]) { ckfs_ExitPlayerF(playerid, 0, id); }
		else if(pickupID == DoorInfo[id][dPickup][0]) { ckfs_EnterPlayerF(playerid, 1, id); }
		else if(pickupID == DoorInfo[id][dPickup][1]) { ckfs_ExitPlayerF(playerid, 1, id); }
		else if(pickupID == ParkingInfo[id][pgPickUp][0]) { ckfs_EnterPlayerF(playerid, 2, id); }
		else if(pickupID == ParkingInfo[id][pgPickUp][1]) { ckfs_ExitPlayerF(playerid, 2, id); }

	}
	return 1;
}

ckfs_EnterPlayerVehicle(playerid)
{
	/*new areaID = PlayerInfo[playerid][pPickedUpArea];*/
	new areaID[1];
	GetPlayerDynamicAreas(playerid, areaID, sizeof(areaID));
	if(areaID[0] != INVALID_STREAMER_ID)
	{
		new data[2];
		Streamer_GetArrayData(STREAMER_TYPE_AREA, areaID[0], E_STREAMER_EXTRA_ID, data);
		if(data[0] != AREA_TYPE_ZONE_PARK) return 0;
		if(areaID[0] == ParkingInfo[ data[1] ][pgAreaid][0]) { ckfs_EnterPlayerH(playerid, 0, data[1]); }
		else if(areaID[0] == ParkingInfo[ data[1] ][pgAreaid][1]) { ckfs_ExitPlayerH(playerid, 0, data[1]); }
	}
	return 1;
}


ckfs_EnterPlayerF(playerid, type, i)
{
	switch(type)
	{
		case 0:
		{
			if(!PlayerToPoint(1.0,playerid,CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ])) return 1;
			if(CasaInfo[i][cLock] == 0 || CasaInfo[i][cOwnerID] == PlayerInfo[playerid][pID])
			{
				if(!CasaInfo[i][cInteriorLoaded])
				{
					House_PlayerLoadInterior(i);
				}

				SetPlayerPosInteriorHouse(playerid, i);
				PlayerInfo[playerid][p_INTERIOR_TYPE] = PLAYER_INTERIOR_PROPERTY;
				PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = i;

				CasaInfo[i][cPlayersInHouse]++;
			}
			else
			{
				ShowPlayerInfoTextdraw(playerid, "~r~Puerta cerrada", 2000);
			}
		}
		case 1:
		{
			if(!PlayerToPoint(1.0,playerid,DoorInfo[i][dExitX], DoorInfo[i][dExitY], DoorInfo[i][dExitZ])) return 1;
			Entrar(playerid);

			if(DoorInfo[i][DoorEnabled] == 1) return 1;
			if(PlayerInfo[playerid][pCargos] >= DoorInfo[i][dCargos] && PlayerInfo[playerid][pCargos] != 0) /*{*/return SendClientMessage(playerid, -1, "No puedes entrar si la policia te esta buscando.");
			if(DoorInfo[i][dEnterX] == 0) return ShowPlayerInfoTextdraw(playerid, "~r~No tiene interior.", 2000);

			PlayerInfo[playerid][p_INTERIOR_TYPE] = PLAYER_INTERIOR_DOOR;
			PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = DoorInfo[i][dID];


			SetPlayerPosInt(playerid, DoorInfo[i][dEnterX],DoorInfo[i][dEnterY],DoorInfo[i][dEnterZ], DoorInfo[i][dAnguloInt], DoorInfo[i][dEnterInt], DoorInfo[i][dEnterVW]);
			
			//LoadObjects(playerid, 1000);	
		}
		case 2:{ // Public Park
			if(!PlayerToPoint(1.0,playerid,ParkingInfo[i][pgExteriorX], ParkingInfo[i][pgExteriorY], ParkingInfo[i][pgExteriorZ])) return 1;

			SetPlayerPosInt(playerid, ParkingInfo[i][pgInteriorX], ParkingInfo[i][pgInteriorY], ParkingInfo[i][pgInteriorZ], ParkingInfo[i][pgInteriorA], 1, ParkingInfo[i][pgVWInt]);
		}
	}
	return 1;
}

ckfs_ExitPlayerF(playerid, type, i)
{
	//new pickupid = Player.Temp[playerid][@PickedUpArea];

	switch(type)
	{
		case 0:
		{
			new interiorid = CasaInfo[i][cInteriorID];			
			if(!PlayerToPoint(1.0, playerid, DataE.HouseInterior[interiorid][@X],DataE.HouseInterior[interiorid][@Y], DataE.HouseInterior[interiorid][@Z])) return 1;
			
			SetPlayerPosInt(playerid, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ], CasaInfo[i][cAnguloExt], 0, 0);
			PlayerInfo[playerid][p_INTERIOR_TYPE] = PLAYER_INTERIOR_NORMAL;
			PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = 0;
			CasaInfo[i][cPlayersInHouse]--;
		}
		case 1:{
			if(!PlayerToPoint(1.0,playerid,DoorInfo[i][dEnterX], DoorInfo[i][dEnterY], DoorInfo[i][dEnterZ])) return 1;

			PlayerInfo[playerid][p_INTERIOR_TYPE] = PLAYER_INTERIOR_NORMAL;
			PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = 0;
			SetPlayerPosInt(playerid, DoorInfo[i][dExitX],DoorInfo[i][dExitY],DoorInfo[i][dExitZ], DoorInfo[i][dAnguloExt], DoorInfo[i][dExitInt], DoorInfo[i][dExitVW]);
			//LoadObjects(playerid, 1000);
		}
		case 2:{ // Public Park
			if(!PlayerToPoint(1.0,playerid,ParkingInfo[i][pgInteriorX], ParkingInfo[i][pgInteriorY], ParkingInfo[i][pgInteriorZ])) return 1;
			SetPlayerPosInt(playerid, ParkingInfo[i][pgExteriorX], ParkingInfo[i][pgExteriorY], ParkingInfo[i][pgExteriorZ], ParkingInfo[i][pgExteriorA], 0, 0);
		}
	}
	funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);
	return 1;
}

ckfs_EnterPlayerH(playerid, type, i)
{
	switch(type)
	{
		case 0:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new Float:nx, Float:ny;
				nx = ParkingInfo[i][pgInteriorX]; ny =ParkingInfo[i][pgInteriorY];
				GetPointInFrontOfPos(nx, ny, ParkingInfo[i][pgInteriorA], 4.0);			
				Streamer_UpdateEx(playerid,nx, ny, ParkingInfo[i][pgInteriorZ]+0.2, 1, ParkingInfo[i][pgVWInt]);
				SetVDriverPassengerPos(vehicleid, 1, ParkingInfo[i][pgVWInt]);
				SetVehiclePosEx(GetPlayerVehicleID(playerid),nx, ny,ParkingInfo[i][pgInteriorZ]+2.0);
				SetVehicleZAngle(vehicleid, ParkingInfo[i][pgInteriorA]);
				LinkVehicleToInteriorEx(vehicleid, 1);
				SetVehicleVWEx(vehicleid, ParkingInfo[i][pgVWInt]);
				SendClientMessageEx(playerid,-1, "XD: %d", ParkingInfo[i][pgVWInt]);
				LoadObjects(playerid);
			}
		}
		case 1:
		{
			if(DoorInfo[i][DoorEnabled] == 1) return 1;
			if(PlayerInfo[playerid][pCargos] >= DoorInfo[i][dCargos] && PlayerInfo[playerid][pCargos] != 0) /*{*/return SendClientMessage(playerid, -1, "No puedes entrar si la policia te esta buscando.");
			if(DoorInfo[i][dEnterX] == 0) return SendClientMessage(playerid, Gris, "No Tiene Interior.");
			Streamer_UpdateEx(playerid, DoorInfo[i][dEnterX], DoorInfo[i][dEnterY], DoorInfo[i][dEnterZ], -1, DoorInfo[i][dEnterInt]);
			SetPlayerPos(playerid, DoorInfo[i][dEnterX],DoorInfo[i][dEnterY],DoorInfo[i][dEnterZ]);
			SetPlayerFacingAngle(playerid, DoorInfo[i][dAnguloInt]);
			SetInterior(playerid, DoorInfo[i][dEnterInt]);
			SetVW(playerid, DoorInfo[i][dEnterVW]);
			LoadObjects(playerid);	
		}
	}
	return 1;
}

ckfs_ExitPlayerH(playerid, type, i)
{
	switch(type)
	{
		case 0:
		{

			new vehicleid = GetPlayerVehicleID(playerid);
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new Float:nx, Float:ny;
				//VehicleInfo[id][vParkingExpenses] -= 100;
				nx = ParkingInfo[i][pgExteriorX]; ny =ParkingInfo[i][pgExteriorY];
				GetPointInFrontOfPos(nx, ny, ParkingInfo[i][pgExteriorA], 4.0);			

				SetVDriverPassengerPos(vehicleid, 0,0);
				SetVehiclePosEx(vehicleid, nx, ny, ParkingInfo[i][pgExteriorZ]);
				SetVehicleZAngle(vehicleid, ParkingInfo[i][pgExteriorA]);
				LinkVehicleToInteriorEx(vehicleid, 0);
				SetVehicleVWEx(vehicleid, 0);
				LoadObjects(playerid);
				return 1;	
			}

		}
		
	}
	return 1;
}

/*ckfs_KeyPressEnter(playerid)
{
	return 1;
}*/

/*cksf_ExitPlayer(playerid)
{
	Salir(playerid);
 	for(new i = 0; i < sizeof(DoorInfo); i++)
  	{
   		if(IsPlayerInRangeOfPoint(playerid,3.0,DoorInfo[i][dEnterX],DoorInfo[i][dEnterY],DoorInfo[i][dEnterZ]) && GetPlayerVirtualWorld(playerid) == DoorInfo[i][dEnterVW])
		{
  			SetPlayerPos(playerid, DoorInfo[i][dExitX],DoorInfo[i][dExitY],DoorInfo[i][dExitZ]);
			SetPlayerFacingAngle(playerid, DoorInfo[i][dAnguloExt]);
			SetPlayerInterior(playerid, DoorInfo[i][dExitInt]);
			SetPlayerVirtualWorld(playerid, DoorInfo[i][dExitVW]);
			LoadObjects(playerid);
		}
 	}
	foreach(new i : HouseIterator)
	{
		if (IsPlayerInRangeOfPoint(playerid,1,CasaInfo[i][cInteriorX], CasaInfo[i][cInteriorY], CasaInfo[i][cInteriorZ]) && PlayerInfo[playerid][pEnCasa] == CasaInfo[i][id_casa])
		{
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInterior] = 0;
			PlayerInfo[playerid][pEnCasa] = 0;
			LoadObjects(playerid);
			SetPlayerPos(playerid,CasaInfo[i][cExteriorX],CasaInfo[i][cExteriorY],CasaInfo[i][cExteriorZ]);
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVirtualWorld] = 0;
			SetPlayerFacingAngle(playerid, CasaInfo[i][cAnguloExt]);
			return Streamer_UpdateEx(playerid, CasaInfo[i][cExteriorX],CasaInfo[i][cExteriorY],CasaInfo[i][cExteriorZ]);
		}
		else if(PlayerToPoint(2.0, playerid, 254.1667,-41.5538,1002.0308) && GetPlayerVirtualWorld(playerid) == CasaInfo[i][cVirtualWorld])
		{
			Streamer_UpdateEx(playerid, CasaInfo[i][cArmarioX], CasaInfo[i][cArmarioY], CasaInfo[i][cArmarioZ], -1, CasaInfo[i][cInterior]);
			SetPlayerPos(playerid, CasaInfo[i][cArmarioX], CasaInfo[i][cArmarioY], CasaInfo[i][cArmarioZ]);
			SetPlayerInterior(playerid, CasaInfo[i][cInterior]);
			SetPlayerFacingAngle(playerid, CasaInfo[i][cArmarioA]);
			return 1;
		}
	}
	return 1;
}*/

/*ckfs_EnterPlayerVehicle(playerid, type)
{
	switch(type)
	{
		case 0:
		{
			if (IsPlayerInRangeOfPoint(playerid,5.0,CasaInfo[i][cGarajeExtX], CasaInfo[i][cGarajeExtY], CasaInfo[i][cGarajeExtZ])){
				if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, Blanco, "No estas de conductor en un Vehiculo.");
				if(CasaInfo[i][cdueno_id] != PlayerInfo[playerid][pID]) return SendClientMessage(playerid, Blanco, "Solo el dueño puede Guardar sus Vehículos en el Garaje.");
				new vehicleid = GetPlayerVehicleID(playerid);
				new v = GetVehiclePlayerID(vehicleid);
				if(VehicleCreated[v] == 1 && strcmp(VehicleInfo[v][vOwnerName], PlayerName(playerid)) == 0)
				{
					Streamer_Update(playerid);
					SetVDriverPassengerPos(vehicleid,4, CasaInfo[i][cVirtualWorld]);
					if(CasaInfo[i][cGaraje] == 1) { SetVehiclePlayerPos(vehicleid, v, 302.1481,302.8076,998.8281, 1.5338, 4, CasaInfo[i][cVirtualWorld]); }
					else if(CasaInfo[i][cGaraje] == 2) { SetVehiclePlayerPos(vehicleid, v, 19.0163,-322.5472,1546.3711,89.7118, 4, CasaInfo[i][cVirtualWorld]); }
					PlayerInfo[playerid][pEnCasa] = i;
					LoadObjects(playerid);
				} else SendClientMessage(playerid, Blanco, "Solo puedes guardar vehículos que sean tuyos.");
			}
		}
	}
}*/

ShowPlayerSpeedoMeter(playerid)
{
	if(Velocidad[playerid] == INVALID_PLAYER_BAR_ID) { Velocidad[playerid] = CreatePlayerProgressBar(playerid, 538.00, 370.0, 88.0, 5.19, 0x009EFFFF, 400.0, 2); }
	if(Gasolina[playerid] == INVALID_PLAYER_BAR_ID) { Gasolina[playerid] = CreatePlayerProgressBar(playerid, 538.00, 404.0, 88.0, 5.19, 0xFEB40EFF, 100.0, 2); }
	new vehicleid = GetPlayerVehicleID(playerid);
	ShowPlayerProgressBar(playerid, Gasolina[playerid]);
	SetPlayerProgressBarMaxValue(playerid, Velocidad[playerid], GetVehicleMaxSpeed(GetVehicleModel(GetPlayerVehicleID(playerid))));
	ShowPlayerProgressBar(playerid, Velocidad[playerid]);
    SetPlayerProgressBarMaxValue(playerid, Gasolina[playerid], GetMaxGasolineVehicle(vehicleid));
	SetPlayerProgressBarValue(playerid, Gasolina[playerid], Vehicles_Info[vehicleid][gi_vehicle_GAS]);
	ShowPlayerProgressBar(playerid, Gasolina[playerid]);
	new szSpeed[30];
	format(szSpeed, sizeof(szSpeed),"%d/%d",Vehicles_Info[vehicleid][gi_vehicle_GAS], GetMaxGasolineVehicle(vehicleid));
    PlayerTextDrawSetString(playerid, VeloText[playerid][1], szSpeed);
    format(szSpeed, sizeof(szSpeed),"0");
    PlayerTextDrawSetString(playerid, VeloText[playerid][0], szSpeed);


	PlayerTextDrawShow(playerid, VeloText[playerid][0] );
    TextDrawShowForPlayer(playerid, VeloBox[0]);
    TextDrawShowForPlayer(playerid, VeloBox[1]);
    TextDrawShowForPlayer(playerid, VeloBox[2]);
    PlayerTextDrawShow(playerid, VeloText[playerid][1] );

    PlayerInfoTemp[playerid][pt_TimersE][11] =  SetTimerEx("TimerSpeedometer", 250, true, "ii", playerid, vehicleid);
	return 1;
}

HidePlayerSpeedoMeter(playerid)
{
	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][11]);

	PlayerTextDrawHide(playerid, VeloText[playerid][0] );
	TextDrawHideForPlayer(playerid, VeloBox[0]);
	TextDrawHideForPlayer(playerid, VeloBox[1]);
	TextDrawHideForPlayer(playerid, VeloBox[2]);
	/*TextDrawHideForPlayer(playerid, VeloText[1][playerid] );
	TextDrawHideForPlayer(playerid, VeloText[2][playerid]);*/
	PlayerTextDrawHide(playerid, VeloText[playerid][1]);
	if(Gasolina[playerid] != INVALID_PLAYER_BAR_ID) { DestroyPlayerProgressBar(playerid, Gasolina[playerid]); Gasolina[playerid] = INVALID_PLAYER_BAR_ID; }
	if(Velocidad[playerid] != INVALID_PLAYER_BAR_ID) { DestroyPlayerProgressBar(playerid, Velocidad[playerid]); Velocidad[playerid] = INVALID_PLAYER_BAR_ID; }
	return 1;
}

function Callback_HoldingKey(playerid, key)
{
	new keys, ud, lr;

	GetPlayerKeys(playerid, keys, ud, lr);
		
	if(keys & key)
	{
		rBit1_Set(eBit1_PlayerInfo[p_ncPressedKey], playerid, true);
		rBit1_Set(eBit1_PlayerInfo[p_HoldKey], playerid, false);
		OnPlayerHoldingKey(playerid, key);
	}
	else
	{
		OnPlayerReleaseKey(playerid, key);
		rBit1_Set(eBit1_PlayerInfo[p_HoldKey], playerid, false);
		rBit1_Set(eBit1_PlayerInfo[p_ncPressedKey], playerid, false);
	}
	return 1;
}

function Vehicle_HoldingKeyOptions(playerid)
{
	new keys, ud, lr;
	GetPlayerKeys(playerid, keys, ud, lr);
	rBit1_Set(eBit1_PlayerInfo[p_HoldKey], playerid, false);
	
	if(keys & KEY_LOOK_BEHIND)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			ShowDialogOptionsVehicle(playerid);
		}
	}
	else
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(rBit1_Get(eBit1_PlayerInfo[p_StartingEngine], playerid)) return 0;
			new vehicleid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[vehicleid][gi_vehicle_GAS] < 1) return GameTextForPlayer(playerid, "~n~~n~~n~~n~~r~Sin combustible.", 4000, 3);
			if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) { return 1; }
			if(Vehicles_Info[vehicleid][gi_vehicle_ENGINE] == 0)
			{
				rBit1_Set(eBit1_PlayerInfo[p_StartingEngine], playerid, true);
				ShowPlayerInfoTextdraw(playerid, "~g~Encendiendo...");
				SetTimerEx("SetVehicleEngine", 1000, 0, "ddd",  vehicleid, playerid, 1);


				if(PlayerInfo[playerid][p_Tutorial] == 0) { PlayerProgressTutorial(playerid, true); }
			}
			else
			{
				rBit1_Set(eBit1_PlayerInfo[p_StartingEngine], playerid, true);
				SetTimerEx("SetVehicleEngine", 1000, 0, "ddd", vehicleid, playerid, 2);
				ShowPlayerInfoTextdraw(playerid, "~r~Apagando...");
			}
		}	
	}
	return 1;
}

ShowDialogOptionsVehicle(playerid)
{
	task_yield(1);
	
	new engine,lights,alarm,doors,bonnet,boot,objective, vehicleid;
	

	new response[e_DIALOG_RESPONSE_INFO], String:string = str_new("");
	pawn_guard(string);

	for(;;)
	{
		DynamicDgui_Start(playerid);
		vehicleid = GetPlayerVehicleID(playerid);
		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);

		str_clear(string);
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			
			str_append_format(string, "Luces\t%s\n", (lights ? ("Encendidas"):("Apagadas")));
			DynamicDgui_AddVar(playerid, 0);
			str_append_format(string, "Estación de radio\t%s\n", RADIO_STATION_DATA[ Vehicles_Info[vehicleid][gi_vehicle_RADIO] ][E_RADIO_STATION_DATA_NAME]);
			DynamicDgui_AddVar(playerid, 1);
			if(VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] == PlayerInfo[playerid][pID]) 
			{ 
				str_append_format(string, "Compartir vehículo\t(%d/4)\n", CountVehicleSharedKeys(vehicleid));
				DynamicDgui_AddVar(playerid, 4);
			}
			if(IsPlayerInVehicleRent(playerid, vehicleid)) { str_append_format(string, "Desrentar vehículo\n"); DynamicDgui_AddVar(playerid, 5);  }
		}
		await_arr(response) ShowPlayerAsyncDialogStr(playerid, DIALOG_STYLE_TABLIST, str_new_static("{5EB5FF}Opciones"), string, str_new_static("Seleccionar"), str_new_static("Salir"));
		
		if(!response[E_DIALOG_RESPONSE_Response]) break;

		new id = DynamicDgui_GetValue(playerid, response[E_DIALOG_RESPONSE_Listitem]);
		switch(id)
		{
			case 0:
			{
				if(vehicle_getLights(vehicleid))
				{
					vehicle_setLights(vehicleid, false);
				}
				else { vehicle_setLights(vehicleid, true); }
				//ShowDialogOptionsVehicle(playerid);
				//break;
			}
			case 1:
			{
				Dialog_RadioStations(playerid);
			}
			case 4:
			{
				Dialog_ShareKeyVehicleList(playerid, vehicleid);
			}
			case 5:
			{
				Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
				PlayerInfo[playerid][p_RentSeconds] = 0;
				PlayerInfo[playerid][p_RentMinutes] = 0;

				new Query[100];
				format(Query, sizeof(Query), "DELETE FROM `lac_uservehicles` WHERE `Car_ID`=%d;",
					VEHICLES_PLAYER[ Player.Temp[playerid][@RentVehicle] ][player_vehicle_ID]);
				mysql_tquery(conexion, Query);

				Player.Temp[playerid][@RentVehicle] = -1;

				SetTimerEx("RespawnearVehiculo", 2000, false, "ii", vehicleid, 1);
				RemovePlayerFromVehicle(playerid);
				funct_HideTextdrawNotif(playerid, VNOTI_TYPE_RENTEDVEHICLE);
				break;
			}
		}
	}    
	return 1;
}

ShowPlayerInfoTextdraw(playerid, const text[], time=0)
{
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], ConvertEncoding(text));
	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo]);
	
	if(time) 
	{ 
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][4]);
		PlayerInfoTemp[playerid][pt_TimersE][4] = SetTimerEx("HidePlayerInfoTextdraw_E", time, false, "i", playerid); 
	}
	return 1;
}

HidePlayerInfoTextdraw(playerid)
{
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], "__");
	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo]);
	return 1;
}

GameTextForPlayerError(playerid, const string[], time, style = 3)
{
	new str[100];
	format(str, sizeof(str), "~n~~n~~n~~n~~n~~n~~n~~n~%s", string);

    return (playerid == -1 ? (GameTextForAll(ConvertEncoding(str), time, 3)) : (GameTextForPlayer(playerid, ConvertEncoding(str), time, style)) );
}

ShowPlayerProgressBarGeneral(playerid, Float:maxvalue, Float:value = 0.0)
{
	Cargando[playerid] = floatround(value);
	SetPlayerProgressBarMaxValue(playerid, ProgressCargando[playerid], maxvalue);
	SetPlayerProgressBarValue(playerid, ProgressCargando[playerid],value/*Cargando[playerid]*/);
	ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BarProgressGeneral]);
}

HidePlayerProgressBarGeneral(playerid)
{
	HidePlayerProgressBar(playerid, ProgressCargando[playerid]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BarProgressGeneral]);
}


UpdatePlayerProgressBarGeneral(playerid)
{
	SetPlayerProgressBarValue(playerid, ProgressCargando[playerid],Cargando[playerid]);
	ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
}

function OnPlayerConnect_Extra(playerid)
{
	InterpolateCameraPos(playerid, 1791.130737, -1570.935546, 209.488677, 1791.130737, -1570.935546, 209.488677, 0, CAMERA_CUT);
 	InterpolateCameraLookAt(playerid, 1787.104736, -1567.996215, 209.098770, 1787.104736, -1567.996215, 209.098770, 0, CAMERA_CUT);
}

ckfs_KeyPressFunc_H(playerid)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		new pickupID = PlayerInfo[playerid][p_PickedUpPickup];
		if(pickupID != INVALID_STREAMER_ID)
		{
			new id = Streamer_GetIntData(STREAMER_TYPE_PICKUP, pickupID, E_STREAMER_EXTRA_ID);
		
			if(pickupID == CasaInfo[id][cPickUp][0]) 
			{ 
				if(CasaInfo[id][cSale] == 0)
				{
					yield 1;

					new string[80], type[15];
					if(CasaInfo[id][cHouseType]) { format(type, sizeof(type), "%d Coins", CasaInfo[id][cPrecio]); } else { format(type, sizeof(type), "$%s", FormatNumber(CasaInfo[id][cPrecio])); }
					format(string, sizeof(string), "{FFFFFF}¿Estas seguro de comprar esta propiedad por {4CD24C}%s{FFFFFF}?", type);

					for(;;)
					{
						new dialog_response[e_DIALOG_RESPONSE_INFO];
						await_arr(dialog_response) ShowPlayerAsyncDialog(playerid, DIALOG_STYLE_MSGBOX, "{5EB5FF}Confirmar compra", string, "Comprar", "Cancelar");
						if(!dialog_response[E_DIALOG_RESPONSE_Response]) break;
						Player_BuyHouse(playerid, id);
						break;
					}
				}
			}	
		}
	}
	return 1;
}

function OnPlayerEnterITArea(playerid, areaid)
{
	if(!rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid))
	{
		CheckEnterITArea_Timer(playerid);
		PlayerInfoTemp[playerid][pt_TimersE][0] = SetTimerEx("CheckEnterITArea_Timer", 500, true, "i", playerid);
		rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid, true);
	}
	/*if(type == 1)
	{
		if(!rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid))
		{
			//CheckEnterITArea_Timer(playerid);
			PlayerInfoTemp[playerid][pt_TimersE][9] = repeat CheckEnterArea_Timer(playerid);
			rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid, true);
		}
	}*/
	return 1;
}

function OnPlayerEnterAreaITV(playerid, areaid, type)
{
	if(type == 1)
	{
		if(!rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid))
		{
			//CheckEnterITArea_Timer(playerid);
			PlayerInfoTemp[playerid][pt_TimersE][9] = SetTimerEx("CheckEnterArea_Timer", 500, true, "i", playerid);
			rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid, true);
		}
	}
	return 1;
}

function OnPlayerLeaveAreaITV(playerid, areaid, type)
{
	if(type == 1)
	{
//		PlayerInfoTemp[playerid][pt_VEHICLE_NEAR] = INVALID_VEHICLE_ID;
		StopTimerEnterAreaCheck(playerid);
	}
	return 1;
}

function OnPlayerLeaveITArea(playerid, areaid)
{
	if(rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid))
	{
		rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid, false);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][0]);
	
	}
	switch(GetInteractiveAreaTypeG(areaid))
	{
		case KEY_AREAIT_TYPE_ENTER: { PlayerInfo[playerid][p_PickedUpArea] = INVALID_AREAIT_ID; }
		case KEY_AREAIT_TYPE_YES: { PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID; }
		case KEY_AREAIT_TYPE_COLLECT: { Player.Temp[playerid][@PlayerInAreaAlt] = INVALID_AREAIT_ID; }
		case KEY_AREAIT_TYPE_V_YES: { PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID; }
	}
	funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);
	return 1;
}

OpenPlayerSpecialDialog(playerid, id)
{
	switch(id)
	{
		case 0:
		{
			Dialog_Show(playerid, DialogBuyDrinkMarket, DIALOG_STYLE_TABLIST_HEADERS, "{00C0FF}Comprar bebidas",
				"Bebida\tPrecio\n\
				Sprunk\t{33AA33}$40\n\
				Cerveza\t{33AA33}$60\n\
				Vino\t{33AA33}$100\n\
				Jugo de manzana\t{33AA33}$40\n\
				Jugo de naranja\t{33AA33}$40\n\
				Caja de leche\t{33AA33}$40\n\
				", "Comprar", "Cancelar");
		
		}
		case 2:
		{
			Dialog_Show(playerid, DialogBuyPizza, DIALOG_STYLE_TABLIST_HEADERS, "{00C0FF}The Well Stacked Pizza",
				"Comida\tPrecio\n\
				Porcion pizza\t{33AA33}$20\n\
				", "Comprar", "Cancelar");
		}
	}
	return 1;
}

// Items World - Last Modified 12/02/2019

public OnPlayerDropItem(playerid, itemid)
{
	//new objdata = ItemsWorld.Info[itemid][@ItemID];
	new type = InvObjectData[itemid][E_INV_TYPE];

	switch(type)
	{
		case INV_TYPE_CARRY_FARMER:
		{
			new vehicleid = CamionID[playerid];
			new Float:x, Float:y,Float:z, bool:end;
			GetVehiclePos(vehicleid, x,y,z);
			if(IsPlayerInRangeOfPoint(playerid, 4.0, x,y,z))
			{
				if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
				if(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK] != WORK_TYPE_FARMER) return 1;
				if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del vehículo puede cargar cosas.", 2000);

				
				if(Objetos[playerid] == INVALID_STREAMER_ID && GetInvValueItemSelected(playerid) == 59)
				{	
		

					if(GetPlayerWorkLevel(playerid, WORK_TYPE_FARMER) < 2) { end = true; }
					Objetos[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(Objetos[playerid], vehicleid, 0.55940, -1.99890, 0.43540, 0.0, 0.0, 0.0);
				
					RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
					RemovePlayerAttachedObject(playerid, 9);

					PlayerInfo[playerid][p_JobMissionState]++;

					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);
				}
				if(Objetos2[playerid] == INVALID_STREAMER_ID && GetInvValueItemSelected(playerid) == 59)
				{	
					if(GetPlayerWorkLevel(playerid, WORK_TYPE_FARMER) < 4) { end = true;  }
					Objetos2[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(Objetos2[playerid], vehicleid, -0.58060, -1.99890, 0.43540, 0.0, 0.0, 0.0);
				
					RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
					RemovePlayerAttachedObject(playerid, 9);

					PlayerInfo[playerid][p_JobMissionState]++;

					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);
				}
				if(Objetos3[playerid] == INVALID_STREAMER_ID && GetInvValueItemSelected(playerid) == 59)
				{	
					end = true;
					Objetos3[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(Objetos3[playerid], vehicleid, -0.62170, -1.39290, 0.43540, 0.0, 0.0, 0.0);
				
					RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
					RemovePlayerAttachedObject(playerid, 9);

					PlayerInfo[playerid][p_JobMissionState]++;

					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);
				}

				if(end)
				{
					PlayerInfo[playerid][p_JobTravelNext] = 9;
					ShowPlayerInfoTextdraw(playerid, "~w~Regresa a la granja para recibir el ~g~~h~pago", 8000);
					SetPlayerDynCP(playerid, 0, -1419.1064,-1521.1444,101.7337, 5.0, CHECKPOINT_TYPE_FINISH_FARMER, true);
				}
				else
				{
					PlayerInfo[playerid][p_JobTravelNext] = 1;
					SetPlayerProgressFarmerNext(playerid);

				}
				return 1;
			}
			
		}
		case INV_TYPE_PHONE:
		{
			//new Query [128];
			//format(Query, sizeof(Query), "INSERT INTO `lac_servergral_witems`(`itemid`, `item_amount`) VALUES (%d, %d);", GetInvValueItemSelected(playerid), GetInvAmountItemSelected(playerid));
			//mysql_tquery(conexion, Query);

			//SelectNuleItemInventory(playerid);
			//RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected], true);

		}
		case INV_TYPE_BACKPAD:
		{
			return 0;
		}
	/*	default:
		{
			
			SelectNuleItemInventory(playerid);
			RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
		}*/
	}

	//SelectNuleItemInventory(playerid);
	//RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
	return 0;
}

public OnPlayerDropItemWorld(playerid, itemid)
{
	new type = InvObjectData[itemid][E_INV_TYPE];

	switch(type)
	{
		case INV_TYPE_PHONE:
		{
			//new Query [128];
			//format(Query, sizeof(Query), "INSERT INTO `lac_servergral_witems`(`itemid`, `item_amount`) VALUES (%d, %d);", GetInvValueItemSelected(playerid), GetInvAmountItemSelected(playerid));
			//mysql_tquery(conexion, Query);

			RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected], true);
			return 1;
		}
	}

	RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
	return 0;
}

public OnPlayerGetItem(playerid, itemid)
{
	/*new objdata = ItemsWorld.Info[itemid][@ItemID];
	new type = InvObjectData[objdata][E_INV_TYPE];

	switch(type)
	{
		case INV_TYPE_BACKPAD:
		{
			map_remove_deep(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID]);	    	
		}
	}*/
	mysql_aquery_s(conexion, str_format("DELETE FROM `lac_servergral_witems` WHERE `id_index`=%d;", itemid));

	return 1;
}

public OnPlayerPickupItem(playerid, itemid)
{
	new objdata = ItemsWorld.Info[itemid][@ItemID];
	new type = InvObjectData[objdata][E_INV_TYPE];

	switch(type)
	{
		case INV_TYPE_BACKPAD:
		{
			if(map_has_key(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID])) { map_remove_deep(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID]); }	
		}
	}
	return 0;
}

// Keys

OnPlayerHoldingKey(playerid, key)
{
	if(key == KEY_LOOK_BEHIND)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			ShowDialogOptionsVehicle(playerid);
		}
	}
	return 1;
}

OnPlayerReleaseKey(playerid, key)
{
	if(key & KEY_LOOK_BEHIND)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[vehicleid][gi_vehicle_GAS] < 1) return GameTextForPlayer(playerid, "~n~~n~~n~~n~~r~Sin combustible.", 4000, 3);
			if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) { return 1; }
			if(Vehicles_Info[vehicleid][gi_vehicle_ENGINE] == 0)
			{
				ShowPlayerInfoTextdraw(playerid, "~g~Encendiendo...");
				SetTimerEx("SetVehicleEngine", 1000, 0, "ddd",  vehicleid, playerid, 1);


				if(PlayerInfo[playerid][p_Tutorial] == 0) { PlayerProgressTutorial(playerid, true); }
			}
			else
			{
				SetTimerEx("SetVehicleEngine", 1000, 0, "ddd", vehicleid, playerid, 2);
				ShowPlayerInfoTextdraw(playerid, "~r~Apagando...");
			}
		}
	}
	return 1;
}