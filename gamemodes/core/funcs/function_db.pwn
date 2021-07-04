function LoadMobilePhoneContacts(playerid)
{
	new rows;
	new name_contact[20], number_contact, count, db_ID;

	cache_get_row_count(rows);

	for(new i = 0; i < rows; i++)
	{
		cache_get_value_name_int(i, "id_contact", db_ID);
		cache_get_value_name(i, "name", name_contact, 20);
		cache_get_value_name_int(i, "number_contact", number_contact);

		Player_Textdraws[playerid][pTextdraw_Mobile_TD][count] = CreatePlayerTextDraw(playerid,531.0, (325.000000 + (17.0*i)), name_contact);
		PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 255);
		PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 1);
		PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0.210, 1.1);
		PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], -1);
		PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0);
		PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0);
		PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 1);
		PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0x00000088);
		PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 597.000000, 10.000000);
		PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 1);
		PlayerTextDrawShow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count]);

		PlayerInfoTemp[playerid][pt_PHONE_LIST_ITEMS][count] = db_ID;

		count++;
	}
	if(count >= 5)
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
	}

}

function LoadMobilePhoneContact(playerid, type)
{
	new rows;
	new name_contact[24], number_contact, db_ID, string[20];

	cache_get_row_count(rows);

	if(rows)
	{
		cache_get_value_name_int(0, "id_contact", db_ID);
		cache_get_value_name(0, "name", name_contact, 24);
		cache_get_value_name_int(0, "number_contact", number_contact);

		if(type == 1)
		{
			format(string, sizeof(string), "%d", number_contact);
			CreatePlayerItemListMobile(playerid, 0, string);
			CreatePlayerItemListMobile(playerid, 1, name_contact);
		}
		else
		{
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TextAbove][0], playerid, name_contact);
		}
		format(Player.Temp[playerid][@CalledPlayer], 9, "%d", number_contact);
	}
}

function LoadMobilePhoneSMS(playerid)
{
	new rows;
	new message[140], number_contact, count, db_ID, Float:total_height = 414.0, Float:total_heightnew = 414.0, Float:box_size = -14.0;

	cache_get_row_count(rows);

	Player.Temp[playerid][@CachePhone] = cache_save();
	for(new i = 0; i < rows; i++)
	{
		cache_get_value_name_int(i, "id_message", db_ID);
		cache_get_value_name(i, "message", message, 128);
		cache_get_value_name_int(i, "by_phone", number_contact);

		
		SplitTextDrawString(message, 298.0, 1.0, 1);
		new line_count = GetTextDrawLineCount(message);

		box_size = (line_count*-9.4);

		total_heightnew -= (line_count*11.0)+4.0;

		if(total_heightnew>290.0)
		{
			CreateTextdrawBoxSMS(playerid, count, number_contact, total_height, box_size, message);

			total_height = total_heightnew;
			count++;
			
		} else break;
	}

	PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] += count;

	//if(total_height < 280.0)
	if(rows > count)
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][8], playerid, "~up~");
	}
}

LoadPhoneCacheSMS(playerid, next)
{
	new rows;
	new message[140], number_contact, count, db_ID, Float:total_height = 414.0, Float:total_heightnew = 414.0, Float:box_size = -14.0;

	cache_set_active(Player.Temp[playerid][@CachePhone]);

	cache_get_row_count(rows);	

	if(next == 1)
	{
		for(new i = PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]; i < rows; i++)
		{
			cache_get_value_name_int(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "id_message", db_ID);
			cache_get_value_name(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "message", message, 128);
			cache_get_value_name_int(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "by_phone", number_contact);

			
			SplitTextDrawString(message, 298.0, 1.0, 1);
			new line_count = GetTextDrawLineCount(message);

			box_size = (line_count*-9.4);

			total_heightnew -= (line_count*11.0)+4.0;

			if(total_heightnew>290.0)
			{
				CreateTextdrawBoxSMS(playerid, count, number_contact, total_height, box_size, message);

				total_height = total_heightnew;

				PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]++;
				count++;
				
			} else break;
		}
	}
	else
	{
		for(new i = 0; i < rows; i++)
		{
			
			if(i == PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE])
			{
				printf("Test: %d, %d", i, PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]);
				
				cache_get_value_name_int(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "id_message", db_ID);
				cache_get_value_name(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "message", message, 128);
				cache_get_value_name_int(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE], "by_phone", number_contact);

				SplitTextDrawString(message, 298.0, 1.0, 1);
				new line_count = GetTextDrawLineCount(message);

				box_size = (line_count*-9.4);

				total_heightnew -= (line_count*11.0)+4.0;

				if(total_heightnew>290.0)
				{
					CreateTextdrawBoxSMS(playerid, count, number_contact, total_height, box_size, message);

					total_height = total_heightnew;

					PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]--;
					count++;

				} else break;
			}
		}
	}
	cache_unset_active();
	printf("List %d", PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]);
	/*if(rows > count)
	{
		if(next == 1)
		{
			PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] += count;
		}
		else
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]) { TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]); }
			PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] -= count;
		}
	}*/
	/*if(total_height < 280.0)
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][8], playerid, "~up~");
	}*/
	return 0;
}

