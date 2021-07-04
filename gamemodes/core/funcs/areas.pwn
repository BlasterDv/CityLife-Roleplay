CreateInitAreasServer()
{
	//Cow
	new areaid;
	FarmerCowsPosition[0] = CreateInteractiveArea(-351.27811, -1061.87012, 58.25100+1.0, "para ordeñar.", 0, 0, 1.0, AREAIT_TYPE_ORDECOW, KEY_AREAIT_TYPE_YES, false);
	FarmerCowsPosition[1] = CreateInteractiveArea(-346.28360, -1058.77307, 58.25100+1.0, "para ordeñar.", 0, 0, 1.0, AREAIT_TYPE_ORDECOW, KEY_AREAIT_TYPE_YES, false);
	FarmerCowsPosition[2] = CreateInteractiveArea(-353.82144, -1056.47388, 58.25100+1.0, "para ordeñar.", 0, 0, 1.0, AREAIT_TYPE_ORDECOW, KEY_AREAIT_TYPE_YES, false);
	FarmerCowsPosition[3] = CreateInteractiveArea(-347.09760, -1062.78064, 58.25100+1.0, "para ordeñar.", 0, 0, 1.0, AREAIT_TYPE_ORDECOW, KEY_AREAIT_TYPE_YES, false);
	FarmerCowsPosition[4] = CreateInteractiveArea(-342.64954, -1056.97852, 58.25100+1.0, "para ordeñar.", 0, 0, 1.0, AREAIT_TYPE_ORDECOW, KEY_AREAIT_TYPE_YES, false);
	CreateInteractiveArea(-365.9910, -1061.0036, 59.2414, "para~n~dejar la leche.", -1, -1, 2.0, AREAIT_TYPE_MILKPROCESSMACHINE, KEY_AREAIT_TYPE_COLLECT, true, "{5EB5FF}Procesadora de leche\n{FFFFFF}Deja la leche aquí para procesarla.", COLOR_TXT3DIT, 5.0, false); // 2 - 2

	// Cajeros
	CreateInteractiveArea(834.1007, 3.1825, 1004.1796, "para usar.", -1, -1, 1.0, AREAIT_TYPE_ATM_MONEY, KEY_AREAIT_TYPE_YES, false);

	CreateInteractiveArea(821.3086, 1.9652, 1004.1796, "para usar.", -1, -1, 1.0, AREAIT_TYPE_BANK_MONEY, KEY_AREAIT_TYPE_ENTER, true, "Caja {5EB5FF}#2", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(821.3085, -0.2724, 1004.1796, "para usar.", -1, -1, 1.0, AREAIT_TYPE_BANK_MONEY, KEY_AREAIT_TYPE_ENTER, true, "Caja {5EB5FF}#1", COLOR_TXT3DIT, 5.0, false);

	CreateInteractiveArea(653.0466, 141.6433, 1043.0695, "para usar.", -1, -1, 1.0, AREAIT_TYPE_BANK_MONEY, KEY_AREAIT_TYPE_ENTER, true, "Caja {5EB5FF}#1", COLOR_TXT3DIT, 5.0, false);

	CreateInteractiveArea(2316.9184, -76.3663, 10.7863, "para comprar.", -1, 3, 1.0, AREAIT_TYPE_BUY_PHONES, 0, true, "{5EB5FF}Telefonos\n{FFFFFF}no hay información disponible.", COLOR_TXT3DIT, 5.0, false);

	//Comprar ropa
	CreateInteractiveArea(207.6959, -99.9275, 1005.2578, "para comprar.", -1, 15, 1.0, AREAIT_TYPE_BUY_SKINBINCO, 0, true, "{5EB5FF}Binco\n{FFFFFF}no hay informacion disponible.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(207.1153, -128.7788, 1003.5078, "para comprar.", -1, 3, 1.0, AREAIT_TYPE_BUY_SKINPROLAPS, 0, true, "{5EB5FF}ProLaps\n{FFFFFF}no hay informacion disponible.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(210.1246, -162.7793, 1000.5234, "para comprar.", -1, 14, 1.0, AREAIT_TYPE_BUY_SKINDS, 0, true, "{5EB5FF}Didier Sanchz\n{FFFFFF}no hay informacion disponible.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(208.5176, -47.5706, 1001.8049, "para comprar.", -1, 1, 1.0, AREAIT_TYPE_BUY_SKINSUBURBAN, 0, true, "{5EB5FF}Suburban\n{FFFFFF}48 para hombres\n20 para mujeres.", COLOR_TXT3DIT, 5.0, false);

	// Vehicles
	CreateAreaSphereForVehicles(1553.0525,-2176.2017,13.8039, 2.0, "para usar.", 0, 0, AREAITV_TYPE_LOAD_WORKSHOP, KEY_AREAIT_TYPE_V_YES);
	CreateAreaSphereForVehicles(1553.2004,-2169.6174,13.8039, 2.0, "para usar.", 0, 0, AREAITV_TYPE_LOAD_WORKSHOP, KEY_AREAIT_TYPE_V_YES);
	CreateAreaSphereForVehicles(1569.2042,-2172.0359,13.8039, 2.0, "para usar.", 0, 0, AREAITV_TYPE_LOAD_WORKSHOP, KEY_AREAIT_TYPE_V_YES);
	CreateAreaSphereForVehicles(1569.2185,-2177.7952,13.8039, 2.0, "para usar.", 0, 0, AREAITV_TYPE_LOAD_WORKSHOP, KEY_AREAIT_TYPE_V_YES);

	// Zip
	CreateInteractiveArea(175.6838, -92.5776, 1002.1417, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_HATS, 0, true, "{5EB5FF}Sombreros\n{FFFFFF}19 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(146.9999, -92.4001, 1002.1417, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_GLASSES, 0, true, "{5EB5FF}Lentes\n{FFFFFF}30 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(155.4755, -88.5091, 1001.8047, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_CAP, 0, true, "{5EB5FF}Gorras\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(167.3923, -88.5092, 1001.8047, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_MASK, 0, true, "{5EB5FF}Mascaras\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(145.8955, -74.7004, 1001.8119, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_BACKPAD, 0, true, "{5EB5FF}Mochilas\n{FFFFFF}1 producto disponible.", COLOR_TXT3DIT, 5.0, false);
	//CreateInteractiveArea(167.3675, -75.8752, 1001.8047, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_CLOCK, 0, true, "{5EB5FF}Relojes\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(181.3838, -86.2905, 1002.0234, "para cambiarte~n~de ropa.", -1, -1, 1.0, AREAIT_TYPE_BUY_CHANGESKIN, 0);
	// DS
	CreateInteractiveArea(200.3034, -166.2575, 1000.8292, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_CAP4, 0, true, "{5EB5FF}Gorras y boinas\n{FFFFFF}15 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(208.3161, -166.2583, 1000.8292, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_MASK4, 0, true, "{5EB5FF}Mascaras\n{FFFFFF}7 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(204.5985, -158.9515, 1000.5234, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_WATCHES, 0, true, "{5EB5FF}Relojes\n{FFFFFF}5 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(215.8411, -154.5792, 1000.5234, "para cambiarte~n~de ropa.", -1, -1, 1.0, AREAIT_TYPE_BUY_CHANGESKIN, 0);
	// Binco
	CreateInteractiveArea(203.2277, -112.1337, 1005.2578, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_CAP, 0, true, "{5EB5FF}Gorras\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(201.6136, -112.1368, 1005.2578, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_MASK, 0, true, "{5EB5FF}Bandanas\n{FFFFFF}10 productos disponibles.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(217.5330, -97.5454, 1005.2578, "para cambiarte~n~de ropa.", -1, -1, 1.0, AREAIT_TYPE_BUY_CHANGESKIN, 0, true);
	// Suburban
	CreateInteractiveArea(214.6265, -39.8521, 1002.0234, "para cambiarte~n~de ropa.", -1, -1, 1.0, AREAIT_TYPE_BUY_CHANGESKIN, 0, true);
	// Victim
	CreateInteractiveArea(205.9741, -8.3430, 1001.2109, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_G_WATCHES1, 0, true, "{5EB5FF}Relojes\n{FFFFFF}10 productos disponibles.", COLOR_TXT3DIT, 5.0, false);

	// BikerShop
	CreateInteractiveArea(596.9401, -1509.9559, 35.5399, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_VEHICLES2, 0, true, "{5EB5FF}BikerShop\n{FFFFFF}9 vehículos disponibles.", COLOR_TXT3DIT, 5.0, false);
	//Grotti
	CreateInteractiveArea(184.7949, 86.6115, 999.2187, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_VEHICLES4, 0, true, "{5EB5FF}Grotti Car's\n{FFFFFF}14 vehículos disponibles.", COLOR_TXT3DIT, 5.0, false);

	// Minero
	CreateInteractiveArea(876.4847, 826.8670, 14.3422, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_ITEMSMINER, 0, true, "{5EB5FF}Mina Hunter Quarry\n{FFFFFF}2 productos disponibles.", COLOR_TXT3DIT, 5.0, false);	

	areaid = CreateInteractiveArea(773.6588,827.5938,9.4248, "para tirar~n~la roca.", -1, -1, 4.0, AREAIT_TYPE_MINER_PROCESS, KEY_AREAIT_TYPE_COLLECT);	
	SetAreaITLabel(areaid, "{5EB5FF}Procesadora\n{FFFFFF}Procesa las rocas.", COLOR_TXT3DIT, 5.0, 1.0, false);
	areaid = CreateInteractiveArea(726.5894,764.3184,-3.8739+2.0, "para tirar~n~la roca.", -1, -1, 4.0, AREAIT_TYPE_MINER_PROCESS, KEY_AREAIT_TYPE_COLLECT); // 2	
	SetAreaITLabel(areaid, "{5EB5FF}Procesadora\n{FFFFFF}Procesa las rocas.", COLOR_TXT3DIT, 5.0, 2.0, false);
	areaid = CreateInteractiveArea(685.4216,751.6248,-2.7204+2.0, "para tirar~n~la roca.", -1, -1, 4.0, AREAIT_TYPE_MINER_PROCESS, KEY_AREAIT_TYPE_COLLECT); // 2 - 2
	SetAreaITLabel(areaid, "{5EB5FF}Procesadora\n{FFFFFF}Procesa las rocas.", COLOR_TXT3DIT, 5.0, 2.0, false);
	areaid = CreateInteractiveArea(633.1408,752.9382,-9.0928+2.0, "para tirar~n~la roca.", -1, -1, 4.0, AREAIT_TYPE_MINER_PROCESS, KEY_AREAIT_TYPE_COLLECT); // 2 - 2
	SetAreaITLabel(areaid, "{5EB5FF}Procesadora\n{FFFFFF}Procesa las rocas.", COLOR_TXT3DIT, 5.0, 2.0, false);
	areaid = CreateInteractiveArea(601.0632,762.5287,-11.7148+2.0, "para tirar~n~la roca.", -1, -1, 4.0, AREAIT_TYPE_MINER_PROCESS, KEY_AREAIT_TYPE_COLLECT); // 2 - 2
	SetAreaITLabel(areaid, "{5EB5FF}Procesadora\n{FFFFFF}Procesa las rocas.", COLOR_TXT3DIT, 5.0, 2.0, false);

	// Apartamentos
	CreateInteractiveArea(216.6838, 156.2956, 1201.9417, "para comprar~n~un apartamento.", -1, -1, 2.0, AREAIT_TYPE_MINER_BUYAPARTAMENT, KEY_AREAIT_TYPE_ENTER, true, "{5EB5FF}City Apartaments Basic\n{FFFFFF}Consulta los apartamentos disponibles.", COLOR_TXT3DIT, 5.0, true);

	// Comprar tienda de servicio
	CreateInteractiveArea(1067.1422, -809.8344, 1081.9749, "para comprar.", -1, -1, 2.0, AREAIT_TYPE_BUYSERVICESTORE, 0, true, "{5EB5FF}7-Eleven\n{FFFFFF}1 producto disponible.", COLOR_TXT3DIT, 5.0, false);
	//
	CreateInteractiveArea(1555.5937, -2156.7570, 13.6855, "para comprar.", -1, -1, 2.0, AREAIT_TYPE_BUYWORKSHOPTOOLS, 0, true, "{5EB5FF}Herramientas para vehículos\n{FFFFFF}1 producto disponible.", COLOR_TXT3DIT, 5.0, false);

	// Clucking Bell
	CreateInteractiveArea(368.1307, -5.6208, 1001.8515, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_DRINKCB, 0, true, "{5EB5FF}Bebidas\n{FFFFFF}1 producto para comprar.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(370.8938, -5.6188, 1001.8588, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_FOODCB, 0, true, "{5EB5FF}Comida\n{FFFFFF}1 producto para comprar.", COLOR_TXT3DIT, 5.0, false);
	
	// Burger Shot
	CreateInteractiveArea(374.0957, -65.5743, 1001.5078, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_DRINKBS, 0, true, "{5EB5FF}Bebidas\n{FFFFFF}2 producto para comprar.", COLOR_TXT3DIT, 5.0, false);
	CreateInteractiveArea(376.7138, -67.0359, 1001.5078, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_FOODBS, 0, true, "{5EB5FF}Comida\n{FFFFFF}1 producto para comprar.", COLOR_TXT3DIT, 5.0, false);

	// LSPD
	CreateInteractiveArea(250.4501, 67.6533, 1003.6409, "para enviar tu corriculum.", -1, -1, 1.0, 0, 0, true, "{5EB5FF}Convocatorias cerradas\n{FFFFFF}Envía aquí tu corriculum.", COLOR_TXT3DIT, 5.0, false);

	// Seguros Los Santos
	areaid = CreateInteractiveArea(1090.9356, -1793.4149, 1017.1729, "para hablar.", -1, 1, 1.0, AREAIT_TYPE_SECUREVEHICLES, 0, false);
	areaid = CreateInteractiveArea(1086.8592, -1793.4161, 1017.1729, "para hablar.", -1, 1, 1.0, AREAIT_TYPE_SECUREVEHICLES, 0, false);
	SetInteractiveExtraData(areaid, 1);
	areaid = CreateInteractiveArea(1081.0543, -1793.2125, 1017.1729, "para hablar.", -1, 1, 1.0, AREAIT_TYPE_SELLVEHICLES, 0, false);
	areaid = CreateInteractiveArea(1077.1088, -1793.4157, 1017.1729, "para hablar.", -1, 1, 1.0, AREAIT_TYPE_SELLVEHICLES, 0, false);
	SetInteractiveExtraData(areaid, 1);
}

StopTimerEnterAreaITCheck(playerid)
{
	if(rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid))
	{
		rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterIT_A], playerid, false);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][0]);
	
	}
	return 1;
}

StopTimerEnterAreaCheck(playerid)
{
	if(rBit1_Get(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid))
	{
		//if(PlayerInfo[playerid][p_PickedUpArea] != INVALID_AREAIT_ID) return 1;
		if(Iter_Count(areag_NearIndex[playerid]) != 0) return 1;
		if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] != INVALID_AREAIT_ID) return 1;

		rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid, false);
		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][9]);
	
	}
	return 1;
}

