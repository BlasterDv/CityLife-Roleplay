/* Last Modified. By Blaster 04/03/2019 */

/*CheckPlayerFactionLoad(playerid)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		new i = FindUnloadFactionInactive();
		format(query, sizeof query, "SELECT * FROM `lac_facciones` WHERE `id` = %d", PlayerInfo[playerid][p_FactionMember]);
		mysql_tquery(conexion, query, "LoadDataPlayerFaction", "d", i);
		Player.Faction[playerid][@Index] = i;
	}
	else
	{
		for(new i = 0; i < MAX_FACTION; i++)
		{
			if(FactionCrew.Info[i][@ID] == PlayerInfo[playerid][p_FactionMember])
			{
				Player.Faction[playerid][@Index] = i;
			}
		}
	}
}*/

FindUnloadFactionInactive()
{
	new id = -1;
	for(new i = MAX_FACTION-1, end = 0; end < i; --i )
	{
		if(FactionCrew.Info[i][@OnlineMemb] == 0)
		{
			//printf("LOL2: %d",i);
			id = i;
			break;
		}
	}
	return id;
}

/*GetFreeFactionID()
{
	for(new i = 0; i < MAX_FACTION; i++)
	{
		if(FactionCrew.Info[i][@ID] == 0)
		{
			return i;
		}
	}
}*/

ResetDataFactionInactive(factionid)
{
	new tmp_Faction_Enum[E_FACTIONCREW_INFO]; FactionCrewInfo[factionid] = tmp_Faction_Enum;

	new tmp_Faction_Rank_Info[E_FACTIONCREW_INFO_RANKS];
	for(new i = 0; i != MAX_FACTION_RANKS; i ++) FactionCrewRank[ factionid ][i] = tmp_Faction_Rank_Info;
}

