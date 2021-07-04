function CheckEnterITArea_Timer(playerid)
{
	//new OnGameModeInitCount = GetTickCount();
	new id = GetInteractiveAreaID_Ex(playerid);
	if(id != INVALID_AREAIT_ID)
	{
		switch(GetInteractiveAreaTypeG(id))
		{
			case 0:
			{
				if(IsItAngleZValid(playerid, id))
				{
					switch(GetInteractiveAreaType(id))
					{
						case AREAIT_TYPE_MINERALCHOP_MINER:
						{
							new extra = GetInteractiveExtraData(id);

							if(!IsPlayerHasJob(playerid, WORK_TYPE_MINER)) return 0;
							else if(GetInvValueItemSelected(playerid) != 166) return CancelPlayerAreaValid(playerid, 0);
							else if(rBit1_Get(StateMineralWorkMiner, extra)) return 0;
							else if(GetPlayerWorkLevel(playerid, WORK_TYPE_MINER) < MinerWork_Info[extra][E_MINERWORK_Info_RequiredLevel]) return 0;
						}
					}
					CheckPlayerAreaValid(playerid, 0, id, 0, "Pulsa ~k~~VEHICLE_ENTER_EXIT~ "); 
				} else { PlayerInfo[playerid][p_PickedUpArea] = INVALID_AREAIT_ID; vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 0); }
			}
			case KEY_AREAIT_TYPE_YES:
			{
				switch(GetInteractiveAreaType(id))
				{
					case AREAIT_TYPE_ORDECOW:
					{
						if(IsItAngleZValid(playerid, id))
						{
							if(PlayerInfo[playerid][p_WorkTravel] != WORK_TYPE_FARMER) return 1;
							if(PlayerInfo[playerid][p_JobTravel] == 0) return 1;

							CheckPlayerAreaValid(playerid, KEY_AREAIT_TYPE_YES, id, TYPE_INAREAY_AREAIT, "Presiona ~k~~CONVERSATION_YES~ ", 1);
						} else { Player.Temp[playerid][@TypeInAreaY] = 0; PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID; vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 1); }

					}
					default:
					{
						CheckPlayerAreaValid(playerid, KEY_AREAIT_TYPE_YES, id, TYPE_INAREAY_AREAIT, "Presiona ~k~~CONVERSATION_YES~ ", 1);
					}
				}
			}
			case KEY_AREAIT_TYPE_COLLECT:
			{
				switch(GetInteractiveAreaType(id))
				{
					default:
					{
						if(IsInteractiveAreaAngleValid(playerid, id))
						{
							if(Player.Temp[playerid][@PlayerInAreaAlt] == INVALID_AREAIT_ID)
							{
								new string[58];
								format(string, sizeof(string), "Presiona ~k~~SNEAK_ABOUT~ ");
								GetInteractiveAreaText(id, string);

								funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, string, 2);
								Player.Temp[playerid][@PlayerInAreaAlt] = id;
							}
						} else { Player.Temp[playerid][@PlayerInAreaAlt] = INVALID_AREAIT_ID; vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 2); }
					}
				}
			}

			case KEY_AREAIT_TYPE_V_YES:
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
				{
					if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] == INVALID_AREAIT_ID)
					{
						funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Presiona ~k~~CONVERSATION_YES~ para interactuar.");
						PlayerInfoTemp[playerid][pt_PlayerInAreaY] = id;
					}
				}
				else
				{
					PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID; /*vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 1);*/
					funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);
				}
			}
		}
	}
	//printf("Excecuted OnGameModeInit, time taken: %d", GetTickCount() - OnGameModeInitCount);
	return 1;
}

// Beta
/*function CheckEnterPickup_Timer(playerid)
{
	new pickupid = PlayerInfo[playerid][p_PickedUpPickup];

	if(pickupid == INVALID_STREAMER_ID) return 1;

	print("XD");

		new data[2];

		Streamer_GetArrayData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_EXTRA_ID, data);
		new id = data[1];
		new Float:x, Float:y, Float:z;
		Streamer_GetFloatData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_X, x);
		Streamer_GetFloatData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_Y, y);
		Streamer_GetFloatData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_Z, z);

		if(PlayerToPoint(1.0, playerid, x,y,z))
		{
			//if(PlayerInfoTemp[playerid][pt_TimersE][15] != 0) return 1;

			if(pickupid == CasaInfo[id][cPickUp][0]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			else if(pickupid == CasaInfo[id][cPickUp][1]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
			else if(pickupid == DoorInfo[id][dPickup][0]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			else if(pickupid == DoorInfo[id][dPickup][1]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
			else if(pickupid == ParkingInfo[id][pgPickUp][0]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			else if(pickupid == ParkingInfo[id][pgPickUp][1]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
		}
		else
		{
			funct_HideTextdrawNotif(playerid, 1);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
			PlayerInfoTemp[playerid][pt_TimersE][15] = 0;
		}
	return 1;
}*/

