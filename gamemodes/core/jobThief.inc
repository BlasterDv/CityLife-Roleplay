new Ob_DoorsThief[5];

stock ForceLockHouse(/*playerid, */doorid)
{
	switch(doorid)
	{
		case 0: //
		{
			MoveDynamicObject(Ob_DoorsThief[0], 2465.82251, -1995.39099, 13.12090,  100.0, 0.00000, 0.00000, 105.00000);
		}
		case 1: // Glen Park
		{
			MoveDynamicObject(Ob_DoorsThief[1], 1885.4021, -1114.4352, 25.2623, 100.0, 0.00000, 0.00000, 180.00000);
		}
		case 2: // LS -
		{
			MoveDynamicObject(Ob_DoorsThief[2], 2651.99219, -1988.95728, 12.99760, 100.0,  0.00000, 0.00000, 90.00000);
		}
		case 3: // SF - Ocean Flats 1
		{
			MoveDynamicObject(Ob_DoorsThief[3], -2621.3728, 96.0031, 3.7354, 100.0, 0.0,0.0,190.0);
		}
	}
}

stock resetWorkThiefHouses()
{
	for(new i = 0; i < sizeof(WorkActivity_Thief); i++)
	{	
		WorkActivity.Thief[i][@AreaIT] = -1;
	}	

	CreateHouseStealThieves(1, 1885.5255, -1113.6102, 26.2734);
		
}

CreateHouseStealThieves(doorid, Float:X, Float:Y, Float:Z)
{
	WorkActivity.Thief[doorid][@X] = X;
	WorkActivity.Thief[doorid][@Y] = Y;
	WorkActivity.Thief[doorid][@Z] = Z;

	WorkActivity.Thief[doorid][@AreaIT] = CreateInteractiveArea(X, Y, Z, "para forzar.", -1, -1, 1.0, AREAIT_TYPE_BUY_THIEVESHOUSE, KEY_AREAIT_TYPE_YES, true, "{00C0FF}Casa Glen Park\n{FFFFFF}su dueño no esta en casa.", COLOR_TXT3DT, 5.0, false);
	//SetInteractiveExtraData(WorkActivity.Thief[doorid][@AreaIT], doorid);

}

stock StartForcingLock(playerid, doorid)
{
	if(!rBit1_Get(StateHouseThievesForce, doorid))
	{
		TogglePlayerControllable(playerid, 0);

		
		ApplyAnimation(playerid, "MISC", "GRAB_R", 4.1, true, false, false, false, 0, false); 
		AttachObjectToSPlayer(playerid, 0, 0, 18634, 9);
		//SendClientMessage(playerid, 0xFFFFFFFF, "Forzando cerradura espera {00C0FF}14 segundos{FFFFFF}.");
		//PlayAudioStreamForPlayer(playerid, "https://dl.dropboxusercontent.com/s/3k0sfgyw1vsao9i/Barretera.mp3");
		//SetTimerEx("TimerLadron", 1000*14, false, "ii", playerid,doorid);

		rBit1_Set(StateHouseThievesForce, doorid, true);

		Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_THIEF_H;		
		Player.Temp[playerid][@CriminalActID] = doorid;
		Player.Temp[playerid][@CriminalActValue] = 1;

		new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_WORKTHIEVESFORCE, 34.0, 0);
		funct_CreateTextdrawTextNotif(playerid, i, 0, ConvertEncoding("Pulsa ~k~~PED_SPRINT~ para forzar ~n~la cerradura."), 0, 0.200, 1.2);
		funct_CreatePlayerBarNotif(playerid, i, 0, 27.0, 40.0);
		UpdateNotificationForPlayer(playerid, i);

		GameTextForPlayer(playerid,"~r~Forzando... ~w~espera",10000,5);
		//format(string,sizeof(string), "%s comienza a forzar la cerradura.", GetPlayerNameEx(playerid));
		//ProxDetector(30.0, playerid, string, Rol, Rol, Rol, Rol, Rol);
	}
	return 1;
		
}

stock CloseDoorThief(doorid)
{
	rBit1_Set(StateHouseThievesForce, doorid, false);
	DeleteTheftObjectHouse(doorid);

	switch(doorid)
	{
		case 0: // Willo
		{
			MoveDynamicObject(Ob_DoorsThief[0],2465.82251, -1995.39099, 13.12090,100.0, 0.00000, 0.32700, 0.00000);
			ResetTheftObject(0);
		}
		case 1: // Glen Park
		{
			MoveDynamicObject(Ob_DoorsThief[1], 1885.4021, -1114.4352, 25.2623, 100.0, 0.00000, 0.00000, 90.00000);
		}
		case 2: // LS -
		{
			MoveDynamicObject(Ob_DoorsThief[2], 2651.99219, -1988.95728, 12.99760, 100.0,  0.00000, 0.00000, 0.00000);
			ResetTheftObject(2);
		}
		case 3: // SF - Ocean Flats 1
		{
			MoveDynamicObject(Ob_DoorsThief[3], -2621.3728, 96.0031, 3.7354, 100.0, 0.0,0.0,90.0);
			ResetTheftObject(3);
		}
	}
}