function LoadDataPlayerFaction(playerid, id)
{
	new rows;
	new DB_Query[128];

	cache_get_row_count(rows);
	if(rows)
	{
		FactionCrew.Info[id][@Valid] = true;
		cache_get_value_name_int(0, "id", FactionCrew.Info[id][@ID]);
		cache_get_value_name(0, "Name", FactionCrew.Info[id][@Name],32);
		cache_get_value_name_int(0, "Points", FactionCrew.Info[id][@Points]);
		cache_get_value_name_int(0, "Color", FactionCrew.Info[id][@Color]);
		cache_get_value_name_int(0, "LastUserActivity", FactionCrew.Info[id][@LastActivity]);

		Player.Temp[playerid][@SelectedFactionID] = FactionCrew.Info[id][@ID];
	}
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_faction_ranks` WHERE `id_faction` = '%d' LIMIT %d;", FactionCrew.Info[id][@ID], MAX_FACTION_RANKS);
	mysql_tquery(conexion, DB_Query, "LoadRanksFactionDB", "d", id);
	return 1;
}

CargarFacciones()
{
	new Cache:consult;
	new DB_Query[128];
	consult = mysql_query(conexion, "SELECT * FROM `lac_facciones` ORDER BY `fixed_load` DESC, `Points` DESC LIMIT 80;");
	cache_set_active(consult);
	
	new total_factions, rows;
	cache_get_row_count(rows);

	for(new i = 0; i < rows; i++)
	{
		cache_set_active(consult);
		if(total_factions >= MAX_FACTION)
		{
			break;
		}
		FactionCrew.Info[total_factions][@Valid] = true;
		cache_get_value_name_int(i, "id", FactionCrew.Info[total_factions][@ID]);
		cache_get_value_name(i, "Name", FactionCrew.Info[total_factions][@Name],32);
		cache_get_value_name_int(i, "Points", FactionCrew.Info[total_factions][@Points]);
		cache_get_value_name_int(i, "Color", FactionCrew.Info[total_factions][@Color]);
		cache_get_value_name_int(i, "LastUserActivity", FactionCrew.Info[total_factions][@LastActivity]);
	
		format(DB_Query, sizeof DB_Query, "SELECT COUNT(*) FROM `lac_users` WHERE `faction_id` = '%d';", FactionCrew.Info[total_factions][@ID]);
		mysql_tquery(conexion, DB_Query, "FactionCrew_MembersCount", "i", total_factions);

		new Cache:Result_ranks, count_ranks;
		format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_faction_ranks` WHERE `id_faction` = '%d' LIMIT %d;", FactionCrew.Info[total_factions][@ID], MAX_FACTION_RANKS);
		Result_ranks = mysql_query(conexion, DB_Query);
		cache_set_active(Result_ranks);
		
		cache_get_row_count(count_ranks);
		for(new x = 0; x < count_ranks; x ++)
		{
			cache_set_active(Result_ranks);
			new pos;
			cache_get_value_name_int(x, "rank_pos", pos);
			if(pos < 0 || pos > MAX_FACTION_RANKS) continue;
			
			FactionCrew.Rank[total_factions][pos][@Valid] = true;
			cache_get_value_name_int(x, "id", FactionCrew.Rank[total_factions][pos][@ID]);
			cache_get_value_name(x, "RankName", FactionCrew.Rank[total_factions][pos][@Name], 21);
		
			new Cache:Result_ranks_permissions, count_ranks_permissions;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_faction_rank_perm` WHERE `id_rank` = %d;", FactionCrew.Rank[total_factions][pos][@ID]);
			Result_ranks_permissions = mysql_query(conexion, DB_Query);
			cache_set_active(Result_ranks_permissions);
			
			cache_get_row_count(count_ranks_permissions);
			if(count_ranks_permissions)
			{
				for(new z = 0; z < 4; z ++)
				{				
					new query[19];
					format(query, sizeof(query), "permission_%d", z);
					cache_get_value_name_int(0, query, FactionCrew.Rank[total_factions][pos][@Permission][z]);
				}
			}
			cache_delete(Result_ranks_permissions);
		
			FactionAssignValueForPermission(total_factions, pos);
		}
		cache_delete(Result_ranks);

		format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_faction_questions` WHERE `id_faction` = '%d' LIMIT %d;", FactionCrew.Info[total_factions][@ID], MAX_FACTION_RANKS);
		mysql_tquery(conexion, DB_Query, "LoadQuestionsFactionDB", "d", total_factions);

		format(DB_Query, sizeof DB_Query, "UPDATE `lac_facciones` SET `GameSlot`=%d, `State`=1 WHERE `id` = '%d';", total_factions, FactionCrew.Info[total_factions][@ID]);
		mysql_query(conexion, DB_Query, false);

		FactionCrew.Info[ total_factions ][@GrafSlot] = -1;

		total_factions++;
	}
	cache_delete(consult);

	count_factions_loaded = total_factions;
	printf("Facciones cargadas: %d", count_factions_loaded);
	return 1;
}

function LoadRanksFactionDB(faction)
{
	new count;
	cache_get_row_count(count);

	for(new x = 0; x < count; x ++)
	{
		//printf("Count Ranks: %d", count);

		new pos;
		cache_get_value_name_int(x, "rank_pos", pos);
		if(pos < 0 || pos > MAX_FACTION_RANKS) continue;

		FactionCrew.Rank[faction][pos][@Valid] = true;
		cache_get_value_name_int(x, "id", FactionCrew.Rank[faction][pos][@ID]);
		cache_get_value_name(x, "RankName", FactionCrew.Rank[faction][pos][@Name], 21);

		FactionAssignValueForPermission(faction, pos);
	}
}

function LoadQuestionsFactionDB(faction)
{
	new count, count_quiz;
	cache_get_row_count(count);

	for(new x = 0; x < count; x ++)
	{
		cache_get_value_name_int(x, "id_question", FactionCrew.Question[faction][count_quiz][@ID]);
		Iter_Add(FactionQuestionIter[faction], count_quiz);
		count_quiz++;	
	}

//	printf("[DEBUG MESSAGE]: Count Questions %d", count_quiz);
}

function FactionCrew_MembersCount(faction)
{
	new count_members;
		
	cache_get_row_count(count_members);
	if(count_members) cache_get_value_index_int(0, 0, FactionCrew.Info[faction][@Members]);
}

