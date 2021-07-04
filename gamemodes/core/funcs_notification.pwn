// Notifications
#define BOXNOTIF_MAX_SIZE_STR 128
#define BOXNOTIF_MAX_TD_TEXT 20
#define BOX_NOTIF_MAX_BARS 10
#define BOX_NOTIF_BAR_POS_Y 5.0
//#define BOX_NOTIF_INVALID_BOX 100
#define BOX_NOTIF_SIZE_X 117.0
#define BOX_NOTIF_SPLIT_X 80.0

#define Notification. OO_TYPE(BOXNOTIF,NotificationsBox_)

// #define Notification_DEBUG_MODE_ALL

static Float:fTextdrawBlockNotiSize[MAX_PLAYERS] = BOXNOTIF_POS_Y;

static enum _:E_VNOTI_PROGRESS_PLAYER_DATA 
{
	bool:E_VNOTI_PB_Valid[10],
	PlayerBar:E_VNOTI_PB_Bar[10],
	Float:E_VNOTI_PB_Y[10]
};

static enum _:E_VNOTI_TEXT_PLAYER_DATA 
{
	bool:E_VNOTI_Text_Valid[10],
	Float:E_VNOTI_Text_Y[10],
	PlayerText:E_VNOTI_Text_TD[10],
	Float:E_VNOTI_Text_SizeY[10]
};


static enum _:E_VNOTI_PLAYER_DATA 
{
	PlayerText:E_VNOTI_TD,
	E_VNOTI_IDBox,
	E_VNOTI_TIMEBOX,
	Float:E_VNOTI_SizeY,
	Float:E_VNOTI_PosY,
	bool:E_VNOTI_SyncChanges,

	Float:E_VNOTI_InternalSize,
	E_VNOTI_CountText,

	E_VNOTI_Text[E_VNOTI_TEXT_PLAYER_DATA],
	E_VNOTI_Progress[E_VNOTI_PROGRESS_PLAYER_DATA]
};

static Pool:VNoti_Pool[MAX_PLAYERS];
static Map:VNoti_Map[MAX_PLAYERS];


static stock Pool:_GetVNotiPool(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_POOL;
    }

    if (!pool_valid(VNoti_Pool[playerid])) {
        VNoti_Pool[playerid] = pool_new();

      
    }
    return VNoti_Pool[playerid];
}

static stock Map:_GetVNotiMap(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_MAP;
    }

    if (!map_valid(VNoti_Map[playerid])) {
        VNoti_Map[playerid] = map_new();

      
    }
    return VNoti_Map[playerid];
}


static stock bool:_IsValidVNoti(playerid, id, &Pool:pool = INVALID_POOL) {
    pool = _GetVNotiPool(playerid);

    return pool_valid(pool) && pool_has(pool, id);
}


static stock bool:_GetVNotiData(playerid, id, data[E_VNOTI_PLAYER_DATA], &Pool:pool = INVALID_POOL) {
    if (!_IsValidVNoti(playerid, id, pool)) {
        return false;
    }

    pool_get_arr(pool, id, data);
    return true;
}


static stock bool:_SetVNotiData(playerid, id, const data[E_VNOTI_PLAYER_DATA]) {
    new Pool:pool;

    if (!_IsValidVNoti(playerid, id, pool)) {
        return false;
    }

    pool_set_arr(pool, id, data);
    return true;
}


funct_ShowTextdrawNotif(playerid)
{
	fTextdrawBlockNotiSize[playerid] = BOXNOTIF_POS_Y;

	new Pool:pool = _GetVNotiPool(playerid);
	if (pool_valid(pool)) {
		new data[E_VNOTI_PLAYER_DATA];
		
		//pool_sort(pool);
		
		for (new Iter:id = pool_iter(pool); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);
			/*if (data[E_VNOTI_TD] != PlayerText:INVALID_TEXT_DRAW) {
				PlayerTextDrawDestroy(playerid, data[E_VNOTI_TD]);
			}*/

			PlayerTextDrawSetPos(playerid, data[E_VNOTI_TD], BOXNOTIF_POS_X, fTextdrawBlockNotiSize[playerid]);
			UpdatePlayerTextBoxNotif(playerid, data);

			data[E_VNOTI_PosY] = fTextdrawBlockNotiSize[playerid];
			_SetVNotiData(playerid, iter_get_key(id), data);

			fTextdrawBlockNotiSize[playerid] += (data[E_VNOTI_SizeY]+data[E_VNOTI_InternalSize]) + 5.0;
			PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

			if(data[E_VNOTI_TIMEBOX] != 0)
			{
				KillTimer(PlayerInfoTemp[playerid][pt_TimersE][1]);
				PlayerInfoTemp[playerid][pt_TimersE][1] = SetTimerEx("ReSyncNotifications_Timer", 1000, true, "i", playerid);
			}
				#if defined Notification_DEBUG_MODE_ALL
				printf("[funct_ShowTextdrawNotif]: Row: %d, %f", inew, fTextdrawBlockNotiSize[playerid]);
				#endif
		}
	}
	 	//pool_delete(pool);
	
	return 1;
}