function LoadFactionListRequest(playerid)
{
	new rows, listitem;
	new dialog[700], item_string[128];

	DynamicDgui_Start(playerid);

	//strcat(dialog, "Asunto\tFecha\n");

    cache_get_row_count(rows);
    for(new i = 0; i < rows; i++)
    {
    	new name_user[24], type, id_request, date;

    	cache_get_value_name_int(i, "id_request", id_request);
    	cache_get_value_name_int(i, "type", type);
    	cache_get_value_name(i, "name", name_user, 24);
    	cache_get_value_name_int(i, "date_unix", date);

    	new time_format[14];

    	ConverTime_TimeElapsed(date, time_format);

    	format(item_string, sizeof(item_string), "%s esta solicitando unirse a tu banda.\t%s.\n", name_user, time_format);
    	strcat(dialog, item_string);
    	DynamicDgui_AddVarEx(playerid, listitem, id_request);
    	listitem++;

    }
    Dialog_Show(playerid, dFactionViewRequest, DIALOG_STYLE_TABLIST, "{5EB5FF}Solicitudes", dialog, "Ver", "Atrás");
}

// Fin cache

function LoadPhoneDataID(playerid)
{
	new rows;
	cache_get_row_count(rows);

	if(rows > 0)
	{
		new number, bool:state_phone;
		
		cache_get_value_name_int(0, "number_phone", number);
		cache_get_value_name_bool(0, "phone_state", state_phone);
		
		rBit1_Set(eBit1_PlayerInfo[pt_PHONE_STATE], playerid, state_phone);

		new string[70];

		format(string, sizeof(string), "Estado: %s", (state_phone ? "~r~OFF" : "~g~ON"));
		TextDrawSetString(Textdraws[sTextdraw_Mobile_TD][12], string);

		format(string, sizeof(string), "Numero: ~y~%d", number);
		TextDrawSetString(Textdraws[sTextdraw_Mobile_TD][13],  string);

		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][12]);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][13]);
	}
	return 1;
}

RegisterPhoneBookContact(id_phone, phone_number, const name[])
{
	new Query[300];
	format(Query, sizeof Query,
	"\
		INSERT INTO `lac_phone_book`\
		(\
			`id_phone`, `name`, `number_contact`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d'\
		);\
	",
		id_phone, name, phone_number);
	
	mysql_tquery(conexion, Query);
	return 1;
}

RegisterPhoneSendSMS(by_phone, to_number, const text[])
{
	new Query[300];

	mysql_format(conexion, Query, sizeof Query,
	"INSERT INTO `lac_phone_messages` ( `by_phone`, `to_phone`, `message`, `date` ) VALUES ('%d', '%d', '%e', CURRENT_TIMESTAMP);", 
	by_phone, to_number, text);
	mysql_tquery(conexion, Query);
	return 1;
}

RegisterNewNumberPhone(random_number)
{
	new Query[158];
	mysql_format(conexion, Query, sizeof Query,
	"INSERT INTO `lac_phone` ( `number_phone`, `phone_state`, `phone_game` ) VALUES (%d, 0, 1);", 
	random_number);
	mysql_tquery(conexion, Query);
}

