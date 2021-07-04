enum Enum_Truck_Next_Point
{
	Float:truck_next_point_X[MAX_PERCP_TRUCKJOB],
	Float:truck_next_point_Y[MAX_PERCP_TRUCKJOB],
	Float:truck_next_point_Z[MAX_PERCP_TRUCKJOB],
	Float:truck_next_point_A[MAX_PERCP_TRUCKJOB],
	truck_next_point_maxpoints,
	truck_maxtime_delivery[MAX_PERCP_TRUCKJOB],
	truck_point_actor[MAX_PERCP_TRUCKJOB]
}
static TruckWorkInfoPoint[MAX_CP_TRUCKJOB][Enum_Truck_Next_Point];

GetPlayerTruckerPoint(playerid)
{
	return TruckWorkInfoPoint[PlayerInfo[playerid][p_JobTravel]][truck_next_point_maxpoints];
}

/*CancelTravelCarrier(playerid)
{
	DFTReco[playerid] = INVALID_VEHICLE_ID;
	RecoCarrier[playerid] = 0;
	RemovePlayerCP(playerid, 0);
	DeleteTimerJob(playerid, 0);
	if(Objetos[playerid] != INVALID_STREAMER_ID) { DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID; }
	if(Objetos2[playerid] != INVALID_STREAMER_ID) { DestroyDynamicObject(Objetos2[playerid]); Objetos2[playerid] = INVALID_STREAMER_ID; }
	if(Objetos3[playerid] != INVALID_STREAMER_ID) { DestroyDynamicObject(Objetos3[playerid]); Objetos3[playerid] = INVALID_STREAMER_ID; }
	if(Objetos4[playerid] != INVALID_STREAMER_ID) { DestroyDynamicObject(Objetos4[playerid]); Objetos4[playerid] = INVALID_STREAMER_ID; }
	return 1;
}*/

/*InPointOfTrukDelivery(playerid, reco, point)
{
	if(IsPlayerInRangeOfPoint(playerid, 2.0, TruckWorkInfoPoint[reco][truck_next_point_X][point], TruckWorkInfoPoint[reco][truck_next_point_Y][point], TruckWorkInfoPoint[reco][truck_next_point_Z][point])) return 1;
	return 0;
}*/

CreateCheckpointTruckerTravel(travel, Float:x, Float:y, Float:z, Float:a, maxtime = 70, actorskin = 0)
{
	new point = TruckWorkInfoPoint[travel][truck_next_point_maxpoints];
	TruckWorkInfoPoint[travel][truck_next_point_X][point] = x;	
	TruckWorkInfoPoint[travel][truck_next_point_Y][point] = y;	
	TruckWorkInfoPoint[travel][truck_next_point_Z][point] = z;
	TruckWorkInfoPoint[travel][truck_next_point_A][point] = a;
	TruckWorkInfoPoint[travel][truck_next_point_maxpoints]++;
	TruckWorkInfoPoint[travel][truck_maxtime_delivery][point] = maxtime;

	if(actorskin != 0) { TruckWorkInfoPoint[travel][truck_point_actor][point] = CreateDynamicActor(actorskin, x,y,z,a); }
	return 1;
}

