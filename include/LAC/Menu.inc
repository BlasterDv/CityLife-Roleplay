/*

	About: Text List system
	Author:	ziggi

	Installation:
		Include this file after a_samp.inc

	Usage:
		TextListCreate:example_tl(playerid)
		{
			new items[][TEXTLIST_MAX_ITEM_NAME] = {
				"Test 1",
				"Big Test 2"
			};

			new bg_colors[TEXTLIST_MAX_ITEMS] = {
				0xFF0000FF,
				0x00FF00FF
			};

			MenuV_Open(playerid, TextList:example_tl, items, sizeof(items),
			              "Example header",
			              "Button 1", "Button 2",
			              .lists_bg_color = bg_colors);
		}

		TextListResponse:example_tl(playerid, MenuVType:response, itemid, itemvalue[])
		{
			new string[128];
			format(string, sizeof(string), " %d | %d | %d | %s", playerid, _:response, itemid, itemvalue);
			SendClientMessage(playerid, -1, string);
			return 1;
		}

*/

#if !defined _samp_included
	#error "Please include a_samp or a_npc before textlist"
#endif
//#include <memory>
#include <PawnPlus>

#if defined _textlist_included
	#endinput
#endif

#define _textlist_included

/*

	Define const

*/

#if !defined TEXTLIST_MAX_ITEMS
	#define TEXTLIST_MAX_ITEMS 30
#endif

#if !defined TEXTLIST_MAX_ITEMS_ON_LIST
	#define TEXTLIST_MAX_ITEMS_ON_LIST 15
#endif

#define TEXTLIST_MAX_ITEM_NAME     32
#define TEXTLIST_MAX_FUNCTION_NAME 31
#define TEXTLIST_MAX_BUTTON_NAME   12

#define DEFAULT_VMENU_INCREMENT_SIZE 10100

#define VMENU_POS_X 10.0 // 550.0
#define VMENU_POS_Y 10.0

#define VMENU_ITEM_POS_X 40.0 // 479.0

/*

	Define functions

*/

