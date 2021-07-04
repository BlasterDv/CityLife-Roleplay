#include <a_samp>

forward OnPlayerModelSelection(playerid, response, listid, modelid);
forward OnPlayerModelSelectionEx2(playerid, response, extraid, modelid, itemid);

#define mS_TOTAL_ITEMS         	1000
#define mS_TOTAL_ROT_ZOOM		100
#define mS_TOTAL_LISTS			20
#define mS_CUSTOM_MAX_ITEMS		70

new gCustomList2[MAX_PLAYERS][mS_CUSTOM_MAX_ITEMS];

#define mS_INVALID_LISTID2		mS_TOTAL_LISTS
#define mS_CUSTOM_LISTID2		(mS_TOTAL_LISTS+1)

#define mS_CANCEL_TEXT2   "X"

#define mS_SELECTION_ITEMS2	  21
#define mS_ITEMS_PER_LINE2    2

#define mS_DIALOG_BASE_X2   23.000000
#define mS_DIALOG_BASE_Y2   364.000000

#define mS_DIALOG_WIDTH2    398.000000
#define mS_DIALOG_HEIGHT2   69.000000

#define mS_SPRITE_DIM_X2    89.000000
#define mS_SPRITE_DIM_Y2    82.000000

#define mS_DIALOG_BASE_X3   135.000000
#define mS_DIALOG_BASE_Y3   159.000000

new PlayerText:gHeaderTextDrawId2[MAX_PLAYERS];
new PlayerText:gBackgroundTextDrawId2[MAX_PLAYERS];
new PlayerText:gCancelButtonTextDrawId2[MAX_PLAYERS];
new PlayerText:gSelectionItems2[MAX_PLAYERS][mS_SELECTION_ITEMS2];
new gSelectionItems2Tag[MAX_PLAYERS][mS_SELECTION_ITEMS2];
new gItemAt2[MAX_PLAYERS];

#define mS_LIST_START			0
#define mS_LIST_END				1
new gLists2[mS_TOTAL_LISTS][2];

#define mS_ITEM_MODEL			0
#define mS_ITEM_ROT_ZOOM_ID 	1
new gItemList2[mS_TOTAL_ITEMS][2];

new Float:gRotZoom2[mS_TOTAL_ROT_ZOOM][4];
new Float:g2RotZoom2[mS_TOTAL_ITEMS][4];
new gItemAmount2 = 0;
new gListAmount2 = 0;
new gRotZoom2Amount = 0;
/*new gRotZoom2Amount2 = 0;*/

/*enum ppObjectInformation
{
ObjectID,
Float:ObjectRX,
Float:ObjectRY,
Float:ObjectRZ,
Float:ObjectZoom,
};
new RotatingObjectsPrendas[3][ppObjectInformation] = {
{18961, 20.0, 0.0, 0.0, 1.0},
{19136, 0.0, 0.0, 9.0, 1.0},
{19079, 40.0, 0.0, 0.0, 0.0}
};*/

stock mS_GetNumberOfPages2(ListID)
{
	new ItemAmount = mS_GetAmountOfListItems2(ListID);
	if((ItemAmount >= mS_SELECTION_ITEMS2) && (ItemAmount % mS_SELECTION_ITEMS2) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS2);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS2) + 1;
}

stock mS_GetNumberOfPages2Ex2(playerid)
{
	new ItemAmount = mS_GetAmountOfListItems2Ex2(playerid);
	if((ItemAmount >= mS_SELECTION_ITEMS2) && (ItemAmount % mS_SELECTION_ITEMS2) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS2);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS2) + 1;
}

stock mS_GetAmountOfListItems2(ListID)
{
	return (gLists2[ListID][mS_LIST_END] - gLists2[ListID][mS_LIST_START])+1;
}

stock mS_GetAmountOfListItems2Ex2(playerid)
{
	return GetPVarInt(playerid, "mS_custom_item_amount");
}

stock mS_GetPlayerCurrentListID2(playerid)
{
	if(GetPVarInt(playerid, "mS_list_active2") == 1) return GetPVarInt(playerid, "mS_list_id2");
	else return mS_INVALID_LISTID2;
}