SetPlayerNextCheckpointTrucker(playerid)
{
	new travel = PlayerInfo[playerid][p_JobTravel];
	new cp = PlayerInfo[playerid][p_JobTravelNext];

	if(PlayerInfo[playerid][p_JobTravelNext] >= GetPlayerTruckerPoint(playerid))
	{
		SetPlayerDynCP(playerid, 0, 2164.1108,-2296.3359,13.5361, 7.0, CHECKPOINT_TYPE_FINISH_JOBTRUCK);
		SetPlayerCheckpointGPS(playerid, 2164.1108, -2296.3359, 13.5361);
		funct_AddTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
		if(PlayerInfo[playerid][p_JobTimeMax] == 0) { PlayerInfo[playerid][p_JobTimeMax] = 480; }
		PlayerInfoTemp[playerid][pt_TimersE][7] =  SetTimerEx("CheckJobTruckerTimer", 1000, true, "i", playerid);
	}
	else if(PlayerInfo[playerid][p_JobTravelNext] == 0)
	{
		SetPlayerDynCP(playerid, 0,
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp],  1.0, CHECKPOINT_TYPE_LOAD_JOB_TRUCK);

		SetPlayerCheckpointGPS(playerid,
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp]);

		PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = CreateDynamicSphere(
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp], 10.0, -1, -1, playerid);

		new info[1];
		info[0] = AREA_TYPE_TRUCKER_ZONE;
		Streamer_SetArrayData(STREAMER_TYPE_AREA, PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0], E_STREAMER_EXTRA_ID, info);

		funct_AddTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
		if(PlayerInfo[playerid][p_JobTimeMax] == 0) { PlayerInfo[playerid][p_JobTimeMax] = GetTruckingTravelTimeJob(travel, cp); }
		PlayerInfoTemp[playerid][pt_TimersE][7] = SetTimerEx("CheckJobTruckerTimer", 1000, true, "i", playerid);
	}
	else
	{
		/*PlayerInfo[playerid][p_JobTravelNext]++;*/
		/*SetPlayerCheckpoint(playerid,
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp], 2.0);*/
		SetPlayerDynCP(playerid, 0,
		TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Z][cp], 1.0, CHECKPOINT_TYPE_NORMAL_JOBTRUCK);

		SetPlayerCheckpointGPS(playerid,
		TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Z][cp]);

		PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = CreateDynamicSphere(
		TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
		TruckWorkInfoPoint[travel][truck_next_point_Z][cp], 10.0, -1, -1, playerid);
		
		new info[1];
		info[0] = AREA_TYPE_TRUCKER_ZONE;
		Streamer_SetArrayData(STREAMER_TYPE_AREA, PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0], E_STREAMER_EXTRA_ID, info);

		funct_AddTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
		if(PlayerInfo[playerid][p_JobTimeMax] == 0) { PlayerInfo[playerid][p_JobTimeMax] = GetTruckingTravelTimeJob(travel, cp); }
		PlayerInfoTemp[playerid][pt_TimersE][7] = SetTimerEx("CheckJobTruckerTimer", 1000, true, "i", playerid);
	}
	return 1;
}

GetTruckingTravelTimeJob(travel, cp)
{
	return TruckWorkInfoPoint[travel][truck_maxtime_delivery][cp];
}