function OnFactionGetDataQuestion(playerid, count)
{
	new rows;
	cache_get_row_count(rows);

	new List:m = _GetPlayerDataList(playerid);
	new data[E_FAC_QUIZ_PLAYER_DATA];
	
	for (new i; i < rows; i++)
	{
		new body[64], db_id;

		cache_get_value_name_int(i, "id_question", db_id);
		cache_get_value_name(i, "body", body, 64);
		

		//new caption[28], info[70];

		//format(caption, sizeof(caption), "{00C0FF}Preguntas - %d/%d", (Player.Temp[playerid][@FactionQuiz]+1), Iter_Count(FactionQuestionIter[ Player.Temp[playerid][@SelectedFactionID] ]));
		//format(info, sizeof(info), "{FFFFFF}%s", body);

		data[E_FAC_QUIZ_STRINGDB] = str_acquire(str_new(body));
		data[E_FAC_QUIZ_STRING] = str_acquire(str_new(""));
		data[E_FAC_QUIZ_DBID] = db_id;

		list_add_arr(m, data, i);

		Player.Temp[playerid][@FactionQuizCount]++;
		
	}
	Player.Temp[playerid][@FactionQuiz] = 0;
	ShowDialogEx(playerid, DIALOG_FACTION_QUIZ_NEXT);

	/*else
	{
		if(Player.Temp[playerid][@SelectedFactionID] != Player.Temp[playerid][@FactionSelectExID]) return ShowPlayerInfoTextdraw(playerid, "~r~Error.", 1000);

		new DB_Query[340];
		format(DB_Query, sizeof DB_Query,
		"INSERT INTO `lac_faction_requests` (`id_faction`, `type`, `id_user`, `date`) VALUES (%d, 0, %d, CURRENT_TIMESTAMP);", FactionCrew.Info[ Player.Temp[playerid][@SelectedFactionID] ][@ID], PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, DB_Query, "RegisterNewFacRequestID", "i", playerid);
	}*/
	return 1;
}

function LoadFactionConfirmQuiz(playerid, faction)
{
	new caption[128], info[214*10];
	new data[E_FAC_QUIZ_PLAYER_DATA];

	//cache_get_row_count(rows);

	strcat(info, "{FFFFFF}");

	for(new i = 0; i < Player.Temp[playerid][@FactionQuizCount]; i++)
	{

		if (!GetPlayerDataListQuiz(playerid, i, data)) {
       		return 0;
       	}
       	new body[64];
       	str_get(data[E_FAC_QUIZ_STRINGDB], body, sizeof(body));
       	if(i == 0)
		{
			format(caption, sizeof(caption), "%s\n", body);
			strcat(info, caption);
		}
		else
		{
			format(caption, sizeof(caption), "\n%s\n", body);
			strcat(info, caption);
		}

       	str_get(data[E_FAC_QUIZ_STRING], caption, sizeof(caption));
		format(caption, sizeof(caption), "{00C0FF}— {FFFFFF}%s", caption);
		strcat(info, caption);

		
	}
	Dialog_Show(playerid, SendRequestFaction, DIALOG_STYLE_MSGBOX, "{00C0FF}Enviar solicitud", info, "Enviar", "Limpiar");
	return 1;
}

function LoadFactionPlayerQuizInfo(playerid, faction)
{
	new rows, caption[128], info[214*10];

	cache_get_row_count(rows);

	strcat(info, "{FFFFFF}");

	for(new i = 0; i < rows; i++)
	{
		new body[64];

		cache_get_value_name(i, "body", body, 64);
		
		//format(caption, sizeof(caption), "{00C0FF}Preguntas - %d/%d", (Player.Temp[playerid][@FactionQuiz]+1), Iter_Count(FactionQuestionIter[ Player.Temp[playerid][@SelectedFactionID] ]));
		if(i == 0)
		{
			format(caption, sizeof(caption), "%s\n", body);
			strcat(info, caption);
		}
		else
		{
			format(caption, sizeof(caption), "\n%s\n", body);
			strcat(info, caption);
		}

		//str_get(String:list_get(m, i), caption, sizeof(caption));

		cache_get_value_name(i, "reply_body", caption, 128);
		format(caption, sizeof(caption), "{00C0FF}— {FFFFFF}%s", caption);
		strcat(info, caption);

		
	}
	Dialog_Show(playerid, dViewFactionQuiz, DIALOG_STYLE_MSGBOX, "{00C0FF}Solicitud", info, "Opciones", "Atrás");
	return 1;
}

