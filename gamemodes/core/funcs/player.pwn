/*SetPlayerConfigOptions(playerid)
{
	return 1;
}*/

CheckPlayerNextLevel(playerid)
{				
	new nextlevel = CalcularExpNivel(playerid);
	if(PlayerInfo[playerid][p_EXP] < (nextlevel-1))
	{
		PlayerInfo[playerid][p_EXP]++;
		//SetPlayerProgressBarValue(playerid, Experiencia[playerid], PlayerInfo[playerid][p_EXP]);
		//ShowPlayerProgressBar(playerid, Experiencia[playerid]);

		new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_NEWEXPERIENCE, 27.0, 15);
		funct_CreateTextdrawTextNotif(playerid, i,0,"~g~+1 ~w~punto de experiencia.", 0);
		new barid = funct_CreatePlayerBarNotif(playerid, i, 0, 19.0, nextlevel);
		funct_SetValuePlayerBarNotif(playerid, barid, 0, PlayerInfo[playerid][p_EXP]);
		UpdateNotificationForPlayer(playerid, i);
	}
	else
	{
		funct_HideTextdrawNotif(playerid, VNOTI_TYPE_NEWEXPERIENCE);

		PlayerInfo[playerid][p_EXP] = 0;		
		PlayerInfo[playerid][p_LEVEL] += 1;
		SetPlayerScore(playerid, PlayerInfo[playerid][p_LEVEL]);
		new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_NEWEXPERIENCE, 40.0, 15);
		new string[48];
		format(string, sizeof(string), "~w~Felicidades subiste al~n~nivel ~g~%d~w~!", PlayerInfo[playerid][p_LEVEL]);
		funct_CreateTextdrawTextNotif(playerid, i,0,string, 0);
		new barid = funct_CreatePlayerBarNotif(playerid, i, 0, 32.0, nextlevel);
		funct_SetValuePlayerBarNotif(playerid, barid, 0, PlayerInfo[playerid][p_EXP]);
		UpdateNotificationForPlayer(playerid, i);
	}
}

PlayerDataLoaded(playerid)
{
	PlayerInfoTemp[playerid][pt_DATA_LOADED_COUNT]++;
	if(PlayerInfoTemp[playerid][pt_DATA_LOADED_COUNT] != 4) return 1;

	if(PlayerInfo[playerid][p_INTERIOR_TYPE] == PLAYER_INTERIOR_PROPERTY)
	{
		if(!CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cInteriorLoaded])
		{
			House_PlayerLoadInterior(PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);
		}
		CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cPlayersInHouse]++;
	}

	StopAudioStreamForPlayer(playerid);

	Streamer_UpdateEx(PlayerInfo[playerid][pRopa], PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z], PlayerInfo[playerid][pVirtualWorld], PlayerInfo[playerid][pInterior]);
	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pRopa], PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z], 5, 0, 0, 0, 0, 0, 0);

	//SpawnVehiclesPlayer(playerid);
	LoadPlayerDataOptions(playerid);

	PlayerInfoTemp[playerid][pt_IsLoggedIn] = true;
	
    TogglePlayerSpectating(playerid, false);

    printf("%s (ID: %d) todo se cargo correctamente.", PlayerInfoTemp[playerid][pt_Name], playerid);
	return 1;
}

LoadPlayerDataOptions(playerid)
{
	if(Player.Temp[playerid][@RentVehicle] != -1)
	{
		new i = funct_AddTextDrawNotifBoxEx(playerid, VNOTI_TYPE_RENTEDVEHICLE, 52.0, 0);
		funct_CreateTextdrawTextNotifEx(playerid, i, 0, "", 1, 0.0, 1.0, 0.240, 1.2);
		funct_CreateTextdrawTextNotifEx(playerid, i, 1, "Mantén pulsado 2 para desrentar~n~el vehículo.", 1, 0.0, 28.0 ,VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2);

		UpdateNotificationForPlayer(playerid, i);
	}
	if(PlayerInfo[playerid][p_AnalgesicEffect] != 0)
	{
		new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_ANALGESICEFFECT, true, 27.0);
		funct_CreateTextdrawTextNotif(playerid, i, 0, "Efecto de la curación", 0.0);
		new barid = funct_CreatePlayerBarNotif(playerid, i, 0, 20.0, 100.0);
		funct_SetValuePlayerBarNotif(playerid, barid, 0, PlayerInfo[playerid][p_AnalgesicEffect]);
		UpdateNotificationForPlayer(playerid, i);
	}
	return 1;
}

