#if !defined PAWNRAKNET_INC_
	#include <Pawn.RakNet>
#endif
/*#if !defined __MEMORY_INCLUDED__
	#include <memory>
#endif*/
#include <PawnPlus>

#if !defined MAX_PLAYER_GZ
	#define MAX_PLAYER_GZ 256
#endif

#define PLAYER_GZ_DEFAULT_COLOR 0xFFFFFFAA

static enum _:E_PLAYER_GZ_DATA
{
	Float:e_player_GZ_MinX,
	Float:e_player_GZ_MinY,
	Float:e_player_GZ_MaxX,
	Float:e_player_GZ_MaxY,
	e_player_GZ_Color,
	bool:e_player_GZ_Used,
	bool:e_player_GZ_Shown
}

//static stock g_PlayerGangZone[MAX_PLAYERS][MAX_PLAYER_GZ];
static stock Pool:PoolPlayerGangZone[MAX_PLAYERS];

static stock Pool:_GetPlayerGangZonePool(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_POOL;
    }

    if (!pool_valid(PoolPlayerGangZone[playerid])) {
        PoolPlayerGangZone[playerid] = pool_new();
    }

    return PoolPlayerGangZone[playerid];
}

static stock bool:_IsValidPerGangZone(playerid, id, &Pool:pool = INVALID_POOL) {
    pool = _GetPlayerGangZonePool(playerid);

    return pool_valid(pool) && pool_has(pool, id);
}

static stock bool:_GetPerGangZoneData(playerid, id, data[E_PLAYER_GZ_DATA], &Pool:pool = INVALID_POOL) {
    if (!_IsValidPerGangZone(playerid, id, pool)) {
        return false;
    }

    pool_get_arr(pool, id, data);
    return true;
}

static stock bool:_SetPerGangZoneData(playerid, id, const data[E_PLAYER_GZ_DATA]) {
    new Pool:pool;

    if (!_IsValidPerGangZone(playerid, id, pool)) {
        return false;
    }

    pool_set_arr(pool, id, data);
    return true;
}

stock CreatePlayerGangZone(playerid, Float:minx, Float:miny, Float:maxx, Float:maxy)
{
	/*new idx;

	for (new i = 0; i < MAX_PLAYER_GZ; ++i)
	{
		if(!g_PlayerGangZone[playerid][i])
		{
			idx = i;
			break;
		}
	}
	if(idx > MAX_PLAYER_GZ-1) return -1;*/

	//new UnmanagedPointer:slot = MEM_UM_new(E_PLAYER_GZ_DATA);
	/*if (!slot) {
		return -1;
	}*/
	new Pool:pool = _GetPlayerGangZonePool(playerid);

	new data[E_PLAYER_GZ_DATA];

	data[e_player_GZ_MinX] = minx;
	data[e_player_GZ_MinY] = miny;
	data[e_player_GZ_MaxX] = maxx;
	data[e_player_GZ_MaxY] = maxy;
	data[e_player_GZ_Color] = PLAYER_GZ_DEFAULT_COLOR;
	data[e_player_GZ_Used] = true;
	data[e_player_GZ_Shown] = false;

	//new slot = pool_add_arr(pool, data);
	//g_PlayerGangZone[playerid][idx] = slot;

	//MEM_UM_set_val(slot, e_player_GZ_MinX, _:minx);
	//MEM_UM_set_val(slot, e_player_GZ_MinY, _:miny);
	//MEM_UM_set_val(slot, e_player_GZ_MaxX, _:maxx);
	//MEM_UM_set_val(slot, e_player_GZ_MaxY, _:maxy);
	//MEM_UM_set_val(slot, e_player_GZ_Color, _:PLAYER_GZ_DEFAULT_COLOR);
	//MEM_UM_set_val(slot, e_player_GZ_Used, _:true);
	//MEM_UM_set_val(slot, e_player_GZ_Shown, _:false);

	return pool_add_arr(pool, data);


}

/*	if(idx > MAX_PLAYER_GZ-1) return -1;

	PlayerGangZoneData[playerid][idx][player_GZ_MinX]	= minx;
	PlayerGangZoneData[playerid][idx][player_GZ_MinY]	= miny;
	PlayerGangZoneData[playerid][idx][player_GZ_MaxX]	= maxx;
	PlayerGangZoneData[playerid][idx][player_GZ_MaxY]	= maxy;
	PlayerGangZoneData[playerid][idx][player_GZ_Color]	= PLAYER_GZ_DEFAULT_COLOR;
	PlayerGangZoneData[playerid][idx][player_GZ_Used]	= true;
	PlayerGangZoneData[playerid][idx][player_GZ_Shown]	= false;*/

	//return -1;