FactionAssignValueForPermission(faction, rank)
{
	switch(rank)
	{
		case 9:
		{
			for(new i = 0; i != FACTION_RANK_MAX; i++)
			{
				FactionCrew.Rank[faction][rank][@Permission][i] = FACTION_RANK_MAX;		
			}
		}
		case 8:
		{
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_INVITE] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_CAST_MEMBERS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_MODIFY_MEMBERS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_MODIFY_RANKS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_CLAN_WAR] = FACTION_RANK_MAX;

			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_CHANGE_COLOR] = FACTION_RANK_MAX;
		}
		case 7:
		{
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_INVITE] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_CAST_MEMBERS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_MODIFY_MEMBERS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_MODIFY_RANKS] = FACTION_RANK_MAX;
			FactionCrew.Rank[faction][rank][@Permission][FACTION_RANK_CLAN_WAR] = FACTION_RANK_MAX;
		}
		case 0:
		{
			for(new i = 0; i != FACTION_RANK_MAX; i++)
			{
				FactionCrew.Rank[faction][rank][@Permission][i] = 0;		
			}
		}
	}
}

AssignValueDefaultRank(faction, rank, const name[], leng = sizeof(name))
{
	FactionCrew.Rank[faction][rank][@Valid] = true;
	format(FactionCrew.Rank[faction][rank][@Name], leng, "%s", name);

	FactionAssignValueForPermission(faction, rank);
}

CreateTextdrawInvFaction(playerid)
{
	rBit1_Set(eBit1_PlayerInfo[p_ShowPanelFaction], playerid, true);

	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][1], 0.019998, 25.00);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);

	Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0] = CreatePlayerTextDraw(playerid,148.0, 142.0, "Miembro           Rango");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 0.290000, 1.8);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], -1);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], 0);

	CreateTextdrawInvFactionLeft(playerid);

	for(new i = 0; i < MAX_FACTION_PANEL_ITEMS; i++)
	{
		Player_Textdraws[playerid][pTextdraw_PanelFactionList][i] = CreatePlayerTextDraw(playerid,150.000000, (/*170.0*/MAX_FACTION_ITEMS_POS_X + (/*17.0*/25.0 * i)), "_");
		PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 255);
		PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 1);
		PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 0.18, 1.200000);
		PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 0x1F1F1FFF);
		PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 0);
		PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 1);
		PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 0);
		//PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 1);
		PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 0xA1A1A100);
		//PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 320.000000, 15.000000);
		//PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionList][i], 1);
		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][i]);

		Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i] = CreatePlayerTextDraw(playerid,320.0, (/*170.0*/MAX_FACTION_ITEMS_POS_X + (/*/17.0*/25.0 * i)), "_");
		PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 255);
		PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 1);
		PlayerTextDrawAlignment(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 3);
		PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 0.18, 1.200000);
		PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 0x000000FF);
		PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 0);
		PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 1);
		PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 0);
		PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i], 320.000000, 15.000000);
		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i]);
	}

	if(PlayerInfo[playerid][p_FactionMember] != 0) Player.Temp[playerid][@SelectedFactionID] = PlayerInfo[playerid][p_FactionMember];
	if(Player.Temp[playerid][@SelectedFactionID] != -1)
	{
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], "Miembro________________________Rango");
		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0]);
		ShowLeftPanelGeneral(playerid);
		//UpdateListFactionGeneral(playerid, 1);
	}
	else
	{
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], "Banda_________________________Puntos");
		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0]);
		UpdateFactionItemList(playerid, 1);

		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][11], playerid, "Crear banda");
	}

	SelectTextDraw(playerid, 0xE0E0E0FF);
}