function CheckEnterArea_Timer(playerid)
{
	if(Iter_Count(areag_NearIndex[playerid]) == 0)
	{
		rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid, false);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][9]);
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if(GetAreaIT_VehicleID(playerid) != INVALID_VEHICLE_ID_EX)
		{
			new vehicleid = GetAreaIT_VehicleID(playerid);

			new Float:x,Float:y,Float:z;
			//x = Vehicles_Info[vehicleid][gi_vehicle_POS_X];
			//y = Vehicles_Info[vehicleid][gi_vehicle_POS_Y];
			//z =Vehicles_Info[vehicleid][gi_vehicle_POS_Z];
			GetVehicleOffset(vehicleid, 0, x,y,z, -0.4);
			
			if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_PLAYER)
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.1, x,y,z) && IsPlayerAngleToPoint(playerid, x,y,z, .range_angle = 50.0))
				{
					if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] != INVALID_AREAIT_ID) return 1;

					funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Pulsa ~k~~CONVERSATION_YES~ para abrir el baul.", 1);
					
					Player.Temp[playerid][@TypeInAreaY] = TYPE_INAREAY_BOOT;
					PlayerInfoTemp[playerid][pt_PlayerInAreaY] = /*/Vehicles_Info[vehicleid][gi_vehicle_AREAID]*/vehicleid;
				}
				else
				{
					Player.Temp[playerid][@TypeInAreaY] = 0;
					PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID;
					vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 1);
				}

				/*x = Vehicles_Info[vehicleid][gi_vehicle_POS_X];
				y = Vehicles_Info[vehicleid][gi_vehicle_POS_Y];
				z = Vehicles_Info[vehicleid][gi_vehicle_POS_Z];
				GetVehicleOffset(vehicleid, 1, x,y,z,-1.0);

				if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] != INVALID_AREAIT_ID) return 1;
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x,y,z) && IsPlayerAngleToPoint(playerid, x,y,z))
				{
					Player.Temp[playerid][@TypeInAreaY] = TYPE_INAREAY_HOOD;
					PlayerInfoTemp[playerid][pt_PlayerInAreaY] = vehicleid;
				}
				else
				{
					Player.Temp[playerid][@TypeInAreaY] = 0;
					PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID;
				}*/

			}
		}
	}
	return 1;
}

function HidePlayerInfoTextdraw_E(playerid)
{
	HidePlayerInfoTextdraw(playerid);
}

function CheckDistanceVehicleJob(playerid, type)
{

	/*if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_WORK)
	{*/
	switch(type)
	{
		case WORK_TYPE_TRUCKER:
		{
			new vehicleid = CamionID[playerid];
			//printf("Vehicle Check timer Active: %d", vehicleid);
			new Float:range_spawn = GetVehicleDistanceFromPoint(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
			if(range_spawn > 4.0)
			{
				CreateNewVehicleInSpaceWork(vehicleid, WORK_TYPE_TRUCKER);

				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
				//printf("Execute Range %d", vehicleid);
			}
			else if(Vehicles_Info[vehicleid][gi_vehicle_VALID] == false)
			{
				CreateNewVehicleInSpaceWork(vehicleid, WORK_TYPE_FARMER);
				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
			}
		}
		case WORK_TYPE_FARMER:
		{
			new vehicleid = CamionID[playerid];
			//printf("Vehicle Check timer Active: %d", vehicleid);
			new Float:range_spawn = GetVehicleDistanceFromPoint(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
			if(range_spawn > 4.0)
			{
				CreateNewVehicleInSpaceWork(vehicleid, WORK_TYPE_FARMER);

				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
				//printf("Execute Range %d", vehicleid);
			}
			else if(Vehicles_Info[vehicleid][gi_vehicle_VALID] == false)
			{
				CreateNewVehicleInSpaceWork(vehicleid, WORK_TYPE_FARMER);
				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
			}
		}
	}
	
	return 1;
}

function CheckDistanceVehicleType(playerid, vehicleid, type)
{
	switch(type)
	{
		case VEHICLE_TYPE_RENT:
		{
			new Float:range_spawn = GetVehicleDistanceFromPoint(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
			if(range_spawn > 4.0)
			{
				CreateNewVehicleInSpaceType(vehicleid, VEHICLE_TYPE_RENT);

				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][1]);
			}
			else if(Vehicles_Info[vehicleid][gi_vehicle_VALID] == false)
			{
				CreateNewVehicleInSpaceType(vehicleid, VEHICLE_TYPE_RENT);
				KillTimer(PlayerInfoTemp[playerid][pt_TimersG][1]);
			}	
		}
	}
}

function DelayExtractCowMilk(playerid)
{
	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][5]);

	if(!IsPlayerInPosAreaIT(playerid, FarmerCowsPosition[ PlayerInfo[playerid][p_JobTravel] ], 1.0)) 
	{
		new Float:x,Float:y,Float:z;
		GetAreaITPos(FarmerCowsPosition[ PlayerInfo[playerid][p_JobTravel] ],x,y,z);

		PlayerInfo[playerid][p_JobMissionExtraID] = CreateDynamicObject(19902, x,y,z+0.4, 0.0, 0.0, 0.0 -1, -1, playerid);
		ShowPlayerInfoTextdraw(playerid, "~w~Ordeña la vaca marcada con una flecha ~y~~h~amarilla");

		PlayerInfo[playerid][p_JobMissionExtra] = 0;
		rBit1_Set(eBit1_PlayerInfo[p_StatePlayerFarmer], playerid, false);

		ShowPlayerInfoTextdraw(playerid, "~r~Estas lejos de la vaca solicitada.", 4000);
		return 1;
	}

	PlayerInfo[playerid][p_JobMissionExtra] = 1;

	new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_FARMER, 34.0, 0);
	funct_CreateTextdrawTextNotif(playerid, i, 0, ConvertEncoding("Pulsa ~k~~PED_SPRINT~ para ordeñar la ~n~vaca."), 0, 0.200, 1.2);
	funct_CreatePlayerBarNotif(playerid, i, 0, 27.0, 20.0);
	UpdateNotificationForPlayer(playerid, i);
	return 1;
}