// Method 2 Interactive Areas - Last modified 19/04/2019.

hook OnPlayerLeaveDynArea(playerid, areaid)
{
	callback_LeaveDynamicAreag(playerid, areaid);
	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
}

callback_LeaveDynamicAreag(playerid, areaid)
{
	if(!IsValidDynamicArea(areaid)) { return 1; }

	if(Iter_Count(areag_NearIndex[playerid]) == 0) { return 2; }

	new data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 2);
	
	if(data[0] != AREA_TYPE_PLAYER_NEAR_VEHICLE) { return 4; }

	if(!Iter_Contains(Vehicle, data[1])) { return 3; }

	CallLocalFunction("OnPlayerLeaveAreaITV", "ddd", playerid, data[1], 1);
	foreach(new i : areag_NearIndex[playerid])
	{

		if(areag_Near[playerid][i] == data[1])
		{
			Iter_Remove(areag_NearIndex[playerid], i);
			break;
		}
	}
	return 0;
}

function AreasIT_OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(SAKEY_RELEASED(KEY_SECONDARY_ATTACK))
	{
		new areaid = CheckPlayerPressInAreaIT(playerid, KEY_SECONDARY_ATTACK);
		if(areaid != INVALID_AREAIT_ID)
		{
			if(IsItAngleZValid(playerid, areaid))
			{
				switch(GetInteractiveAreaType(areaid))
				{
					case AREAIT_TYPE_MINERALCHOP_MINER:
					{
						new extra = GetInteractiveExtraData(areaid);
						if(!IsPlayerHasJob(playerid, WORK_TYPE_MINER)) return 0;
						else if(GetInvValueItemSelected(playerid) != 166) return 1;
						else if(rBit1_Get(StateMineralWorkMiner, extra)) return 0;
						else if(GetPlayerWorkLevel(playerid, WORK_TYPE_MINER) < MinerWork_Info[extra][E_MINERWORK_Info_RequiredLevel]) return 0;
					}
				}
				new Float:curangle = GetPlayerAngleToIT(playerid, areaid); 
				SetPlayerFacingAngle(playerid, curangle);
				StopTimerEnterAreaITCheck(playerid);
				funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);

				Internal_OnPressAreaIT(playerid, areaid);
			}
		}
	}
	if (SAKEY_PRESSED(KEY_WALK))
	{
		if(IsPlayerInAnyVehicle(playerid)) return 1;
		
		new areaid = CheckPlayerPressInAreaIT(playerid, KEY_WALK);
		
		if(areaid != -1 && IsInteractiveAreaAngleValid(playerid, areaid))
		{
			Internal_OnPressAreaIT(playerid, areaid);
		}
		else
		{
			PlayerPressKeyDropItem(playerid);
		}

	}
	if(newkeys & KEY_YES)
	{
		if(Player.Temp[playerid][@PickedUpAreaF] != INVALID_STREAMER_ID)
		{
			new info[2];
			Streamer_GetArrayData(STREAMER_TYPE_AREA, Player.Temp[playerid][@PickedUpAreaF], E_STREAMER_EXTRA_ID, info);
			OnPlayerInteractiveFurniture(playerid, info[1]);
		}

		new areaid = CheckPlayerPressInAreaIT_Ex(playerid);
		
		switch(GetInteractiveAreaTypeG(areaid))
		{
			case KEY_AREAIT_TYPE_YES:
			{
				switch(GetInteractiveAreaType(areaid))
				{
					case AREAIT_TYPE_ORDECOW:
					{
						if(IsItAngleZValid(playerid, areaid))
						{
							if(PlayerInfo[playerid][p_WorkTravel] != WORK_TYPE_FARMER) return 1;
							if(PlayerInfo[playerid][p_JobTravel] == 0) return 1;
						}
					}
				}
				Internal_OnPressAreaIT(playerid, areaid);
			}
			case KEY_AREAIT_TYPE_COLLECT:
			{
				new itemid = GetInteractiveExtraData(areaid);
				switch(ItemsWorld.Info[itemid][@ItemID])
				{
					case 58:
					{
						if(item_Interactor[itemid] != INVALID_PLAYER_ID) return 0;
						Player.Temp[playerid][@InteractType] = TYPE_ITEMINTERACT_BACKPAD;
						Player.Temp[playerid][@InteractID] = ItemsWorld.Info[itemid][@ItemAmount];
						ShowPlayerInvChangeBox(playerid, 2);
					}
				}
			}
		}
	}
	return 1;
}

