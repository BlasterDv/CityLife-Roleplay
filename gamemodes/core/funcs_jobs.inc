stock GetPositionNearMecaWorkshop(playerid)
{
	new Float:TallerLS, Float:TallerSF, Float:TallerLV;
	TallerLS = GetPlayerDistanceFromPoint(playerid, 1562.1530,-2176.0923,13.5587);
	TallerLV = GetPlayerDistanceFromPoint(playerid, 1900.0842,2135.8931,10.820);
	TallerSF = GetPlayerDistanceFromPoint(playerid, -1839.7137,159.1623,15.1172);
	if(TallerLS < TallerSF && TallerLS < TallerLV) { return 1; } // LS
	else if(TallerSF < TallerLS && TallerSF < TallerLV) { return 2; } // SF
	else if(TallerLV < TallerLS && TallerLV < TallerSF) { return 3; } // LV
	return 0;
}

IsPlayerPositionInMecaWorkshop(playerid)
{
	if(PlayerToPoint(7.0, playerid, 1552.4414,-2176.7883,13.5587)) return 1;
	else if(PlayerToPoint(7.0, playerid, -1832.6570,151.6756,15.1172)) return 1;
	else if(PlayerToPoint(7.0, playerid, 1907.9426,2127.6099,10.8203)) return 1;
	return 0;
}

/*SetAssignTravelCarrier(playerid, type)
{
	switch(type)
	{
		case 0:
		{
			new string[128], recostr[40], recostr2[40], recostr3[40];
			new reco, reco2, reco3, random_reco;
			new objects;
			switch(PlayerInfo[playerid][pNivelTransportista])
			{
				case 1: { reco = random(2); }
				case 2: { reco = random(4); }
				case 3: { reco = random(6);  }
				case 4: { reco = random(8); }
				case 5: { reco = random(10); }
				case 6: { reco = random(12); }
				case 7: { reco = random(14); }
			}
			switch(reco)
			{
				case 0: { format(recostr, sizeof(recostr), "Fabrica de Sprunk de Montgomery"); }
				case 1: { format(recostr, sizeof(recostr), "Obra de construcción Glen Park"); }
				case 2: { format(recostr, sizeof(recostr), "Ferroviario Willowfield"); }
				case 3: { format(recostr, sizeof(recostr), "Rockshore East"); }
				case 4: { format(recostr, sizeof(recostr), "Bodega en Downtown"); }
				case 5: { format(recostr, sizeof(recostr), "Cantera de Hunter Quarry"); }
				case 6: { format(recostr, sizeof(recostr), "Bone County"); }
				case 7: { format(recostr, sizeof(recostr), "Bone County"); }
				case 8: { format(recostr, sizeof(recostr), "Aserradero en The Panopticon"); }
				case 9: { format(recostr, sizeof(recostr), "Whitewood Estates - Casino"); }
				case 10: { format(recostr, sizeof(recostr), ""); }
				case 11: { format(recostr, sizeof(recostr), ""); }
				case 12: { format(recostr, sizeof(recostr), ""); }
				case 13: { format(recostr, sizeof(recostr), ""); }
			}
			SetPlayerCarrierCheckpoint(playerid, reco);
		}
	}
}*/