PlayerFirstDataLoaded(playerid)
{
	if(PlayerInfo[playerid][p_SyncUpdate] < SERVER_BUILD)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
		PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("Timer_PlayerNewUpdate", 100, false, "id", playerid, 0);
		return 1;
	}

	PlayerFirstDataLoadedContinue(playerid);
	return 1;
}

PlayerFirstDataLoadedContinue(playerid)
{
	new query[128];
	format(query, sizeof(query), "UPDATE `lac_users` SET `Online`=1, `InGameID`=%d WHERE `id` = %d;", playerid, PlayerInfo[playerid][pID]);
	mysql_tquery(conexion, query);


	SpawnVehiclesPlayer(playerid);

	if(PlayerInfo[playerid][p_FactionMember] != 0)
	{
		new bool:search_faction;

		for(new i = 0; i < MAX_FACTION; i++)
		{
			if(PlayerInfo[playerid][p_FactionMember] == FactionCrew.Info[i][@ID])
			{
				Player.Faction[playerid][@Valid] = true;
				Player.Faction[playerid][@Index] = i;
				Player.Temp[playerid][@SelectedFactionID] = PlayerInfo[playerid][p_FactionMember];
				FactionCrew.Info[i][@OnlineMemb]++;
				search_faction = true;

				break;
			}
		}
		if(search_faction == false)
		{
			new DB_Query[128];
			new id_faction = FindUnloadFactionInactive();
				
			new update_time = gettime();
			ResetDataFactionInactive(id_faction);
			format(query, sizeof query, "UPDATE `lac_facciones` SET `LastUserActivity`=%d, `State`=0 WHERE `id` = %d;", update_time, FactionCrew.Info[id_faction][@ID]);
			mysql_tquery(conexion, query);

			Player.Faction[playerid][@Valid] = true;
			Player.Faction[playerid][@Index] = id_faction;
			//Player.Temp[playerid][@SelectedFactionID] = id_faction;
			FactionCrew.Info[id_faction][@OnlineMemb]++;

			format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_facciones` WHERE `id` = %d;", PlayerInfo[playerid][p_FactionMember]);
			mysql_tquery(conexion, DB_Query, "LoadDataPlayerFaction", "ii", playerid, id_faction);
			
		}
		FactionWarnGrafiti(playerid);
	}

	//LoadPlayerDataS(playerid,1);
	//LoadPlayerDataS(playerid,2);
	//LoadPlayerDataS(playerid,3);
	//LoadPlayerDataS(playerid,4);
	LoadPlayerDataInventory(playerid);
	LoadPlayerDataSkills(playerid);
	LoadPlayerDataHouse(playerid);
}

AddPlayerBan(player_id, player_ip[], admin_id, type, reason[], time = 0)
{
	new DB_Query[500];
	
	if(!time)
	{
		mysql_format(conexion, DB_Query, sizeof DB_Query, 
			
			"\
			INSERT INTO `lac_bad_history` (`id_user`, `type`, `id2`, `text`, `date`) VALUES('%d', '%d', '%d', '%e', current_timestamp);\
			INSERT INTO `lac_banned` (`id_user_ban`, `IP`, `id_history`, `expire_date`) SELECT '%d', '%e', MAX(`id`), 0 FROM `lac_bad_history`;",
			
			player_id, type, admin_id, reason,
			player_id, player_ip 

		);
	}
	else
	{
		new unix_days;
		unix_days = time * 60;
		mysql_format(conexion, DB_Query, sizeof DB_Query, 
			
			"\
			INSERT INTO `lac_bad_history` (`id_user`, `type`, `id2`, `text`, `date`) VALUES('%d', '%d', '%d', '%e', current_timestamp);\
			INSERT INTO `lac_banned` (`id_user_ban`, `IP`, `id_history`, `expire_date`) SELECT '%d', '%e', MAX(`id`), FROM_UNIXTIME(UNIX_TIMESTAMP() +%d) FROM `lac_bad_history`;\
			",
			
				player_id, type, admin_id, reason,
				player_id, player_ip, unix_days
				
		);
	}
	printf("XD: %s", DB_Query);
	mysql_tquery(conexion, DB_Query);
}

function PlayerBannedCheck(playerid, logged)
{
	new DB_Query[550];
	new count;
	cache_get_row_count(count);
	if(count > 0)
	{
		new now[24], id, expire_date[24], type, by, text[128], date[24];
		
		cache_get_value_name(0, "NOW", now, 24);
		cache_get_value_name_int(0, "id_user_ban", id);
		cache_get_value_name(0, "expire_date", expire_date, 24);
		cache_get_value_name_int(0, "type", type);
		cache_get_value_name_int(0, "id2", by);
		cache_get_value_name(0, "text", text, 128);
		cache_get_value_name(0, "date", date, 24);
		
		if(type == 2)
		{
			new string[128];
			format(string, sizeof string, "{00C0FF}Te encuentras baneado permanentemente:");
			SendClientMessage(playerid, -1, string);
			format(string, sizeof string, "Nombre: {00C0FF}%s", PlayerInfoTemp[playerid][pt_Name]);
			SendClientMessage(playerid, -1, string);
			format(string, sizeof string, "Fecha expulsión: {00C0FF}%s", date);
			SendClientMessage(playerid, -1, string);
			format(string, sizeof string,"Razón: {00C0FF}%s", text);
			SendClientMessage(playerid, -1, string);				
							
			KickEx(playerid, 500);
		}
		
		else if(type == 3)
		{
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_banned` WHERE (`id_user_ban` = %d OR `IP` = '%q') AND current_timestamp >= `expire_date`;", id, PlayerInfoTemp[playerid][pt_IP]);
			mysql_tquery(conexion, DB_Query, "CheckTempBanned", "iiissss", playerid, id, by, date, text, now, expire_date);
			return 1;
		}
	}
	if(PlayerInfoTemp[playerid][pt_KICKED]) return 1;
	if(logged == 0) { CheckPlayerData(playerid); }
	return 1;
}