//}

stock PlayerGangZoneShow(playerid, gangzoneid, color = PLAYER_GZ_DEFAULT_COLOR)
{
	new Pool:pool = _GetPlayerGangZonePool(playerid);

	new data[E_PLAYER_GZ_DATA];
	//MEM_UM_get_arr(g_PlayerGangZone[playerid][gangzoneid], 0, data, E_PLAYER_GZ_DATA);
			//new data[E_VMENU_DATA];
	pool_get_arr(pool, gangzoneid/*g_PlayerGangZone[playerid][gangzoneid]*/, data);


	if(!(playerid, data[e_player_GZ_Used]) || gangzoneid > MAX_PLAYER_GZ-1 || gangzoneid < 0) return 0;

	//MEM_UM_set_val(g_PlayerGangZone[playerid][gangzoneid], e_player_GZ_Color, color);
	//MEM_UM_set_val(g_PlayerGangZone[playerid][gangzoneid], e_player_GZ_Shown, true);
	data[e_player_GZ_Color] = color;
	data[e_player_GZ_Shown] = true;

	_SetPerGangZoneData(playerid, gangzoneid/*g_PlayerGangZone[playerid][gangzoneid]*/, data);

	//PlayerGangZoneData[playerid][gangzoneid][player_GZ_Color] = color;
	//PlayerGangZoneData[playerid][gangzoneid][player_GZ_Shown] = true;
	new abgr_color = (((color << 16) | color & 0xFF00) << 8) | (((color >>> 16) | color & 0xFF0000) >>> 8);

	new BitStream:gz_bs = BS_New();
		
	BS_WriteValue(
		gz_bs,
		PR_UINT16, 1023 - gangzoneid,
		PR_FLOAT, data[e_player_GZ_MinX],
		PR_FLOAT, data[e_player_GZ_MinY],
		PR_FLOAT, data[e_player_GZ_MaxX],
		PR_FLOAT, data[e_player_GZ_MaxY],
		PR_UINT32, abgr_color
	);
		
	PR_SendRPC(gz_bs, playerid, 0x6C);
	BS_Delete(gz_bs);
	return 1;
}

stock PlayerGangZoneHide(playerid, gangzoneid)
{
	new Pool:pool = _GetPlayerGangZonePool(playerid);

	new data[E_PLAYER_GZ_DATA];
	//MEM_UM_get_arr(g_PlayerGangZone[playerid][gangzoneid], 0, data, E_PLAYER_GZ_DATA);
	pool_get_arr(pool, /*g_PlayerGangZone[playerid][gangzoneid]*/gangzoneid, data);

	if(!data[e_player_GZ_Used] || 
		!data[e_player_GZ_Shown]) return 0;

	//MEM_UM_set_val(g_PlayerGangZone[playerid][gangzoneid], e_player_GZ_Shown, false);
	data[e_player_GZ_Shown] = false;
	_SetPerGangZoneData(playerid, gangzoneid/*g_PlayerGangZone[playerid][gangzoneid]*/, data);

	new BitStream:gz_bs = BS_New();
		
	BS_WriteValue(
		gz_bs,
		PR_UINT16, 1023 - gangzoneid
	);
		
	PR_SendRPC(gz_bs, playerid, 0x78);
	BS_Delete(gz_bs);
	return 1;
}

stock PlayerGangZoneDestroy(playerid, gangzoneid)
{
	//new data[E_PLAYER_GZ_DATA];
	//new UnmanagedPointer:slot = g_PlayerGangZone[playerid][gangzoneid];
	new id = gangzoneid, data[E_PLAYER_GZ_DATA], Pool:pool;
	//if(!PlayerGangZoneData[playerid][gangzoneid][player_GZ_Used] || gangzoneid > MAX_PLAYER_GZ-1 || gangzoneid < 0) return 0;
	
	if (!_GetPerGangZoneData(playerid, id, data, pool)) {
        return 0;
    }

	if (data[e_player_GZ_Shown])	
		PlayerGangZoneHide(playerid, gangzoneid);

	pool_remove(pool, gangzoneid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new Pool:pool = _GetPlayerGangZonePool(playerid);

    if (pool_valid(pool)) {
         pool_delete(pool);
    }
	#if defined pGZ_OnPlayerDisconnect
		pGZ_OnPlayerDisconnect(playerid,  reason);
	#endif
	return 1;
}

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect pGZ_OnPlayerDisconnect
forward pGZ_OnPlayerDisconnect(playerid, reason);