function DestroyMovingMilkMachine(playerid, objectid)
{
	DestroyDynamicObject(objectid);

	PlayerInfo[playerid][p_JobTravelNext] = 2;
	PlayerInfo[playerid][p_JobMissionExtraValue]++;
	SetPlayerProgressFarmerNext(playerid);
	
	return 1;
}

function CheckJobTruckerTimer(playerid)
{
	new string[70], minutes, seconds;
	PlayerInfo[playerid][p_JobTimeMax]--;
	convertTime_SecondsMinutes(PlayerInfo[playerid][p_JobTimeMax], minutes, seconds);
	if(PlayerInfo[playerid][p_JobTimeMax] > 60)
	{
		format(string, sizeof(string), "Tiempo restante: ~g~%d:%02d min", minutes, seconds);
	}
	else
	{
		format(string, sizeof(string), "Tiempo restante: ~g~%02d seg", seconds);
	}

	funct_UpdateTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM, string);
	if(PlayerInfo[playerid][p_JobTimeMax] == 0)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
		PlayerInfo[playerid][p_JobTimeMax] = 0;
		CancelTruckerLoad(playerid);
		ShowPlayerInfoTextdraw(playerid, "~r~Perdiste la carga porque se acabo el tiempo.", 5000);
	}
}

function CheckJobMissionTimer(playerid)
{
	new string[70], minutes, seconds;
	PlayerInfo[playerid][p_JobTimeMax]--;
	convertTime_SecondsMinutes(PlayerInfo[playerid][p_JobTimeMax], minutes, seconds);
	if(PlayerInfo[playerid][p_JobTimeMax] > 60) 
	{
		format(string, sizeof(string), "Tiempo restante: ~g~%d:%02d min", minutes, seconds);
	}
	else
	{
		format(string, sizeof(string), "Tiempo restante: ~g~%02d seg", seconds);
	}
	funct_UpdateTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM, string);
	if(PlayerInfo[playerid][p_JobTimeMax] == 0)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
		PlayerInfo[playerid][p_JobTimeMax] = 0;
		CancelMissionJobLoad(playerid);
		ShowPlayerInfoTextdraw(playerid, "~r~Perdiste la carga porque se acabo el tiempo.", 5000);
	}
}

function TransitionDeathForPlayer(playerid)
{
	rBit1_Set(b1_PlayerTemp[b1pt_InInmune], playerid, false);

	SetHealth(playerid, 100.0);
	SetInterior(playerid, PlayerInfo[playerid][pInterior]);
	SetVW(playerid, PlayerInfo[playerid][pVirtualWorld]);

	PlayerInfo[playerid][p_State_Game] = GAME_STATE_CRACK;
	return 1;
}

function TimerSpeedometer(playerid, vehicleid){
	if(!GetPlayerVehicleID(playerid) /*|| Player.Info[playerid][@ConfigVelocimOff]*/)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][11]);
		//OcultarVelocimetro(playerid);
		return 0;
	}

	if(GetPlayerVehicleID(playerid) != vehicleid)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][11]);
		PlayerInfoTemp[playerid][pt_TimersE][11] = SetTimerEx("TimerSpeedometer", 250, true, "ii", playerid, GetPlayerVehicleID(playerid));
		return 0;
	}

	new Float:fCurrentSpeed = GetVehicleSpeed(vehicleid);
	if(!IsABike(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){

		switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
		{
			case VEHICLE_TYPE_WORK:
			{
				VehicleWorkSecure(vehicleid);
			}
		}

		new szSpeed[19];
		format(szSpeed, sizeof(szSpeed),"%d/%d",Vehicles_Info[vehicleid][gi_vehicle_GAS], GetMaxGasolineVehicle(vehicleid));

		PlayerTextDrawSetString(playerid, VeloText[playerid][1], szSpeed);
		format(szSpeed, sizeof(szSpeed),"%.0f", fCurrentSpeed);

		PlayerTextDrawSetString(playerid, VeloText[playerid][0], szSpeed);
		SetPlayerProgressBarValue(playerid, Velocidad[playerid], fCurrentSpeed);
		ShowPlayerProgressBar(playerid, Velocidad[playerid]);

		//GetVehicleHealth(vehicleid,fExpHealth);

		if(Vehicles_Info[vehicleid][gi_vehicle_HEALTH] < 350.0 && !IsABike(vehicleid)){
			SetVehicleHealth(vehicleid, 350.0);
			Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
			UpdateVehicleParams(vehicleid);
			GameTextForPlayer(playerid, "~r~MOTOR AVERIADO", 2000, 3);
		}
	}
	return 1;
}