funct_AddTextDrawNotif(playerid, id, const text[] = "", textslot = 0/*, Float:sizey = 0.0*/)
{	
	/*Notification.TDBox[playerid][0][@IDBox] = 1;
	Notification.TDText[playerid][0][@IDBox] = 1;
	Notification.TDBox[playerid][0][@TIMEBOX] = 1;*/

	switch(id)
	{
		case VNOTI_TYPE_ZONEIT: 
		{
			//new idx = IsOpenNotifBox(playerid, 1);
			new textf[100], lines;

			
				//box = funct_CreateTextdrawBoxNotif(playerid, id, true, sizey);
			new box = GetPlayerOpenNotifID(playerid, id);
			if(box == BOXNOTIF_INVALID_ID)
			{
				box = funct_CreateTextdrawBoxNotif(playerid, id, false, 4.0);

				format(textf, sizeof(textf), "%s", text);
				lines = GetTextDrawLineCount(textf);

				//vNoti_SetPlayerBoxSize(playerid, box, 4.0);
				UpdateNotificationForPlayer(playerid, box); 

				new Float:textsizey;
				vNoti_GetPlayerBoxSize(playerid, box, textsizey);
				funct_CreateTextdrawTextNotifEx(playerid, box, textslot, textf, 1, 0.0, textsizey, .sizey = (lines*VNOTI_LETTERSIZE_T_1), .syncsize = true);
			}
			else
			{

				format(textf, sizeof(textf), "%s", text);
				lines = GetTextDrawLineCount(textf);

				new Float:textsizey;
				vNoti_GetPlayerBoxSize(playerid, box, textsizey);
				funct_CreateTextdrawTextNotifEx(playerid, box, textslot, textf, 1, 0.0, textsizey, .sizey = (lines*VNOTI_LETTERSIZE_T_1), .syncsize = true);
				//vNoti_SetSizeTextForBox(playerid, box, (lines*VNOTI_LETTERSIZE_T_1));
				//vNoti_UpdateSizeTextForBox(playerid, box);
			}
		}
		case VNOTI_TYPE_COUNTFARM:
		{
			new i = funct_CreateTextdrawBoxNotif(playerid, id, true,  17.0);
			if(i == BOX_NOTIF_INVALID_BOX) return 1;
			new string[59];
			format(string, sizeof(string), "Tiempo restante:");
			funct_CreateTextdrawTextNotif(playerid, i, 0, string, 0);

			UpdateNotificationForPlayer(playerid, i);
		}
		default:
		{
			new i = funct_CreateTextdrawBoxNotif(playerid, id, true, 17.0);
			if(i == BOX_NOTIF_INVALID_BOX) return 1;
			funct_CreateTextdrawTextNotif(playerid, i, 0, text, 0);

			UpdateNotificationForPlayer(playerid, i);
		} 
	}
	return 1;
}

funct_AddTextDrawNotifBoxEx(playerid, id, Float:sizey, time)
{
	new i = funct_CreateTextdrawBoxNotif(playerid, id, true, sizey);
	if(time != 0) vNoti_SetTimeHideBox(playerid, i, time);
	return i;
}

vNoti_CreatePlayerBox(playerid, id, Float:sizey, time)
{
	new i = funct_CreateTextdrawBoxNotif(playerid, id, true, sizey);
	if(time != 0) 
	{ 	
 		vNoti_SetTimeHideBox(playerid, i, time);
 	}
	return i;
}

vNoti_SetPlayerBoxSize(playerid, id, Float:sy, bool:fixed = false)
{
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	if(fixed) { data[E_VNOTI_SizeY] = sy; PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], BOX_NOTIF_SIZE_X, sy); }
	else { PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], BOX_NOTIF_SIZE_X, (data[E_VNOTI_SizeY]+sy)); data[E_VNOTI_SizeY] += sy; }

	PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);
	data[E_VNOTI_SyncChanges] = true;

	_SetVNotiData(playerid,id,data);
	return 1;
}

