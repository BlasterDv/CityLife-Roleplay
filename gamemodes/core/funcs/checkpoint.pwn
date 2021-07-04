public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	new info[1];
	Streamer_GetArrayData(STREAMER_TYPE_CP, checkpointid, E_STREAMER_EXTRA_ID, info);

	switch(info[0])
	{
		case CHECKPOINT_TYPE_LOAD_JOBCARRIER:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new autoid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[autoid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_WORK] != WORK_TYPE_TRUCKER) return 1;
			if(Vehicles_Info[autoid][gi_vehicle_MODELID] != 578) return 1; 
			if(VEHICLES_WORKG[autoid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);

			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);

			ForcePlayerEndLastRoute(playerid);
			PlayerInfo[playerid][p_JobTimeMax] = 0;

			ShowPlayerProgressBarGeneral(playerid, 10.0);
			Cargando[playerid] = 0;

			ShowPlayerInfoTextdraw(playerid, "~g~Cargando Camion...", 10000);
			KillTimer(TimerDescargando[playerid]);
			TimerDescargando[playerid] = SetTimerEx("LoadDFT", 1000, true, "i", playerid);
			TogglePlayerControllable(playerid, 0);
		}
		case CHECKPOINT_TYPE_UNLOAD_CARRIER:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new autoid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[autoid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_WORK] != WORK_TYPE_TRUCKER) return 1;
			if(Vehicles_Info[autoid][gi_vehicle_MODELID] != 578) return 1; 
			if(VEHICLES_WORKG[autoid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);

			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);

			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
			
			ForcePlayerEndLastRoute(playerid);
			PlayerInfo[playerid][p_JobTimeMax] = 0;

			ShowPlayerProgressBarGeneral(playerid, 10.0, 10.0);
			/*Cargando[playerid] = 10;*/
			ShowPlayerInfoTextdraw(playerid, "~g~Descargando Camion...", 10000);
			KillTimer(TimerDescargando[playerid]);
			TimerDescargando[playerid] = SetTimerEx("UnloadDFT", 1000, true, "ii", playerid, 2);
			TogglePlayerControllable(playerid, 0);			
		}
		case CHECKPOINT_TYPE_FINISH_JOBTRUCK:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new autoid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[autoid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_WORK] != WORK_TYPE_TRUCKER) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);
			
			PayJobTrucker(playerid, GetPlayerWorkLevel(playerid, WORK_TYPE_TRUCKER));
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
			/*CheckSpeedHackJob(playerid, 2, 2);*/
			CancelTruckerLoad(playerid);

			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] = INVALID_STREAMER_ID;
		}
		case CHECKPOINT_TYPE_START_FARMER:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new vehicleid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK] != WORK_TYPE_FARMER) return 1;
			if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);


			PlayerInfo[playerid][p_JobTravelNext] = 1;
			SetPlayerProgressFarmerNext(playerid);

			GPS_DestroyPlayerCP(playerid);
			
			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] = INVALID_STREAMER_ID;
		}
		case CHECKPOINT_TYPE_FINISH_FARMER:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new vehicleid = GetPlayerVehicleID(playerid);
			if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK] != WORK_TYPE_FARMER) return 1;
			if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);

			PagoTrabajoLechero(playerid);
			
			DestroyPlayerDynCP(playerid, 0, true);
			
			FinishPlayerJob(playerid);
			CancelWorkTravelFarmer(playerid);
			CancelMissionJobLoad(playerid);

			
		}
		case CHECKPOINT_TYPE_G_GRAFFITI:
		{
			PlayerInfoTemp[playerid][pt_TimersE][12] = SetTimerEx("CheckPlayerSprayGrafiti", 1500, true, "i", playerid);
		}
		case CHECKPOINT_TYPE_GPS:
		{
			Player.Temp[playerid][@GPSRouteSelected] = -1;
			DestroyPlayerDynCP(playerid, 1, true);
		}
		case CHECKPOINT_TYPE_GPSVEHICLE:
		{
			DestroyPlayerDynCP(playerid, 2, true);
		}
	}
	return 1;
}

public OnPlayerLeaveDynamicCP(playerid, checkpointid)
{
	new info[1];
	Streamer_GetArrayData(STREAMER_TYPE_CP, checkpointid, E_STREAMER_EXTRA_ID, info);

	switch(info[0])
	{
		case CHECKPOINT_TYPE_G_GRAFFITI:
		{
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][12]);
		}

	}
	return 1;
}

SetPlayerDynCP(playerid, index, Float:x,Float:y,Float:z, Float:size, type = CHECKPOINT_TYPE_NONE, bool:route = false, color = 0, bool:mapicon = true)
{
	if(IsValidDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index]))
	{
		DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index]);
		PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index] = INVALID_STREAMER_ID;
	}
	PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index] = CreateDynamicCP(x,y,z,size,-1,-1, playerid);

	new info[1];
	info[0] = type;
	Streamer_SetArrayData(STREAMER_TYPE_CP, PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index], E_STREAMER_EXTRA_ID, info);
	
	if(mapicon) { SetPlayerMapIcon(playerid, index+19, x,y,z, 0, ColorsRutePlayerGPS[color], MAPICON_GLOBAL); }
	if(route == true) { SetPlayerCheckpointGPS(playerid, x,y,z, color); }
	return 1;
}

DestroyPlayerDynCP(playerid, index, bool:route = false)
{
	if(IsValidDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index]))
	{
		DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index]);
		PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][index] = INVALID_STREAMER_ID;
	}

	RemovePlayerMapIcon(playerid, index+19);

	if(route) GPS_DestroyPlayerCP(playerid);
}