function CheckPlayerSprayGrafiti(playerid)
{
	if(disputed_grafiti_actived == -1) return 1;
	else if(!IsPlayerInDynamicCP(playerid, PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][3])) return 1;
	else if(GetInvValueItemSelected(playerid) != 33) return 1;
	else if(GetPlayerAnimationIndex(playerid) == 640 || GetPlayerAnimationIndex(playerid) == 1167)
	{
		
    	if(!rBit1_Get(eBit1_PlayerInfo[pt_ShootAnimWeapon], playerid)) return 1;

		if(FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] == -1)
		{
			if(Grafiti_CrewsSpray[0] == 0)
			{
				new i = 0;
				FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] = i;

				Grafiti_CrewsSpray[i] = PlayerInfo[playerid][p_FactionMember];
				Grafiti_CrewsSprayIndex[i] = Player.Faction[playerid][@Index];

				Grafiti_CrewsObject[i] = CreateDynamicObject(19482, Grafiti.Info[disputed_grafiti_actived][@X],Grafiti.Info[disputed_grafiti_actived][@Y], Grafiti.Info[disputed_grafiti_actived][@Z], 0.0, 0.0, Grafiti.Info[disputed_grafiti_actived][@RZ] ); //Creating the object
        		SetDynamicObjectMaterialText(Grafiti_CrewsObject[i], 0, FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], 110, "Comic Sans MS", 50, 0, RGBAToARGB(DataE.CrewColor[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] ][@Color]), 0, 1);

				Grafiti_CrewsProgress[i] = randomEx(0,4);

				foreach(new player : Player)
				{
					if(PlayerInfo[player][p_FactionMember] == 0) continue;
	
					funct_HideTextdrawNotif(player, VNOTI_TYPE_DISPUTEGRAFITI);
	
					new box = funct_CreateTextdrawBoxNotif(player, VNOTI_TYPE_DISPUTEGRAFITI, true, 22.0);
					funct_CreateTextdrawTextNotifEx(player, box, 0, "hud:radar_spray", 4);

					new title[50];
					format(title, sizeof(title), "Grafiti en %s", Grafiti_CrewsZoneName);
					funct_CreateTextdrawTextNotifEx(player, box, 1, title, 1, 14.0);
					new lines = GetTextDrawLineCount(title);

					new string[52];
					format(string, sizeof(string), "%s %d%", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], Grafiti_CrewsProgress[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ]);
					funct_CreateTextdrawTextNotifEx(player, box, 2, string, 1, 0.0, 20.0, 0.220, 1.1, .color = DataE.CrewColor[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] ][@Color]);

					vNoti_SetPlayerBoxSize(player, box, (lines*VNOTI_LETTERSIZE_T_1)+(i*VNOTI_LETTERSIZE_T_2));
					UpdateNotificationForPlayer(player, box);
				}
			}
			else
			{
				for(new i = 1; i < MAX_FACT_DISPUTE_GRAFFITI; i++)
				{
					if(Grafiti_CrewsSpray[i] != 0) continue;
				
					FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] = i;

					Grafiti_CrewsSpray[i] = PlayerInfo[playerid][p_FactionMember];
					Grafiti_CrewsSprayIndex[i] = Player.Faction[playerid][@Index];

					Grafiti_CrewsObject[i] = CreateDynamicObject(19482, Grafiti.Info[disputed_grafiti_actived][@X],Grafiti.Info[disputed_grafiti_actived][@Y], Grafiti.Info[disputed_grafiti_actived][@Z], 0.0, 0.0, Grafiti.Info[disputed_grafiti_actived][@RZ] ); //Creating the object
        			SetDynamicObjectMaterialText(Grafiti_CrewsObject[i], 0, FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], 110, "Comic Sans MS", 50, 0, RGBAToARGB(DataE.CrewColor[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] ][@Color]), 0, 1);

					Grafiti_CrewsProgress[i] = randomEx(1,4);

					foreach(new player : Player)
					{
					//	if(!IsPlayerLogged(player)) return printf("XD SI");
						if(PlayerInfo[player][p_FactionMember] == 0) continue;

						new box = funct_CreateTextdrawBoxNotif(player, VNOTI_TYPE_DISPUTEGRAFITI, true, 29.0);
						new string[52];
						format(string, sizeof(string), "%s %d%", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], Grafiti_CrewsProgress[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ]);
						funct_CreateTextdrawTextNotifEx(player, box, i+2, string, 1, 0.0, 20.0+(i*12.0), 0.220, 1.1, .color = DataE.CrewColor[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] ][@Color]);
						

						vNoti_SetPlayerBoxSize(player, box, 2.0+(i*VNOTI_LETTERSIZE_T_2));
						UpdateNotificationForPlayer(player, box);
					}
					break;
				}
			}
			
		}

		else if(Grafiti_CrewsSpray[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ] == PlayerInfo[playerid][p_FactionMember])
		{
			Grafiti_CrewsProgress[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ] += 4;

			if(Grafiti_CrewsProgress[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ] > 99)
			{
				foreach(new player : Player)
				{
					if(PlayerInfo[player][p_FactionMember] == 0) continue;

					funct_HideTextdrawNotif(player, VNOTI_TYPE_DISPUTEGRAFITI);

					new box = funct_CreateTextdrawBoxNotif(player, VNOTI_TYPE_DISPUTEGRAFITI2, true, 4.0);
					funct_CreateTextdrawTextNotifEx(player, box, 0, "hud:radar_race", 4);

					new string[100];
					format(string, sizeof(string), "~w~%s ha ganado el graffiti en %s. Se volvera a disputar en 1 día.", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], Grafiti_CrewsZoneName);
					SplitTextDrawString(string, 94.0, 0.240, 1);
					funct_CreateTextdrawTextNotifEx(player, box, 1, string, 1, 14.0);
					new lines = GetTextDrawLineCount(string);
					vNoti_SetPlayerBoxSize(player, box, (lines*VNOTI_LETTERSIZE_T_1));
					vNoti_SetTimeHideBox(player, box, 14);
					UpdateNotificationForPlayer(player, box);

					PlayerPlaySoundEx(player,1058,0.0,0.0,0.0);

					if(IsPlayerInDynamicCP(player, PlayerInfoTemp[player][pt_PLAYER_CHECKPOINT][3])) 
					{
						DestroyDynamicCP(PlayerInfoTemp[player][pt_PLAYER_CHECKPOINT][3]);
						KillTimer(PlayerInfoTemp[player][pt_TimersE][12]);
					}
				}
				CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONADDPOINTS, "~w~Se sumaron ~y~+14 puntos ~w~a ~n~tu banda.", 15, false);
				
				SetDynamicObjectMaterialText(Grafiti.Info[disputed_grafiti_actived][@ObjectID], 0, FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], 110, "Comic Sans MS", 50, 0, RGBAToARGB(DataE.CrewColor[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Color] ][@Color]), 0, 1);
				WinDisputeFactionGrafiti(Player.Faction[playerid][@Index]);

				
				
				return 1;
			}

			foreach(new player : Player)
			{
				if(PlayerInfo[player][p_FactionMember] == 0) continue;

				new string[52];
				format(string, sizeof(string), "%s %d%", FactionCrew.Info[ Player.Faction[playerid][@Index] ][@Name], Grafiti_CrewsProgress[ FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot] ]);
				funct_UpdateTextDrawNotif(player, VNOTI_TYPE_DISPUTEGRAFITI, string, (FactionCrew.Info[ Player.Faction[playerid][@Index] ][@GrafSlot]+2));
			}
		}
	}

	return 1;
}