SetPlayerCarrierCheckpoint(playerid)
{
	new reco = PlayerInfo[playerid][p_JobTravel];
	new next = PlayerInfo[playerid][p_JobTravelNext];
	new time, bool:recoend;
	switch(reco)
	{
		case 1: 
		{ 
			if(next == 1) { time = 250; SetPlayerDynCP(playerid, 0, 1334.1903,287.9654,19.5615, 5.0, CHECKPOINT_TYPE_LOAD_JOBCARRIER, true); }
			else if(next == 2) { time = 250; SetPlayerDynCP(playerid, 0, 164.5418,-150.2570,1.5781, 5.0, CHECKPOINT_TYPE_UNLOAD_CARRIER, true); }
			else if(next == 3) { time = 250; SetPlayerDynCP(playerid, 0, 1302.6042,-1866.5769,13.5469, 5.0, CHECKPOINT_TYPE_UNLOAD_CARRIER, true); }
			else if(next == 4) { recoend = true;  }
		}
		case 2: { 
			if(next == 1) { time = 250; SetPlayerDynCP(playerid, 0, 337.0713,893.4661,20.4064, 5.0, CHECKPOINT_TYPE_LOAD_JOBCARRIER, true); }
			else if(next == 2) { time = 250; SetPlayerDynCP(playerid, 0, 2707.5999, 909.7000, 10.7178, 5.0, CHECKPOINT_TYPE_UNLOAD_CARRIER, true); }
			else if(next == 3) { recoend = true; }
		}
		case 3: {
			if(next == 1) { time = 270; SetPlayerDynCP(playerid, 0, 1757.0587,2078.4514,10.8203, 5.0, CHECKPOINT_TYPE_LOAD_JOBCARRIER, true); }
			else if(next == 2) { time = 270; SetPlayerDynCP(playerid, 0, 2077.3816,-2006.5903,13.5469, 5.0, CHECKPOINT_TYPE_UNLOAD_CARRIER, true); }
			else if(next == 3) { recoend = true; }
		}
	}
	if(recoend == true)
	{
		time = 420; SetPlayerDynCP(playerid, 0, 2164.1108,-2296.3359,13.5361, 7.0, CHECKPOINT_TYPE_FINISH_JOBTRUCK, true);
	}
	if(time != 0)
	{
		funct_AddTextDrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
		PlayerInfoTemp[playerid][pt_TimersE][7] = SetTimerEx("CheckJobTruckerTimer", 1000, true, "i", playerid);
		if(PlayerInfo[playerid][p_JobTimeMax] == 0) { PlayerInfo[playerid][p_JobTimeMax] = time; }
	}
	/*PlayerInfo[playerid][p_JobTravel] = reco;
	PlayerInfo[playerid][p_JobTravelNext] = 1;*/
}

/*InPointOfDeliveryCarrier(playerid, Float:Range)
{
	new travel = PlayerInfo[playerid][p_JobTravel];
	new next = PlayerInfo[playerid][p_JobTravelNext];
	if(travel == 1 && next == 1 && PlayerToPoint(Range, playerid, -79.5351,90.7314,3.1172)) { return 1; }
	else if(travel == 1 && next == 2 && PlayerToPoint(Range, playerid, -366.3077,-1412.9005,25.7266)) { return 1; }
	else if(travel == 2 && next == 1 && PlayerToPoint(Range, playerid, 1992.5087,956.1931,10.8203)) { return 1; }
	else if(travel == 2 && next == 2 && PlayerToPoint(Range, playerid, 2094.0779,1445.6447,10.8203)) { return 1; }

	return 0;
}*/

