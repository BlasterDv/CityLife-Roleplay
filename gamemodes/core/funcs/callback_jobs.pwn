function UnloadDFT(playerid, finalcp)
{
	/*if(finalcp == rBit4_Get(eBit4_PlayerInfo[pProgressRecoJobO], playerid))
	{
		CancelTravelCarrier(playerid);
		CheckSpeedHackJob(playerid, 10, 0);
		PayJobCarrier(playerid, PlayerInfo[playerid][pNivelTransportista]);
	}*/
	if(Cargando[playerid] > 0)
	{
		Cargando[playerid]--;
		UpdatePlayerProgressBarGeneral(playerid);
	}
	else
	{
		Cargando[playerid] = 0;
		HidePlayerProgressBarGeneral(playerid);
		KillTimer(TimerDescargando[playerid]);

		new bool:recoend;
		switch(PlayerInfo[playerid][p_JobTravel])
		{
			case 1:
			{
				switch(PlayerInfo[playerid][p_JobTravelNext])
				{
					case 2:
					{
						DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID;
						DestroyDynamicObject(Objetos3[playerid]); Objetos3[playerid] = INVALID_STREAMER_ID;
						ShowPlayerInfoTextdraw(playerid, "Te estan esperando en ~b~Market Los Santos", 5000);
						PlayerInfo[playerid][p_JobTravelNext]++;
						SetPlayerCarrierCheckpoint(playerid);				
					}
					case 3:
					{
						DestroyDynamicObject(Objetos2[playerid]); Objetos2[playerid] = INVALID_STREAMER_ID;
						ShowPlayerInfoTextdraw(playerid, "Para recibir el pago regresa a ~b~Ocean Docks", 5000);
						PlayerInfo[playerid][p_JobTravelNext]++;
						SetPlayerCarrierCheckpoint(playerid);
					}
				}
			}
			case 2:
			{
				if(PlayerInfo[playerid][p_JobTravelNext] == 2)
				{
					DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID;
					recoend = true;
				}

			}
			case 3:
			{
				if(PlayerInfo[playerid][p_JobTravelNext] == 2)
				{
					DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID;
					DestroyDynamicObject(Objetos2[playerid]); Objetos2[playerid] = INVALID_STREAMER_ID;
					recoend = true;
				}
			}
		}
		if(recoend == true)
		{
			ShowPlayerInfoTextdraw(playerid, "Para recibir el pago regresa a ~b~Ocean Docks", 5000);
			PlayerInfo[playerid][p_JobTravelNext]++;
			SetPlayerCarrierCheckpoint(playerid);
		}
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}


/*GetWorkLevelForSkills(playerid, job)
{
	new level;
	switch(job)
	{
		case WORK_TYPE_TRUCKER:
		{
			
			if(0 <= PlayerInfo[playerid][p_TruckerSkill] <= 5) level = 1;
			else if(5 <= PlayerInfo[playerid][p_TruckerSkill] <= 15) level = 2;
			else if(15 <= PlayerInfo[playerid][p_TruckerSkill] <= 30) level = 3;
			else if(30 <= PlayerInfo[playerid][p_TruckerSkill] <= 80) level = 4;
			else if(PlayerInfo[playerid][p_TruckerSkill] >= 80) level = 5;

		}
		case WORK_TYPE_FARMER:
		{
			if(0 <= PlayerInfo[playerid][p_FarmerSkill] < 14) level = 1;
			else if(14 <= PlayerInfo[playerid][p_FarmerSkill] <= 40) level = 2;
			else if(40 <= PlayerInfo[playerid][p_FarmerSkill] <= 90) level = 3;
			else if(90 <= PlayerInfo[playerid][p_FarmerSkill] <= 145) level = 4;
			else if(PlayerInfo[playerid][p_FarmerSkill] >= 145) level = 5;
		}
		case WORK_TYPE_MINER:
		{
			if(0 <= PlayerInfo[playerid][p_MinerSkill] < 20) level = 1;
			else if(14 <= PlayerInfo[playerid][p_MinerSkill] <= 40) level = 2;
			else if(40 <= PlayerInfo[playerid][p_MinerSkill] <= 90) level = 3;
			else if(90 <= PlayerInfo[playerid][p_MinerSkill] <= 145) level = 4;
			else if(PlayerInfo[playerid][p_MinerSkill] >= 145) level = 5;

		}
	}
	return level;
}*/

stock CancelMissionJobLoad(playerid)
{
	PlayerInfo[playerid][p_WorkTravel] = 0;
	PlayerInfo[playerid][p_JobTravel] = 0;
	PlayerInfo[playerid][p_JobTravelT] = 0;
	PlayerInfo[playerid][p_JobTravelNext] = 0;
	PlayerInfo[playerid][p_JobMissionExtra] = 0;
	PlayerInfo[playerid][p_JobMissionExtraID] = 0;
	PlayerInfo[playerid][p_JobMissionState] = 0;
	PlayerInfo[playerid][p_JobTimeMax] = 0;

	if(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] != INVALID_PLAYER_ID) { DestroyDynamicArea(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0]); PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = INVALID_STREAMER_ID; }
	if(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] != INVALID_PLAYER_ID) { DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0]); PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][0] = INVALID_STREAMER_ID; }

	return 1;
}