RegisterNewFactionRank(playerid, index, rank)
{
	new DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `lac_faction_ranks`\
		(\
			`id_faction`, `rank_pos`, `RankName`\
		)\
		VALUES\
		(\
			'%d', '%d', '%q'\
		);\
		\
	",
		FactionCrew.Info[index][@ID],
		rank,
		FactionCrew.Rank[index][rank][@Name]
	);
	mysql_tquery(conexion, DB_Query, "RegisterNewFacRankID", "iii", playerid, index, rank);
	return 1;
}

RegisterNewFactionQuestion(playerid, index, const question[])
{
	new DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `lac_faction_questions`\
		(\
			`id_faction`, `body`\
		)\
		VALUES\
		(\
			'%d', '%q'\
		);\
		\
	",
		FactionCrew.Info[index][@ID],
		question
	);
	mysql_tquery(conexion, DB_Query, "RegisterNewFacQuestionID", "i", playerid);
	return 1;
}


function RegisterNewFacRankID(playerid, index, rank)
{
	new count;
	/*cache_get_row_count(count);
	printf("ID %d, count %d", FactionCrew.Rank[index][rank][@ID], count);

	if(count) { cache_get_value_index_int(0, 0, FactionCrew.Rank[index][rank][@ID]); }
	
	printf("ID2:  %d y %d", FactionCrew.Rank[index][rank][@ID], id);*/
	count = cache_insert_id();

	FactionCrew.Rank[index][rank][@ID] = count;

	new DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `lac_faction_rank_perm`(`id_rank`, `permission_0`, `permission_1`, `permission_2`, `permission_3`) VALUES (%d, 0, 0, 0, 0);",
		FactionCrew.Rank[index][rank][@ID]
	);
	mysql_tquery(conexion, DB_Query);
	
	//UpdateListFactionGeneral(playerid, 1);
	return 1;
}

function RegisterNewFacQuestionID(playerid)
{
	ShowPlayerInfoTextdraw(playerid, "~g~~h~Añadiste una nueva pregunta.", 4000);
	ShowDialogEx(playerid, DIALOG_FACTION_QUESTIONS);
	return 1;
}

function RegisterNewFacRequestID(playerid)
{
	new id_request = cache_insert_id();
	new DB_Query[340], reply_body[128];

	new List:m = _GetPlayerDataList(playerid), data[E_FAC_QUIZ_PLAYER_DATA];

	if (list_valid(m)) 
	{
		for (new Iter:id = list_iter(m); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);

			str_get(data[E_FAC_QUIZ_STRING], reply_body, sizeof(reply_body));

			mysql_format(conexion, DB_Query, sizeof DB_Query,
				"INSERT INTO `lac_faction_req_reply` (`request_id`, `id_question`, `reply_body`) VALUES (%d, %d, '%e');", id_request, data[E_FAC_QUIZ_DBID], reply_body);
			mysql_tquery(conexion, DB_Query);

			str_delete(data[E_FAC_QUIZ_STRING]);
			str_delete(data[E_FAC_QUIZ_STRINGDB]);
		}
		list_delete_deep(m); 
	}


	new string[128];
	format(string, sizeof(string), "Tu petición se envió a los lideres de la banda. Espera a que la respondan.", FactionCrew.Info[ Player.Temp[playerid][@FactionSelectExID] ][@Name]);
	CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONQUIZ, string, 8);
}

CreateFactionRegister(index, type)
{
//	if(FactionCrew.Info[index][@ID] == 0) return 0;
	
	new DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `lac_facciones`\
		(\
			`name`, `Color`, `Type`, `creation_date` \
		)\
		VALUES\
		(\
			'%q', %d, %d, CURRENT_TIMESTAMP \
		);\
		\
	",
		FactionCrew.Info[index][@Name],
		FactionCrew.Info[index][@Color],
		type
	);
	await mysql_aquery(conexion, DB_Query);

	//new count;
	//cache_get_row_count(count);

	FactionCrew.Info[index][@ID] = cache_insert_id();
	//printf("%d", FactionCrew.Info[index][@ID]);

	//mysql_tquery(conexion, DB_Query, "RegisterNewFaction", "i", index);
	RegisterNewFaction(index);
	return 1;
}

