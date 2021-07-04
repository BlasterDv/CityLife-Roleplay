/*RemoveWeaponPlayerDB(playerid, weaponid)
{
	new query[127];
	format(query, sizeof(query), "DELETE FROM `lac_user_weapons` WHERE `id_user`=%d AND `weaponid`=%d", PlayerInfo[playerid][pID],weaponid);
	mysql_tquery(conexion, query);
}

AddWeaponPlayerDB(playerid, weaponid, type)
{
	new query[180];
	format(query, sizeof(query), "INSERT INTO `lac_user_weapons` (`id_user`, `weaponid`, `ammu`, `type`) VALUES (%d, %d, 9999999, %d) ON DUPLICATE KEY UPDATE `weaponid`=%d",
	PlayerInfo[playerid][pID], weaponid, type, weaponid);
	mysql_tquery(conexion, query);
}*/


/*SavePlayerWSkills(playerid)
{
	if(IsPlayerLogged(playerid)) return 0;
	
	new query[150];
	format(query, sizeof query, "DELETE FROM `lac_user_wskills` WHERE `id_user` = '%d';", PlayerInfo[playerid][pID]);
	mysql_tquery(conexion, query);
	
	for(new i = 0; i != 12; i ++)
	{

		query[0] = EOS;
		if(GetPlayerConvSkillsDB(playerid, i, 0) == 1 && GetPlayerConvSkillsDB(playerid, i, 1) != 0 || GetPlayerConvSkillsDB(playerid, i, 0) > 1)
		{
			format(query, sizeof query, "INSERT INTO `lac_user_wskills` (`id_user`, `id_work`, `level`, `exp`) VALUES (%d, %d, %d, %d);", PlayerInfo[playerid][pID], i, GetPlayerConvSkillsDB(playerid, i, 0), GetPlayerConvSkillsDB(playerid, i, 1));
			mysql_tquery(conexion, query);
		}
	}
	return 1;
}*/