function TimerPlayerChopMineral(playerid)
{
	new id = PlayerInfo[playerid][p_JobTravel];

	if(PlayerInfo[playerid][p_JobMissionExtra] == 100)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][13]);
		TogglePlayerControllableEx(playerid, true);
		HidePlayerInfoTextdraw(playerid);

		rBit1_Set(StateMineralWorkMiner, id, false);

		PlayerInfo[playerid][p_WorkTravel] = 0;
		PlayerInfo[playerid][p_JobTravel] = 0;
		PlayerInfo[playerid][p_JobMissionExtra] = 0;

		if(AddItemInvPlayer(playerid, MinerWork_Info[id][E_MINERWORK_Info_MineralID], 0, true) == -1) return 1;
		
		new id_level = /*(MinerWork_Info[id][E_MINERWORK_Info_RequiredLevel]-1)*/GetFloorMinerForLevel(id);

		if(Miner_TimeGenNewMineral[id_level] < gettime())
		{
			MinerGenerateRockMinerals(id_level, 18);
		}
		count_miner_rocks_generated[id_level]--;
		
		rBit1_Set(Minerals_PosMinerLevelActive[id_level], MinerWork_Info[id][E_MINERWORK_Info_PosMineral], false);
		rBit1_Set(MineralWorkMinerValid, id, false);

		MinerWork_Info[id][E_MINERWORK_Info_MineralID] = 0;
		MinerWork_Info[id][E_MINERWORK_Info_RequiredLevel] = 0;

		DestroyDynamicObject(MinerWork_Info[id][E_MINERWORK_Info_ObjectID]);
		DestroyInteractiveArea(MinerWork_Info[id][E_MINERWORK_Info_AreaIT]);
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);
		ShowPlayerInfoTextdraw(playerid, "~w~Tira la roca en la ~b~~h~procesadora ~w~para recibir el pago.", 4000);
		return 1;
	}
	else if(PlayerInfo[playerid][p_JobMissionExtra] < 88)
	{
		PlayerInfo[playerid][p_JobMissionExtra] += 4;
	}
	else if(PlayerInfo[playerid][p_JobMissionExtra] > 87)
	{
		PlayerInfo[playerid][p_JobMissionExtra] = 100;
	}

	new rand_sound = random(1);
	if(rand_sound == 0) { PlayerPlaySound(playerid,1135,0.0,0.0,0.0); }

	new str[64];
	format(str, sizeof(str), "~b~~h~Picando %s...~n~~w~%d%", InvObjectData[MinerWork_Info[id][E_MINERWORK_Info_MineralID]][E_INV_NAME], PlayerInfo[playerid][p_JobMissionExtra]);
	ShowPlayerInfoTextdraw(playerid, str);

	return 1;
}