CreateTextdrawInvFactionLeft(playerid)
{
	Player_Textdraws[playerid][pTextdraw_PanelFactionTitle] = CreatePlayerTextDraw(playerid,334.0, 142.0, "~g~~h~The Real Family");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 0.290000, 1.900000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], -1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 0);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 448.0, 10.0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], 0);

	Player_Textdraws[playerid][pTextdraw_PanelFactionDesc] = CreatePlayerTextDraw(playerid,328.0, 192.0, "No hay una descripcion disponible.");
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 0.180000, 1.4);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], -1);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 0);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 459.0/*500.0*/, 10.0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], 1);

	Player_Textdraws[playerid][pTextdraw_PanelFactionLogo] = CreatePlayerTextDraw(playerid,380.0, 159.0, /*"~>~"*/"LD_OTB2:Ric4");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 0xFFFFFFFF);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 4);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 0.490000, 3.500000);
	//PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 0xFF000088);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 1);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 29.0, 40.0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], 0);

	Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1] = CreatePlayerTextDraw(playerid,454.0, 227.0, "0/20~n~Top 1 global");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 0.18, 1.4);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], -1);
	PlayerTextDrawAlignment(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 3);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], 0);
}

DestroyTextdrawInvFactionAll(playerid)
{
	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0]);
	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1]);

	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle]);
	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionDesc]);
	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionLogo]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][4]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][5]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][6]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][12]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][13]);

	for(new i; i < MAX_FACTION_PANEL_ITEMS; i++)
	{
		PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][i]);
		PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxPanelFactionList][i]);
	}
}

HideTextdrawTabFactionBox(playerid)
{
	for(new i; i < MAX_FACTION_PANEL_ITEMS; i++)
	{
		PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][i]);
		PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][i]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxPanelFactionList][i]);
		Player.Temp[playerid][@PanelFactionList][i] = 0;
	}
}

UpdateListFactionGeneral(playerid, type = 0, bool:reset = true)
{
	if(type == 1)
	{
		if(!rBit1_Get(eBit1_PlayerInfo[p_ShowPanelFaction], playerid)) return 0;
	   	
		await mysql_aquery_s(conexion, str_format("SELECT UNIX_TIMESTAMP(u.`last_connection`) AS `date_unix`, u.`id`, u.`name`, u.`fact_rank`, u.`Online`, f.`RankName` FROM `lac_users` u INNER JOIN `lac_faction_ranks` f ON f.`rank_pos`=u.`fact_rank` WHERE u.`faction_id` = %d AND f.`id_faction`= %d ORDER BY u.`Online` DESC, u.`fact_rank` DESC LIMIT %d, 7;", Player.Temp[playerid][@SelectedFactionID], Player.Temp[playerid][@SelectedFactionID], (Player.Temp[playerid][@FactionPage] * MAX_FACTION_PANEL_ITEMS)));
		//printf("SELECT UNIX_TIMESTAMP(u.`last_connection`) AS `date_unix`, u.`id`, u.`name`, u.`fact_rank`, u.`Online`, f.`RankName` FROM `lac_users` u INNER JOIN `lac_faction_ranks` f ON f.`rank_pos`=u.`fact_rank` WHERE u.`faction_id` = %d AND f.`id_faction`= %d ORDER BY u.`Online` DESC, u.`fact_rank` DESC LIMIT %d, 7;", Player.Temp[playerid][@SelectedFactionID], Player.Temp[playerid][@SelectedFactionID], (Player.Temp[playerid][@FactionPage] * MAX_FACTION_PANEL_ITEMS));
		/*if(!pool_valid(Player.Temp[playerid][@ListFaction]))
		{
			Player.Temp[playerid][@ListFaction] = pool_new();	
		}*/

		new rows, count;
		//new faction = Player.Temp[playerid][@SelectedFactionID];
		cache_get_row_count(rows);

		for(new i = 0; i < rows; i++)
		{

			new name[24], rank_name[24], connected, rank, db_ID, date;

			cache_get_value_name_int(i, "id", db_ID);
			cache_get_value_name(i, "name", name, 24);
			cache_get_value_name(i, "RankName", rank_name);
			cache_get_value_name_int(i, "Online", connected);
			cache_get_value_name_int(i, "fact_rank", rank);
			cache_get_value_name_int(i, "date_unix", date);

			new string[127];
    		format(string, 127, "%s", /*player_state, */name);

			PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][count], string);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][count]);

			new time_format[14];
			ConverTime_TimeElapsed(date, time_format);

			if(connected == 1)
			{
				format(string, 127, "%s ~n~~g~Conectado", rank_name, time_format);
			}
			else
			{
				format(string, 127, "%s ~n~%s", rank_name, time_format);
			}

			PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][count], ConvertEncoding(string));
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][count]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxPanelFactionList][count]);
			PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], "Miembro________________________Rango");

			Player.Temp[playerid][@PanelFactionList][count] = db_ID;

			//pool_add(Player.Temp[playerid][@ListFaction], db_ID);

			count++;

		}

		if(reset) { Player.Temp[playerid][@FactionPage] = 0; TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]); TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]); }

		if(count >= 7)
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);
		}
	}
	else
	{
		UpdateFactionItemList(playerid, 1);
	}
	return 1;
}