SetPlayerWorkID(playerid, jobid)
{
	if(PlayerInfo[playerid][p_WorkTravel] != 0) return ShowPlayerInfoTextdraw(playerid, "~r~Termina tu trabajo actual.", 2000);
	if(PlayerInfo[playerid][pJob] != 0 && PlayerInfo[playerid][pJob] != jobid)
	{
		new string[44], objects;
		PlayerObjects[playerid][objects] = PlayerInfo[playerid][pJob]; objects++;
		format(string, sizeof(string), "{00C0FF}Trabajo 1: {FFFFFF}%s", GetPlayerJobName(PlayerInfo[playerid][pJob]));
		ShowPlayerDialog(playerid, DIALOG_LEAVEWORK, DIALOG_STYLE_LIST, "Dejar trabajo", string, "Dejar", "Cancelar");
		return 0;
	}
	/*if(PlayerInfo[playerid][pVip] >= 2)
	{
		if(PlayerInfo[playerid][pJob2] != 0 && PlayerInfo[playerid][pJob] != 0)
		{
			new string[88], objects;
			PlayerObjects[playerid][objects] = PlayerInfo[playerid][pJob]; objects++;
			PlayerObjects[playerid][objects] = PlayerInfo[playerid][pJob2]; objects++;
			format(string, sizeof(string), "{00C0FF}Trabajo 1: {FFFFFF}%s\n{00C0FF}Trabajo 2: {FFFFFF}%s", GetPlayerJobName(PlayerInfo[playerid][pJob]), GetPlayerJobName(PlayerInfo[playerid][pJob2]));
			ShowPlayerDialog(playerid, DIALOG_LEAVEWORK, DIALOG_STYLE_LIST, "Dejar trabajo", string, "Dejar", "Cancelar");
		
			return 0;
		}
	}*/
	switch(jobid)
	{
		case 1: 
		{
			if(PlayerInfo[playerid][p_LEVEL] < 4) return SendClientMessage(playerid, -1, "Necesitas tener nivel 4 mínimo para conseguir este trabajo.");
			new string[288];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid, 1);
			strcat(string, "{FFFFFF}El trabajo de medico consiste en reanimar y curar a otras personas.\n");
			strcat(string, "Al reanimar un paciente se puede subir a la ambulancia dejando presionada la..\n");
			strcat(string, "..tecla {00C0FF}'2' > Subir paciente{FFFFFF}.\n");
			strcat(string, "Los clientes se puede ver en el Mapa o GPS.\n\n");
			if(IsPlayerHasJob(playerid, 1))
			{
				strcat(string, "{7DCEA0}Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Medico", string, "Aceptar", "");
			}
			else
			{
				strcat(string, "{DE5454}No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Medico", string, "Aceptar", "Cancelar");
			}
		}
		case 2:
		{
			new string[300];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid, 2);
			strcat(string, "{FFFFFF}El trabajo de camionero consiste en realizar diferentes recorridos por San Andreas.\n");
			strcat(string, "La paga inicial es de {00E500}$1000{FFFFFF} e ira incrementando conforme subas de nivel.\nEste trabajo también cuenta con ganancias extras.\n\n");
			if(PlayerInfo[playerid][pJob] == 0)
			{
				strcat(string, "No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "{00C0FF}Empresa de transportes RS Haul", string, "Aceptar", "Cancelar");
			}
			else if(PlayerInfo[playerid][pJob] == jobid)
			{
				strcat(string, "Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "{00C0FF}Empresa de transportes RS Haul", string, "Aceptar", "");
			}	
		}
		case 4:
		{
			new string[250];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,4);
			strcat(string, "{FFFFFF}El trabajo de granjero consiste el recoger cargas.\n");
			strcat(string, "Es un trabajo variado, al nivel 1, 2 y 3 se ordeñan vacas,\n");
			strcat(string, "al nivel 4 y 5 se transportan animales de un lugar a otro con ayuda de un compañero.\n\n");
			if(!IsPlayerHasJob(playerid, WORK_TYPE_FARMER))
			{
				strcat(string, "No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Granjero", string, "Aceptar", "Cancelar");
			}
			else if(PlayerInfo[playerid][pJob] == jobid /*|| PlayerInfo[playerid][pJob2] == jobid && PlayerInfo[playerid][pVip] >= 2*/)
			{
				strcat(string, "Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Granjero", string, "Aceptar", "");
			}	
		}
		case 5:
		{
			new string[240];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,5);
			strcat(string, "{FFFFFF}En este trabajo deberás picar las diferentes rocas en la mina.\n");
			strcat(string, "Dependiendo de la rareza de la roca te pagaran más o menos.\n");
			strcat(string, "Deberás comprar el equipo necesario para minar en el puesto fuera de aquí.\n\n");
			if(IsPlayerHasJob(playerid, WORK_TYPE_MINER))
			{
				strcat(string, "Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "{00C0FF}Trabajo en Minería Hunter Quarry", string, "Aceptar", "");
			}
			else
			{
				strcat(string, "No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "{00C0FF}Trabajo en Minería Hunter Quarry", string, "Aceptar", "Cancelar");
			}
		}
		case 3:
		{
			new string[345];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,6);
			strcat(string, "{FFFFFF}El trabajo de taxista consiste en llevar clientes a donde ellos requieran\n");
			strcat(string, "Se puede configurar un ficha dejando presionada la tecla {00C0FF}'2' > Configurar ficha {FFFFFF}.\n");
			strcat(string, "Los clientes se puede ver en el Mapa o GPS.\n");
			strcat(string, "La paga depende del precio configurado en el taxímetro y la distancia a recorrer.\n\n");
			if(IsPlayerHasJob(playerid, 6))
			{
				strcat(string, "{7DCEA0}Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Taxista", string, "Aceptar", "");
			}
			else
			{
				strcat(string, "{DE5454}No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Taxista", string, "Aceptar", "Cancelar");
			}
		}
		case 6:
		{
			new string[340];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,7);
			strcat(string, "{FFFFFF}El trabajo de mecánico consiste el reparar vehículos averiados.\n");
			strcat(string, "Requisitos:\n2 puntos de reputación.\nTener vehículo propio(Opcional).\n\n");
			strcat(string, "Necesitaras comprar Kits de reparación y guardarlos en tu vehículo de trabajo\n");
			strcat(string, "Para reparar un vehículo tienes que estar frente a el y presionar {00C0FF}Y{FFFFFF}.\n\n");
			if(IsPlayerHasJob(playerid, 7))
			{
				strcat(string, "Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Mecánico", string, "Aceptar", "");
			}
			else
			{
				strcat(string, "No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Mecánico", string, "Aceptar", "Cancelar");
			}

		}
		case 7:
		{
			new string[440];
			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,8);
			strcat(string, "{FFFFFF}El trabajo de basurero consiste en recolectar basura por San Andreas.\n");
			strcat(string, "Para trabajar de basurero requieres mínimo 1 punto de experiencia(se consiguen cada 1 hora).\n");
			strcat(string, "Este es un trabajo para 2 personas(conductor y recolector), por lo que necesitaras 1 compañero para trabajar.\n");
			strcat(string, "La paga depende del recorrido y nivel de basurero, cada nivel de basurero aumenta la velocidad de recolección.\n\n");
			if(IsPlayerHasJob(playerid, 8))
			{
				strcat(string, "Ya tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Basurero", string, "Aceptar", "");
			}
			else
			{
				strcat(string, "No tienes este trabajo.");
				ShowPlayerDialog(playerid, DIALOG_OBTAINWORK, DIALOG_STYLE_MSGBOX, "Trabajo de Basurero", string, "Aceptar", "Cancelar");
			}
		}

		case 10:
		{
		/*	if(PlayerInfo[playerid][pJob] == 10 || PlayerInfo[playerid][pJob2] == 10) return SendClientMessage(playerid, -1, "No puedes tener 2 trabajos iguales.");
			if(PlayerInfo[playerid][pJob] == 0)
			{
				SendClientMessage(playerid, -1, "¡Felicidades!, te dieron el trabajo de transportista, si necesitas información sobre el trabajo usa {00C0FF}/ayuda trabajos{FFFFFF}.");
				PlayerInfo[playerid][pJob] = 10;
			}
			else if(PlayerInfo[playerid][pJob] != 0 && PlayerInfo[playerid][pJob2] == 0 && PlayerInfo[playerid][pVip] >= 2)
			{
				SendClientMessage(playerid, -1, "¡Felicidades!, te dieron el trabajo de transportista, si necesitas información sobre el trabajo usa {00C0FF}/ayuda trabajos{FFFFFF}.");
				PlayerInfo[playerid][pJob2] = 10;
			}*/
		}
	}
	return 1;
}