vNoti_SetTimeHideBox(playerid, id, time)
{
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	data[E_VNOTI_TIMEBOX] = gettime() + time;

	_SetVNotiData(playerid, id, data);

	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][1]);
	PlayerInfoTemp[playerid][pt_TimersE][1] = SetTimerEx("ReSyncNotifications_Timer", 1000, true, "i", playerid);
	return 1;
}

// Get - Functions
vNoti_GetPlayerBoxSize(playerid, id, &Float:sy)
{
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	sy = data[E_VNOTI_InternalSize];
	return 1;
}

funct_UpdateTextDrawNotif(playerid, id, const text[], slot = 0)
{
    new box = IsOpenNotifBox(playerid, id);
	
	if(box == BOXNOTIF_INVALID_ID) return 1;

	new data[E_VNOTI_PLAYER_DATA];
	new Pool:pool;

	if (!_GetVNotiData(playerid, box, data, pool)) {
        return 0;
    }

   	if(data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] != PlayerText:INVALID_TEXT_DRAW)
   	{
		PlayerTextDrawSetString(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], ConvertEncoding(text));
   	}
	
	return box;
}

function funct_HideTextdrawNotif(playerid, id)
{
	new Map:map;
	new i = IsOpenNotifBox(playerid, id, map);

	if(i != BOXNOTIF_INVALID_ID)
	{
		new data[E_VNOTI_PLAYER_DATA], Pool:pool;

	    if (!_GetVNotiData(playerid, i, data, pool)) {
	        return 0;
	    }

		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][1]);
		
		PlayerTextDrawDestroy(playerid, data[E_VNOTI_TD]);
		DestroyPlayerTextBoxNotif(playerid, data);


		pool_remove(pool, i);
		map_remove(map, data[E_VNOTI_IDBox]);

		funct_ShowTextdrawNotif(playerid);
	}
	return 1;
}

static stock vNoti_DestroyInternal(playerid, data[E_VNOTI_PLAYER_DATA])
{
	new Pool:pool = _GetVNotiPool(playerid), Map:map;
	new i = IsOpenNotifBox(playerid, data[E_VNOTI_IDBox], map);

	if(i != BOXNOTIF_INVALID_ID)
	{
		#if defined Notification_DEBUG_MODE_ALL
			printf("[funct_HideTextdrawNotif] %d", i);
		#endif

		KillTimer(PlayerInfoTemp[playerid][pt_TimersE][1]);
		
		PlayerTextDrawDestroy(playerid, data[E_VNOTI_TD]);

		DestroyPlayerTextBoxNotif(playerid, data);

		pool_remove(pool, i);
		map_remove(map, data[E_VNOTI_IDBox]);

		funct_ShowTextdrawNotif(playerid);
	}
	return 1;
}

ShowPlayerNotificationBox(playerid, id, const text[], time,  Float:SizeY)
{
	new i = funct_AddTextDrawNotifBoxEx(playerid, id, SizeY, time);
	if(i == BOX_NOTIF_INVALID_BOX) return 1;
	funct_CreateTextdrawTextNotif(playerid, i, 0, ConvertEncoding(text), 0, 0.220, 1.3);
	UpdateNotificationForPlayer(playerid, i);
	return 1;
}

CreatePlayerNotificationSimple(playerid, id, const text[], time = 0, bool:split = true)
{
	if(IsOpenNotifBox(playerid, id) != BOXNOTIF_INVALID_ID) return 1;

	new i = funct_CreateTextdrawBoxNotif(playerid, id, false, 10.0);
	
	new temp_text[800];
	format(temp_text, sizeof(temp_text), "%s", text);
	if(split) SplitTextDrawString(temp_text, 117.0, 0.240, 1);

	new lines = GetTextDrawLineCount(temp_text);

	funct_CreateTextdrawTextNotif(playerid, i, 0, ConvertEncoding(temp_text), 0, 0.220, 1.35);

	vNoti_SetPlayerBoxSize(playerid, i, 4.0+(lines*VNOTI_LETTERSIZE_T_1), true);
	if(time != 0) { vNoti_SetTimeHideBox(playerid, i, time); }
	
	UpdateNotificationForPlayer(playerid, i);
	return 1;
}