ShowLeftPanelGeneral(playerid)
{
	if(!rBit1_Get(eBit1_PlayerInfo[p_ShowPanelFaction], playerid)) return 0;

	new i = Player.Temp[playerid][@SelectedFactionID];

	if(/*FactionCrew.Info[i][@ID]*/i == PlayerInfo[playerid][p_FactionMember])
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][4]);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][5]);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][6]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
	}
	else
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][11], playerid, "Unirme");
		//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][0]);
	}
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][12]);

	new string[58];
	//format(string, sizeof(string), "%s", FactionCrew.Info[i][@Name]);
	//PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], string);
	//PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], DataE.CrewColor[FactionCrew.Info[i][@Color]][@Color]);
	//format(string, sizeof(string), "~y~%d ~n~~w~%d/20 ~n~0/4 ~n~0/20", FactionCrew.Info[i][@Points], FactionCrew.Info[i][@Members]);
	//PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], string);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][13]);

	await mysql_aquery_s(conexion, str_format("SELECT f.`name`,f.`description`,f.`Color`, f.`Points`, COUNT(u.`faction_id`) memberscount FROM `lac_facciones` f INNER JOIN `lac_users` u ON u.`faction_id`=f.`id` WHERE f.`id` = %d;", i/*FactionCrew.Info[i][@ID]*/));
		
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		new name[24], description[64], color, points, members;
		cache_get_value_name(0, "name", name, sizeof(name));
		cache_get_value_name(0, "description", description, sizeof(description));
		cache_get_value_name_int(0, "Color", color);
		cache_get_value_name_int(0, "Points", points);
		cache_get_value_name_int(0, "memberscount", members);

		format(string, sizeof(string), "%s", name);
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], string);
		PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle], DataE.CrewColor[color][@Color]);

		format(string, sizeof(string), "~y~%d ~n~~w~%d/20 ~n~0/4 ~n~%d/%d", points, members, CountGraffitisForFaction(i), MAX_FACTION_GRAFITIS+1);
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1], string);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][13]);

		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionDesc]);			
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionDesc], ConvertEncoding(isnull(description) ? "Clickea aquí para agregar una descripción." : description));
	
		new string_logo[20];
		format(string_logo, sizeof(string_logo), "LD_OTB2:Ric%d",DataE.CrewColor[color][@ID]);
		PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionLogo], string_logo);
		PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionLogo]);
	}
	
	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle]);	
	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1]);

	HideTextdrawTabFactionBox(playerid);
	UpdateListFactionGeneral(playerid, 1);

	return 1;
}

HideLeftPanelGeneral(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][4]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][5]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][6]);
	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][12]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][13]);

	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionTitle]);
	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionLogo]);
	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionDesc]);
	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][1]);

	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][11]);
	TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][11], playerid, "Crear banda");

	HideTextdrawTabFactionBox(playerid);
	UpdateListFactionGeneral(playerid, 0);
}