/*stock IsPosPlayerSetWorkID(playerid)
{

	//if(PlayerToPoint(1.0, playerid, 1174.9558,-1359.4973,14.375)) { SetPlayerWorkID(playerid, 1); }
	//else if(PlayerToPoint(1.0, playerid, 2526.8142,-1472.0265,23.9631)) { SetPlayerWorkID(playerid, 3); }
	//else if(PlayerToPoint(1.0, playerid, 1615.5157,-1498.5768,14.2361)) { SetPlayerWorkID(playerid, 5); }
	//else if(PlayerToPoint(1.0, playerid, -555.4631,-197.5723,78.4063)) { SetPlayerWorkID(playerid, 6); }
	//else if(PlayerToPoint(1.0, playerid, -1433.6064,-1542.9164,101.7578)) { SetPlayerWorkID(playerid, 4); }
	//else if(PlayerToPoint(1.0, playerid, -467.5827,-523.1122,25.5365)) { SetPlayerWorkID(playerid, 2); }
	//else if(PlayerToPoint(1.0, playerid, 1490.2838,1305.6012,1093.2964)) { SetPlayerWorkID(playerid, 7); }
	//else if(PlayerToPoint(1.0, playerid, -154.9691,-1611.6494,4.7973)) { SetPlayerWorkID(playerid, 9); }
	//else if(PlayerToPoint(1.0, playerid, 1557.1312,-2159.3701,13.5587) || PlayerToPoint(1.0, playerid, -1858.3964,140.8488,15.3312)) { SetPlayerWorkID(playerid, 8); }
	//else if(PlayerToPoint(1.0, playerid, -1714.7107,-62.6820,3.5547)) { SetPlayerWorkID(playerid, 10); }
	new pickupID = PlayerInfo[playerid][p_PickedUpPickup];
	if(pickupID != -1)
	{
		
		for(new i = 1; i < sizeof pos_get_work_var; i++)
		{
			if(pickupID == pickup_jobs[i]) { SetPlayerWorkID(playerid,i); ClearAnimations(playerid); }
		}
	}
	return 1;
}*/