function RegisterNewFaction(index)
{
	/*new count;
	cache_get_row_count(count);

	cache_get_value_index_int(0, 0, FactionCrew.Info[index][@ID]); FactionCrew.Info[index][@ID] = cache_insert_id(); 	printf("%d", FactionCrew.Info[index][@ID]);*/
	
	
	for(new i = 0; i != MAX_FACTION_RANKS; i ++)
	{
		if(!FactionCrew.Rank[index][i][@Valid]) continue;
		
		new DB_Query[340];
		format(DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `lac_faction_ranks`\
			(\
				`id_faction`, `rank_pos`, `RankName`\
			)\
			VALUES\
			(\
				'%d', '%d', '%q'\
			);\
			SELECT MAX(`id`) FROM `lac_faction_ranks`;\
		",
			FactionCrew.Info[index][@ID],
			i,
			FactionCrew.Rank[index][i][@Name]
		);
		mysql_tquery(conexion, DB_Query, "GetMaxFactionRanksID", "ii", index, i);		
	}
	return 1;
}

function GetMaxFactionRanksID(index, i)
{
	new count;
	cache_get_row_count(count);
	if(count) cache_get_value_index_int(0, 0, FactionCrew.Rank[index][i][@ID]);
	return 1;
}

function LoadFactionModifyMember(playerid)
{
	new count, name[24], current_rank, bool:found;
	cache_get_row_count(count);
	if(count)
	{
		cache_get_value_name(0, "name", name, 24);
		cache_get_value_name_int(0, "fact_rank", current_rank);
		found = true;
	}
	else found = false;
	
	if(!found) return 1;
	if(current_rank > PlayerInfo[playerid][p_FactionRank]) return ShowPlayerInfoTextdraw(playerid, "~r~No puedes modificar el rango de este miembro~n~porque es un rango superior al tuyo.", 4000);
	
	if(current_rank == 9)
	{
		new Query[256];
		format(Query, sizeof Query, "SELECT COUNT(*) FROM `lac_users` WHERE `faction_id` = '%d' AND `fact_rank` = '9';", PlayerInfo[playerid][p_FactionMember]);
		mysql_tquery(conexion, Query, "LoadFactionMemberRankCount", "isi", playerid, name, current_rank);
		return 1;
	}
	
	//for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][pt_PLAYER_LISTITEM][i] = -1;
	DynamicDgui_Start(playerid);

	new caption[45];
	format(caption, sizeof caption, "Miembro - {5EB5FF}%s", name);
	
	new dialog[45 * /*FACTION_RANK_MAX*/MAX_FACTION_RANKS], line_str[45], listitem;
	for(new i = MAX_FACTION_RANKS_SUB; i != -1; i --)
	{
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Valid]) continue;
		
		if(i <  PlayerInfo[playerid][p_FactionRank])
		{
			if(current_rank == i) format(line_str, sizeof line_str, "%s *\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
			else format(line_str, sizeof line_str, "%s\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
		}
		else
		{
			if(current_rank == i) format(line_str, sizeof line_str, "%s *\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
			else format(line_str, sizeof line_str, "%s\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
		}
		strcat(dialog, line_str);
		
		DynamicDgui_AddVarEx(playerid, listitem, i);
		listitem ++;
	}
	
	Dialog_Show(playerid, dFactionModifyMember, DIALOG_STYLE_LIST, caption, dialog, "Siguiente", "Atras");
	return 1;
}

function LoadFactionMemberRankCount(playerid, const name[24], current_rank)
{
	new count, total;
	cache_get_row_count(count);
	if(count) cache_get_value_index_int(0, 0, total);
	
	if(total <= 1)
	{
		ShowPlayerInfoTextdraw(playerid, "~r~Tiene que ver por lo menos un miembro dueño.", 4000);
		return 1;
	}
	
	DynamicDgui_Start(playerid);
	
	new caption[45];
	format(caption, sizeof caption, "Miembro - {5EB5FF}%s", name);
	
	new dialog[45 * MAX_FACTION_RANKS], line_str[45], listitem;
	for(new i = MAX_FACTION_RANKS_SUB; i != -1; i --)
	{
		if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Valid]) continue;
		
		if(i < PlayerInfo[playerid][p_FactionRank])
		{
			if(current_rank == i) format(line_str, sizeof line_str, "%s *\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
			else format(line_str, sizeof line_str, "%s\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
		}
		else
		{
			if(current_rank == i) format(line_str, sizeof line_str, "%s *\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
			else format(line_str, sizeof line_str, "%s\n", FactionCrew.Rank[ Player.Faction[playerid][@Index] ][i][@Name]);
		}
		strcat(dialog, line_str);
		
		DynamicDgui_AddVarEx(playerid, listitem, i);
		listitem ++;
	}
	
	Dialog_Show(playerid, dFactionModifyMember, DIALOG_STYLE_LIST, caption, dialog, "Siguiente", "Atras");
	return 1;
}

function LoadFactionMemberModify(playerid, listitem)
{
	new rows, name[24], current_rank, connected, player_id, bool:found;
	cache_get_row_count(rows);
	
	if(rows)
	{
		cache_get_value_name(0, "name", name, 24);
		cache_get_value_name_int(0, "Online", connected);
		cache_get_value_name_int(0, "fact_rank", current_rank);
		found = true;
	}
	else found = false;
	
	if(!found) return 1;
	if(current_rank > PlayerInfo[playerid][p_FactionRank]) return GameTextForPlayerError(playerid, "~r~No puedes modificar un rango superior al tuyo.", 4000);
	
	new listitem_id = DynamicDgui_GetValue(playerid, listitem);

	if(current_rank == 9)
	{

		await mysql_aquery_s(conexion, str_format("SELECT COUNT(*) FROM `lac_users` WHERE `faction_id` = %d AND `fact_rank` = 9;", PlayerInfo[playerid][p_FactionMember]));
		
		new count;
		cache_get_row_count(count);
		if(count) cache_get_value_index_int(0, 0, count);
		
		if(count <= 1)
		{
			GameTextForPlayerError(playerid, "~r~Tiene que ver por lo menos un~n~miembro con rango dueño.", 4000);
			return 1;
		}
		
		mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `fact_rank` = '%d' WHERE `id` = '%d';", listitem_id, Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ]));
		
		new message[145];
		if(connected)
		{
			PlayerInfo[player_id][p_FactionRank] = listitem_id;
		}
		
		format(message, sizeof message, "%s cambio el rango de~n~%s a %s.", PlayerInfoTemp[playerid][pt_Name], name, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ listitem_id ][@Name]);
		SendNotificationMembersFaction(PlayerInfo[playerid][p_FactionMember], VNOTI_TYPE_MODIFYRANK, message, 15);
		
			//rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, true);
		
		return 1;
	}
	new Query[90];
	format(Query, sizeof Query, "UPDATE `lac_users` SET `fact_rank` = '%d' WHERE `id` = '%d';", listitem_id, Player.Temp[playerid][@PanelFactionList][ PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] ]);
	mysql_tquery(conexion, Query);
	
	new message[145];
	if(connected)
	{
		PlayerInfo[player_id][p_FactionRank] = listitem_id;
	}
	
	format(message, sizeof message, "%s cambio el rango de~n~%s a %s.", PlayerInfoTemp[playerid][pt_Name], name, FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ listitem_id ][@Name] ,);
	SendNotificationMembersFaction(PlayerInfo[playerid][p_FactionMember], VNOTI_TYPE_MODIFYRANK, message, 10);

    PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED]], FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ listitem_id ][@Name]);
    PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_PanelFactionListR][PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED]]);		//SelectTextDraw(playerid, 0xFFFFFFFFF); 