CancelWorkTravelFarmer(playerid)
{
	new vehicleid = CamionID[playerid];
	KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
	CreateNewVehicleInSpaceWork(CamionID[playerid], PlayerInfo[playerid][p_WorkTravel]);

	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
	funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
	ForcePlayerEndLastRoute(playerid);

	DestroyVehicleEx(vehicleid);
	CamionID[playerid] = INVALID_VEHICLE_ID;
	VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = INVALID_PLAYER_ID;

	if(Objetos[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID;
	if(Objetos2[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos2[playerid]); Objetos2[playerid] = INVALID_STREAMER_ID;
	if(Objetos3[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos3[playerid]); Objetos3[playerid] = INVALID_STREAMER_ID;
}

// Farmer - 12/04/2019 2:05

SelectStageWorkFarmer(playerid)
{
	if(PlayerInfo[playerid][p_JobTravelT] == 1)
	{
		new vehicleid = CamionID[playerid];
		switch(PlayerInfo[playerid][p_JobMissionState])
		{
			case 1:
			{
				Objetos[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos[playerid], vehicleid, 0.55940, -1.99890, 0.43540, 0.0, 0.0, 0.0);
			}
			case 2:
			{
				Objetos[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos[playerid], vehicleid, 0.55940, -1.99890, 0.43540, 0.0, 0.0, 0.0);
				Objetos2[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos2[playerid], vehicleid, -0.58060, -1.99890, 0.43540, 0.0, 0.0, 0.0);
			}
			case 3:
			{
				Objetos[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos[playerid], vehicleid, 0.55940, -1.99890, 0.43540, 0.0, 0.0, 0.0);
				Objetos2[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos2[playerid], vehicleid, -0.58060, -1.99890, 0.43540, 0.0, 0.0, 0.0);
				Objetos3[playerid] = CreateDynamicObject(19812, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Objetos3[playerid], vehicleid, -0.62170, -1.39290, 0.43540, 0.0, 0.0, 0.0);
			}
			
		}
		if(PlayerInfo[playerid][p_JobTravelNext] == 0)
		{
			StartMissionJobFarmer(playerid);
		}
		else if(PlayerInfo[playerid][p_JobTravelNext] == 9)
		{
			ShowPlayerInfoTextdraw(playerid, "~g~Regresa a la granja para recibir el pago.", 8000);
			SetPlayerDynCP(playerid, 0, -1419.1064,-1521.1444,101.7337, 5.0, CHECKPOINT_TYPE_FINISH_FARMER, true);
		}
		else
		{
			SetPlayerProgressFarmerNext(playerid);
		}

		
	}
	return 1;
}

// Skills
ShowPlayerWorkSkills(playerid, type = 0, newskillid = 0)
{
	new string[250], string_add[59];
	new level, barid;
	new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_PLAYERSKILLS, 70.0, 20);

	level = Player.WorkSkill[playerid][WORK_TYPE_TRUCKER-1][@Level];
	format(string_add, sizeof(string_add), "~w~(%d/5) (%d/%d)~n~~n~", level, Player.WorkSkill[playerid][WORK_TYPE_TRUCKER-1][@Skill], Work_Skills_Data[WORK_TYPE_TRUCKER][level]);
	strcat(string, string_add);
	
	barid = funct_CreatePlayerBarNotif(playerid, i, 0, 17.0, Work_Skills_Data[WORK_TYPE_TRUCKER][level]);
	funct_SetValuePlayerBarNotif(playerid, barid, 0, Player.WorkSkill[playerid][WORK_TYPE_TRUCKER-1][@Skill]);


	level = Player.WorkSkill[playerid][WORK_TYPE_FARMER-1][@Level];
	format(string_add, sizeof(string_add), "(%d/5) (%d/%d)~n~~n~", level, Player.WorkSkill[playerid][WORK_TYPE_FARMER-1][@Skill], Work_Skills_Data[WORK_TYPE_FARMER][level]);
	strcat(string, string_add);

	barid = funct_CreatePlayerBarNotif(playerid, i, 1, 40.0, Work_Skills_Data[WORK_TYPE_FARMER][level]);
	funct_SetValuePlayerBarNotif(playerid, barid, 1, Player.WorkSkill[playerid][WORK_TYPE_FARMER-1][@Skill]);

	level = Player.WorkSkill[playerid][WORK_TYPE_MINER-1][@Level];
	format(string_add, sizeof(string_add), "(%d/10) (%d/%d)~n~~n~", level, Player.WorkSkill[playerid][WORK_TYPE_MINER-1][@Skill], Work_Skills_Data[WORK_TYPE_MINER][level]);
	strcat(string, string_add);

	barid = funct_CreatePlayerBarNotif(playerid, i, 2, 60.0, Work_Skills_Data[WORK_TYPE_MINER][level]);
	funct_SetValuePlayerBarNotif(playerid, barid, 2, Player.WorkSkill[playerid][WORK_TYPE_MINER-1][@Skill]);

	

	new string_works[200], add_type[20];

	if(type == 1) format(add_type, sizeof(add_type), "~g~+1");
	else if(type == 2) format(add_type, sizeof(add_type), "~g~nuevo nivel!");

	if(newskillid == WORK_TYPE_TRUCKER) format(string_works, sizeof(string_works),"~w~Camionero %s~n~~n~", add_type); else strcat(string_works, "~w~Camionero~n~~n~"); 
	if(newskillid == WORK_TYPE_FARMER) format(string_works, sizeof(string_works), "%s~w~Granjero %s~n~~n~", string_works, add_type); else strcat(string_works, "~w~Granjero~n~~n~");
	if(newskillid == WORK_TYPE_MINER) format(string_works, sizeof(string_works), "%s~w~Minero %s~n~~n~", string_works, add_type); else strcat(string_works, "~w~Minero~n~~n~");
	
	funct_CreateTextdrawTextNotif(playerid, i, 0, string_works, 0, 0.200, 1.2);


	funct_CreateTextdrawTextNotif(playerid, i, 1, string, 108.0, 0.200, 1.2, .align = 3);
	UpdateNotificationForPlayer(playerid, i);

	return 1;
}

GivePlayerWorkSkill(playerid, work, maxlevel)
{
	if(GetPlayerWorkSkill(playerid, work) < (Work_Skills_Data[work][ GetPlayerWorkLevel(playerid, work) ]))
	{
		
		Player.WorkSkill[playerid][work-1][@Skill]++;
		ShowPlayerWorkSkills(playerid, 1, work);

		
	}
	if(GetPlayerWorkSkill(playerid, work) >= (Work_Skills_Data[work][ GetPlayerWorkLevel(playerid, work) ]))
	{
		if(GetPlayerWorkLevel(playerid, work) >= /*Work_Skills_Data[work][*/maxlevel/*+1]*/) return ShowPlayerWorkSkills(playerid, 1, work);
		Player.WorkSkill[playerid][work-1][@Level]++;
		Player.WorkSkill[playerid][work-1][@Skill] = 0;
		ShowPlayerWorkSkills(playerid, 2, work);
	}
	
	return 0;
}