forward CheckTempBanned(playerid, name, by, date[], text[], now[], expire_date[], logged);
public CheckTempBanned(playerid, name, by, date[], text[], now[], expire_date[], logged)
{
	new DB_Query[550];
	new count;
	cache_get_row_count(count);
	if(count > 0)
	{
		format(DB_Query, sizeof DB_Query, "DELETE FROM `lac_banned` WHERE (`id_user_ban` = '%d' OR `IP` = '%q');", name, PlayerInfoTemp[playerid][pt_IP]);
		mysql_tquery(conexion, DB_Query);
	}
	else
	{
		new string[128];
		format(string, sizeof string, "{00C0FF}Te encuentras baneado temporalmente.");
		SendClientMessage(playerid, -1, string);
		format(string, sizeof string, "Fecha expulsión: {00C0FF}%s", date);
		SendClientMessage(playerid, -1, string);
		format(string, sizeof string, "Expira: {00C0FF}%s", expire_date);
		SendClientMessage(playerid, -1, string);
		format(string, sizeof string,"Razón: {00C0FF}%s", text);
		SendClientMessage(playerid, -1, string);				
		
		KickEx(playerid, 500);
	}
	
	if(PlayerInfoTemp[playerid][pt_KICKED]) return 1;
	if(logged == 0) { CheckPlayerData(playerid); }
	
	return 1;
}
	
CheckPlayerData(playerid)
{
	//new DB_Query[550];
	//PLAYER_TEMP[playerid][pt_USER_VALID_NAME] = true;
	//SetRolePlayNames(playerid);
	//CargarDatos(playerid);

	new Query[128];
	format(Query, sizeof(Query), "SELECT * FROM `lac_users` WHERE `name` = '%q';", PlayerInfoTemp[playerid][pt_Name]);
    mysql_tquery(conexion, Query, "CargarDatos", "i", playerid);
	
	return 1;
}

SendDeathToPlayer(playerid)
{
	rBit1_Set(b1_PlayerTemp[b1pt_InInmune], playerid, true);
	
	SetTimerEx("TransitionDeathForPlayer", 4000, false, "i", playerid);
	
	if(!IsPlayerInAnyVehicle(playerid))
	{
		SetHealth(playerid, 2.0);
		ApplyAnimationEx(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, false, 0, false);	
	}
	else
	{
		RemovePlayerFromVehicle(playerid);
	}
}