stock CreatePlayerNotifSimple_s(playerid, id, String:text, time = 0, bool:split = true)
{
	new i = funct_CreateTextdrawBoxNotif(playerid, id, true, 10.0);
	if(i == BOX_NOTIF_INVALID_BOX) return 1;
	
	if(split) SplitTextDrawString_s(text, 117.0, 0.240, 1);

	new lines = GetTextDrawLineCount_s(text);

	funct_CreateTextdrawTextNotif(playerid, i, 0, text, 0, 0.220, 1.35);

	vNoti_SetPlayerBoxSize(playerid, i, 4.0+(lines*VNOTI_LETTERSIZE_T_1), true);
	if(time != 0) { vNoti_SetTimeHideBox(playerid, i, time); }
	
	UpdateNotificationForPlayer(playerid, i);
	return 1;
}

funct_CreateTextdrawBoxNotif(playerid, id, bool:double_check = false, Float:sizeboxy)
{	
	new textid, Pool:pool = _GetVNotiPool(playerid), data[E_VNOTI_PLAYER_DATA];
	if(double_check == true)
	{
		new Map:map;
		textid = IsOpenNotifBox(playerid, id, map);
		if(textid == -1)
		{
			//textid = GetBoxNotifAvailableID(playerid);


			data[E_VNOTI_TD] = CreatePlayerTextDraw(playerid,BOXNOTIF_POS_X, fTextdrawBlockNotiSize[playerid], "LD_SPAC:white");
			PlayerTextDrawColor(playerid,data[E_VNOTI_TD], 0x00000077/*44*/);
			PlayerTextDrawBoxColor(playerid,data[E_VNOTI_TD], 1970632023);
			PlayerTextDrawUseBox(playerid,data[E_VNOTI_TD], 1);
			PlayerTextDrawFont(playerid,data[E_VNOTI_TD], 4);
			PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], 117.000000, sizeboxy);
			PlayerTextDrawSetSelectable(playerid, data[E_VNOTI_TD], /*1*/false);
			PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

			data[E_VNOTI_IDBox] = id;
			data[E_VNOTI_SizeY] = sizeboxy;
			data[E_VNOTI_SyncChanges] = true;
			data[E_VNOTI_PosY] = fTextdrawBlockNotiSize[playerid];

			for(new i = 0; i < 10; i++)
			{
				data[E_VNOTI_Text][E_VNOTI_Text_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				data[E_VNOTI_Text][E_VNOTI_Text_Y] = 0.0;
				data[E_VNOTI_Text][E_VNOTI_Text_Valid] = false;
			}

			new index = pool_add_arr(pool, data);
			map_add(map, id, index);

			return index;

			//Notification.TDBox[playerid][textid][@SizeY] = sizeboxy;

		//	return textid;

		} else return textid;
	}
	else
	{
		new Map:map = _GetVNotiMap(playerid);
	//	pool = _GetVNotiPool(playerid);

		data[E_VNOTI_TD] = CreatePlayerTextDraw(playerid,BOXNOTIF_POS_X, fTextdrawBlockNotiSize[playerid], "LD_SPAC:white");
		PlayerTextDrawColor(playerid,data[E_VNOTI_TD], 0x00000077/*44*/);
		PlayerTextDrawBoxColor(playerid,data[E_VNOTI_TD], 1970632023);
		PlayerTextDrawUseBox(playerid,data[E_VNOTI_TD], 1);
		PlayerTextDrawFont(playerid,data[E_VNOTI_TD], 4);
		PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], 117.000000, sizeboxy);
		PlayerTextDrawSetSelectable(playerid, data[E_VNOTI_TD], /*1*/false);
		PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

		data[E_VNOTI_IDBox] = id;
		data[E_VNOTI_SizeY] = sizeboxy;
		data[E_VNOTI_SyncChanges] = true;
		data[E_VNOTI_PosY] = fTextdrawBlockNotiSize[playerid];

		for(new i = 0; i < 10; i++)
		{
			data[E_VNOTI_Text][E_VNOTI_Text_TD][i] = PlayerText:INVALID_TEXT_DRAW;
			data[E_VNOTI_Text][E_VNOTI_Text_Y] = 0.0;
			data[E_VNOTI_Text][E_VNOTI_Text_Valid] = false;

			data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i] = PlayerBar:INVALID_PLAYER_BAR_ID;
			data[E_VNOTI_Progress][E_VNOTI_PB_Y] = 0.0;
			data[E_VNOTI_Progress][E_VNOTI_PB_Valid] = false;
		}

		new index = pool_add_arr(pool, data);
		map_add(map, id, index);

		return index;
	}