// Timers normales

function CheckThiefHouseTimer(doorid)
{
	new string[70], minutes, seconds;
	WorkActivity.Thief[doorid][@TimeOpen]--;
	convertTime_SecondsMinutes(WorkActivity.Thief[doorid][@TimeOpen], minutes, seconds);
	if(WorkActivity.Thief[doorid][@TimeOpen] > 60)
	{
		format(string, sizeof(string), "La puerta cerrara en: ~g~%d:%02d min", minutes, seconds);
	}
	else
	{
		format(string, sizeof(string), "La puerta cerrara en: ~g~%02d seg", seconds);
	}

	if(WorkActivity.Thief[doorid][@TimeOpen] < 1)
	{
		CloseDoorThief(doorid);
		KillTimer(WorkActivity.Thief[doorid][@Timer]);
		WorkActivity.Thief[doorid][@AreaIT] = CreateInteractiveArea(WorkActivity.Thief[doorid][@X], WorkActivity.Thief[doorid][@Y], WorkActivity.Thief[doorid][@Z], "para forzar.", -1, -1, 1.0, AREAIT_TYPE_BUY_THIEVESHOUSE, KEY_AREAIT_TYPE_YES, true, "{00C0FF}Casa Glen Park\n{FFFFFF}su dueño no esta en casa.", COLOR_TXT3DT, 5.0, false);

		foreach(new player : Player)
		{
			if(PlayerToPoint(10.0, player, WorkActivity.Thief[doorid][@X], WorkActivity.Thief[doorid][@Y], WorkActivity.Thief[doorid][@Z]))
			{
				funct_HideTextdrawNotif(player, VNOTI_TYPE_TIMECLOSETHIEVES);
			}
		}
	}
	else
	{
		foreach(new player : Player)
		{
			if(PlayerToPoint(10.0, player, WorkActivity.Thief[doorid][@X], WorkActivity.Thief[doorid][@Y], WorkActivity.Thief[doorid][@Z]))
			{
				funct_UpdateTextDrawNotif(player, VNOTI_TYPE_TIMECLOSETHIEVES, string);
			}
			else
			{
				funct_HideTextdrawNotif(player, VNOTI_TYPE_TIMECLOSETHIEVES);
			}
		}
	}
}

function PlayerDelayReloadWeapon(playerid, i)
{
	new itemselected = GetInvValueItemSelected(playerid);

	new ammo = DataE.WeaponsData[ InvObjectData[itemselected][E_INV_EXTRADATA] ][@Ammo];
	new count = ammo - PlayerInfo[playerid][pWAmmo];

	if(PlayerInventory[playerid][i][invAmount] <= count)
	{
		count = PlayerInventory[playerid][i][invAmount];

		PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] += count;
		PlayerInfo[playerid][pWAmmo] += count;

		RemoveItemInvPlayer(playerid, i, false, false);
	}
	else
	{
		PlayerInventory[playerid][i][invAmount] -= count;
		PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] += count;
		PlayerInfo[playerid][pWAmmo] += count;
	}

	new string[50];
	format(string, sizeof(string), ConvertEncoding("~n~~n~~n~~n~~n~~n~~n~~n~~w~Munición ~g~~h~+%d"), count);
	GameTextForPlayer(playerid, string, 4000, 3);

	GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapon], PlayerInfo[playerid][pWAmmo]);

	Player.Temp[playerid][@FreezeInventory] = 0;
	rBit1_Set(eBit1_PlayerInfo[pt_WEAPON_RELOAD], playerid, false);
}

// Player Healing

