/*IsPlayerInGarageHouseEnter(playerid)
{
	if(PlayerToPoint(2.0, playerid, 300.2313,311.6552,999.1484)) { return 1; }
	else if(PlayerToPoint(2.0, playerid, -2.2331,-335.5395,1546.3405)) { return 1; }
	return 0;
}

IsPlayerInVehicleGarageHouseInt(playerid)
{
	if(PlayerToPoint(3.0, playerid, 302.1481,302.8076,998.8281)) { return 1; }
	else if(PlayerToPoint(3.0, playerid, 19.0163,-322.5472,1546.3711)) { return 1; }
	return 0;
}*/

/*IsPlayerPosMessageActionI(playerid)
{
	foreach(new i : HouseIterator)
	{
		if (IsPlayerInRangeOfPoint(playerid,1,CasaInfo[i][cInteriorX], CasaInfo[i][cInteriorY], CasaInfo[i][cInteriorZ]) && PlayerInfo[playerid][pEnCasa] == CasaInfo[i][id_casa])
		{
			SendClientMessage(playerid, -1, "Cerca");
		}
	}
}*/

CheckPlayerAreaValid(playerid, type, id, typefunc, const text[], slot = 0)
{
	switch(type)
	{
		case 0:
		{
			if(PlayerInfo[playerid][p_PickedUpArea] == INVALID_AREAIT_ID)
			{
				PlayerInfo[playerid][p_PickedUpArea] = id;

				new string[58];
				format(string, sizeof(string), text);
				GetInteractiveAreaText(id, string);
				funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, string, slot);
			}		
		}
			
		case KEY_AREAIT_TYPE_YES:
		{
			if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] == INVALID_AREAIT_ID)
			{
				new string[58];
				format(string, sizeof(string), text);
				GetInteractiveAreaText(id, string);
				funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, string, 1);

				Player.Temp[playerid][@TypeInAreaY] = typefunc;
				PlayerInfoTemp[playerid][pt_PlayerInAreaY] = id;
			}
		}
	}
}

CancelPlayerAreaValid(playerid, type)
{
	switch(type)
	{
		case 0:
		{
			PlayerInfo[playerid][p_PickedUpArea] = INVALID_AREAIT_ID; 
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);
		}
	}
	return 1;
}