/*	return 0;*/
}

// Mejor que funct_CreateTextdrawBoxNotif. By Blaster


vNotif_CreatePlayerBoxID(playerid, id, bool:double_check = false)
{	
	new box_id, Pool:pool = _GetVNotiPool(playerid), data[E_VNOTI_PLAYER_DATA];
	if(double_check == true)
	{
		new Map:map;
		box_id = IsOpenNotifBox(playerid, id, map);
		if(box_id == -1)
		{
			data[E_VNOTI_TD] = PlayerText:INVALID_TEXT_DRAW;
			data[E_VNOTI_SizeY] = 0.0;
			data[E_VNOTI_IDBox] = id;

			for(new i = 0; i < 10; i++)
			{
				data[E_VNOTI_Text][E_VNOTI_Text_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				//data[E_VNOTI_Text][E_VNOTI_Text_Y][i] = 0.0;
				//data[E_VNOTI_Text][E_VNOTI_Text_Valid][i] = false;

				data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i] = PlayerBar:INVALID_PLAYER_BAR_ID;
				data[E_VNOTI_Progress][E_VNOTI_PB_Y][i] = 0.0;
				data[E_VNOTI_Progress][E_VNOTI_PB_Valid][i] = false;

			}

			new index = pool_add_arr(pool, data);
			map_add(map, id, index);

			return index;

		} else return box_id;
	}
	else
	{
		new Map:map = _GetVNotiMap(playerid);

		//pool = _GetVNotiPool(playerid);

		data[E_VNOTI_TD] = PlayerText:INVALID_TEXT_DRAW;
		data[E_VNOTI_SizeY] = 0.0;
		data[E_VNOTI_IDBox] = id;
		//data[E_VNOTI_SizeY] = sizeboxy;

		for(new i = 0; i < 10; i++)
		{
			data[E_VNOTI_Text][E_VNOTI_Text_TD][i] = PlayerText:INVALID_TEXT_DRAW;
			//data[E_VNOTI_Text][E_VNOTI_Text_Y][i] = 0.0;
			//data[E_VNOTI_Text][E_VNOTI_Text_Valid][i] = false;

			data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i] = PlayerBar:INVALID_PLAYER_BAR_ID;
			data[E_VNOTI_Progress][E_VNOTI_PB_Y] = 0.0;
			data[E_VNOTI_Progress][E_VNOTI_PB_Valid] = false;
		}
		new index = pool_add_arr(pool, data);
		map_add(map, id, index);

		return index;
	}
}

vNotif_CreatePlayerBoxTD(playerid, id, Float:sizeboxy)
{	
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	if(data[E_VNOTI_TD] == PlayerText:INVALID_TEXT_DRAW) data[E_VNOTI_TD] = CreatePlayerTextDraw(playerid,BOXNOTIF_POS_X, fTextdrawBlockNotiSize[playerid], "LD_SPAC:white");
	PlayerTextDrawColor(playerid,data[E_VNOTI_TD], 0x00000088/*44*/);
	PlayerTextDrawBoxColor(playerid,data[E_VNOTI_TD], 1970632023);
	PlayerTextDrawUseBox(playerid,data[E_VNOTI_TD], 1);
	PlayerTextDrawFont(playerid,data[E_VNOTI_TD], 4);
	PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], 117.000000, sizeboxy);
	//PlayerTextDrawSetSelectable(playerid, data[E_VNOTI_TD], 1);
	PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

	data[E_VNOTI_SyncChanges] = true;
	data[E_VNOTI_SizeY] = sizeboxy;
	data[E_VNOTI_PosY] = fTextdrawBlockNotiSize[playerid];
	
	_SetVNotiData(playerid, id, data);
	return id;
}