function Timer_PlayerFinishApplyBandage(playerid)
{
	

	if(Player.Temp[playerid][@HealingProgress] == 100)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][14]);
		HidePlayerInfoTextdraw(playerid);

		new Float:health = PlayerInfo[playerid][pHealth];
		if(PlayerInfo[playerid][pHealth] > 90)
		{
			SetPlayerHealthEx(playerid, 100);
		}
		else
		{
			health += 10;
			SetPlayerHealthEx(playerid, health);
		}

		PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount]--;

		if(PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] < 1)
		{
			RemoveItemInvPlayer(playerid, GetInvItemSelected(playerid), false, false);
		}

		ApplyAnimation(playerid, "COP_AMBIENT", "COPLOOK_OUT", 4.1, false, false, false, false, 0, false);

		return 1;
	}

	else if(Player.Temp[playerid][@HealingProgress] < 92)
	{
		Player.Temp[playerid][@HealingProgress] += 18;
	}
	else
	{
		Player.Temp[playerid][@HealingProgress] = 100;
	}

	new string[40];
	format(string, sizeof(string), "Vendando ~r~%d%", Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(playerid,string);
	return 1;
}

function Timer_PlayerFinishApplyKit(playerid)
{
	new extraid = Player.Temp[playerid][@PlayerHealing];

	if(Player.Temp[playerid][@HealingProgress] == 100)
	{

		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][14]);
		HidePlayerInfoTextdraw(playerid);
		HidePlayerInfoTextdraw(extraid);

		
		SetPlayerHealthEx(extraid, 40);
		PlayerInfo[extraid][p_State_Game] = GAME_STATE_NORMAL;
		
		Player.Temp[playerid][@HealingProgress] = 0;
		Player.Temp[playerid][@PlayerHealing] = INVALID_PLAYER_ID;
		Player.Temp[extraid][@PlayerHealing] = INVALID_PLAYER_ID;

		ApplyAnimation(playerid, "COP_AMBIENT", "COPLOOK_OUT", 4.1, false, false, false, false, 0, false);
		ClearAnimations(extraid);
		return 1;
	}

	else if(Player.Temp[playerid][@HealingProgress] < 92)
	{
		Player.Temp[playerid][@HealingProgress] += 8;
	}
	else
	{
		Player.Temp[playerid][@HealingProgress] = 100;
	}


	new string[70];
	format(string, sizeof(string), "Curando a %s...~n~~r~%d%", PlayerInfo[extraid][p_Name], Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(playerid,string);
	format(string, sizeof(string), "%s te esta curando...~n~~r~%d%", PlayerInfo[playerid][p_Name], Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(extraid,string);
	return 1;
}

function PlayerTimerLoadingInterior(playerid, Float:X, Float:Y, Float:Z, Float:A, int, vw)
{
	SetPlayerAngleEx(playerid, A);

	if(int != -1) { SetInterior(playerid, int); }
	if(vw != -1) { SetVW(playerid, vw); }

	new Float:newx, Float:newy;
	GetPointInFrontPos(playerid, X, Y, A, newx, newy, 1.5);

	PlayerInfo[playerid][p_POS_X] = newx;
	PlayerInfo[playerid][p_POS_Y] = newy;
	PlayerInfo[playerid][p_POS_Z] = Z;
	SetPlayerPos(playerid, newx, newy, Z);

	ClearAnimations(playerid);

	DeletePVar(playerid, "LoadingObjects");
}

function DoorRobberyTimerFinish(doorid)
{

	//KillTimer(Actor.RobberyStore[actorid][@RobberID]);
	//Actor.RobberyStore[actorid][@RobberID] = 0;
	
	for(new i = 0; i < MAX_ROBBERY_ACTORS; i ++)
	{
		if(!Actor.RobberyStore[i][@Created]) continue;
		if(Actor.RobberyStore[i][@DoorID] == doorid)
		{
			if(Actor.RobberyStore[i][@RobberID]) continue;
			DestroyDynamic3DTextLabel(Actor.RobberyStore[i][@Label]);
			ClearActorAnimations(Actor.RobberyStore[i][@Actor]);
			ApplyDefaultAnimationActor(Actor.RobberyStore[i][@Actor], Actor.RobberyStore[i][@Anim]);
		}	
	}
	
	//Actor.RobberyStore[actorid][@LastRobbed] = gettime() + 50;

	//Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_NONE;
	//Player.Temp[playerid][@CriminalActID] = 0;
	//Player.Temp[playerid][@CriminalActValue] = 0;

	//DoorInfo[ doorid ][dTimeRobbery] = gettime() + 50;
	
}

function Timer_PlayerApplyRepairVehicle(playerid, vehicleid)
{

	if(Player.Temp[playerid][@VehicleActionPr] == 100)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
		TogglePlayerControllable(playerid, 1);
		Vehicles_Info[vehicleid][gi_vehicle_BONNET] = 0;
    	UpdateVehicleParams(vehicleid);
    	ClearAnimations(playerid);
    	HidePlayerInfoTextdraw(playerid);
    	Player.Temp[playerid][@VehicleActionPr] = 0;
		if(GetInvValueItemSelected(playerid) == 197 && Vehicles_Info[vehicleid][gi_vehicle_VALID])
		{
			SetVehicleHealthEx(vehicleid, 1000.0);
			RemoveItemInvPlayer(playerid, GetInvItemSelected(playerid));
		}
		else
		{
			SelectedPlayerItemInventory(playerid, GetInvItemSelected(playerid));
		}
		return 1;
	}

	else if(Player.Temp[playerid][@VehicleActionPr] < 92)
	{
		Player.Temp[playerid][@VehicleActionPr] += 8;

		new animrand = random(2);
		if(animrand) ApplyAnimation(playerid, "BAR", "BARCUSTOM_GET", 4.1, false, false, false, false, 0, false);
		else ApplyAnimation(playerid, "BAR", "BARSERVE_BOTTLE", 4.1, false, false, false, false, 0, false);
	}
	else
	{
		Player.Temp[playerid][@VehicleActionPr] = 100;
	}

	new string[40];
	format(string, sizeof(string), "Reparando vehículo...~n~~r~%d%", Player.Temp[playerid][@VehicleActionPr]);
	ShowPlayerInfoTextdraw(playerid,string);
	return 1;
}