stock PlayerText:mS_CreateMPTextDraw2(playerid, modelindex, Float:Xpos, Float:Ypos, Float:Xrot, Float:Yrot, Float:Zrot, Float:mZoom = 1.0, Float:width, Float:height, bgcolor)
{
    new PlayerText:txtPlayerSprite = CreatePlayerTextDraw(playerid, Xpos, Ypos, "");
    PlayerTextDrawFont(playerid, txtPlayerSprite, TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawColor(playerid, txtPlayerSprite, 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerSprite, bgcolor);
    PlayerTextDrawTextSize(playerid, txtPlayerSprite, width, height);
    PlayerTextDrawSetPreviewModel(playerid, txtPlayerSprite, modelindex);
    PlayerTextDrawSetPreviewRot(playerid,txtPlayerSprite, Xrot, Yrot, Zrot, mZoom);
    PlayerTextDrawSetSelectable(playerid, txtPlayerSprite, 1);
    PlayerTextDrawShow(playerid,txtPlayerSprite);
    return txtPlayerSprite;
}

stock PlayerText:mS_CreatePlayerBGTextDraw2(playerid, bgcolor)
{
	new PlayerText:txtBackground = CreatePlayerTextDraw(playerid,316.000000, 156.000000, "__");
    PlayerTextDrawAlignment(playerid,txtBackground, 2);
	PlayerTextDrawBackgroundColor(playerid,txtBackground, bgcolor);
	PlayerTextDrawFont(playerid,txtBackground, 1);
	PlayerTextDrawLetterSize(playerid,txtBackground, 0.500000, 9.500001);
	PlayerTextDrawColor(playerid,txtBackground, -1);
	PlayerTextDrawSetOutline(playerid,txtBackground, 0);
	PlayerTextDrawSetProportional(playerid,txtBackground, 1);
	PlayerTextDrawSetShadow(playerid,txtBackground, 1);
	PlayerTextDrawUseBox(playerid,txtBackground, 1);
	PlayerTextDrawBoxColor(playerid,txtBackground, 119);
	PlayerTextDrawTextSize(playerid,txtBackground, 23.000000, 364.000000);
	PlayerTextDrawSetSelectable(playerid,txtBackground, 0);
	PlayerTextDrawShow(playerid,txtBackground);
    return txtBackground;
}

stock PlayerText:mS_CreatePlayerDialogButton2(playerid, button_text[])
{
 	new PlayerText:txtInit;
    txtInit = CreatePlayerTextDraw(playerid,487.000000, 148.000000, button_text);
	PlayerTextDrawBackgroundColor(playerid,txtInit, 255);
	PlayerTextDrawFont(playerid,txtInit, 1);
	PlayerTextDrawLetterSize(playerid,txtInit, 0.400000, 1.000000);
	PlayerTextDrawColor(playerid,txtInit, -16776961);
	PlayerTextDrawSetOutline(playerid,txtInit, 0);
	PlayerTextDrawSetProportional(playerid,txtInit, 1);
	PlayerTextDrawSetShadow(playerid,txtInit, 1);
	PlayerTextDrawSetSelectable(playerid,txtInit, 1);
	PlayerTextDrawShow(playerid,txtInit);
    return txtInit;
}

stock PlayerText:mS_CreatePlayerHeaderTextDraw2(playerid, header_text[])
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid,133.000000, 146.000000, header_text);
	PlayerTextDrawBackgroundColor(playerid,txtInit, 255);
	PlayerTextDrawFont(playerid,txtInit, 1);
	PlayerTextDrawLetterSize(playerid,txtInit, 0.470000, 1.300000);
	PlayerTextDrawColor(playerid,txtInit, -1);
	PlayerTextDrawSetOutline(playerid,txtInit, 1);
	PlayerTextDrawSetProportional(playerid,txtInit, 1);
	PlayerTextDrawSetSelectable(playerid,txtInit, 0);
	PlayerTextDrawShow(playerid,txtInit);
    return txtInit;
}