UpdateFactionItemList(playerid, type, bool:reset = true)
{
	switch(type)
	{
		case 1:
		{
			if(!rBit1_Get(eBit1_PlayerInfo[p_ShowPanelFaction], playerid)) return 0;

			await mysql_aquery_s(conexion, str_format("SELECT * FROM `lac_facciones` WHERE `id` AND `Points` ORDER BY `Points` DESC LIMIT %d, 7;", Player.Temp[playerid][@FactionPage]*7));

			new rows, count;
			cache_get_row_count(rows);

			for(new i = 0; i < rows; i++)
			{
				new name[32], id, points, color, slot;

				cache_get_value_name_int(i, "id", id);
				cache_get_value_name(i, "Name", name, 32);
				cache_get_value_name_int(i, "Points", points);
				cache_get_value_name_int(i, "Color", color);
				cache_get_value_name_int(i, "GameSlot", slot);

				new string[128];

				Player.Temp[playerid][@PanelFactionList][count] = id;

				format(string, sizeof(string), "%s", name/*FactionCrew.Info[slot][@Name]*/);
				PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][count], ConvertEncoding(string));
				PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionList][count]);

				format(string, sizeof(string), "- ~y~%d", points/*FactionCrew.Info[slot][@Points]*/);
				PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][count], string);
				PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][count]);
				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxPanelFactionList][count]);
				PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionInfo][0], "Banda_________________________Puntos");


				count++;
			}

			if(reset) { Player.Temp[playerid][@FactionPage] = 0; TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]); TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]); }
			
			if(count >= 7)
			{
				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);
			}
			
		}
	}
	return 1;
}

stock GetAvaibleFactionIndex()
{
	for(new i = 0; i != MAX_FACTION; i ++)
	{
		if(FactionCrew.Info[i][@Valid] == false) return i;
	}
	return -1;
}

SendNotificationMembersFaction(faction, id, const string[], time)
{
	foreach(new i : Player)
	{
		if(PlayerInfo[i][p_FactionMember] == faction)
		{
			if(PlayerInfoTemp[i][pt_IsLoggedIn])
			{
				CreatePlayerNotificationSimple(i, id, string, time);
			}
			
		
		}
	}
	return 1;
}

FactionWarnGrafiti(playerid)
{
	if(disputed_grafiti_actived != -1)
	{
		new i = disputed_grafiti_actived;

		if(Grafiti_CrewsSpray[0] == 0)
		{
			new message[50];
			format(message, sizeof(message), "Graffiti en %s", Grafiti_CrewsZoneName);
			SplitTextDrawString(message, 117.0, 0.240, 1);
			new lines = GetTextDrawLineCount(message);

			new box = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_DISPUTEGRAFITI, true, 29.0+(lines*4.0));
			funct_CreateTextdrawTextNotifEx(playerid, box, 0, "hud:radar_spray", 4);
			funct_CreateTextdrawTextNotifEx(playerid, box, 1, message, 1, 14.0);
			funct_CreateTextdrawTextNotifEx(playerid, box, 2, "Nadie lo ha pintado aun.", 1, 15.0, 14.0+(lines*4.0), 0.220, 1.1);
			UpdateNotificationForPlayer(playerid, box);
		}
		else
		{
			new box = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_DISPUTEGRAFITI, true, 22.0);
			funct_CreateTextdrawTextNotifEx(playerid, box, 0, "hud:radar_spray", 4);

			new title[50];
			format(title, sizeof(title), "Graffiti en %s", Grafiti_CrewsZoneName);
			funct_CreateTextdrawTextNotifEx(playerid, box, 1, title, 1, 14.0);
			new lines = GetTextDrawLineCount(title);

			for(new f = 0; f < MAX_FACT_DISPUTE_GRAFFITI; f++)
			{
				if(Grafiti_CrewsSpray[f] == 0) continue;

				new string[52];
				format(string, sizeof(string), "%s %d%", FactionCrew.Info[ Grafiti_CrewsSprayIndex[f] ][@Name], Grafiti_CrewsProgress[ f ]);
				funct_CreateTextdrawTextNotifEx(playerid, box, f+2, string, 1, 0.0, 20.0+(f*12.0), 0.220, 1.1, .color = DataE.CrewColor[ FactionCrew.Info[ Grafiti_CrewsSprayIndex[f] ][@Color] ][@Color]);
				
				vNoti_SetPlayerBoxSize(playerid, box, (lines*VNOTI_LETTERSIZE_T_1)+(f*VNOTI_LETTERSIZE_T_2));
				UpdateNotificationForPlayer(playerid, box);
			}
		}

		SetPlayerDynCP(playerid, 3, Grafiti.Info[i][@PosX],Grafiti.Info[i][@PosY],Grafiti.Info[i][@PosZ],2.0, CHECKPOINT_TYPE_G_GRAFFITI);
	}
	return 1;
}