SendDeathPlayerMessage(playerid, killerid)
{
	if(killerid == INVALID_PLAYER_ID) return 0;

	new Float:x, Float:y, Float:z;
	GetPlayerPos(killerid, x,y,z);
	new Float: fDistance = GetPlayerDistanceFromPoint(playerid, x, y, z);

	new string[80];
	format(string, sizeof(string), "%s te daño con %s a %0.0f metros.", PlayerInfo[killerid][p_Name], InvObjectData[GetInvValueItemSelected(killerid)][E_INV_NAME], fDistance);
	CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_KILLERPLAYER, string, 15);

	return 0;
}

PlayerProgressTutorial(playerid, bool:progress = false)
{
	if(progress) 
	{ 
		PlayerInfo[playerid][p_Tutorial]++;

		funct_HideTextdrawNotif(playerid, VNOTI_TYPE_TUTORIAL1);

		new Query[140];
		format(Query, sizeof(Query), "UPDATE `lac_users` SET `tutorial`= %d WHERE `id`=%d;", PlayerInfo[playerid][p_Tutorial], PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, Query);
	}

	switch(PlayerInfo[playerid][p_Tutorial])
	{
		case 0:
		{
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_TUTORIAL1, "Sube a un vehículo y presiona la tecla 2 para encender el motor.");
		}
		case 1:
		{
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_TUTORIAL1, "~w~Presiona ~g~~h~~k~~PED_SPRINT~ + ~k~~CONVERSATION_YES~ ~w~para~n~desbloquear o bloquear tu~n~vehículo.", 20, false);
		}
	}
	return 1;
}

// Register
AddPlayerMessageNotification(playerid, player_id, type, const text[])
{
	new Query[300];
	if(type == 1)
	{
		mysql_format(conexion, Query, sizeof Query,
		"\
			INSERT INTO `lac_user_notifications`\
			(\
				`id_user`, `type`, `extra`, `date`, `body`\
			)\
			VALUES\
			(\
				%d, %d, %d, CURRENT_TIMESTAMP, '%e'\
			);\
		",
			player_id, type, PlayerInfo[playerid][pID], text);
	}
	else
	{
		mysql_format(conexion, Query, sizeof Query,
		"\
			INSERT INTO `lac_user_notifications`\
			(\
				`id_user`, `type`, `date`, `body`\
			)\
			VALUES\
			(\
				%d, %d, CURRENT_TIMESTAMP, '%e'\
			);\
		",
			player_id, type, text);
	}
	mysql_tquery(conexion, Query);

	format(Query, sizeof(Query), "DELETE n FROM `lac_user_notifications` n LEFT JOIN(SELECT `id_notification` FROM `lac_user_notifications` ORDER BY `id_notification` DESC \
		LIMIT 20) s ON n.`id_notification` = s.`id_notification` WHERE `id_user`=%d and s.`id_notification` IS NULL;", player_id);
	mysql_tquery(conexion, Query);
	return 1;
}

// Show

ShowPlayerDialogNotifications(playerid)
{
	DynamicDgui_Start(playerid);

	new dialog[700], item_string[128];

	strcat(dialog, "{5EB5FF}Mensaje\t{5EB5FF}Fecha\n");

	//new query[250];
	//format(query, sizeof(query), "SELECT UNIX_TIMESTAMP(n.`date`) AS `date_unix`, n.`id_notification`, n.`type`, n.`id_user`, n.`body` FROM `lac_user_notifications` n, `lac_users` u WHERE n.`id_user`=%d AND u.`id`=n.`id_user` ORDER BY `date` DESC LIMIT 24;", PlayerInfo[playerid][pID]);
	await mysql_aquery_s(conexion, str_format("SELECT UNIX_TIMESTAMP(n.`date`) AS `date_unix`, n.`id_notification`, n.`type`, n.`id_user`, n.`body` FROM `lac_user_notifications` n, `lac_users` u WHERE n.`id_user`=%d AND u.`id`=n.`id_user` ORDER BY `date` DESC LIMIT 24;", PlayerInfo[playerid][pID]));

	new rows, listitem;
	cache_get_row_count(rows);
	if(rows)
	{
		for(new i = 0; i < rows; i++)
		{
			new body[128], string_extract[44], type, id_notification, date;

			cache_get_value_name_int(i, "id_notification", id_notification);
			cache_get_value_name_int(i, "type", type);
			cache_get_value_name(i, "body", body, 128);
			cache_get_value_name_int(i, "date_unix", date);

			new time_format[18];

			ConverTime_TimeElapsed(date, time_format);

			new leng = strlen(body);
			//printf("Leng: %d", leng);
			if(leng > 40)
			{
				strmid(string_extract, body, 0, (0 + leng));
				format(body, sizeof(body), "%s...", string_extract);
			}

			format(item_string, sizeof(item_string), "%s\t%s.\n", body, time_format);
			strcat(dialog, item_string);
			DynamicDgui_AddVarEx(playerid, listitem, id_notification);
			listitem++;

		}
		Dialog_Show(playerid, dPlayerViewNotif, DIALOG_STYLE_TABLIST_HEADERS, "{5EB5FF}Notificaciones", dialog, "Ver", "Salir");
	}
	return 1;
}