#define ShowPlayerMenuV(%0,%1, \
	Internal_ShowPlayerMenuV(%0, #%1,

#define MenuV_Show(%0,%1) \
	Internal_MenuV_Show(%0, #%1)

#define MenuV:%0(%1) \
	forward tlr_%0(%1); \
	public tlr_%0(%1)

#define MenuV_Create:%0(%1) \
	forward tlc_%0(%1); \
	public tlc_%0(%1)

#define MenuV_Tag: #

/*

	Enums

*/

 enum _:E_VMENU_DATA {
	String:E_VMENU_TITLE,
	String:E_VMENU_INFO,
	E_VMENU_EXTRA
};

/*

	Vars

*/

static
	bool:IsOpenMenuV[MAX_PLAYERS],
	ListCount[MAX_PLAYERS],
	ListPage[MAX_PLAYERS],
	FunctionName[MAX_PLAYERS][TEXTLIST_MAX_FUNCTION_NAME],
	bool:TD_SkipCancel[MAX_PLAYERS],
	//TD_ListItemValue[MAX_PLAYERS][TEXTLIST_MAX_ITEMS][TEXTLIST_MAX_ITEM_NAME],
	PlayerText:TD_ListItem[MAX_PLAYERS][TEXTLIST_MAX_ITEMS_ON_LIST],
	PlayerText:TD_ListInfoItem[MAX_PLAYERS][TEXTLIST_MAX_ITEMS_ON_LIST],
	Text:TDGeneral_ListItem[TEXTLIST_MAX_ITEMS_ON_LIST],

	Text:TD_vMenuGlobal[8] = {Text:INVALID_TEXT_DRAW, ...},


	List:vMenuPlayerPool[MAX_PLAYERS];


/*

	Public functions

*/

 stock List:_GetVMenuPool(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_LIST;
    }

    if (!list_valid(vMenuPlayerPool[playerid])) {
        vMenuPlayerPool[playerid] = list_new();
    }

    return vMenuPlayerPool[playerid];
}


stock Internal_MenuV_Show(playerid, const function[])
{
	new call_func[TEXTLIST_MAX_FUNCTION_NAME] = "tlc_";
	strcat(call_func, function);

	CallLocalFunction(call_func, "i", playerid);
}

stock MenuV_Update(playerid)
{
	vMenu_UpdateListitems(playerid);
	SelectTextDraw(playerid, 0xFFFFFFAA);
	return 1;
}

stock MenuV_Close(playerid, bool:update = false)
{
	if(!IsOpenMenuV[playerid]) return 0;

	IsOpenMenuV[playerid] = false;
	FunctionName[playerid][0] = EOS;

	TextDrawHideForPlayer(playerid, TD_vMenuGlobal[0]);
	TextDrawHideForPlayer(playerid, TD_vMenuGlobal[1]);
	TextDrawHideForPlayer(playerid, TD_vMenuGlobal[2]);
	TextDrawHideForPlayer(playerid, TD_vMenuGlobal[3]);
	
	vMenu_DestroyPointers(playerid);
	
	for (new i = 0; i < TEXTLIST_MAX_ITEMS_ON_LIST; i++) {
		TD_Remove(playerid, TD_ListItem[playerid][i]);
		TD_Remove(playerid, TD_ListInfoItem[playerid][i]);
		TextDrawHideForPlayer(playerid, TDGeneral_ListItem[i]);

	}

	if(!update) 
	{ 
		TD_SkipCancel[playerid] = true; 
		CancelSelectTextDraw(playerid); 
	}

	return 1;
}

stock vMenu_AddItems(playerid, const title[] = "", const info[] = "", extraid = -1)
{
	if(!IsOpenMenuV[playerid]) return -1;

	//SendClientMessageEx(playerid, -1, "XD %d", ListCount[playerid]);

	new List:list = _GetVMenuPool(playerid);

	new data[E_VMENU_DATA];

	data[E_VMENU_TITLE] = str_acquire(str_new(title));
	data[E_VMENU_INFO] = str_acquire(str_new(info));
	data[E_VMENU_EXTRA] = extraid;

	new count = ListCount[playerid];
	count++;
	ListCount[playerid] = count;

	return list_add_arr(list, data);
}

stock Internal_ShowPlayerMenuV(playerid, const function[], const header[] = "", bool:update = false)
{
	MenuV_Close(playerid, update);
	//if(IsOpenMenuV[playerid]) { MenuV_Close(playerid, update); }

	IsOpenMenuV[playerid] = true;
	ListPage[playerid] = 0;
	ListCount[playerid] = 0;

	format(FunctionName[playerid], TEXTLIST_MAX_FUNCTION_NAME, function);
	// header
	new string[50];
	format(string, sizeof(string), "%s", header);

	TextDrawShowForPlayer(playerid, TD_vMenuGlobal[3]);
	TextDrawSetStringForPlayer(TD_vMenuGlobal[3], playerid, ConvertEncoding(string));
	TextDrawShowForPlayer(playerid, TD_vMenuGlobal[0]);
	

	for (new i; i < TEXTLIST_MAX_ITEMS_ON_LIST; i++)
	{
		TD_ListCreate_Left(playerid, i, "", VMENU_POS_X, (VMENU_POS_Y + 42.0 + (20.0 * i)));
		TD_ListCreate_Right(playerid, i, "", VMENU_POS_X + 148.0, (VMENU_POS_Y + 42.0 + (20.0 * i)));
	}
}

stock MenuV_IsOpen(playerid)
{
	return _:IsOpenMenuV[playerid];
}

/*

	Private functions

*/

stock vMenu_UpdateListitems(playerid)
{
	//new listitem = (ListPage[playerid] * TEXTLIST_MAX_ITEMS_ON_LIST)) + 1);
	// list
	new listitem;
	new pages_count, start_index, end_index;
	new text[128], info[25];
	
	GetPaginatorInfo(ListCount[playerid], ListPage[playerid], pages_count, start_index, end_index);

	//new Pointer:listitemPointer;
	//new Pointer:listitemTextPointer;
	//new Pointer:listitemInfoPointer;
	new List:pool = _GetVMenuPool(playerid);

	for (new i; i < TEXTLIST_MAX_ITEMS_ON_LIST; i++)
	{
		listitem = (i + (ListPage[playerid] * TEXTLIST_MAX_ITEMS_ON_LIST));

		if(listitem >= ListCount[playerid])
		{
			
			TextDrawHideForPlayer(playerid, TDGeneral_ListItem[i]);
			PlayerTextDrawHide(playerid, TD_ListItem[playerid][i]);
			PlayerTextDrawHide(playerid, TD_ListInfoItem[playerid][i]);
			continue; 
		}
		new data[E_VMENU_DATA];
		
		list_get_arr(pool, listitem, data);

		TextDrawShowForPlayer(playerid, TD_vMenuGlobal[1]);	
		TextDrawShowForPlayer(playerid, TD_vMenuGlobal[2]);

		if(ListPage[playerid] >= pages_count - 1)
		{
			TextDrawHideForPlayer(playerid, TD_vMenuGlobal[2]);
		}
		if(ListPage[playerid] == 0)
		{
			TextDrawHideForPlayer(playerid, TD_vMenuGlobal[1]);
		} 		

		str_get(data[E_VMENU_TITLE], text, sizeof(text));
		str_get(data[E_VMENU_INFO], info, sizeof(info));

		if (strlen(text) != 0) {

			PlayerTextDrawSetString(playerid, TD_ListItem[playerid][i], ConvertEncoding(text));
			PlayerTextDrawShow(playerid, TD_ListItem[playerid][i]);
			TextDrawShowForPlayer(playerid, TDGeneral_ListItem[i]);
		} else { PlayerTextDrawHide(playerid, TD_ListItem[playerid][i]); TextDrawHideForPlayer(playerid, TDGeneral_ListItem[i]); }

		if (strlen(info) != 0) {
			PlayerTextDrawSetString(playerid, TD_ListInfoItem[playerid][i], ConvertEncoding(info));
			PlayerTextDrawShow(playerid, TD_ListInfoItem[playerid][i]);
		} else { PlayerTextDrawHide(playerid, TD_ListInfoItem[playerid][i]); }

	}

}

stock vMenu_DestroyPointers(playerid)
{
	new List:pool = _GetVMenuPool(playerid);

    if (list_valid(pool)) {
        new data[E_VMENU_DATA];

        for (new Iter:id = list_iter(pool); iter_inside(id); iter_move_next(id)) {
            if (!iter_sizeof(id)) {
                continue;
            }

            iter_get_arr(id, data);

            str_delete(data[E_VMENU_TITLE]);
            str_delete(data[E_VMENU_INFO]);
        }
        list_delete(pool);
    }
}

static stock GetPaginatorInfo(items_count, &curr_page = 0, &max_page = 0, &start_index = 0, &end_index = 0)
{
	if (items_count <= 0) {
		return;
	}

	max_page = items_count / TEXTLIST_MAX_ITEMS_ON_LIST;
	if (items_count % TEXTLIST_MAX_ITEMS_ON_LIST != 0) {
		max_page++;
	}

	if (curr_page < 0) {
		curr_page = 0;
	} else if (curr_page > max_page - 1) {
		curr_page = max_page - 1;
	}

	start_index = curr_page * TEXTLIST_MAX_ITEMS_ON_LIST;
	end_index = start_index + TEXTLIST_MAX_ITEMS_ON_LIST;

	if (items_count % end_index == items_count) {
		end_index = start_index + items_count % TEXTLIST_MAX_ITEMS_ON_LIST;
	}
}

static stock MenuV_GetMaxPages(playerid) {
	new size = ListCount[playerid];
	new page_size = (TEXTLIST_MAX_ITEMS_ON_LIST);
    return ((size / page_size) + ((size % page_size) ? 1 : 0));
}

stock TD_ListCreate(item_id, Float:pos_x, Float:pos_y)
{
	TDGeneral_ListItem[item_id] = TextDrawCreate(pos_x, pos_y, "LD_SPAC:white");
	TextDrawLetterSize(TDGeneral_ListItem[item_id], 0.20, 1.5);
	TextDrawTextSize(TDGeneral_ListItem[item_id], 149.0, /*435.0 + 8.0*/20.0);
//	TextDrawAlignment(TDGeneral_ListItem[item_id], 2);
	TextDrawColor(TDGeneral_ListItem[item_id], 0x000000FF);
	TextDrawUseBox(TDGeneral_ListItem[item_id], 1);
	TextDrawBoxColor(TDGeneral_ListItem[item_id], 0x000000FF);
	TextDrawSetShadow(TDGeneral_ListItem[item_id], 0);
	TextDrawSetOutline(TDGeneral_ListItem[item_id], 0);
	TextDrawBackgroundColor(TDGeneral_ListItem[item_id], 0xFFFFFFFFF);
	TextDrawFont(TDGeneral_ListItem[item_id], 4);
	TextDrawSetProportional(TDGeneral_ListItem[item_id], 1);
	TextDrawSetSelectable(TDGeneral_ListItem[item_id], true);

	//PlayerTextDrawShow(playerid, TD_ListItem[playerid][item_id]);
}

stock TD_ListCreate_Left(playerid, item_id, const text[], Float:pos_x, Float:pos_y)
{
	TD_ListItem[playerid][item_id] = CreatePlayerTextDraw(playerid, pos_x + 4.0, pos_y, text);
	PlayerTextDrawLetterSize(playerid, TD_ListItem[playerid][item_id], 0.18, 1.2);
	PlayerTextDrawTextSize(playerid, TD_ListItem[playerid][item_id], 625.0, /*435.0 + 8.0*/10.0);
	PlayerTextDrawColor(playerid, TD_ListItem[playerid][item_id], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, TD_ListItem[playerid][item_id], 0x00000088);
	PlayerTextDrawSetOutline(playerid, TD_ListItem[playerid][item_id], 1);
	PlayerTextDrawFont(playerid, TD_ListItem[playerid][item_id], 1);
	PlayerTextDrawSetSelectable(playerid, TD_ListItem[playerid][item_id], false);

	//PlayerTextDrawShow(playerid, TD_ListItem[playerid][item_id]);
}

stock MenuV_ItemSetActive(playerid, item_id, color = 0xF11818FF)
{
	PlayerTextDrawColor(playerid, TD_ListItem[playerid][item_id], color);
	PlayerTextDrawShow(playerid, TD_ListItem[playerid][item_id]);
}

stock TD_ListCreate_Right(playerid, item_id, const text[], Float:pos_x, Float:pos_y)
{
	TD_ListInfoItem[playerid][item_id] = CreatePlayerTextDraw(playerid, pos_x, pos_y, text);
	PlayerTextDrawLetterSize(playerid, TD_ListInfoItem[playerid][item_id], 0.18, 1.2);
	//PlayerTextDrawTextSize(playerid, TD_ListInfoItem[playerid][item_id], 13.0, 135.0 + 8.0);
	PlayerTextDrawAlignment(playerid, TD_ListInfoItem[playerid][item_id], 3);
	PlayerTextDrawColor(playerid, TD_ListInfoItem[playerid][item_id], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, TD_ListInfoItem[playerid][item_id], 0x00000088);
	PlayerTextDrawSetOutline(playerid, TD_ListInfoItem[playerid][item_id], 1);
	PlayerTextDrawFont(playerid, TD_ListInfoItem[playerid][item_id], 1);
	PlayerTextDrawSetProportional(playerid, TD_ListInfoItem[playerid][item_id], 1);

	//PlayerTextDrawShow(playerid, TD_ListItem[playerid][item_id]);
}

stock TD_ListUpdateText(playerid, item_id,  text[])
{
	PlayerTextDrawSetString(playerid, TD_ListItem[playerid][item_id], text);
}

static stock TD_PaginatorCreate()
{
	TD_vMenuGlobal[0] = TextDrawCreate(VMENU_POS_X, VMENU_POS_Y, "LD_SPAC:white");
	/*TextDrawLetterSize(TD_vMenuGlobal[0], 0.4, 4.0);
	TextDrawTextSize(TD_vMenuGlobal[0], VMENU_POS_X+148.0, 435.0 + 8.0);
	TextDrawColor(TD_vMenuGlobal[0], 0);
	TextDrawBoxColor(TD_vMenuGlobal[0], 0x282828FF);
	TextDrawUseBox(TD_vMenuGlobal[0], 1);
	TextDrawSetShadow(TD_vMenuGlobal[0], 0);
	TextDrawSetOutline(TD_vMenuGlobal[0], 0);
	TextDrawSetProportional(TD_vMenuGlobal[0], 0);
	TextDrawSetShadow(TD_vMenuGlobal[0], 0);*/
	TextDrawLetterSize(TD_vMenuGlobal[0], 0.20, 1.5);
	TextDrawTextSize(TD_vMenuGlobal[0], 149.0, 40.0);
	TextDrawColor(TD_vMenuGlobal[0], 0x282828FF);
	TextDrawUseBox(TD_vMenuGlobal[0], 1);
	TextDrawBoxColor(TD_vMenuGlobal[0], 0x000000FF);
	TextDrawSetShadow(TD_vMenuGlobal[0], 0);
	TextDrawSetOutline(TD_vMenuGlobal[0], 0);
	TextDrawBackgroundColor(TD_vMenuGlobal[0], 0xFFFFFFFFF);
	TextDrawFont(TD_vMenuGlobal[0], 4);
	TextDrawSetProportional(TD_vMenuGlobal[0], 1);

	TD_vMenuGlobal[1] = TextDrawCreate(VMENU_POS_X+125.0, VMENU_POS_Y+29.0, "<");
	TextDrawLetterSize(TD_vMenuGlobal[1], 0.25, 1.5);
	TextDrawTextSize(TD_vMenuGlobal[1], 10.0, 10.0);
	TextDrawColor(TD_vMenuGlobal[1], 0xFFFFFFFF);
	TextDrawAlignment(TD_vMenuGlobal[1], 2);
	TextDrawSetShadow(TD_vMenuGlobal[1], 0);
	TextDrawSetOutline(TD_vMenuGlobal[1], 0);
	TextDrawBackgroundColor(TD_vMenuGlobal[1], 255);
	TextDrawFont(TD_vMenuGlobal[1], 1);
	TextDrawSetProportional(TD_vMenuGlobal[1], 0);
	TextDrawSetShadow(TD_vMenuGlobal[1], 0);
	TextDrawSetSelectable(TD_vMenuGlobal[1], true);

	TD_vMenuGlobal[2] = TextDrawCreate(VMENU_POS_X + 140.0, VMENU_POS_Y+29.0, ">");
	TextDrawLetterSize(TD_vMenuGlobal[2], 0.25, 1.5);
	TextDrawTextSize(TD_vMenuGlobal[2], 10.0, 10.0);
	TextDrawColor(TD_vMenuGlobal[2], 0xFFFFFFFF);
	TextDrawAlignment(TD_vMenuGlobal[2], 2);
	TextDrawSetShadow(TD_vMenuGlobal[2], 0);
	TextDrawSetOutline(TD_vMenuGlobal[2], 0);
	TextDrawBackgroundColor(TD_vMenuGlobal[2], 255);
	TextDrawFont(TD_vMenuGlobal[2], 1);
	TextDrawSetProportional(TD_vMenuGlobal[2], 1);
	TextDrawSetShadow(TD_vMenuGlobal[2], 0);
	TextDrawSetSelectable(TD_vMenuGlobal[2], true);

	TD_vMenuGlobal[3] = TextDrawCreate(VMENU_POS_X+4.0, VMENU_POS_Y, "Header");
	TextDrawLetterSize(TD_vMenuGlobal[3], 0.4, 2.0);
	//TextDrawTextSize(TD_vMenuGlobal[3], 10.0, 135.0);
	TextDrawColor(TD_vMenuGlobal[3], 0x5EB5FFFF);
	TextDrawSetShadow(TD_vMenuGlobal[3], 1);
	TextDrawSetOutline(TD_vMenuGlobal[3], 0);
	TextDrawBackgroundColor(TD_vMenuGlobal[3], 255);
	TextDrawFont(TD_vMenuGlobal[3], 1);
	TextDrawSetProportional(TD_vMenuGlobal[3], 1);
	TextDrawSetShadow(TD_vMenuGlobal[3], 0);

	for (new i; i < TEXTLIST_MAX_ITEMS_ON_LIST; i++)
	{
		//new string[128];
		//format(string, sizeof(string), "Ejemplo");
		//new count = GetTextDrawStringWidth(string,1);
		//convertCharToSpaces(string, 50);
		TD_ListCreate(i, VMENU_POS_X, (VMENU_POS_Y + /*28.0*/40.0 + (20.0 * i)));
	}
}

static stock TD_PaginatorUpdateText(playerid, const pagestr[])
{
	PlayerTextDrawSetString(playerid, TD_ListPage[playerid], pagestr);
}

/*stock TD_HeaderCreate(playerid, const text[], bg_color, fg_color, Float:pos_x, Float:pos_y)
{
	TD_ListHeader[playerid] = CreatePlayerTextDraw(playerid, pos_x, pos_y, text);
	PlayerTextDrawLetterSize(playerid, TD_ListHeader[playerid], 0.3, 2.0);
	PlayerTextDrawTextSize(playerid, TD_ListHeader[playerid], 625.0, 435.0 + 8.0);
	PlayerTextDrawColor(playerid, TD_ListHeader[playerid], fg_color);
	PlayerTextDrawUseBox(playerid, TD_ListHeader[playerid], 1);
	PlayerTextDrawBoxColor(playerid, TD_ListHeader[playerid], bg_color);
	PlayerTextDrawSetShadow(playerid, TD_ListHeader[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TD_ListHeader[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_ListHeader[playerid], 255);
	PlayerTextDrawFont(playerid, TD_ListHeader[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TD_ListHeader[playerid], 1);

	PlayerTextDrawShow(playerid, TD_ListHeader[playerid]);
}*/

static stock TD_ButtonCreate(playerid, &PlayerText:button, const text[], bg_color, fg_color, Float:pos_x, Float:pos_y)
{
	button = CreatePlayerTextDraw(playerid, pos_x, pos_y, text);
	PlayerTextDrawLetterSize(playerid, button, 0.25, 1.4);
	PlayerTextDrawTextSize(playerid, button, 13.0, 68.0);
	PlayerTextDrawAlignment(playerid, button, 2);
	PlayerTextDrawColor(playerid, button, fg_color);
	PlayerTextDrawUseBox(playerid, button, 1);
	PlayerTextDrawBoxColor(playerid, button, bg_color);
	PlayerTextDrawSetShadow(playerid, button, 0);
	PlayerTextDrawSetOutline(playerid, button, 0);
	PlayerTextDrawBackgroundColor(playerid, button, 255);
	PlayerTextDrawFont(playerid, button, 1);
	PlayerTextDrawSetProportional(playerid, button, 1);
	PlayerTextDrawSetSelectable(playerid, button, true);

	PlayerTextDrawShow(playerid, button);
}

static stock TD_Remove(playerid, &PlayerText:td)
{
	PlayerTextDrawHide(playerid, td);
	PlayerTextDrawDestroy(playerid, td);
	td = PlayerText:INVALID_TEXT_DRAW;
}


/*
	Hook OnGamemodeInit
*/
public OnGameModeInit() 
{
	TD_PaginatorCreate();

	#if defined MenuV_OnGameModeInit
		return MenuV_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit MenuV_OnGameModeInit
#if defined MenuV_OnGameModeInit
	forward MenuV_OnGameModeInit();
#endif

/* 
	OnPlayerConnect
*/

public OnPlayerConnect(playerid)
{
	//vMenuPlayerPool[playerid] = MEM_NULLPTR;

	#if defined MenuV_OnPlayerConnect
		return MenuV_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect MenuV_OnPlayerConnect
#if defined MenuV_OnPlayerConnect
	forward MenuV_OnPlayerConnect(playerid);
#endif

/*

	OnPlayerDisconnect

*/

public OnPlayerDisconnect(playerid, reason)
{
	if (MenuV_IsOpen(playerid)) {
		MenuV_Close(playerid);
	}

	#if defined TL_OnPlayerDisconnect
		return TL_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect TL_OnPlayerDisconnect
#if defined TL_OnPlayerDisconnect
	forward TL_OnPlayerDisconnect(playerid, reason);
#endif

/*

	OnPlayerClickPlayerTextDraw

*/

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if (MenuV_IsOpen(playerid)) {

	}

	#if defined TL_OnPlayerClickPlayerTextDraw
		return TL_OnPlayerClickPlayerTextDraw(playerid, playertextid);
	#else
		return 0;
	#endif
}
#if defined _ALS_OnPlayerClickPlayerTD
	#undef OnPlayerClickPlayerTextDraw
#else
	#define _ALS_OnPlayerClickPlayerTD
#endif

#define OnPlayerClickPlayerTextDraw TL_OnPlayerClickPlayerTextDraw
#if defined TL_OnPlayerClickPlayerTextDraw
	forward TL_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
#endif

/*

	OnPlayerClickTextDraw

*/

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (clickedid == Text:INVALID_TEXT_DRAW && TD_SkipCancel[playerid]) {
		TD_SkipCancel[playerid] = false;
		return 1;
	}
	if (clickedid == Text:INVALID_TEXT_DRAW && MenuV_IsOpen(playerid)) {
		
		new call_func[TEXTLIST_MAX_FUNCTION_NAME] = "tlr_";
		strcat(call_func, FunctionName[playerid]);

		if (funcidx(call_func) != -1) {
			CallLocalFunction(call_func, "iiisi", playerid, 0, -1, "cancel", 0);
		}
		//MenuV_Close(playerid);
		return 1;
	}
	if(MenuV_IsOpen(playerid))
	{
		new curpage = ListPage[playerid];

		if(clickedid == TD_vMenuGlobal[1])
		{
			if(curpage > 0) {
	    		ListPage[playerid]-- /*= curpage - 1*/;
	    		vMenu_UpdateListitems(playerid);
	    		PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
			} else {
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
		}
		new max_page;
		GetPaginatorInfo(ListCount[playerid], .max_page = max_page);

		if (TD_vMenuGlobal[2] == clickedid && ListPage[playerid] != max_page - 1) {
			ListPage[playerid]++;
	    	vMenu_UpdateListitems(playerid);
		}

		new list_id = -1;
		// check listitem
		for (new i = 0; i < /*ListCount[playerid]*/TEXTLIST_MAX_ITEMS_ON_LIST; i++) {
			if (TDGeneral_ListItem[i] == clickedid) {
				new value[TEXTLIST_MAX_ITEM_NAME], title[TEXTLIST_MAX_ITEM_NAME], extra;

				//new Pointer:listitemPointer;
				//new Pointer:listitemInfoPointer;
				new List:pool = _GetVMenuPool(playerid);

				list_id = ((ListPage[playerid] * (TEXTLIST_MAX_ITEMS_ON_LIST)) + i);

				//listitemPointer = Pointer:MEM_get_val(vMenuPlayerPool[playerid], list_id);

				//listitemInfoPointer = Pointer:MEM_get_val(listitemPointer, 0);
				//str_get(data[E_VMENU_TITLE], string, len);
				new data[E_VMENU_DATA];
				list_get_arr(pool, list_id, data);

				str_get(data[E_VMENU_INFO], value, sizeof(value));	
				if(strlen(value) == 0)
				{
					value[0] = '\1';
				}
				str_get(data[E_VMENU_TITLE], title, sizeof(title));	
				if(strlen(title) == 0)
				{
					title[0] = '\1';
				}

				extra = data[E_VMENU_EXTRA];

				new call_func[TEXTLIST_MAX_FUNCTION_NAME] = "tlr_";
				strcat(call_func, FunctionName[playerid]);
			//	new item_id = ((mSele_PlayerDialogPage[playerid] * (mS_SELECTION_ITEMS)) + i);

				if (funcidx(call_func) != -1) {
					CallLocalFunction(call_func, "iiisis", playerid, 1, list_id, value, extra, title);
					return 1;
				}
			}
		}
		
	}

	#if defined TL_OnPlayerClickTextDraw
		return TL_OnPlayerClickTextDraw(playerid, Text:clickedid);
	#else
		return 0;
	#endif
}
#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif

#define OnPlayerClickTextDraw TL_OnPlayerClickTextDraw
#if defined TL_OnPlayerClickTextDraw
	forward TL_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif

/*

	Helpers

*/

stock vMenu_strcpy(result[], const source[], const size = sizeof(result))
{
	result[0] = 0;
	return strcat(result, source, size);
}