FinishForceDoorHouse(playerid, doorid)
{
	new random_open, string[128];
	//switch(PlayerInfo[playerid][pThiefLvl])
	//{
		//case 1: { random_open = random(3); numrandom = 2; }
		//case 2: { random_open = random(2); numrandom = 1; }
		//case 3: { random_open = 0; numrandom = 0; }
	//}
	random_open = 1;
	if(random_open == 1)
	{
		format(string,sizeof(string), "%s logra abrir la cerradura.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, Rol, Rol, Rol, Rol, Rol);
		ForceLockHouse(doorid);
		//payJobThief(playerid);
		WorkActivity.Thief[doorid][@TimeClosed] = gettime()+1800;
		VarsForServer_B[e_VFS_OpenTheftDoor][doorid] = true;
		WorkActivity.Thief[doorid][@TimeOpen] = 60;

		DestroyInteractiveArea(WorkActivity.Thief[doorid][@AreaIT]);
		WorkActivity.Thief[doorid][@AreaIT] = -1;

		foreach(new player : Player)
		{
			if(PlayerToPoint(10.0, player, WorkActivity.Thief[doorid][@X],  WorkActivity.Thief[doorid][@Y],  WorkActivity.Thief[doorid][@Z]))
			{
				new i = funct_AddTextDrawNotifBoxEx(player, VNOTI_TYPE_TIMECLOSETHIEVES, 17.0, 0);
				funct_CreateTextdrawTextNotif(player, i, 0, "La puerta cerrara en:", 0, 0.200, 1.2);
				UpdateNotificationForPlayer(player, i);
			}
		}

		WorkActivity.Thief[doorid][@Timer] = SetTimerEx("CheckThiefHouseTimer", 1100, true, "i", doorid);

		ResetTheftObject(doorid);
	}
	else 
	{
		format(string,sizeof(string), "%s no logra abrir la cerradura.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, Rol, Rol, Rol, Rol, Rol);
		VarsForServer_B[e_VFS_OpenTheftDoor][doorid] = false;
		
	}
	RemovePlayerAttachedObject(playerid, 9);
	TogglePlayerControllable(playerid,1);
	StopAudioStreamForPlayer(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
}

stock ResetTheftObject(idhouse)
{
	switch(idhouse)
	{
		case 0: // Willo
		{
			VarsForServer_B[TheftObjects][0] = CreateDynamicObject(19317, 2464.23828, -1995.01184, 13.29500,   -14.00000, -2.00000, 169.00000);
			VarsForServer_B[TheftObjects][1] = CreateDynamicObject(2318, 2464.31641, -1993.49500, 12.83010,   0.00000, 0.00000, 273.00000);
			VarsForServer_B[TheftObjects][2] = CreateDynamicObject(2226, 2462.07129, -1993.50903, 14.22850,   0.00000, 0.00000, 89.73320);
			VarsForServer_B[TheftObjects][3] = CreateDynamicObject(19612, 2464.33716, -1992.87488, 12.55520,   0.00000, 0.00000, 273.00000);
			VarsForServer_B[TheftObjects][4] = CreateDynamicObject(2317, 2463.24487, -1994.83032, 12.79380,   0.00000, 0.00000, -181.00000);
			VarsForServer_B[TheftObjects][5] = CreateDynamicObject(19894, 2462.05054, -1993.58899, 13.37933,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][6] = CreateDynamicObject(2190, 2461.73413, -1994.31982, 14.22870,   0.00000, 0.00000, 69.00000);
			VarsForServer_B[TheftObjects][7] = CreateDynamicObject(1210, 2462.05811, -1994.38550, 13.81550,   -90.00000, 90.00000, 0.00000);
		}
		case 1: // Glen Park
		{
			VarsForServer_B[TheftObjects][0] = CreateItemInvWorld(161, 1887.45569, -1104.88892, 25.98540, 0.0, 0.0, 0.0, 0, 0, 1);
			VarsForServer_B[TheftObjects][1] = CreateItemInvWorld(162, 1886.37207, -1105.96545, 25.26230, 0.0, 0.0, 0.0, 0, 0, 1);
			VarsForServer_B[TheftObjects][2] = CreateItemInvWorld(163, 1884.97485, -1111.37476, 25.26210, 0.0, 0.0, 315.17801, 0, 0, 1);
			VarsForServer_B[TheftObjects][3] = CreateItemInvWorld(164, 1884.87415, -1108.97876, 25.84710, 0.0, 0.0, 0.0, 0, 0, 1);
			VarsForServer_B[TheftObjects][4] = CreateItemInvWorld(165, 1884.78040, -1109.85022, 26.01350, 0.0, 0.0, -90.0, 0, 0, 1);

		}
		case 2: // LS - Glen Park 2
		{
			VarsForServer_B[TheftObjects][16] = CreateDynamicObject(366, 2656.36938, -1977.93835, 14.76550,   -90.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][18] = CreateDynamicObject(19894, 2656.70264, -1978.76965, 14.25760,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][19] = CreateDynamicObject(2190, 2656.99731, -1978.43518, 14.66850,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][20] = CreateDynamicObject(2317, 2656.67725, -1979.59045, 14.92650,   0.00000, 0.00000, -91.00000);
			VarsForServer_B[TheftObjects][21] = CreateDynamicObject(1210, 2656.71362, -1979.43042, 14.35740,   90.00000, 0.00000, 68.00000);
			VarsForServer_B[TheftObjects][22] = CreateDynamicObject(2226, 2656.62109, -1979.59875, 13.82710,   0.00000, 0.00000, -91.00000);
			VarsForServer_B[TheftObjects][23] = CreateDynamicObject(2028, 2656.78320, -1978.42773, 13.90310,   0.00000, 0.00000, 32.00000);
			VarsForServer_B[TheftObjects][24] = CreateDynamicObject(2406, 2654.04907, -1978.78418, 14.22760,   -8.00000, 0.00000, 90.00000);
			VarsForServer_B[TheftObjects][25] = CreateDynamicObject(2404, 2654.04761, -1978.22327, 14.22760,   -8.00000, 0.00000, 90.00000);
		}
		case 3: // SF - Ocean Flats 1
		{
			VarsForServer_B[TheftObjects][26] = CreateDynamicObject(2406, -2626.15771, 89.99070, 4.54900,   -10.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][27] = CreateDynamicObject(2404, -2626.14429, 90.11400, 4.54900,   -10.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][28] = CreateDynamicObject(2190, -2627.63599, 90.44320, 4.99830,   0.00000, 0.00000, 90.00000);
			VarsForServer_B[TheftObjects][29] = CreateDynamicObject(2317, -2628.08179, 90.26720, 5.24350,   0.00000, 0.00000, -180.00000);
			VarsForServer_B[TheftObjects][30] = CreateDynamicObject(2028, -2629.10278, 90.14030, 4.64850,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][31] = CreateDynamicObject(2226, -2628.06250, 90.29410, 4.57740,   0.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][32] = CreateDynamicObject(19894, -2627.47827, 90.18771, 4.14141,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][33] = CreateDynamicObject(1210, -2628.12427, 90.19320, 4.11740,   -90.00000, 0.00000, 30.20190);
			VarsForServer_B[TheftObjects][34] = CreateDynamicObject(366, -2629.34277, 90.26760, 5.09000,   90.00000, 0.00000, 347.61108);
			VarsForServer_B[TheftObjects][35] = CreateDynamicObject(19612, -2629.76929, 90.65035, 3.31170,   0.00000, 0.00000, 135.00000);
			VarsForServer_B[TheftObjects][36] = CreateDynamicObject(19317, -2628.25464, 90.26530, 3.67710,   -90.00000, 0.00000, 83.96570);
		}
	}
}

stock DeleteTheftObjectHouse(idhouse)
{
	switch(idhouse)
	{
		case 0: // Willo
		{
			VarsForServer_B[TheftObjects][0] = CreateDynamicObject(19317, 2464.23828, -1995.01184, 13.29500,   -14.00000, -2.00000, 169.00000);
			VarsForServer_B[TheftObjects][1] = CreateDynamicObject(2318, 2464.31641, -1993.49500, 12.83010,   0.00000, 0.00000, 273.00000);
			VarsForServer_B[TheftObjects][2] = CreateDynamicObject(2226, 2462.07129, -1993.50903, 14.22850,   0.00000, 0.00000, 89.73320);
			VarsForServer_B[TheftObjects][3] = CreateDynamicObject(19612, 2464.33716, -1992.87488, 12.55520,   0.00000, 0.00000, 273.00000);
			VarsForServer_B[TheftObjects][4] = CreateDynamicObject(2317, 2463.24487, -1994.83032, 12.79380,   0.00000, 0.00000, -181.00000);
			VarsForServer_B[TheftObjects][5] = CreateDynamicObject(19894, 2462.05054, -1993.58899, 13.37933,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][6] = CreateDynamicObject(2190, 2461.73413, -1994.31982, 14.22870,   0.00000, 0.00000, 69.00000);
			VarsForServer_B[TheftObjects][7] = CreateDynamicObject(1210, 2462.05811, -1994.38550, 13.81550,   -90.00000, 90.00000, 0.00000);
		}
		case 1: // Glen Park
		{
			/*VarsForServer_B[TheftObjects][8] = CreateDynamicObject(19894, 1883.99902, -1103.67212, 26.53940,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][9] = CreateDynamicObject(2190, 1882.51538, -1103.38501, 26.96020,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][10] = CreateDynamicObject(2226, 1882.37903, -1103.71655, 26.53930,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][11] = CreateDynamicObject(2028, 1883.22913, -1103.58301, 26.17510,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][12] = CreateDynamicObject(2406, 1884.82556, -1103.38086, 26.50650,   -10.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][13] = CreateDynamicObject(2404, 1884.84045, -1103.46558, 26.50650,   -10.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][14] = CreateDynamicObject(2317, 1881.81006, -1105.40955, 25.50040,   0.00000, 0.00000, -272.00000);
			VarsForServer_B[TheftObjects][15] = CreateDynamicObject(1210, 1883.69421, -1103.59460, 27.05610,   90.00000, 0.00000, 0.00000);*/
			RemoveItemFromWorld(VarsForServer_B[TheftObjects][0]);
			RemoveItemFromWorld(VarsForServer_B[TheftObjects][1]);
			RemoveItemFromWorld(VarsForServer_B[TheftObjects][2]);
			RemoveItemFromWorld(VarsForServer_B[TheftObjects][3]);
			RemoveItemFromWorld(VarsForServer_B[TheftObjects][4]);

		}
		case 2: // LS - Glen Park 2
		{
			VarsForServer_B[TheftObjects][16] = CreateDynamicObject(366, 2656.36938, -1977.93835, 14.76550,   -90.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][18] = CreateDynamicObject(19894, 2656.70264, -1978.76965, 14.25760,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][19] = CreateDynamicObject(2190, 2656.99731, -1978.43518, 14.66850,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][20] = CreateDynamicObject(2317, 2656.67725, -1979.59045, 14.92650,   0.00000, 0.00000, -91.00000);
			VarsForServer_B[TheftObjects][21] = CreateDynamicObject(1210, 2656.71362, -1979.43042, 14.35740,   90.00000, 0.00000, 68.00000);
			VarsForServer_B[TheftObjects][22] = CreateDynamicObject(2226, 2656.62109, -1979.59875, 13.82710,   0.00000, 0.00000, -91.00000);
			VarsForServer_B[TheftObjects][23] = CreateDynamicObject(2028, 2656.78320, -1978.42773, 13.90310,   0.00000, 0.00000, 32.00000);
			VarsForServer_B[TheftObjects][24] = CreateDynamicObject(2406, 2654.04907, -1978.78418, 14.22760,   -8.00000, 0.00000, 90.00000);
			VarsForServer_B[TheftObjects][25] = CreateDynamicObject(2404, 2654.04761, -1978.22327, 14.22760,   -8.00000, 0.00000, 90.00000);
		}
		case 3: // SF - Ocean Flats 1
		{
			VarsForServer_B[TheftObjects][26] = CreateDynamicObject(2406, -2626.15771, 89.99070, 4.54900,   -10.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][27] = CreateDynamicObject(2404, -2626.14429, 90.11400, 4.54900,   -10.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][28] = CreateDynamicObject(2190, -2627.63599, 90.44320, 4.99830,   0.00000, 0.00000, 90.00000);
			VarsForServer_B[TheftObjects][29] = CreateDynamicObject(2317, -2628.08179, 90.26720, 5.24350,   0.00000, 0.00000, -180.00000);
			VarsForServer_B[TheftObjects][30] = CreateDynamicObject(2028, -2629.10278, 90.14030, 4.64850,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][31] = CreateDynamicObject(2226, -2628.06250, 90.29410, 4.57740,   0.00000, 0.00000, 180.00000);
			VarsForServer_B[TheftObjects][32] = CreateDynamicObject(19894, -2627.47827, 90.18771, 4.14141,   0.00000, 0.00000, 0.00000);
			VarsForServer_B[TheftObjects][33] = CreateDynamicObject(1210, -2628.12427, 90.19320, 4.11740,   -90.00000, 0.00000, 30.20190);
			VarsForServer_B[TheftObjects][34] = CreateDynamicObject(366, -2629.34277, 90.26760, 5.09000,   90.00000, 0.00000, 347.61108);
			VarsForServer_B[TheftObjects][35] = CreateDynamicObject(19612, -2629.76929, 90.65035, 3.31170,   0.00000, 0.00000, 135.00000);
			VarsForServer_B[TheftObjects][36] = CreateDynamicObject(19317, -2628.25464, 90.26530, 3.67710,   -90.00000, 0.00000, 83.96570);
		}
	}
}