function Timer_ApplyPetrolcanVehicle(playerid, vehicleid)
{
	new maxgasoline = Vehicles_Data_Info[ Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400 ][vehicle_data_MAX_GAS];
	new amount = GetInvAmountItemSelected(playerid), bool:stop;

	if(Vehicles_Info[vehicleid][gi_vehicle_GAS] < maxgasoline)
	{
		Player.Temp[playerid][@VehicleActionPr] += 40;

		amount--;
		SetPlayerInvItemAmount(playerid, GetInvItemSelected(playerid), amount);

		Vehicles_Info[vehicleid][gi_vehicle_GAS]++;

		if(amount <= 0) { RemoveItemInvPlayer(playerid, GetInvItemSelected(playerid)); stop = true; }
	}
	else
	{
		Player.Temp[playerid][@VehicleActionPr] = maxgasoline;
	
		amount--;
		SetPlayerInvItemAmount(playerid, GetInvItemSelected(playerid), amount);

		Vehicles_Info[vehicleid][gi_vehicle_GAS] = maxgasoline;

		stop = true;
	}

	if(stop)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
		ShowPlayerInfoTextdraw(playerid,"~y~Terminado.", 2000);
		Player.Temp[playerid][@VehicleActionPr] = 0;
		TogglePlayerControllableEx(playerid, true);
		ClearAnimations(playerid);
		return 1;
	}

	new string[40];
	format(string, sizeof(string), "Cargando bidón...~n~~y~%d/%d", Vehicles_Info[vehicleid][gi_vehicle_GAS], Vehicles_Data_Info[ Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400 ][vehicle_data_MAX_GAS]);
	ShowPlayerInfoTextdraw(playerid,string);
	return 1;
}

function Timer_PlayerNewUpdate(playerid, next)
{
	switch(next)
	{
		case 0:
		{
			Streamer_ToggleCameraUpdate(playerid, 1);
			SetPlayerCameraPos(playerid, 1674.079711, -1503.913085, 27.347503);
			SetPlayerCameraLookAt(playerid, 1669.833862, -1502.451293, 25.148372);

			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_INFONEWUPDATE, "¿Vehículo bajo el piso?, Seguros Los Santos recupera tu vehículo en cualquier parte.");

			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("Timer_PlayerNewUpdate", 10000, false, "id", playerid, 1);
		}
		case 1:
		{
			SetPlayerCameraPos(playerid, 1641.692138, -1537.091796, 20.551237);
			SetPlayerCameraLookAt(playerid, 1641.484130, -1532.339599, 19.010629);

			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_INFONEWUPDATE);
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_INFONEWUPDATE, "iNuevo estacionamiento!, mantiene tu vehículo a salvo de cualquier amenaza externa.");

			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("Timer_PlayerNewUpdate", 10000, false, "id", playerid, 2);
		}
		case 2:
		{
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, 174);
			SetPlayerCameraPos(playerid, -208.327743, 35.404064, 1107.696899);
			SetPlayerCameraLookAt(playerid, -203.534530, 35.111690, 1106.304199);
			
			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("Timer_PlayerNewUpdate", 10000, false, "id", playerid, 3);

			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_INFONEWUPDATE);
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_INFONEWUPDATE, "Esperamos que disfrutes de la nueva actualización 4.1.0, puedes obtener más detalles en nuestro discord.");
		}
		case 3:
		{
			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			Streamer_ToggleCameraUpdate(playerid, 0);
			
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_INFONEWUPDATE);
			
			PlayerInfo[playerid][p_SyncUpdate] = SERVER_BUILD;
			mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `syncupdate`= %d WHERE `id`=%d;", PlayerInfo[playerid][p_SyncUpdate], PlayerInfo[playerid][pID]));
			//mysql_tquery_s(conexion, str_format("INSERT INTO `lac_player_betatester` (`id_user`) VALUES (%d);", PlayerInfo[playerid][pID]));

			PlayerFirstDataLoadedContinue(playerid);
		}
	}
	return 1;
}