funct_CreateTextdrawTextNotif(playerid, i, slot,/*id,*/const text[],  Float:px, Float:tsizex = 0.240, Float:tsizey = 1.35, font = 1, align = 1)
{
	new id = i, data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

//	if(data[E_VNOTI_Text][E_VNOTI_Text_Valid][slot] == false) { data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] = CreatePlayerTextDraw(playerid,(BOXNOTIF_POS_X+px)+3.0, fTextdrawBlockNotiSize[playerid]+Notification.TDBox[playerid][i][@SizeY]+1.0, ConvertEncoding(text)); }
	if(data[E_VNOTI_Text][E_VNOTI_Text_Valid][slot] == false) { data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] = CreatePlayerTextDraw(playerid,(BOXNOTIF_POS_X+px)+3.0, data[E_VNOTI_PosY]+1.0, ConvertEncoding(text)); }
	PlayerTextDrawBackgroundColor(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 255);
	PlayerTextDrawColor(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], -1);
	PlayerTextDrawAlignment(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], align);
	PlayerTextDrawSetString(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], ConvertEncoding(text));
	PlayerTextDrawFont(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], font);
	PlayerTextDrawLetterSize(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], /*0.240000+tsizex, 1.3+tsizey*/tsizex, tsizey);
	if(font == 4) PlayerTextDrawTextSize(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 10.0, 15.0);
	PlayerTextDrawSetShadow(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 0);

	//data[E_VNOTI_Text][E_VNOTI_Text_Y][slot] = 1.0;
	data[E_VNOTI_Text][E_VNOTI_Text_Valid][slot] = true;
	PlayerTextDrawShow(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot]);
	//Notification.Extra[playerid][i][@IDBox] = Notification.TDBox[playerid][textid][@IDBox];
	_SetVNotiData(playerid, id, data);
	return i;
	
}

funct_CreateTextdrawTextNotifEx(playerid, i, slot, const text[], font, Float:px = 0.0, Float:py = 1.0, Float:letterx = 0.240, Float:lettery = 1.35, color = -1, align = 1, Float:sizey = 0.0, bool:syncsize = false, bool:showtd = true)
{
	new id = i, data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	//data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] = CreatePlayerTextDraw(playerid,(BOXNOTIF_POS_X+px)+3.0, (fTextdrawBlockNotiSize[playerid] / -Notification.TDBox[playerid][i][@SizeY] / +1.0)+py, ConvertEncoding(text));
	if(data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] == PlayerText:INVALID_TEXT_DRAW) 
	{
		data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] = CreatePlayerTextDraw(playerid,(BOXNOTIF_POS_X+px)+3.0, (data[E_VNOTI_PosY]+1.0)+py, ConvertEncoding(text));
	
		if(syncsize)
		{
			data[E_VNOTI_InternalSize] += sizey;
			PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], BOX_NOTIF_SIZE_X, (data[E_VNOTI_SizeY]+data[E_VNOTI_InternalSize]));
			
			PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);
			fTextdrawBlockNotiSize[playerid] += sizey;
			//printf("%.4f Notif", 	fTextdrawBlockNotiSize[playerid]);
		}
	}

	PlayerTextDrawBackgroundColor(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 255);
	PlayerTextDrawColor(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], color);
	PlayerTextDrawAlignment(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], align);
	PlayerTextDrawFont(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], font);
	PlayerTextDrawLetterSize(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], letterx, lettery);
	if(font == 4) PlayerTextDrawTextSize(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 10.0, 15.0);
	PlayerTextDrawSetShadow(playerid,data[E_VNOTI_Text][E_VNOTI_Text_TD][slot], 0);

	data[E_VNOTI_Text][E_VNOTI_Text_Y][slot] = py;
	data[E_VNOTI_Text][E_VNOTI_Text_SizeY][slot] = sizey;
	data[E_VNOTI_Text][E_VNOTI_Text_Valid][slot] = true;

	//data[E_VNOTI_CountText]++;

	if(showtd) PlayerTextDrawShow(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot]);
	

	_SetVNotiData(playerid, id, data);
	return 1;
}

stock vNoti_CreateTextdrawText(playerid, i, slot, const text[])
{
	return 1;
}

UpdateNotificationForPlayer(playerid, id = 0, Float:sizeboxy = 0.0/*, bool:resync = false*/)
{
	new data[E_VNOTI_PLAYER_DATA];
	if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

    if(!data[E_VNOTI_SyncChanges]) return 0; 


	PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

	if(sizeboxy) fTextdrawBlockNotiSize[playerid] +=  sizeboxy + 5.0;
	else fTextdrawBlockNotiSize[playerid] += data[E_VNOTI_SizeY] + 5.0;

	data[E_VNOTI_SyncChanges] = false;
	_SetVNotiData(playerid, id, data);
	return 1;
}