SavePlayerInventoryItems(playerid)
{
	if(IsPlayerLogged(playerid)) return 0;
	
	mysql_tquery_s(conexion, str_format("DELETE FROM `lac_user_inventory` WHERE `id_user` = %d;", PlayerInfo[playerid][pID]));

	new query[150];
	
	for(new i = 0; i != MAX_PLAYER_INVENTORY_ITEMS; i ++)
	{
		query[0] = EOS;
		if(PlayerInventory[playerid][i][invItem] != 0)
		{
			format(query, sizeof query, "INSERT INTO `lac_user_inventory` (`id_user`, `index`, `item`, `amount`) VALUES (%d, %d, %d, %d);", PlayerInfo[playerid][pID], i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
			mysql_tquery(conexion, query);
		}
	}
	for(new i = 0; i != MAX_PLAYER_INV_ITEMS_EQUIPED; i ++)
	{
		query[0] = EOS;
		if(Player.InvEquiped[playerid][i][@Item] != 0)
		{
			format(query, sizeof query, "INSERT INTO `lac_user_inventory` (`id_user`, `index`, `item`, `amount`) VALUES (%d, %d, %d, %d);", PlayerInfo[playerid][pID], i + 12, Player.InvEquiped[playerid][i][@Item], Player.InvEquiped[playerid][i][@Amount]);
			mysql_tquery(conexion, query);
		}
	}

	return 1;
}

SavePlayerWorkSkills(playerid)
{
	if(IsPlayerLogged(playerid)) return 0;

	mysql_tquery_s(conexion, str_format("DELETE FROM `lac_user_skills` WHERE `id_user` = %d;", PlayerInfo[playerid][pID]));
	
	for(new i = 0; i != sizeof(Player_WorkSkill[]); i ++)
	{
		if(Player.WorkSkill[playerid][i][@Level] < 2 && Player.WorkSkill[playerid][i][@Skill] == 0) continue;
	
		mysql_tquery_s(conexion, str_format("INSERT INTO `lac_user_skills` (`id_user`, `id_work`, `level`, `skill`) VALUES (%d, %d, %d, %d);", PlayerInfo[playerid][pID], i+1, Player.WorkSkill[playerid][i][@Level], Player.WorkSkill[playerid][i][@Skill]));
	}

	return 1;
}

/*AddBuyNewPhoneUser(playerid, phonenumber)
{
	new query[180];
	format(query, sizeof(query), "INSERT INTO `lac_user_phone` (`id_user`, `phone_number`) VALUES (%d, %d)",
	PlayerInfo[playerid][pID], phonenumber);
	mysql_tquery(conexion, query);
}*/

SavePlayerWorkVehicle(playerid, vehicleid)
{
	//if(!IsPlayerLogged(playerid)) return 0;
	
	mysql_tquery_s(conexion, str_format("DELETE FROM `lac_uservehicles` WHERE `owner_id` = %d AND `type`=1;", PlayerInfo[playerid][pID]));

	if(CamionID[playerid] != INVALID_VEHICLE_ID)
	{
		new Float:vx,Float:vy,Float:vz,Float:va, Float:health;
		GetVehiclePos(CamionID[playerid], vx,vy,vz);
		GetVehicleZAngle(CamionID[playerid], va);
		GetVehicleHealth(CamionID[playerid], health);


		mysql_tquery_s(conexion, str_format("INSERT INTO `lac_uservehicles` \
			(`owner_id`, `modelid`, \
			`pos_x`, `pos_y`, `pos_z`, `pos_angle`, \
			`spawn_x`, `spawn_y`, `spawn_z`, `spawn_a`,\
			`type`, `color_1`, `color_2`, `health`, `gasoline`, `slot`) VALUES \
			('%d', '%d', \
			%f, %f, %f, %f, \
			%f, %f, %f, %f,\
			1, %d, %d, \
			%.1f, %d, 11);", 
			PlayerInfo[playerid][pID], Vehicles_Info[vehicleid][gi_vehicle_MODELID],
			vx,vy,vz,va, 
			vx,vy,vz,va,
			Vehicles_Info[vehicleid][gi_vehicle_COLOR1], Vehicles_Info[vehicleid][gi_vehicle_COLOR2],
			health, Vehicles_Info[vehicleid][gi_vehicle_GAS]));
	}
	return 1;
}

SavePlayerFactionFuncs(playerid)
{
	new query[305];
	new update_time = gettime();
	new faction_player = Player.Faction[playerid][@Index];
	format(query, sizeof query, "UPDATE `lac_facciones` SET `LastUserActivity`=%d WHERE `id` = %d", update_time, FactionCrew.Info[faction_player][@ID]);
	mysql_tquery(conexion, query);
}

SaveSlotInventoryToDB(playerid, i)
{
	if(PlayerInventory[playerid][i][invItem] != 0)
	{
		//mysql_tquery_s(conexion, str_format("DELETE FROM `lac_user_inventory` WHERE `id_user` = %d AND `index`=%d;"));
		mysql_tquery_s(conexion, str_format("INSERT INTO `lac_user_inventory` (`id_user`, `index`, `item`, `amount`) VALUES (%d, %d, %d, %d) ON DUPLICATE KEY UPDATE `id_user` = %d, `index`=%d, `item`=%d, `amount`=%d;", 
			PlayerInfo[playerid][pID], i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount],
			PlayerInfo[playerid][pID], i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]));
	}
}

stock RemoveSlotInventoryToDB(playerid, i)
{
	if(PlayerInventory[playerid][i][invItem] != 0)
	{
		new query[150];
		format(query, sizeof query, "DELETE FROM `lac_user_inventory` WHERE `id_user` = %d AND `index`=%d;", PlayerInfo[playerid][pID], i);
		mysql_tquery(conexion, query);
	}
}

// Player

SavePlayerSkinToDB(playerid, skinid)
{
	await mysql_aquery_s(conexion, str_format("SELECT `skinid` FROM `lac_player_skins` WHERE `id_user`=%d AND `skinid`=%d;", PlayerInfo[playerid][pID], skinid));

	new rows;
	cache_get_row_count(rows);

	if(rows)
	{	
		return 1;
	}

	mysql_tquery_s(conexion, str_format("INSERT INTO `lac_player_skins` (`id_user`, `skinid`, `date`) VALUES (%d, %d, CURRENT_TIMESTAMP);", PlayerInfo[playerid][pID], skinid));
	return 0;
}