// Dynamic Data
stock List:_GetPlayerDataList(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_LIST;
    }

    if (!list_valid(Player.Temp[playerid][@DataList])) {
        Player.Temp[playerid][@DataList] = list_new();

    }

    return Player.Temp[playerid][@DataList];
}

stock GetPlayerDataListQuiz(playerid, id, data[E_FAC_QUIZ_PLAYER_DATA], &List:list = INVALID_LIST) {
    if (!_IsValidListPlayerQuiz(playerid, id, list)) {
        return 0;
    }
    list_get_arr(list, id, data);
    return 1;
}

stock _IsValidListPlayerQuiz(playerid, id, &List:list = INVALID_LIST) {
    list = _GetPlayerDataList(playerid);

    return list_valid(list) && list_size(list) > id && list_sizeof(list, id) != 0;
}

ResetPlayerDataListQuiz(playerid)
{
	new List:m = _GetPlayerDataList(playerid), data[E_FAC_QUIZ_PLAYER_DATA];

	if (list_valid(m)) 
	{
		for (new Iter:id = list_iter(m); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);

			str_delete(data[E_FAC_QUIZ_STRING]);
			str_delete(data[E_FAC_QUIZ_STRINGDB]);
		}
		list_delete_deep(m); 
	}

	Player.Temp[playerid][@FactionQuiz] = -1;
	Player.Temp[playerid][@FactionQuizCount] = 0;
	Player.Temp[playerid][@FactionSelectExID] = 0;
}

stock GetPlayerDataListGene(playerid, id, data[E_FAC_GENE_PLAYER_DATA], &List:list = INVALID_LIST) {
    if (!_IsValidListPlayerQuiz(playerid, id, list)) {
        return 0;
    }
    list_get_arr(list, id, data);
    return 1;
}

/*stock _IsValidListPlayerGene(playerid, id, &List:list = INVALID_LIST) {
    list = _GetPlayerDataList(playerid);

    return list_valid(list) && list_size(list) > id && list_sizeof(list, id) != 0;
}*/

stock SetPlayerGeneListData(playerid, id, const data[E_FAC_GENE_PLAYER_DATA]) {
    new List:list;

    if (!_IsValidListPlayerQuiz(playerid, id, list)) {
        return false;
    }

    list_set_arr(list, id, data);
    return 1;
}

ResetPlayerDataListGene(playerid)
{
	new List:m = _GetPlayerDataList(playerid), data[E_FAC_GENE_PLAYER_DATA];

	if (list_valid(m)) 
	{
		for (new Iter:id = list_iter(m); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);

			str_delete(data[E_FAC_GENE_STRING]);
		}
		list_delete(m); 
	}
}

//

forward OnPlayerChangePassChecked(playerid, bool:success);
public OnPlayerChangePassChecked(playerid, bool:success)
{
   // new Query[228];
  //  new bool:success = bcrypt_is_equal();

    if(success)
    {
		Dialog_Close(playerid);
		DialogConfigPlayer(playerid);
    }
    else
    {
    	Dialog_Close(playerid);
    	ShowPlayerInfoTextdraw(playerid, "~r~Contraseña incorrecta.", 2000);
    }
    return 1;
}

// Other

SetPlayerHealthAnalgesic(playerid)
{
	PlayerInfo[playerid][p_AnalgesicEffect] += 20;

	new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_ANALGESICEFFECT, true, 27.0);

	funct_CreateTextdrawTextNotif(playerid, i, 0, "Efecto de la curación", 0.0);
	new barid = funct_CreatePlayerBarNotif(playerid, i, 0, 20.0, 100.0);
	funct_SetValuePlayerBarNotif(playerid, barid, 0, PlayerInfo[playerid][p_AnalgesicEffect]);

	UpdateNotificationForPlayer(playerid, i);
	return 1;
}