/*GetAreaIT_VehicleID(playerid)
{
	if(!IsPlayerConnected(playerid))
		return INVALID_VEHICLE_ID;

	if(Iter_Count(areag_NearIndex[playerid]) == 0)
		return INVALID_VEHICLE_ID;

	new
	Float:x,
	Float:y,
	Float:z,
	curid,
	closestid = INVALID_VEHICLE_ID,
	Float:curdistance,
	Float:closetsdistance = 99999.9;

	GetPlayerPos(playerid, x, y, z);

	foreach(new i : areag_NearIndex[playerid])
	{
		curid = areag_Near[playerid][i];

		curdistance = Distance_func(x, y, z, Vehicles_Info[curid][gi_vehicle_POS_X], Vehicles_Info[curid][gi_vehicle_POS_Y], Vehicles_Info[curid][gi_vehicle_POS_Z]);

		if(curdistance < closetsdistance)
		{
			closetsdistance = curdistance;
			closestid = curid;
		}
	}
	return closestid;
}*/
GetAreaIT_VehicleID(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid) && Iter_Count(areag_NearIndex[playerid]) > 0)
	{
		if(!IsPlayerInAnyDynamicArea(playerid))
		{
			printf("[WARNING 2] Player %d is not in areas but list isn't empty. Purging list.", playerid);
			Iter_Clear(areag_NearIndex[playerid]);
		}

		new
		areaid,
		Float:x,
		Float:y,
		Float:z,
		Float:distance,
		list[MAX_AREAS_GE_INRANGE][e_areasit_range_data],
		index;

		GetPlayerPos(playerid, x, y, z);

		foreach(new i : areag_NearIndex[playerid])
		{
			if(index >= MAX_AREAS_GE_INRANGE - 1)
				break;

			areaid = areag_Near[playerid][i];

			distance = Distance_func(x, y, z, Vehicles_Info[areaid][gi_vehicle_POS_X], Vehicles_Info[areaid][gi_vehicle_POS_Y], Vehicles_Info[areaid][gi_vehicle_POS_Z]);

			//if(distance > AreasInteractive[areaid][AreaIT_Size])
			//	continue;

			//if(!(AreasInteractive[areaid][AreaIT_Z] - AreasInteractive[areaid][AreaIT_Size] <= z <= AreasInteractive[areaid][AreaIT_Z] + AreasInteractive[areaid][AreaIT_Size]))
				//continue;

			//if(ConvertDecimalToKeyArea(AreasInteractive[areaid][AreaIT_TypeG]) != key)
				//continue;

			list[index][AreaIT_ID] = areaid;
			list[index][AreaIT_distance] = distance;

			index++;
		}

		SortArrayContent(list, 0, index);

		for(new i = index - 1; i >= 0; i--)
		{
			return list[i][AreaIT_ID];

		}
	}
	return -1;
}

callback_LeaveDynamicAreaTwo(playerid, areaid)
{
	if(!IsValidDynamicArea(areaid)) { return 1; }

	if(Iter_Count(areag_NearIndex[playerid]) == 0) { return 2; }

	new data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 2);
	
	if(data[0] != AREA_TYPE_PLAYER_NEAR_VEHICLE) { return 4; }

	if(!Iter_Contains(Vehicle, data[1])) { return 3; }

	foreach(new i : areag_NearIndex[playerid])
	{
		if(areag_Near[playerid][i] == data[1])
		{
			Iter_Remove(areag_NearIndex[playerid], i);
			break;
		}
	}
	return 0;
}

stock GetPlayerCountAreag(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(Iter_Count(areag_NearIndex[playerid]) == 0)
		return 0;

	return Iter_Count(areag_NearIndex[playerid]);
}

stock Float:GetPlayerAngleToPos(playerid, Float:px, Float:py)
{
	if(!IsPlayerConnected(playerid))
		return 0.0;

	new
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

	return GetAngleToPoint(x, y, px, py);
}