MinerGenerateRockMinerals(id, maxpos)
{
	if(count_miner_rocks_generated[id] != maxpos)
	{
		new mineral_type;

		for(new i = 0; i < sizeof(MinerWork_Info); i++ )
		{
			if(count_miner_rocks_generated[id] == maxpos) break;
			if(!rBit1_Get(MineralWorkMinerValid, i))
			{
				//printf("Minerals %i", i);
				new pos_random = random(29);
				for(new rand = 0; rand < 30; rand++)
				{
					if(rBit1_Get(Minerals_PosMinerLevelActive[id], pos_random))
					{
						if(!rBit1_Get(Minerals_PosMinerLevelActive[id], rand))
						{
							
							pos_random = rand;
							break;
						}
					} /*else { break; }*/
				}

				new rand_rock, required_level;

				new Float:posx, Float:posy, Float:posz;
				switch(id)
				{
					case 0:
					{
						posx = Minerals_Zone_Random_Level1[pos_random][0];
						posy = Minerals_Zone_Random_Level1[pos_random][1];
						posz = Minerals_Zone_Random_Level1[pos_random][2];

						rand_rock = randomEx(1, 4);
						required_level = 1;
					}
					case 1:
					{
						posx = Minerals_Zone_Random_Level2[pos_random][0];
						posy = Minerals_Zone_Random_Level2[pos_random][1];
						posz = Minerals_Zone_Random_Level2[pos_random][2];

						rand_rock = randomEx(2, 5);
						required_level = 2;
					}
					case 2:
					{
						posx = Minerals_Zone_Random_Level3[pos_random][0];
						posy = Minerals_Zone_Random_Level3[pos_random][1];
						posz = Minerals_Zone_Random_Level3[pos_random][2];

						rand_rock = randomEx(5, 8);
						required_level = 5;
					}
					case 3:
					{
						posx = Minerals_Zone_Random_Level4[pos_random][0];
						posy = Minerals_Zone_Random_Level4[pos_random][1];
						posz = Minerals_Zone_Random_Level4[pos_random][2];

						rand_rock = randomEx(5, 9);
						required_level = 10;
					}
				}

				switch(rand_rock)
				{
					case 0: mineral_type = 168;
					case 1: mineral_type = 169;
					case 2: mineral_type = 170;
					case 3: mineral_type = 171;
					case 4: mineral_type = 172;
					case 5: mineral_type = 173;
					case 6: mineral_type = 174;
					case 7: mineral_type = 175;
					case 8: mineral_type = 176;
					case 9: mineral_type = 177;
				}


				MinerWork_Info[i][E_MINERWORK_Info_ObjectID] = CreateDynamicObject(InvObjectData[mineral_type][E_INV_OBJECTMID], posx, posy, posz + InvObjectData[mineral_type][invarea_ModelOffset], 0.0, 0.0, 0.0, -1, 1);
				SetDynamicObjectMaterial(MinerWork_Info[i][E_MINERWORK_Info_ObjectID], 0, InvObjectData[mineral_type][E_INV_OBJECTMID], "none", "none", InvObjectData[mineral_type][E_INV_COLOR1]);

				MinerWork_Info[i][E_MINERWORK_Info_AreaIT] = CreateInteractiveArea(posx, posy, posz+1.0, "para minar.", -1, -1, 1.5, AREAIT_TYPE_MINERALCHOP_MINER, 0, false);
				SetInteractiveExtraData(MinerWork_Info[i][E_MINERWORK_Info_AreaIT], i);

				//MinerWork_Info[i][E_MINERWORK_Info_Valid] = true;
				MinerWork_Info[i][E_MINERWORK_Info_MineralID] = mineral_type;
				MinerWork_Info[i][E_MINERWORK_Info_RequiredLevel] = /*(id+1)*/required_level;
				MinerWork_Info[i][E_MINERWORK_Info_PosMineral] = pos_random;

				rBit1_Set(Minerals_PosMinerLevelActive[id], pos_random, true);
				rBit1_Set(MineralWorkMinerValid, i, true);

				Miner_TimeGenNewMineral[id] = gettime() + 20;
				count_miner_rocks_generated[id]++;
			}
		}
	}
}

