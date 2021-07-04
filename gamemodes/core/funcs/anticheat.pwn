

stock AC_SetPlayerPos(playerid, Float:x,Float:y,Float:z)
{
	Player.Anticheat[playerid][CHEAT_TYPE_TELEPORT][@Inmunity] = gettime()+3;
	return SetPlayerPos(playerid,x,y,z);
}

#if defined _ALS_SetPlayerPos
        #undef SetPlayerPos
#else
        #define _ALS_SetPlayerPos
#endif
#define SetPlayerPos AC_SetPlayerPos


CheckPlayerTeleportHack(playerid)
{
	new current_time = gettime(), Float:distance, vehicleid = GetPlayerVehicleID(playerid);
    if(Anticheat.Info[CHEAT_TYPE_TELEPORT][@Enabled] == true)
    {
        if(current_time > Player.Anticheat[playerid][CHEAT_TYPE_TELEPORT][@Inmunity])
        {
            if(!vehicleid) distance = GetPlayerDistanceFromPoint(playerid, PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z]);
            if(floatabs(distance) > 30.0 && PlayerInfo[playerid][p_POS_Z] > -97.0)
            {
            	if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
            	{
            		return 1;
            	}
            }
        }
    }
    switch(GetPlayerState(playerid))
	{
		case PLAYER_STATE_ONFOOT:
		{
			if(Anticheat.Info[CHEAT_TYPE_TELEPORT][@Enabled])
			{
				if(current_time > Player.Anticheat[playerid][CHEAT_TYPE_TELEPORT][@Inmunity])
				{
					if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerSurfingObjectID(playerid) == INVALID_OBJECT_ID && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_ENTER_VEHICLE && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_EXIT_VEHICLE)
					{
						if(floatabs(distance) > 6.0 && PlayerInfo[playerid][p_POS_Z] > -97.0)
						{
							/*if(DetectarCheat(playerid, CHEAT_TP))
							{
								MensajeAdminEx(0xA9C4E4, ADMIN_LEVEL_BANEOS, "[PRUEBA] Jugador: %s (ID:%d) Distancia: %f / Animacion: %d / Ping: %d", Player.Info[playerid][@Name], playerid, dis, GetPlayerAnimationIndex(playerid), GetPlayerPing(playerid));
							}*/
							return 1;
						}
					}
				}
			}
		}
	}
    return 0;
}