UpdatePlayerTextBoxNotif(playerid, const data[E_VNOTI_PLAYER_DATA])
{
	for(new i = 0; i < 10; i++)
	{
		if(data[E_VNOTI_Text][E_VNOTI_Text_Valid][i]) 
		{
			PlayerTextDrawSetPos(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][i], BOXNOTIF_POS_X+3.0, (fTextdrawBlockNotiSize[playerid]+1.0)+data[E_VNOTI_Text][E_VNOTI_Text_Y][i]);
			PlayerTextDrawShow(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][i]);
		}
	}
	for(new i = 0; i < 10; i++)
	{
		if(data[E_VNOTI_Progress][E_VNOTI_PB_Valid][i])
		{
			SetPlayerProgressBarPos(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i], (BOXNOTIF_POS_X+BOX_NOTIF_BAR_POS_Y), (fTextdrawBlockNotiSize[playerid]+data[E_VNOTI_Progress][E_VNOTI_PB_Y][i]));
			ShowPlayerProgressBar(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i]);
		}
	}
	return 1;
}

UpdatePlayerNotifBar(playerid, id, Float:value, slot = 0)
{

	new i = IsOpenNotifBox(playerid, id);
	if(i == BOXNOTIF_INVALID_ID) return 1;

	new data[E_VNOTI_PLAYER_DATA];
	if (!_GetVNotiData(playerid, i, data)) {
        return 0;
    }

	SetPlayerProgressBarValue(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot], value);
	ShowPlayerProgressBar(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot]);

	return 1;
}

// Destroy Textdraw Text. Last Modified: 4/06/2019 By Blaster
stock DestroyPlayerTextForBox(playerid, box, slot)
{
	PlayerTextDrawDestroy(playerid, Notification.Extra[playerid][box][@Text][slot]);
	Notification.Extra[playerid][box][@Text][slot] = PlayerText:INVALID_TEXT_DRAW;
	Notification.Extra[playerid][box][@TextY][slot] = 0.0;
	return 1;
}

stock vNoti_DestroyBoxEmpty(playerid, id, slot)
{
	new i = IsOpenNotifBox(playerid, id);

	if(i == BOXNOTIF_INVALID_ID) return 0;

	new data[E_VNOTI_PLAYER_DATA];
	if (!_GetVNotiData(playerid, i, data)) {
        return 0;
    }

   	if(data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] != PlayerText:INVALID_TEXT_DRAW) 
   	{
   		PlayerTextDrawDestroy(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][slot]);
   		data[E_VNOTI_Text][E_VNOTI_Text_TD][slot] = PlayerText:INVALID_TEXT_DRAW;
   		data[E_VNOTI_Text][E_VNOTI_Text_Valid][slot] = false;
   		data[E_VNOTI_Text][E_VNOTI_Text_SizeY][slot] = 0.0;
   		data[E_VNOTI_Text][E_VNOTI_Text_Y][slot] = 0.0;

   		data[E_VNOTI_InternalSize] = 0.0;

   		new bool:found;
   		for(new text = 0; text < 10; text++)
   		{
   			if(data[E_VNOTI_Text][E_VNOTI_Text_TD][text] != PlayerText:INVALID_TEXT_DRAW) 
   			{
   				found = true;

   				data[E_VNOTI_Text][E_VNOTI_Text_Y][text] = data[E_VNOTI_InternalSize];
   				PlayerTextDrawSetPos(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][text], BOXNOTIF_POS_X+3.0, (data[E_VNOTI_PosY]+1.0)+data[E_VNOTI_Text][E_VNOTI_Text_Y][text]);
   				PlayerTextDrawShow(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][text]);

   				data[E_VNOTI_InternalSize] += data[E_VNOTI_Text][E_VNOTI_Text_SizeY][text];
   			}
   		}

   		PlayerTextDrawTextSize(playerid,data[E_VNOTI_TD], BOX_NOTIF_SIZE_X, data[E_VNOTI_InternalSize]+data[E_VNOTI_SizeY]);
   		PlayerTextDrawShow(playerid, data[E_VNOTI_TD]);

   		_SetVNotiData(playerid, i, data);

   		if(found == false)
   		{
   			funct_HideTextdrawNotif(playerid, id);
   			return 1;
   		}
   		funct_ShowTextdrawNotif(playerid);
   	}
	return 1;
}