DisableEventsFactionForPlayer(playerid)
{
	if(disputed_grafiti_actived != -1)
	{
		funct_HideTextdrawNotif(playerid, VNOTI_TYPE_DISPUTEGRAFITI);
		funct_HideTextdrawNotif(playerid, VNOTI_TYPE_DISPUTEGRAFITI2);
		DestroyPlayerDynCP(playerid, 3);
	}
}

WinDisputeFactionGrafiti(index_faction)
{
//	FactionCrew.Info[ index_faction ][@GrafSlot] = -1;

	format(Grafiti_CrewsZoneName, sizeof(Grafiti_CrewsZoneName), "");

	ClearDisputeFactionGrafiti();

	Grafiti.Info[disputed_grafiti_actived][@Owner] = FactionCrew.Info[index_faction][@ID];
	Grafiti.Info[disputed_grafiti_actived][@Time] = 64800;
	FactionCrew.Info[index_faction][@Points] += 14;

	for(new i = 0; i < MAX_FACTION_GRAFITIS; i++)
	{
		if(Grafiti.Info[i][@ID] == 0) continue;
		mysql_tquery_s(conexion, str_format("UPDATE `lac_faction_grafitis` SET `time` = %d WHERE `id_grafiti`=%d;",Grafiti.Info[i][@Time], Grafiti.Info[i][@ID]));
	}

	//mysql_tquery_s(conexion, str_format("UPDATE `lac_faction_grafitis` SET `time` = %d, `id_faction`=%d WHERE `id_grafiti`=%d;",Grafiti.Info[disputed_grafiti_actived][@Time], Grafiti.Info[disputed_grafiti_actived][@Owner], Grafiti.Info[disputed_grafiti_actived][@ID]));
	mysql_tquery_s(conexion, str_format("UPDATE `lac_facciones` SET `Points`=%d WHERE `id`=%d;",FactionCrew.Info[index_faction][@Points], FactionCrew.Info[index_faction][@ID]));

	disputed_grafiti_actived = -1;
}

ClearDisputeFactionGrafiti()
{
	for(new i = 0; i < MAX_FACT_DISPUTE_GRAFFITI; i++)
	{
		DestroyDynamicObject(Grafiti_CrewsObject[i]);

		Grafiti_CrewsSpray[i] = 0;
		FactionCrew.Info[ Grafiti_CrewsSprayIndex[i] ][@GrafSlot] = -1;
		Grafiti_CrewsSprayIndex[i] = 0;

		Grafiti_CrewsProgress[i] = 0;
		Grafiti_CrewsObject[i] = INVALID_STREAMER_ID;
	}	
}

CountGraffitisForFaction(faction)
{
	new count_grafitis;
	for(new g = 0; g < MAX_FACTION_GRAFITIS; g++)
	{
		if(Grafiti.Info[g][@ID] == 0) continue; 
		if(Grafiti.Info[g][@Owner] == faction)
		{
			count_grafitis++;
		}
	}
	return count_grafitis;
}

IsFactionRankDefault(rank)
{
	new value = -1;
	switch(rank)
	{
		case 0: value = 0;
		case 7: value = 7;
		case 8: value = 8;
		case 9: value = 9;
	}
	return value;
}

 stock GetNumbersOfPageFactionList(total_items)
 {
 	if((total_items >= MAX_FACTION_PANEL_ITEMS) && (total_items % MAX_FACTION_PANEL_ITEMS) == 0)
 	{
 		return (total_items / MAX_FACTION_PANEL_ITEMS);
 	}
 	else return (total_items / MAX_FACTION_PANEL_ITEMS) + 1;
 }