JobMiner_PayPlayerMineral(playerid, type)
{
	new value;
	switch(type)
	{
		case 168: { value = 120; }
		case 169: { value = 114; }
		case 170: { value = 110; }
		case 171: { value = 119; }
		case 172: { value = 108; }
		case 173: { value = 124; }
		case 174: { value = 134; }
		case 175: { value = 200; }
		case 176: { value = 180; }
		case 177: { value = 300; }
	}
	GivePlayerMoneyEx(playerid, value, true);

	GivePlayerWorkSkill(playerid, WORK_TYPE_MINER, 10);

	return 0;
}

GetFloorMinerForLevel(id)
{
	new floor_level;
	switch(MinerWork_Info[id][E_MINERWORK_Info_RequiredLevel])
	{
		case 1: floor_level = 0;
		case 2, 3, 4, 5: floor_level = 1;
		case 6, 7, 8, 9: floor_level = 2;
		case 10: floor_level = 3;
	}
	return floor_level;
}

// Farm
SetPlayerProgressFarmerNext(playerid)
{
	switch(PlayerInfo[playerid][p_JobTravelNext])
	{
		case 1:
		{
			new cow_random = randomEx(1, 5);
			new Float:x,Float:y,Float:z;
			GetAreaITPos(FarmerCowsPosition[cow_random],x,y,z);

			PlayerInfo[playerid][p_JobMissionExtraID] = CreateDynamicObject(19902, x,y,z+0.4, 0.0, 0.0, 0.0 -1, -1, playerid);
			ShowPlayerInfoTextdraw(playerid, "~w~Ordeña la vaca marcada con una flecha ~y~~h~amarilla");

			PlayerInfo[playerid][p_JobTravelT] = 1;
			PlayerInfo[playerid][p_JobTravel] = cow_random;
			PlayerInfo[playerid][p_JobMissionExtra] = 0;

			PlayerInfo[playerid][p_JobTravelNext]++;
		}
		case 2:
		{
			if(PlayerInfo[playerid][p_JobMissionExtraValue] >= 4)
			{
				HidePlayerInfoTextdraw(playerid);
				funct_HideTextdrawNotif(playerid, VNOTI_TYPE_FARMER);

				PlayerInfo[playerid][p_JobTravel] = 0;
				PlayerInfo[playerid][p_JobMissionExtra] = 0;
				PlayerInfo[playerid][p_JobMissionExtraValue] = 0;
				PlayerInfo[playerid][p_JobTravelNext] = 4;
				SetPlayerProgressFarmerNext(playerid);
				//AddItemInvPlayerEx(playerid, 59, 0);


				//ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.1, false, false, false, false, 1000);
				return 0;
			}

			new cow_random = randomEx(1, 5);
			new Float:x,Float:y,Float:z;
			GetAreaITPos(FarmerCowsPosition[cow_random],x,y,z);
			PlayerInfo[playerid][p_JobMissionExtraID] = CreateDynamicObject(19902, x,y,z+0.4, 0.0, 0.0, 0.0, -1, -1, playerid);
			ShowPlayerInfoTextdraw(playerid, "~w~Ordeña la vaca marcada con una flecha ~y~~h~amarilla");

			PlayerInfo[playerid][p_JobTravel] = cow_random;
			PlayerInfo[playerid][p_JobMissionExtra] = 0;

			new string[40];
			format(string, sizeof(string), "Tu progreso %d/4", PlayerInfo[playerid][p_JobMissionExtraValue]);
			if(GetPlayerOpenNotifID(playerid, VNOTI_TYPE_FARMERPROGRESS) == BOXNOTIF_INVALID_ID)
			{
				new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_FARMERPROGRESS, false, 25.0);
				funct_CreateTextdrawTextNotif(playerid, i, 0, ConvertEncoding(string), 0.0, 0.200, 1.2);
				new bar = funct_CreatePlayerBarNotif(playerid, i, 0, 18.0, 4.0, 0xF1F1F1FF);
				funct_SetValuePlayerBarNotif(playerid, bar, 0, PlayerInfo[playerid][p_JobMissionExtraValue]);
				vNoti_SetTimeHideBox(playerid, i, 10);
				UpdateNotificationForPlayer(playerid, i);
			}
			else
			{
				UpdatePlayerNotifBar(playerid, VNOTI_TYPE_FARMERPROGRESS, PlayerInfo[playerid][p_JobMissionExtra]);
				funct_UpdateTextDrawNotif(playerid, VNOTI_TYPE_FARMERPROGRESS, string);
			}
		}
		case 3:
		{
			new Float:curangle = GetPlayerAngleToIT(playerid, FarmerCowsPosition[ PlayerInfo[playerid][p_JobTravel] ]); 
			SetPlayerFacingAngle(playerid, curangle);

			ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0, 1, 1, 1, true, 0);
			rBit1_Set(eBit1_PlayerInfo[p_StatePlayerFarmer], playerid, true);

			PlayerInfo[playerid][p_JobMissionExtra] = 0;

			DestroyDynamicObject(PlayerInfo[playerid][p_JobMissionExtraID]);

			HidePlayerInfoTextdraw(playerid);

			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][5]);
			PlayerInfoTemp[playerid][pt_TimersE][5] = SetTimerEx("DelayExtractCowMilk", 8000, false, "i", playerid);

			vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 1);				

		}
		case 4:
		{
			Player.Temp[playerid][@JobAreaMission] = CreateInteractiveArea(-369.0569, -1065.8527, 58.7759 + 0.98, "para ~n~recoger.", -1, -1, 1.2, AREAIT_TYPE_PICKUPITEMMILK, KEY_AREAIT_TYPE_COLLECT, .testlos = false, .player = playerid);
			
			new objectid = CreateDynamicObject(19812, -369.0569, -1065.8527, 58.7759, 0.0000, 0.0000, -159.4800, -1, -1, playerid);
			SetInteractiveExtraData(Player.Temp[playerid][@JobAreaMission], objectid);

			PlayerInfo[playerid][p_JobMissionExtraID] = CreateDynamicObject(19902, -369.0569, -1065.8527, 58.7759+0.5, 0.0, 0.0, 0.0, -1, -1, playerid);

			ShowPlayerInfoTextdraw(playerid, "~w~Carga la leche marcada en color ~y~~h~amarillo", 4000);
		}
		case 5:
		{
			PlayerInfo[playerid][p_JobTravel] = 0;
			AddItemInvPlayerEx(playerid, 205, 0);
		}
	}
	return 1;
}