stock mS_DestroyPlayerMPs2(playerid)
{
	new x=0;
	while(x != mS_SELECTION_ITEMS2)
	{
	    if(gSelectionItems2[playerid][x] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, gSelectionItems2[playerid][x]);
			gSelectionItems2[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		x++;
	}
}


stock mS_ShowPlayerMPs2(playerid)
{
	new bgcolor = GetPVarInt(playerid, "mS_previewBGcolor");
    new x=0;
	new Float:BaseX = mS_DIALOG_BASE_X3;
	new Float:BaseY = mS_DIALOG_BASE_Y3;
	new linetracker = 0;

	new mS_listID = mS_GetPlayerCurrentListID2(playerid);
	if(mS_listID == mS_CUSTOM_LISTID2)
	{
		new itemat = (GetPVarInt(playerid, "mS_list_page") * mS_SELECTION_ITEMS2);
		new Float:rotzoom[4];
		rotzoom[0] = GetPVarFloat(playerid, "mS_custom_Xrot");
		rotzoom[1] = GetPVarFloat(playerid, "mS_custom_Yrot");
		rotzoom[2] = GetPVarFloat(playerid, "mS_custom_Zrot");
		rotzoom[3] = GetPVarFloat(playerid, "mS_custom_Zoom");
		new itemamount = mS_GetAmountOfListItems2Ex2(playerid);
		mS_DestroyPlayerMPs2(playerid);

		while(x != mS_SELECTION_ITEMS2 && itemat < (itemamount))
		{
			if(linetracker == 0)
			{
			
			
			}
			
			if(gCustomList2[playerid][itemat] > 0 || gCustomList2[playerid][itemat] <= -1001)
			{
			/*new string[128];
			format(string, 128, "%f %f %d", g2RotZoom2[itemat][0], g2RotZoom2[itemat][3], itemat);
			SendClientMessage(playerid, -1, string);*/
			gSelectionItems2[playerid][x] =					mS_CreateMPTextDraw2(playerid, gCustomList2[playerid][itemat], BaseX, BaseY, g2RotZoom2[itemat][0], g2RotZoom2[itemat][1], g2RotZoom2[itemat][2], g2RotZoom2[itemat][3], mS_SPRITE_DIM_X2, mS_SPRITE_DIM_Y2, bgcolor);
			}
			else
			{
			gSelectionItems2[playerid][x] =	mS_CreateMPTextDraw2(playerid, 11392, BaseX, BaseY, rotzoom[0], rotzoom[1], rotzoom[2], 0.0, mS_SPRITE_DIM_X2, mS_SPRITE_DIM_Y2, bgcolor);
			}
		
			gSelectionItems2Tag[playerid][x] = gCustomList2[playerid][itemat];
			BaseX += mS_SPRITE_DIM_X2 + 2.0;
			linetracker++;
			if(linetracker == mS_ITEMS_PER_LINE2) linetracker = 0;
			itemat++;
			x++;
		}
	}
	else
	{
		new itemat = (gLists2[mS_listID][mS_LIST_START] + (GetPVarInt(playerid, "mS_list_page") * mS_SELECTION_ITEMS2));
		mS_DestroyPlayerMPs2(playerid);

		while(x != mS_SELECTION_ITEMS2 && itemat < (gLists2[mS_listID][mS_LIST_END]+1))
		{
			if(linetracker == 0)
			{
				BaseX = mS_DIALOG_BASE_X3 + 25.0;
				BaseY += mS_SPRITE_DIM_Y2 + 1.0;
			}
			new rzID = gItemList2[itemat][mS_ITEM_ROT_ZOOM_ID];
			if(rzID > -1) gSelectionItems2[playerid][x] =	mS_CreateMPTextDraw2(playerid, gItemList2[itemat][mS_ITEM_MODEL], BaseX, BaseY, gRotZoom2[rzID][0], gRotZoom2[rzID][1], gRotZoom2[rzID][2], gRotZoom2[rzID][3], mS_SPRITE_DIM_X2, mS_SPRITE_DIM_Y2, bgcolor);
			else gSelectionItems2[playerid][x] =			mS_CreateMPTextDraw2(playerid, gItemList2[itemat][mS_ITEM_MODEL], BaseX, BaseY, 0.0, 0.0, 0.0, 1.0, mS_SPRITE_DIM_X2, mS_SPRITE_DIM_Y2, bgcolor);
			gSelectionItems2Tag[playerid][x] = gItemList2[itemat][mS_ITEM_MODEL];
			BaseX += 100.0;
			linetracker++;
			if(linetracker == mS_ITEMS_PER_LINE2) linetracker = 0;
			itemat++;
			x++;
		}
	}
}

stock ShowModelSelectionMenu2(playerid, ListID, header_text[], dialogBGcolor = 0x00000077, previewBGcolor = 0x555555555 , tdSelectionColor = 0xFF0000FF0)
{
	if(!(0 <= ListID < mS_TOTAL_LISTS && gLists2[ListID][mS_LIST_START] != gLists2[ListID][mS_LIST_END])) return 0;
	mS_DestroySelectionMenu2(playerid);
	SetPVarInt(playerid, "mS_list_page", 0);
	SetPVarInt(playerid, "mS_list_id2", ListID);
	SetPVarInt(playerid, "mS_list_active2", 1);
	SetPVarInt(playerid, "mS_list_time", GetTickCount());

    gBackgroundTextDrawId2[playerid] =		mS_CreatePlayerBGTextDraw2(playerid, mS_DIALOG_BASE_X2, mS_DIALOG_BASE_Y2, mS_DIALOG_WIDTH2, mS_DIALOG_HEIGHT2, dialogBGcolor);
    gHeaderTextDrawId2[playerid]	=		mS_CreatePlayerHeaderTextDraw2(playerid, header_text);
    gCancelButtonTextDrawId2[playerid] =	mS_CreatePlayerDialogButton2(playerid, mS_CANCEL_TEXT2);

	SetPVarInt(playerid, "mS_previewBGcolor", previewBGcolor);
    mS_ShowPlayerMPs2(playerid);

	SelectTextDraw(playerid, tdSelectionColor);
	return 1;
}

stock ShowModelSelectionMenuEx2(playerid, items_array[], item_amount, header_text[], extraid/*, Float:Xrot[] = 0.0, Float:Yrot[] = 0.0, Float:Zrot[] = 0.0,, Float:mZoom[] = 1.0*/, dialogBGcolor = 255, previewBGcolor = 0x88888899 , tdSelectionColor = 0xBABABAAA, Float:mZoom = 1.0)
{
	mS_DestroySelectionMenu2(playerid);
	if(item_amount > mS_CUSTOM_MAX_ITEMS)
	{
		item_amount = mS_CUSTOM_MAX_ITEMS;
		print("-mSelection- WARNING: Too many items given to \"ShowModelSelectionMenuEx2\", increase \"mS_CUSTOM_MAX_ITEMS\" to fix this");
	}
	if(item_amount > 0)
	{	LoadRotZoomObjects(/*playerid,*/ items_array);
		for(new i=0;i<item_amount;i++)
		{
		/*g2RotZoom2[i][0];
		g2RotZoom2[i][1];
		g2RotZoom2[i][2];
		g2RotZoom2[i][3];
		new string[128];
		format(string, 128, "%f %f %d", g2RotZoom2[i][0], g2RotZoom2[i][3], i);
		SendClientMessage(playerid, -1, string);*/
		
		gRotZoom2Amount++;
		gCustomList2[playerid][i] = items_array[i];
			
		g2RotZoom2[i][3] = mZoom;
		}
		
		SetPVarInt(playerid, "mS_list_page", 0);
		SetPVarInt(playerid, "mS_list_id2", mS_CUSTOM_LISTID2);
		SetPVarInt(playerid, "mS_list_active2", 1);
		SetPVarInt(playerid, "mS_list_time", GetTickCount());

		SetPVarInt(playerid, "mS_custom_item_amount", item_amount);
			
		SetPVarInt(playerid, "mS_custom_extraid", extraid);

		/*for(new i=0;i<3;i++)
		{
		g2RotZoom2[i][0] = Xrot[i];
		g2RotZoom2[i][1] = Yrot[i];
		g2RotZoom2[i][2] = Zrot[i];
		g2RotZoom2[i][3] = mZoom[i];
		g2RotZoom2[2][0] = Xrot[3];
		g2RotZoom2[2][1] = Yrot[3];
		g2RotZoom2[2][2] = Zrot[3];
		g2RotZoom2[2][3] = mZoom[3];
		new string[128];
		format(string, 128, "%f %f %d", g2RotZoom2[i][0], g2RotZoom2[i][3], i);
		SendClientMessage(playerid, -1, string);
		
		gRotZoom2Amount++;
		gCustomList2[playerid][i] = items_array[i];
			
		}*/
	
		gBackgroundTextDrawId2[playerid] =		mS_CreatePlayerBGTextDraw2(playerid, dialogBGcolor);
		gHeaderTextDrawId2[playerid] 	=		mS_CreatePlayerHeaderTextDraw2(playerid, header_text);
		gCancelButtonTextDrawId2[playerid] =	mS_CreatePlayerDialogButton2(playerid, mS_CANCEL_TEXT2);

		SetPVarInt(playerid, "mS_previewBGcolor", previewBGcolor);
		mS_ShowPlayerMPs2(playerid);

		SelectTextDraw(playerid, tdSelectionColor);
		return 1;
	}
	return 0;
}

stock HideModelSelectionMenu2(playerid)
{
	mS_DestroySelectionMenu2(playerid);
	SetPVarInt(playerid, "mS_ignore_next_esc", 1);
	CancelSelectTextDraw(playerid);
	return 1;
}

stock mS_DestroySelectionMenu2(playerid)
{
	if(GetPVarInt(playerid, "mS_list_active2") == 1)
	{
		if(mS_GetPlayerCurrentListID2(playerid) == mS_CUSTOM_LISTID2)
		{
			DeletePVar(playerid, "mS_custom_Xrot");
			DeletePVar(playerid, "mS_custom_Yrot");
			DeletePVar(playerid, "mS_custom_Zrot");
			DeletePVar(playerid, "mS_custom_Zoom");
			DeletePVar(playerid, "mS_custom_extraid");
			DeletePVar(playerid, "mS_custom_item_amount");
		}
		DeletePVar(playerid, "mS_list_time");
		SetPVarInt(playerid, "mS_list_active2", 0);
		mS_DestroyPlayerMPs2(playerid);

		PlayerTextDrawDestroy(playerid, gHeaderTextDrawId2[playerid]);
		PlayerTextDrawDestroy(playerid, gBackgroundTextDrawId2[playerid]);
		PlayerTextDrawDestroy(playerid, gCancelButtonTextDrawId2[playerid]);

		gHeaderTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gBackgroundTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gCancelButtonTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;
	}
}

public OnPlayerConnect(playerid)
{
    gHeaderTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gBackgroundTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCancelButtonTextDrawId2[playerid] = PlayerText:INVALID_TEXT_DRAW;

    for(new x=0; x < mS_SELECTION_ITEMS2; x++) {
        gSelectionItems2[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	}

	gItemAt2[playerid] = 0;

	return CallLocalFunction("MP_OPC2", "i", playerid);
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect MP_OPC2

forward MP_OPC2(playerid);

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
   	if(GetPVarInt(playerid, "mS_ignore_next_esc") == 1)
	{
		SetPVarInt(playerid, "mS_ignore_next_esc", 0);
		return CallLocalFunction("MP_OPC2TD2", "ii", playerid, _:clickedid);
	}
   	if(GetPVarInt(playerid, "mS_list_active2") == 0) return CallLocalFunction("MP_OPC2TD2", "ii", playerid, _:clickedid);
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
		new listid = mS_GetPlayerCurrentListID2(playerid);
		if(listid == mS_CUSTOM_LISTID2)
		{
			new extraid = GetPVarInt(playerid, "mS_custom_extraid");
			mS_DestroySelectionMenu2(playerid);
			CallLocalFunction("OnPlayerModelSelectionEx2", "ddddd", playerid, 0, extraid, -1, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            // Aqui
		}
		else
		{
			mS_DestroySelectionMenu2(playerid);
			CallLocalFunction("OnPlayerModelSelection", "ddddd", playerid, 0, listid, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
        return 1;
	}
	return CallLocalFunction("MP_OPC2TD2", "ii", playerid, _:clickedid);
}

#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw MP_OPC2TD2

forward MP_OPC2TD2(playerid, Text:clickedid);

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(GetPVarInt(playerid, "mS_list_active2") == 0 || (GetTickCount()-GetPVarInt(playerid, "mS_list_time")) < 200) return CallLocalFunction("MP_OPC2PTD", "ii", playerid, _:playertextid);
	if(playertextid == gCancelButtonTextDrawId2[playerid])
	{
		new listID = mS_GetPlayerCurrentListID2(playerid);
		if(listID == mS_CUSTOM_LISTID2)
		{
			new extraid = GetPVarInt(playerid, "mS_custom_extraid");
			HideModelSelectionMenu2(playerid);
			CallLocalFunction("OnPlayerModelSelectionEx2", "ddddd", playerid, 0, extraid, -1, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		else
		{
			HideModelSelectionMenu2(playerid);
			CallLocalFunction("OnPlayerModelSelection", "ddddd", playerid, 0, listID, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}
	new x=0;
	while(x != mS_SELECTION_ITEMS2)
	{
	    if(playertextid == gSelectionItems2[playerid][x])
		{
			new listID = mS_GetPlayerCurrentListID2(playerid);
			if(listID == mS_CUSTOM_LISTID2)
			{
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				new item_id = gSelectionItems2Tag[playerid][x];
				new extraid = GetPVarInt(playerid, "mS_custom_extraid");
				HideModelSelectionMenu2(playerid);
				CallLocalFunction("OnPlayerModelSelectionEx2", "ddddd", playerid, 1, extraid, item_id, x);
				return 1;
			}
			else
			{
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				new item_id = gSelectionItems2Tag[playerid][x];
				HideModelSelectionMenu2(playerid);
				CallLocalFunction("OnPlayerModelSelection", "ddddd", playerid, 1, listID, item_id);
				return 1;
			}
		}
		x++;
	}

	return CallLocalFunction("MP_OPC2PTD", "ii", playerid, _:playertextid);
}

#if defined _ALS_OnPlayerClickPlayerTD
	#undef OnPlayerClickPlayerTextDraw
#else
	#define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw MP_OPC2PTD

forward MP_OPC2PTD(playerid, PlayerText:playertextid);
stock LoadModelSelectionMenu2(f_name[])
{
	new File:f, str[75];
	format(str, sizeof(str), "%s", f_name);
	f = fopen(str, io_read);
	if( !f ) {
		printf("-mSelection- WARNING: Failed to load list: \"%s\"", f_name);
		return mS_INVALID_LISTID2;
	}

	if(gListAmount2 >= mS_TOTAL_LISTS)
	{
		printf("-mSelection- WARNING: Reached maximum amount of lists, increase \"mS_TOTAL_LISTS\"", f_name);
		return mS_INVALID_LISTID2;
	}
	new tmp_ItemAmount = gItemAmount2;


	new line[128], idxx;
	while(fread(f,line,sizeof(line),false))
	{
		if(tmp_ItemAmount >= mS_TOTAL_ITEMS)
		{
			printf("-mSelection- WARNING: Reached maximum amount of items, increase \"mS_TOTAL_ITEMS\"", f_name);
			break;
		}
		idxx = 0;
		if(!line[0]) continue;
		new mID = strval( mS_strtok2(line,idxx) );
		if((-30000 <= mID <= -1000) || (0 <= mID < 20000))
		{
			gItemList2[tmp_ItemAmount][mS_ITEM_MODEL] = mID;

			new tmp_mS_strtok2[20];
			new Float:mRotation[3], Float:mZoom = 1.0;
			new bool:useRotation = false;

			tmp_mS_strtok2 = mS_strtok2(line,idxx);
			if(tmp_mS_strtok2[0]) {
				useRotation = true;
				mRotation[0] = floatstr(tmp_mS_strtok2);
			}
			tmp_mS_strtok2 = mS_strtok2(line,idxx);
			if(tmp_mS_strtok2[0]) {
				useRotation = true;
				mRotation[1] = floatstr(tmp_mS_strtok2);
			}
			tmp_mS_strtok2 = mS_strtok2(line,idxx);
			if(tmp_mS_strtok2[0]) {
				useRotation = true;
				mRotation[2] = floatstr(tmp_mS_strtok2);
			}
			tmp_mS_strtok2 = mS_strtok2(line,idxx);
			if(tmp_mS_strtok2[0]) {
				useRotation = true;
				mZoom = floatstr(tmp_mS_strtok2);
			}
			if(useRotation)
			{
				new bool:foundRotZoom = false;
				for(new i=0; i < gRotZoom2Amount; i++)
				{
					if(gRotZoom2[i][0] == mRotation[0] && gRotZoom2[i][1] == mRotation[1] && gRotZoom2[i][2] == mRotation[2] && gRotZoom2[i][3] == mZoom)
					{
						foundRotZoom = true;
						gItemList2[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = i;
						break;
					}
				}
				if(gRotZoom2Amount < mS_TOTAL_ROT_ZOOM)
				{
					if(!foundRotZoom)
					{
						gRotZoom2[gRotZoom2Amount][0] = mRotation[0];
						gRotZoom2[gRotZoom2Amount][1] = mRotation[1];
						gRotZoom2[gRotZoom2Amount][2] = mRotation[2];
						gRotZoom2[gRotZoom2Amount][3] = mZoom;
						gItemList2[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = gRotZoom2Amount;
						gRotZoom2Amount++;
					}
				}
				else print("-mSelection- WARNING: Not able to save rotation/zoom information. Reached maximum rotation/zoom information count. Increase '#define mS_TOTAL_ROT_ZOOM' to fix the issue");
			}
			else gItemList2[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = -1;
			tmp_ItemAmount++;
		}
	}
	if(tmp_ItemAmount > gItemAmount2)
	{
		gLists2[gListAmount2][mS_LIST_START] = gItemAmount2;
		gItemAmount2 = tmp_ItemAmount;
		gLists2[gListAmount2][mS_LIST_END] = (gItemAmount2-1);

		gListAmount2++;
		return (gListAmount2-1);
	}
	printf("-mSelection- WARNING: No Items found in file: %s", f_name);
	return mS_INVALID_LISTID2;
}
stock mS_strtok2(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock LoadRotZoomObjects(/*playerid,*/ item_array[])
{
new ObjectModel;
new Float:Rot[3], Float:Zoom;
for(new x=0; x<4; x++)
{
new File:cFile = fopen("objetos.txt", io_read);
if(cFile)
{
new line[128];
while(fread(cFile,line,sizeof(line),false))
{
sscanf(line, "p<,>dffff", ObjectModel, Rot[0], Rot[1], Rot[2], Zoom);
if(ObjectModel == item_array[x])
{
g2RotZoom2[x][0] = Rot[0];
g2RotZoom2[x][1] = Rot[1];
g2RotZoom2[x][2] = Rot[2];
g2RotZoom2[x][3] = Zoom;
/*new string[128];
format(string, 128, "%d, %f, %f, %f, %f, %d", ObjectModel, g2RotZoom2[x][0], g2RotZoom2[x][1], g2RotZoom2[x][2], g2RotZoom2[x][3], item_array[x]);
SendClientMessage(playerid, -1, string);*/
}
}
}
}
}
/*new string[128];
for(new x=0; x<4; x++)
{
for(new i; i<sizeof(RotatingObjectsPrendas); i++)
{
if(RotatingObjectsPrendas[i][ObjectID] == item_array[x])
{
g2RotZoom2[x][0] = RotatingObjectsPrendas[i][ObjectRX];
g2RotZoom2[x][1] = RotatingObjectsPrendas[i][ObjectRY];
g2RotZoom2[x][2] = RotatingObjectsPrendas[i][ObjectRZ];
g2RotZoom2[x][3] = RotatingObjectsPrendas[i][ObjectZoom];
}
new string[128];
format(string, 128, "%d, %f, %f, %f, %f, %d", RotatingObjectsPrendas[i][ObjectID], g2RotZoom2[i][0], g2RotZoom2[i][1], g2RotZoom2[i][2], g2RotZoom2[i][3], item_array[i]);
SendClientMessage(playerid, -1, string);
}
}
}
}
}*/