DestroyPlayerTextBoxNotif(playerid, data[E_VNOTI_PLAYER_DATA])
{
	for(new i = 0; i < 10; i++)
	{
		if(data[E_VNOTI_Text][E_VNOTI_Text_Valid][i]) 
		{
			PlayerTextDrawDestroy(playerid, data[E_VNOTI_Text][E_VNOTI_Text_TD][i]);
			data[E_VNOTI_Text][E_VNOTI_Text_TD][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}
	for(new i = 0; i < 10; i++)
	{
		if(data[E_VNOTI_Progress][E_VNOTI_PB_Valid][i])
		{
			DestroyPlayerProgressBar(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i]);
			data[E_VNOTI_Progress][E_VNOTI_PB_Bar][i] = PlayerBar:INVALID_PLAYER_BAR_ID;
		}
	}
	return 1;
}

funct_CreatePlayerBarNotif(playerid, id, slot = 0, Float:PosY, Float:maxvalue, color = 0x47BCE8FF, Float:Height = 5.0)
{
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	if(!data[E_VNOTI_Progress][E_VNOTI_PB_Valid][slot]) data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot] = CreatePlayerProgressBar(playerid, (BOXNOTIF_POS_X+BOX_NOTIF_BAR_POS_Y), (fTextdrawBlockNotiSize[playerid]/*-Notification.TDBox[playerid][id][@SizeY]*/+PosY), 110.0, Height, color, maxvalue, 2);
	
	data[E_VNOTI_Progress][E_VNOTI_PB_Y][slot] = PosY;
	data[E_VNOTI_Progress][E_VNOTI_PB_Valid][slot] = true;
	ShowPlayerProgressBar(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot]);

	_SetVNotiData(playerid, id, data);
	return id;
}

funct_SetValuePlayerBarNotif(playerid, id, slot, Float:value)
{
	new data[E_VNOTI_PLAYER_DATA];

    if (!_GetVNotiData(playerid, id, data)) {
        return 0;
    }

	SetPlayerProgressBarValue(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot], value);
	ShowPlayerProgressBar(playerid, data[E_VNOTI_Progress][E_VNOTI_PB_Bar][slot]);

	return 1;
}


/*timer HideNotificationID_Timer[time](playerid, time, box)
{
	#pragma unused time
	funct_HideTextdrawNotif(playerid, box);
}*/

function ReSyncNotifications_Timer(playerid)
{
	new Pool:pool = _GetVNotiPool(playerid);
	if (pool_valid(pool)) {
		new data[E_VNOTI_PLAYER_DATA];
		
		//pool_sort(pool);
		
		for (new Iter:id = pool_iter(pool); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);

			

			if(data[E_VNOTI_TIMEBOX] > 0)
			{
				//printf("Timer %d y gettime %d", data[E_VNOTI_TIMEBOX], gettime());
				//data[E_VNOTI_TIMEBOX]--;	

				if(data[E_VNOTI_TIMEBOX] < gettime())
				{
				//	printf("Destroy");
					vNoti_DestroyInternal(playerid,data);
					break;
				}
			}
		}
	}
	return 1;
}

reset_DataNotifications(playerid)
{
	fTextdrawBlockNotiSize[playerid] = BOXNOTIF_POS_Y;
	/*for(new i = 0; i != 10; i++) { fTextdrawBlockNoti[playerid][efunct_textboxid][i] = -1; }*/
}

CleanPlayerNotifications(playerid)
{
	new Pool:pool = _GetVNotiPool(playerid);

	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][1]);
	if (pool_valid(pool)) {
		new data[E_VNOTI_PLAYER_DATA];
		

		
		for (new Iter:id = pool_iter(pool); iter_inside(id); iter_move_next(id)) {
			if (!iter_sizeof(id)) {
				continue;
			}

			iter_get_arr(id, data);

			if(data[E_VNOTI_TD] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, data[E_VNOTI_TD]);
			}

			DestroyPlayerTextBoxNotif(playerid, data);
			
		}
		pool_delete(pool);
	}
	new Map:map = _GetVNotiMap(playerid);
	if(map_valid(map))
	{
		map_delete(map);
	}
	return 1;
}

static stock IsOpenNotifBox(playerid, boxid, &Map:map = INVALID_MAP)
{

	map = _GetVNotiMap(playerid);


	if(map_has_key(map, boxid)) 
	{
		new index = map_get (map, boxid);
		//printf("Return: %d", index);
		return index;
	}

	return BOXNOTIF_INVALID_ID;
}

stock GetPlayerOpenNotifID(playerid, id)
{
	new box = IsOpenNotifBox(playerid, id);
	return box;
}