GetTruckerZoneName(travel, cp)
{
	new MapZone:zone, zone_name[MAX_MAP_ZONE_NAME];

	if(cp < TruckWorkInfoPoint[travel][truck_next_point_maxpoints])
	{

		zone = GetMapZoneAtPoint(			
			TruckWorkInfoPoint[travel][truck_next_point_X][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
			TruckWorkInfoPoint[travel][truck_next_point_Z][cp]);
	}
	else
	{
		zone = GetMapZoneAtPoint(2164.1108,-2296.3359,13.5361);
	}
	GetMapZoneName(zone, zone_name);
	return zone_name;
}

function CheckPositionTruckJob_Timer(playerid)
{
	new travel = PlayerInfo[playerid][p_JobTravel];
	new cp = PlayerInfo[playerid][p_JobTravelNext];
	new Float:x, Float:y,Float:z;
	x = TruckWorkInfoPoint[travel][truck_next_point_X][cp];	
 	y = TruckWorkInfoPoint[travel][truck_next_point_Y][cp];	
	z = TruckWorkInfoPoint[travel][truck_next_point_Z][cp];
	GetPosBehindVehicle(CamionID[playerid], x,y,z, 1.0);
	if(GetDistanceBetweenPoints(
	TruckWorkInfoPoint[travel][truck_next_point_X][cp],
 	TruckWorkInfoPoint[travel][truck_next_point_Y][cp],	
	TruckWorkInfoPoint[travel][truck_next_point_Z][cp], x,y,z) <= 1.0)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][6]);
		if(PlayerInfo[playerid][p_JobTravelNext] == 0)
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new autoid = GetPlayerVehicleID(playerid);
			new model = Vehicles_Info[autoid][gi_vehicle_MODELID];
			if(Vehicles_Info[autoid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_WORK] != WORK_TYPE_TRUCKER) return 1;
			if(model != 414 && model != 456 && model != 499 && model != 609) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);
			//if(!IsVehicleTruckingInAnglePos(autoid, PlayerInfo[playerid][p_JobTravel], PlayerInfo[playerid][p_JobTravelNext])) return SendClientMessage(playerid, -1, "Estaciónate con la parte trasera del camión.");

			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] = INVALID_STREAMER_ID;

			DestroyDynamicArea(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = INVALID_STREAMER_ID;

			PlayerInfo[playerid][p_JobTimeMax] = 0;
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
			KillTimer(TimerDescargando[playerid]);
			TogglePlayerControllable(playerid, 0);
			ShowPlayerProgressBarGeneral(playerid, 10.0);
			ShowPlayerInfoTextdraw(playerid, "~g~Cargando...", 10000);
			OpenDoorTruck(CamionID[playerid], 1);
			TimerDescargando[playerid] = SetTimerEx("LoadTruckJobPlayer", 1000, true, "d", playerid);			
			if(TruckWorkInfoPoint[travel][truck_point_actor][cp] != 0)
			{
				ApplyDynamicActorAnimation(TruckWorkInfoPoint[travel][truck_point_actor][cp], "CARRY", "LIFTUP", 4.1, false, false, false, false, 10000);
			}
		}
		else
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			new autoid = GetPlayerVehicleID(playerid);
			new model = Vehicles_Info[autoid][gi_vehicle_MODELID];
			if(Vehicles_Info[autoid][gi_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_WORK] != WORK_TYPE_TRUCKER) return 1;
			if(model != 414 && model != 456 && model != 499 && model != 609) return 1;
			if(VEHICLES_WORKG[autoid][wgi_vehicle_OWNER] != playerid) return ShowPlayerInfoTextdraw(playerid, "~r~Solo el dueño del camión puede entregar.", 2000);
			//if(!IsVehicleTruckingInAnglePos(autoid, PlayerInfo[playerid][p_JobTravel], PlayerInfo[playerid][p_JobTravelNext])) return GameTextForPlayerError(playerid, "~r~Estaciónate con la parte trasera del camión.", 4000);

			PlayerInfo[playerid][p_JobTimeMax] = 0;
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
			KillTimer(TimerDescargando[playerid]);
			//Cargando[playerid] = 10;
			ShowPlayerProgressBarGeneral(playerid, 10.0, 10.0);
			OpenDoorTruck(CamionID[playerid], 1);
			TimerDescargando[playerid] = SetTimerEx("DescargandoCamion", 1000, true, "d", playerid);
			TogglePlayerControllable(playerid, 0);
			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] = INVALID_STREAMER_ID;

			DestroyDynamicArea(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0]);
			PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = INVALID_STREAMER_ID;

			ShowPlayerInfoTextdraw(playerid, "~g~Descargando...", Descargando[playerid]*1000);
		}
	}
	return 1;
}

StartMissionJobFarmer(playerid)
{
	if(GetPlayerWorkLevel(playerid, WORK_TYPE_FARMER) <= 5)
	{
		SetPlayerDynCP(playerid, 0,
		-380.3307,-1056.2023,59.0065, 5.0, CHECKPOINT_TYPE_START_FARMER);

		GPS_SetPlayerCheckpoint(playerid,
		-380.3307,-1056.2023,59.0065);	
	}
	PlayerInfo[playerid][p_WorkTravel] = WORK_TYPE_FARMER;
	PlayerInfo[playerid][p_JobTravelT] = 1;
}

FinishPlayerJob(playerid)
{
	switch(PlayerInfo[playerid][p_WorkTravel])
	{
		case WORK_TYPE_FARMER:
		{
			if(IsValidDynamicObject(PlayerInfo[playerid][p_JobMissionExtraID])) DestroyDynamicObject(PlayerInfo[playerid][p_JobMissionExtraID]);
			if(IsValidDynamicArea(Player.Temp[playerid][@JobAreaMission])) 
			{
				new objectid = GetInteractiveExtraData(Player.Temp[playerid][@JobAreaMission]);
				DestroyDynamicObject(objectid);
				DestroyInteractiveArea(Player.Temp[playerid][@JobAreaMission]);  
			}
		}
	}
	return 1;
}