//	SelectTextDraw(playerid, 0xFFFFFFFFF); 
//	rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, true);
	return 1;
}

ShowInventoryTransStorage(playerid, maxsize = 20, bool:furniture = false, maxitems = MAX_PLAYER_INVENTORY_ITEMS)
{
	for(new i = 0; i < maxitems; i++)
	{
		Inv_TransUpdateItemsLeft(playerid, i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);	
		Inv_TransUpdateItemsRight(playerid, i, 0, 0);	
	}

	new capacity;
	if(furniture) { capacity = Furniture.Info[ maxsize ][@Capacity]; } else { capacity = maxsize; }
	
	InventorySpaceBar[playerid][1] = CreatePlayerProgressBar(playerid, 313.00, 318.00, 108.0, 4.0, 0x008BFFFF, capacity, 2);

	if(!map_valid(ServerGeneral_StorageMap))
	{
		ServerGeneral_StorageMap = map_new();
	}

	new count;

	if(Player.Temp[playerid][@InteractID] == 0)
	{
		await mysql_aquery(conexion, "INSERT INTO `lac_item_storage` (`extra`) VALUES (0);");
		new dbid = cache_insert_id();
		
		new data[E_SVGENERAL_STORAGE_INFO];
		Player.Temp[playerid][@InteractID] = dbid;
		
		map_add_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
		return 0;

	}
	if(!map_has_key(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID]))
	{
		await mysql_aquery_s(conexion, str_format("SELECT s2.`id` idmisc, s2.`storageid`, s2.`slot`, s2.`itemid`, s2.`amount` FROM `lac_item_storage` s INNER JOIN `lac_item_misc` s2 ON s.`id` = s2.`storageid` WHERE s.`id` = %d;", Player.Temp[playerid][@InteractID]));

		new rows;
		cache_get_row_count(rows);


		new data[E_SVGENERAL_STORAGE_INFO];

		for(new i = 0; i < rows; i++)
		{
			new item, amount, slot;
		
			cache_get_value_name_int(i, "itemid", item);
			cache_get_value_name_int(i, "amount", amount);
			cache_get_value_name_int(i, "slot", slot);
			cache_get_value_name_int(i, "idmisc", data[E_SVGENERAL_STORAGE_ID][slot]);
			Inv_TransUpdateItemsRight(playerid, slot, item, amount);

			data[E_SVGENERAL_STORAGE_Item][slot] = item;
			data[E_SVGENERAL_STORAGE_Amount][slot] = amount;


			count += InvObjectData[ item ][E_INV_SIZE];
		}

		map_add_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
	}
	else
	{
		new data[E_SVGENERAL_STORAGE_INFO];
		map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
		
		for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			if(data[E_SVGENERAL_STORAGE_Item][i] != 0)
			{
				Inv_TransUpdateItemsRight(playerid, i, data[E_SVGENERAL_STORAGE_Item][i], data[E_SVGENERAL_STORAGE_Amount][i]);	
				count += InvObjectData[ data[E_SVGENERAL_STORAGE_Item][i] ][E_INV_SIZE];
			}
		}

		map_set_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
	}

	SetValueProgTransDiagRight(playerid, count, capacity);
	return 1;
}

