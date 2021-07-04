/*LoadPlayerDataS(playerid, data)
{
	switch(data)
	{
		case 2: // Works
		{
			new query[200];
			format(query, sizeof(query), "SELECT * FROM lac_user_wskills WHERE id_user = %d", PlayerInfo[playerid][pID]);
			mysql_tquery(conexion, query, "LoadPlayerDataDB", "ii", playerid, 2);
		}
	}
}*/

function LoadPlayerDataDB(playerid, data)
{
	new rows;
	cache_get_row_count(rows);
	switch(data)
	{
		case 2: // Work
		{
			for(new i; i < rows; i++ )
			{
				new work, level, exp;
				cache_get_value_name_int(i, "id_work", work);
				cache_get_value_name_int(i, "level", level);
				cache_get_value_name_int(i, "exp", exp);
				//SetPlayerConvSkillsDB(playerid, work, level, exp);
			}
		}
	}
	return 1;
}

LoadPlayerDataInventory(playerid)
{
	new query[200];
	format(query, sizeof(query), "SELECT * FROM `lac_user_inventory` WHERE `id_user` = %d;", PlayerInfo[playerid][pID]);
	mysql_tquery(conexion, query, "PlayerDataInventoryLoad", "i", playerid);
	return 1;
}

function PlayerDataInventoryLoad(playerid)
{
	new rows;
	cache_get_row_count(rows);
	for(new i = 0; i < rows; i++ )
	{
		new index, item, amount;
		cache_get_value_name_int(i, "index", index);
		cache_get_value_name_int(i, "item", item);
		cache_get_value_name_int(i, "amount", amount);

		if(index < 12)
		{
			PlayerInventory[playerid][index][invItem] = item;
			PlayerInventory[playerid][index][invAmount] = amount;
		}
		else
		{
	
			Player.InvEquiped[playerid][index-12][@Item] = item;
			Player.InvEquiped[playerid][index-12][@Amount] = amount;
	

		}
	}
	PlayerDataLoaded(playerid);
	return 1;
}

LoadPlayerDataSkills(playerid)
{
	new query[150];
	format(query, sizeof(query), "SELECT * FROM `lac_user_skills` WHERE `id_user` = %d;", PlayerInfo[playerid][pID]);
	mysql_tquery(conexion, query, "PlayerDataSkillsLoad", "i", playerid);
	return 1;
}

function PlayerDataSkillsLoad(playerid)
{
	new rows;
	cache_get_row_count(rows);
	for(new i = 0; i < rows; i++ )
	{
		new index;
		cache_get_value_name_int(i, "id_work", index);
		cache_get_value_name_int(i, "level", Player.WorkSkill[playerid][index-1][@Level]);
		cache_get_value_name_int(i, "skill", Player.WorkSkill[playerid][index-1][@Skill]);

	}
	PlayerDataLoaded(playerid);
	return 1;
}

LoadPlayerDataHouse(playerid)
{
	mysql_tquery_s(conexion, str_format("SELECT * FROM `lac_property_owner` WHERE `id_user` = %d;", PlayerInfo[playerid][pID]), "PlayerDataHouseLoad", "i", playerid);
	return 1;
}

function PlayerDataHouseLoad(playerid)
{
	new rows;
	cache_get_row_count(rows);
	for(new i = 0; i < rows; i++ )
	{
		new slot, index;
		cache_get_value_name_int(i, "slot", slot);
		cache_get_value_name_int(i, "index", index);

		PlayerInfo[playerid][p_HouseSlot][slot] = index;
	}
	PlayerDataLoaded(playerid);
	return 1;
}

stock SetPlayerLoginAccount(playerid)
{
	if(PlayerInfo[playerid][pBan] == 1)
	{
		new str[128];
		format(str, 128, "Tu Cuenta se encuentra baneada. Razón: %s.", PlayerInfo[playerid][pRazonBan]);
		SendClientMessage(playerid, COLOR_SAMP, str);
		Kick(playerid);
	}
	if(PlayerInfo[playerid][pCargos] > 0)
	{
		SetTimerEx("Encerrando",100,false,"dd",playerid, 0);
	}
	if(PlayerInfo[playerid][pTiempoCarcel] > 0)
	{
		SetTimerEx("Encerrando",100,false,"dd",playerid, 1);
	}
	if(PlayerInfo[playerid][pTimeSan] > 0)
	{
		San[playerid] = 1;
	}
	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pRopa], PlayerInfo[playerid][pPosx], PlayerInfo[playerid][pPosy], PlayerInfo[playerid][pPosz], 5, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	JugadorLogeado[playerid] = 1;

	SetPlayerScore(playerid, PlayerInfo[playerid][p_LEVEL]);
	GivePlayerMoney(playerid, PlayerInfo[playerid][pDinero]);
	SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
	SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);

	SpawnVehiclesPlayer(playerid);

	printf("Cargada de Datos del Usuario: %s Fuero Realizadas Correctamente.", PlayerName(playerid));
	
}