//
RegisterNewStorageFurniture(type, item, Pool:pool)
{
	yield 1;

	await mysql_aquery(conexion, "INSERT INTO `lac_item_storage` (`extra`) VALUES (0);");
	new dbid = cache_insert_id();

	switch(type)
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			new data_furniture[E_HOUSE_FURNITURE_DATA];
			pool_get_arr(pool, item, data_furniture);

			data_furniture[E_HOUSE_FURNITURE_DATA_Extra] = dbid;
			mysql_tquery_s(conexion, str_format("UPDATE `lac_house_furniture` SET `extra`=%d WHERE `idfurniture`=%d;", dbid, data_furniture[E_HOUSE_FURNITURE_DATA_DBID]));

			pool_set_arr(pool, item, data_furniture);
		}
	}
	new data[E_SVGENERAL_STORAGE_INFO];		
	map_add_arr(ServerGeneral_StorageMap, dbid, data);
	return 1;
}

function LoadFurnitureHouseDB(houseid)
{
	new rows_furniture;
	cache_get_row_count(rows_furniture);
	
	if(rows_furniture)
	{

		if(!pool_valid(CasaInfo[houseid][hPoolFurniture]))
		{
			CasaInfo[houseid][hPoolFurniture] = pool_new();
		}

		new data_furniture[E_HOUSE_FURNITURE_DATA];
		for(new i; i < rows_furniture; i++)
		{

			new model, slot, slot2, slot3;
			cache_get_value_name_int(i, "idfurniture", data_furniture[E_HOUSE_FURNITURE_DATA_DBID]);
			cache_get_value_name_int(i, "model", model);
			cache_get_value_name_int(i, "extra", data_furniture[E_HOUSE_FURNITURE_DATA_Extra]);
			cache_get_value_name_float(i, "posx", data_furniture[E_HOUSE_FURNITURE_DATA_X]);
			cache_get_value_name_float(i, "posy", data_furniture[E_HOUSE_FURNITURE_DATA_Y]);
			cache_get_value_name_float(i, "posz", data_furniture[E_HOUSE_FURNITURE_DATA_Z]);
			cache_get_value_name_float(i, "rotz", data_furniture[E_HOUSE_FURNITURE_DATA_RotZ]);

			cache_get_value_name_int(i, "slot", slot);
			cache_get_value_name_int(i, "slot2", slot2);
			cache_get_value_name_int(i, "slot3", slot3);

			cache_get_value_name_int(i, "date_unix", data_furniture[E_HOUSE_FURNITURE_DATA_DATE]);

			data_furniture[E_HOUSE_FURNITURE_DATA_MODEL] = model;
			data_furniture[E_HOUSE_FURNITURE_DATA_ObjID] = CreateDynamicObject(Furniture.Info[model][@Model], data_furniture[E_HOUSE_FURNITURE_DATA_X], data_furniture[E_HOUSE_FURNITURE_DATA_Y], data_furniture[E_HOUSE_FURNITURE_DATA_Z], 0.0, 0.0, data_furniture[E_HOUSE_FURNITURE_DATA_RotZ], CasaInfo[houseid][cVirtualWorld]);

			new material;

			material = slot;
			SetDynamicObjectMaterial(data_furniture[E_HOUSE_FURNITURE_DATA_ObjID], 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
			material = slot2;
			SetDynamicObjectMaterial(data_furniture[E_HOUSE_FURNITURE_DATA_ObjID], 1, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
			material = slot3;
			SetDynamicObjectMaterial(data_furniture[E_HOUSE_FURNITURE_DATA_ObjID], 2, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);

			new index = pool_add_arr(CasaInfo[houseid][hPoolFurniture], data_furniture);

			if(Furniture.Info[ data_furniture[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type] != 0)
			{
				new area = CreateDynamicSphere(0.0, 0.0, 0.0, 1.1, CasaInfo[houseid][cVirtualWorld]);
				new array[2];
				array[0] = AREA_TYPE_ZONE_IT_OBJECT;
				array[1] = index;
				Streamer_SetArrayData(STREAMER_TYPE_AREA, area, E_STREAMER_EXTRA_ID, array);

				AttachDynamicAreaToObject(area, data_furniture[E_HOUSE_FURNITURE_DATA_ObjID], .offsetx = Furniture.Info[model][@OffsetX], .offsety = Furniture.Info[model][@OffsetY]);
				data_furniture[E_HOUSE_FURNITURE_DATA_AREA] = area;

				pool_set_arr(CasaInfo[houseid][hPoolFurniture], index, data_furniture);

				LoadFeaturesFurnitureType(Furniture.Info[ data_furniture[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type], index, data_furniture[E_HOUSE_FURNITURE_DATA_Extra], CasaInfo[houseid][cVirtualWorld], CasaInfo[houseid][hPoolFurniture]);
			}
		}
	}
	return 1;
}

/*function LoadStorageForFurniture(item, vw, Pool:pool)
{
	if(!map_valid(ServerGeneral_StorageMap))
	{
		ServerGeneral_StorageMap = map_new();
	}
	new data[E_HOUSE_FURNITURE_DATA];
	pool_get_arr(pool, item, data);

	new rows;
	cache_get_row_count(rows);

	new datainv[E_SVGENERAL_STORAGE_INFO], slot;

	for(new i = 0; i < rows; i++)
	{
		cache_get_value_name_int(i, "slot", slot);
		cache_get_value_name_int(i, "idmisc", datainv[E_SVGENERAL_STORAGE_ID][slot]);
		cache_get_value_name_int(i, "itemid", datainv[E_SVGENERAL_STORAGE_Item][slot]);
		cache_get_value_name_int(i, "amount", datainv[E_SVGENERAL_STORAGE_Amount][slot]);
		datainv[E_SVGENERAL_STORAGE_Object][slot] = AssignShelfObjectPosition(slot, datainv[E_SVGENERAL_STORAGE_Item][slot], data[E_HOUSE_FURNITURE_DATA_X], data[E_HOUSE_FURNITURE_DATA_Y], data[E_HOUSE_FURNITURE_DATA_Z], data[E_HOUSE_FURNITURE_DATA_RotZ], vw);
	}
	map_add_arr(ServerGeneral_StorageMap, data[E_HOUSE_FURNITURE_DATA_Extra], datainv);

	return 1;
}*/