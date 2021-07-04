//
// Model Selection using previews. For SA-MP 0.3x and above.
// - D0erfler 2013
// - Kye 2013
//
// Version 1.1 R2

/*Functions to be used

LoadModelSelectionMenu(f_name[])
HideModelSelectionMenu(playerid)
ShowModelSelectionMenu(playerid, ListID, header_text[], dialogBGcolor = 0x4A5A6BBB, previewBGcolor = 0x88888899 , tdSelectionColor = 0xFFFF00AA)
ShowModelSelectionMenuEx(playerid, items_array[], item_amount, header_text[], extraid, Float:Xrot = 0.0, Float:Yrot = 0.0, Float:Zrot = 0.0, Float:mZoom = 1.0, dialogBGcolor = 0x4A5A6BBB, previewBGcolor = 0x88888899 , tdSelectionColor = 0xFFFF00AA)
*/
//#include <memory>
#include <PawnPlus>

// Callbacks
forward OnPlayerModelSelection(playerid, response, listid, modelid, price);
forward OnPlayerModelSelectionEx(playerid, extraid, response, itemid, modelid, price);

// settings static lists
#define mS_TOTAL_ITEMS         	1000 // Max amount of items from all lists
#define mS_TOTAL_LISTS			20 // Max amount of lists
#define mS_TOTAL_ROT_ZOOM		100 // Max amount of items using extra information like zoom or rotations
#define DEFAULT_MSELECTION_INCREMENT_SIZE 100

#define MSELECT_MAX_FUNCTION_NAME 31

// settings dynamic per player lists
//#define mS_CUSTOM_MAX_ITEMS		70
//new gCustomList[MAX_PLAYERS][mS_CUSTOM_MAX_ITEMS];

#define mS_INVALID_LISTID		mS_TOTAL_LISTS
#define mS_CUSTOM_LISTID		(mS_TOTAL_LISTS+1)

#define mS_NEXT_TEXT   ">"
#define mS_PREV_TEXT   "<"
#define mS_CANCEL_TEXT   "X"

#define mS_SELECTION_ITEMS 		10
#define mS_ITEMS_PER_LINE  		5
#define mS_DIALOG_BASE_X   	120.0
#define mS_DIALOG_BASE_Y   	130.0
#define mS_DIALOG_WIDTH    	500.0
#define mS_DIALOG_HEIGHT   	140.0//180.0
#define mS_SPRITE_DIM_X    	74.0
#define mS_SPRITE_DIM_Y    	85.0

#define ShowModelSelectionMenuEx(%0,%1, \
	Internal_mSelect_Open(%0, #%1,

#define mSelect:%0(%1) \
	forward msr_%0(%1); \
	public msr_%0(%1)

#define mSelect_Create:%0(%1) \
	forward msc_%0(%1); \
	public msc_%0(%1)

static ms_FunctionName[MAX_PLAYERS][MSELECT_MAX_FUNCTION_NAME];
static TD_SkipCancel[MAX_PLAYERS];
static bool:IsOpenMSelection[MAX_PLAYERS];
static mSele_PlayerDialogPage[MAX_PLAYERS];

new PlayerText:gCurrentPageTextDrawId[MAX_PLAYERS];
new PlayerText:gHeaderTextDrawId[MAX_PLAYERS];
new PlayerText:gNextButtonTextDrawId[MAX_PLAYERS];
new PlayerText:gPrevButtonTextDrawId[MAX_PLAYERS];
new PlayerText:gCancelButtonTextDrawId[MAX_PLAYERS];
new PlayerText:gSelectionItems[MAX_PLAYERS][mS_SELECTION_ITEMS];
static PlayerText:mSele_TDInfoExtra[MAX_PLAYERS][mS_SELECTION_ITEMS];
static Text:mSele_TDModel[mS_SELECTION_ITEMS][2];
static Text:mSele_TDBox[2];
static Text:mSele_TDButtons[3];

static mSele_PlayerSelectionNumItems[MAX_PLAYERS];
static mSele_PlayerSelectionID[MAX_PLAYERS];
static Pool:mSele@PlayerListitemPointer[MAX_PLAYERS];

#define mS_LIST_START			0
#define mS_LIST_END				1

#define mS_ITEM_MODEL			0
#define mS_ITEM_ROT_ZOOM_ID 	1

static enum _:E_MSELECTION_DATA {
	E_MSELECTION_MODELID,
	E_MSELECTION_PRICE,
	Float:E_MSELECTION_RX,
	Float:E_MSELECTION_RY,
	Float:E_MSELECTION_RZ,
	Float:E_MSELECTION_ZOOM,
	E_MSELECTION_COLOR1,
	E_MSELECTION_COLOR2,
	E_MSELECTION_ITEM
};

//------------------------------------------------

/*stock mS_GetNumberOfPages(ListID)
{
	new ItemAmount = mS_GetAmountOfListItems(ListID);
	if((ItemAmount >= mS_SELECTION_ITEMS) && (ItemAmount % mS_SELECTION_ITEMS) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS) + 1;
}*/

static stock Pool:_GetMSelectionPool(playerid) {
    if (!IsPlayerConnected(playerid)) {
        return INVALID_POOL;
    }

    if (!pool_valid(mSele@PlayerListitemPointer[playerid])) {
        mSele@PlayerListitemPointer[playerid] = pool_new();
    }

    return mSele@PlayerListitemPointer[playerid];
}

//------------------------------------------------

stock mS_GetNumberOfPagesEx(playerid)
{
	new ItemAmount = mS_GetAmountOfListItemsEx(playerid);
	if((ItemAmount >= mS_SELECTION_ITEMS) && (ItemAmount % mS_SELECTION_ITEMS) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS) + 1;
}


//------------------------------------------------

stock mS_GetAmountOfListItemsEx(playerid)
{
	return /*GetPVarInt(playerid, "mS_custom_item_amount")*/mSele_PlayerSelectionNumItems[playerid];
}

//------------------------------------------------

/*stock mS_GetPlayerCurrentListID(playerid)
{
	if(GetPVarInt(playerid, "mS_list_active") == 1) return GetPVarInt(playerid, "mS_list_id");
	else return mS_INVALID_LISTID;
}*/

//------------------------------------------------

stock PlayerText:mS_CreateCurrentPageTextDraw(playerid, Float:Xpos, Float:Ypos)
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, "0/0");
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    //PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xFFFFFFFF/*0xACCBF1FF*/);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------
// Creates a button textdraw and returns the textdraw ID.

stock Text:mS_CreateDialogButton(Float:Xpos, Float:Ypos, Float:Width, Float:Height, const button_text[], Float:SizeX = 0.4, Float:SizeY = 1.1)
{
 	new Text:txtInit;
   	txtInit = TextDrawCreate(Xpos, Ypos, button_text);
   /*	PlayerTextDrawUseBox(txtInit, 1);*/
   	TextDrawBoxColor(txtInit, 0x000000FF);
   	TextDrawBackgroundColor(txtInit, 0x000000FF);
	TextDrawLetterSize(txtInit, SizeX, SizeY);
	TextDrawFont(txtInit, 1);
	TextDrawSetShadow(txtInit, 0); // no shadow
    TextDrawSetOutline(txtInit, 0);
   /* TextDrawColor(txtInit, 0x255255255FF);*/
    TextDrawSetSelectable(txtInit, 1);
    TextDrawAlignment(txtInit, 2);
    TextDrawTextSize(txtInit, Height, Width); // The width and height are reversed for centering.. something the game does <g>
    return txtInit;
}
 
//------------------------------------------------

stock PlayerText:mS_CreatePlayerHeaderTextDraw(playerid, Float:Xpos, Float:Ypos, const header_text[])
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, header_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.50, 2.0);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    //PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xFFFFFFFF/*0xACCBF1FF*/);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------

stock Text:mS_CreateBGTextDraw(Float:Xpos, Float:Ypos, Float:Width, Float:Height, bgcolor)
{
	new Text:txtBackground = TextDrawCreate(Xpos, Ypos,"                                   ~n~"); // enough space for everyone
    TextDrawUseBox(txtBackground, 1);
    TextDrawBoxColor(txtBackground, bgcolor);
	TextDrawLetterSize(txtBackground, 5.0, 5.0);
	TextDrawFont(txtBackground, 0);
	TextDrawSetShadow(txtBackground, 0);
    TextDrawSetOutline(txtBackground, 0);
    TextDrawColor(txtBackground,0x000000FF);
    TextDrawTextSize(txtBackground, Width, Height);
   	TextDrawBackgroundColor(txtBackground, bgcolor);
    return txtBackground;
}

//------------------------------------------------
// Creates a model preview sprite

stock PlayerText:mS_CreateMPTextDraw(playerid, modelindex, Float:Xpos, Float:Ypos, Float:Xrot, Float:Yrot, Float:Zrot, Float:mZoom, Float:width, Float:height, bgcolor)
{
    new PlayerText:txtPlayerSprite = CreatePlayerTextDraw(playerid, Xpos, Ypos, ""); // it has to be set with SetText later
    PlayerTextDrawFont(playerid, txtPlayerSprite, TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawColor(playerid, txtPlayerSprite, 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerSprite, bgcolor);
    PlayerTextDrawTextSize(playerid, txtPlayerSprite, width, height); // Text size is the Width:Height
    PlayerTextDrawSetPreviewModel(playerid, txtPlayerSprite, modelindex);
    PlayerTextDrawSetPreviewRot(playerid,txtPlayerSprite, Xrot, Yrot, Zrot, mZoom);
    PlayerTextDrawSetSelectable(playerid, txtPlayerSprite, 1);
    PlayerTextDrawShow(playerid,txtPlayerSprite);
    return txtPlayerSprite;
}

stock PlayerText:mS_CreateExtraValueTextDraw(playerid, const str[], Float:Xpos, Float:Ypos, Float:width, Float:height, bgcolor)
{
    new PlayerText:txtPlayerValue = CreatePlayerTextDraw(playerid, Xpos, Ypos, str);
    PlayerTextDrawFont(playerid, txtPlayerValue, 1);
    PlayerTextDrawColor(playerid, txtPlayerValue, 0xFFFFFFFF);
    PlayerTextDrawSetOutline(playerid, txtPlayerValue, 1);
    PlayerTextDrawSetShadow(playerid, txtPlayerValue, 0);
    PlayerTextDrawAlignment(playerid, txtPlayerValue, 3);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerValue, bgcolor);
    PlayerTextDrawLetterSize(playerid, txtPlayerValue, width, height);
    return txtPlayerValue;
}

//------------------------------------------------

stock mS_DestroyPlayerMPs(playerid)
{
	new x=0;
	while(x != mS_SELECTION_ITEMS) {
	    if(gSelectionItems[playerid][x] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawDestroy(playerid, gSelectionItems[playerid][x]);
			gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		x++;
	}
}

mSele_HidePlayerModelSelection(playerid)
{
	for(new i = 0; i < mS_SELECTION_ITEMS; i++)
	{
		TextDrawHideForPlayer(playerid, mSele_TDModel[i][0]);
	}
}

stock mSelection_DestroyPointers(playerid)
{
	new Pool:pool = _GetMSelectionPool(playerid);

    if (pool_valid(pool)) {
      /*  new data[E_MSELECTION_DATA];

        for (new Iter:id = pool_iter(pool); iter_inside(id); iter_move_next(id)) {
            if (!iter_sizeof(id)) {
                continue;
            }

            iter_get_arr(id, data);

        }*/

        pool_delete_deep(pool);
    }
}

//------------------------------------------------

stock mS_ShowPlayerMPs(playerid)
{
	//new bgcolor = GetPVarInt(playerid, "mS_previewBGcolor");
   // new x=0;
	new Float:BaseX = mS_DIALOG_BASE_X;
	new Float:BaseY = mS_DIALOG_BASE_Y - (mS_SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker = 0;
	new txtid;
	new itemat;
	new Pool:pool = _GetMSelectionPool(playerid);
	//new Pointer:listitemTextPointer;
	new modelid, price, /*text[128],*/ Float:rx, Float:ry, Float:rz, Float:zoom, color1, color2;
	
		//rotzoom[0] = GetPVarFloat(playerid, "mS_custom_Xrot");
		//rotzoom[1] = GetPVarFloat(playerid, "mS_custom_Yrot");
		//rotzoom[2] = GetPVarFloat(playerid, "mS_custom_Zrot");
		//rotzoom[3] = GetPVarFloat(playerid, "mS_custom_Zoom");
	new itemamount = mSele_PlayerSelectionNumItems[playerid];
		// Destroy any previous ones created
		//mS_DestroyPlayerMPs(playerid);

	for(new i = 0; i < mS_SELECTION_ITEMS; i++)
	{
		if(linetracker == 0) {
			BaseX = mS_DIALOG_BASE_X + 10.0; 
			BaseY += mS_SPRITE_DIM_Y + 1.0; 
		}
		txtid = i;
		itemat = ((mSele_PlayerDialogPage[playerid] * mS_SELECTION_ITEMS) + txtid);
			//printf("Test: %d y %d", txtid, itemat);
		TextDrawHideForPlayer(playerid, mSele_TDModel[txtid][0]);
		if(itemat >= itemamount)
		{
			TextDrawHideForPlayer(playerid, mSele_TDModel[txtid][0]);
			PlayerTextDrawHide(playerid, mSele_TDInfoExtra[playerid][txtid]);
			continue; 
		}
		//listitemPointer = Map:map_get_var(mSele@PlayerListitemPointer[playerid], itemat);
		new data[E_MSELECTION_DATA];
		pool_get_arr(pool, itemat, data);

		modelid = data[E_MSELECTION_MODELID];
		price = data[E_MSELECTION_PRICE];
		rx = data[E_MSELECTION_RX];
		ry = data[E_MSELECTION_RY];
		rz = data[E_MSELECTION_RZ];
		zoom = data[E_MSELECTION_ZOOM];
		color1 = data[E_MSELECTION_COLOR1];
		color2 = data[E_MSELECTION_COLOR2];

		TextDrawSetPreviewModel(mSele_TDModel[txtid][0], modelid);
		TextDrawSetPreviewRot(mSele_TDModel[txtid][0], rx,ry,rz,zoom);
		TextDrawSetPreviewVehCol(mSele_TDModel[txtid][0], color1, color2);
		TextDrawShowForPlayer(playerid, mSele_TDModel[txtid][0]);

		//printf("Price: %d", price);

		if(price)
		{
			new str[18];
			format(str, sizeof(str), "~g~$%s", FormatNumber(price));
			PlayerTextDrawSetString(playerid, mSele_TDInfoExtra[playerid][txtid], str);
			PlayerTextDrawShow(playerid, mSele_TDInfoExtra[playerid][txtid]);
			//mSele_TDInfoExtra[playerid][txtid] = mS_CreateExtraValueTextDraw(playerid, price, BaseX, BaseY, 0.40, 1.0, 0x000000FF);
		}
		else
		{
			PlayerTextDrawHide(playerid, mSele_TDInfoExtra[playerid][txtid]);
		}
		BaseX += mS_SPRITE_DIM_X + 1.0; // move on the X for the next sprite
		linetracker++;
		if(linetracker == mS_ITEMS_PER_LINE) linetracker = 0;
			
	}
}

//------------------------------------------------

stock mS_UpdatePageTextDraw(playerid)
{
	new PageText[64+1];
	
	format(PageText, 64, "%d/%d", mSele_PlayerDialogPage[playerid] + 1, mS_GetNumberOfPagesEx(playerid));
	PlayerTextDrawSetString(playerid, gCurrentPageTextDrawId[playerid], PageText);
}

//------------------------------------------------------------

stock mSelection_AddItems(playerid, modelid, price = 0, itemid = 0, color1 = 0, color2 = 0, Float:rx = 0.0, Float:ry = 0.0, Float:rz = 0.0, Float:zoom = 1.0)
{

	if(!ms_FunctionName[playerid][0]) return 0;
	/*if(mSele@PlayerListitemPointer[playerid] == MEM_NULLPTR)
	{
		mSele@PlayerListitemPointer[playerid] = MEM_new(DEFAULT_MSELECTION_INCREMENT_SIZE);
		printf("Se ejecuto solo 1 una vez.");
	}*/
	new count;
	count = mSele_PlayerSelectionNumItems[playerid];

	new Pool:pool = _GetMSelectionPool(playerid);

	new data[E_MSELECTION_DATA];

	/*if (Prev_FetchListitemData(listitem, modelid, price, rx,  ry, rz, zoom, color1, color2) == 0) {
		continue;
	}*/
	data[E_MSELECTION_MODELID] = modelid;
	data[E_MSELECTION_PRICE] = price;
	data[E_MSELECTION_RX] = rx;
	data[E_MSELECTION_RY] = ry;
	data[E_MSELECTION_RZ] = rz;
	data[E_MSELECTION_ZOOM] = zoom;
	data[E_MSELECTION_COLOR1] = color1;
	data[E_MSELECTION_COLOR2] = color2;
	data[E_MSELECTION_ITEM] = itemid;


	pool_add_arr(pool, data);
	/*listitemPointer = map_new();

	map_add(listitemPointer, 0, modelid);
	map_add(listitemPointer, 1, price);
	map_add(listitemPointer, 2, _:rx);
	map_add(listitemPointer, 3, _:ry);
	map_add(listitemPointer, 4, _:rz);
	map_add(listitemPointer, 5, _:zoom);
	map_add(listitemPointer, 6, color1);
	map_add(listitemPointer, 7, color2);
	map_add(listitemPointer, 8, itemid);

	if (count == map_size(mSele@PlayerListitemPointer[playerid])) {
		new Map:tmpPointer = map_new(count + DEFAULT_MSELECTION_INCREMENT_SIZE);
		tmpPointer = map_clone(mSele@PlayerListitemPointer[playerid]);

		map_delete(mSele@PlayerListitemPointer[playerid]);

		mSele@PlayerListitemPointer[playerid] = tmpPointer;
	}

	map_set(mSele@PlayerListitemPointer[playerid], count++, _:listitemPointer);*/
	count++;
	mSele_PlayerSelectionNumItems[playerid] = count;
	return 1;
}

stock Internal_mSelect_Open(playerid, const ms_ID[], /*items_array[], item_amount,*/const header_text[], /*extraid, dialogBGcolor = 0x4A5A6BBB,*/ previewBGcolor = 0x88888899 , tdSelectionColor = 0xFFFFFFAA)
{
	if(ms_FunctionName[playerid][0]) { HideModelSelectionMenu(playerid); 	/*printf("Open Close");*/ }

	//if(item_amount > mS_CUSTOM_MAX_ITEMS)
	//{
		//item_amount = mS_CUSTOM_MAX_ITEMS;
		//print("-mSelection- WARNING: Too many items given to \"ShowModelSelectionMenuEx\", increase \"mS_CUSTOM_MAX_ITEMS\" to fix this");
	//}
	//mSele@PlayerListitemPointer[playerid] = map_new();

	mSele_PlayerDialogPage[playerid] = 0;
	//mSele_PlayerSelectionID[playerid] = ms_ID;

	IsOpenMSelection[playerid] = true;

	mSelection_strcpy(ms_FunctionName[playerid], ms_ID, MSELECT_MAX_FUNCTION_NAME);

	//	SetPVarInt(playerid, "mS_custom_item_amount", item_amount);

	//SetPVarFloat(playerid, "mS_custom_Xrot", Xrot);
	//SetPVarFloat(playerid, "mS_custom_Yrot", Yrot);
	//SetPVarFloat(playerid, "mS_custom_Zrot", Zrot);
	//SetPVarFloat(playerid, "mS_custom_Zoom", mZoom);
	//SetPVarInt(playerid, "mS_custom_extraid", extraid);


	TextDrawShowForPlayer(playerid, mSele_TDBox[0]);
		//gBackgroundTextDrawId[playerid] = mS_CreatePlayerBGTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y + 20.0, mS_DIALOG_WIDTH, mS_DIALOG_HEIGHT, dialogBGcolor);
	gHeaderTextDrawId[playerid] = mS_CreatePlayerHeaderTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y + 20.0, ConvertEncoding(header_text));
	gCurrentPageTextDrawId[playerid] = mS_CreateCurrentPageTextDraw(playerid, mS_DIALOG_BASE_X + 10.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+90.0);
	//gNextButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 30.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_NEXT_TEXT);
	//gPrevButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 90.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_PREV_TEXT);
	//gCancelButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 10.0, mS_DIALOG_BASE_Y + 20.0, 50.0, 16.0, mS_CANCEL_TEXT);
	TextDrawShowForPlayer(playerid, mSele_TDButtons[0]);
	TextDrawShowForPlayer(playerid, mSele_TDButtons[1]);
	TextDrawShowForPlayer(playerid, mSele_TDButtons[2]);

	SetPVarInt(playerid, "mS_previewBGcolor", previewBGcolor);

	mSele_CreatePlayerTextdraws(playerid);

	SelectTextDraw(playerid, tdSelectionColor);
	return 1;

}

stock mSelection_Update(playerid)
{
	mS_ShowPlayerMPs(playerid);
	mS_UpdatePageTextDraw(playerid);
}

stock mSelection_IsOpen(playerid)
{
	return _:IsOpenMSelection[playerid];
}

//------------------------------------------------

stock HideModelSelectionMenu(playerid)
{
	mS_DestroySelectionMenu(playerid);
	//SetPVarInt(playerid, "mS_ignore_next_esc", 1);
	TD_SkipCancel[playerid] = true;
	CancelSelectTextDraw(playerid);
	return 1;
}

//------------------------------------------------

stock mS_DestroySelectionMenu(playerid)
{
	IsOpenMSelection[playerid] = false;
		//ms_FunctionName[playerid][0] = '\0';
	//	mS_DestroyPlayerMPs(playerid);

	mSele_DestroyPlayerTextdraws(playerid);
	mSele_HidePlayerModelSelection(playerid);

	PlayerTextDrawDestroy(playerid, gHeaderTextDrawId[playerid]);
	TextDrawHideForPlayer(playerid, mSele_TDBox[0]);
	PlayerTextDrawDestroy(playerid, gCurrentPageTextDrawId[playerid]);

	//PlayerTextDrawDestroy(playerid, gNextButtonTextDrawId[playerid]);
	//PlayerTextDrawDestroy(playerid, gPrevButtonTextDrawId[playerid]);
	//PlayerTextDrawDestroy(playerid, gCancelButtonTextDrawId[playerid]);
	TextDrawHideForPlayer(playerid, mSele_TDButtons[0]);
	TextDrawHideForPlayer(playerid, mSele_TDButtons[1]);
	TextDrawHideForPlayer(playerid, mSele_TDButtons[2]);


	mSelection_DestroyPointers(playerid);

	mSele_PlayerSelectionNumItems[playerid] = 0;

	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

	//gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	//gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;	
	//gCancelButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;		
}

mSele_CreateTextDraws()
{
	mSele_TDBox[0] = mS_CreateBGTextDraw(mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y + 20.0, mS_DIALOG_WIDTH, mS_DIALOG_HEIGHT, 0x555555CC/*1970632023 0x4A5A6BBB*/);
	mSele_TDButtons[0] = mS_CreateDialogButton(mS_DIALOG_WIDTH - 50.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+90.0, 50.0, 16.0, mS_NEXT_TEXT, 0.29, 2.0);
	mSele_TDButtons[1] = mS_CreateDialogButton(mS_DIALOG_WIDTH - 90.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+90.0, 50.0, 16.0, mS_PREV_TEXT, 0.29, 2.0);
	mSele_TDButtons[2] = mS_CreateDialogButton(mS_DIALOG_WIDTH - 10.0, mS_DIALOG_BASE_Y + 20.0, 50.0, 16.0, mS_CANCEL_TEXT);

	new Float:BaseX = mS_DIALOG_BASE_X;
	new Float:BaseY = mS_DIALOG_BASE_Y - (mS_SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker;

	for(new i = 0; i < mS_SELECTION_ITEMS; i++)
	{
		if(linetracker == 0)
		{
			BaseX = mS_DIALOG_BASE_X + 2.0; 
			BaseY += mS_SPRITE_DIM_Y + 1.0; 
		}
	 	mSele_TDModel[i][0] = TextDrawCreate(BaseX, BaseY, ""); // it has to be set with SetText later
    	TextDrawFont(mSele_TDModel[i][0], TEXT_DRAW_FONT_MODEL_PREVIEW);
    	TextDrawColor(mSele_TDModel[i][0], 0xFFFFFFFF);
    	TextDrawBackgroundColor(mSele_TDModel[i][0], 0xB5B5B5FF/*0x88888899*/);
    	TextDrawTextSize(mSele_TDModel[i][0], mS_SPRITE_DIM_X, mS_SPRITE_DIM_Y); // Text size is the Width:Height
    	//PlayerTextDrawSetPreviewModel(mSele_TDModel[i][0], modelindex);
    	//PlayerTextDrawSetPreviewRot(playerid,mSele_TDModel[i][0], Xrot, Yrot, Zrot, mZoom);
    	TextDrawSetSelectable(mSele_TDModel[i][0], 1);
    	//PlayerTextDrawShow(playerid,mSele_TDModel[i][0]);
    	BaseX += mS_SPRITE_DIM_X + 1.0;
    	linetracker++;
		if(linetracker == mS_ITEMS_PER_LINE) linetracker = 0;
    }
}




mSele_DestroyTextDraws()
{

}

mSele_CreatePlayerTextdraws(playerid)
{
	new Float:BaseX = mS_DIALOG_BASE_X;
	new Float:BaseY = mS_DIALOG_BASE_Y - (mS_SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker;

	for(new i = 0; i < mS_SELECTION_ITEMS; i++)
	{
		if(linetracker == 0)
		{
			BaseX = mS_DIALOG_BASE_X + 2.0; 
			BaseY += mS_SPRITE_DIM_Y + 1.0; 
		}
		
		mSele_TDInfoExtra[playerid][i] = mS_CreateExtraValueTextDraw(playerid, "", BaseX+74.0, BaseY+65.0, 0.20, 1.0, 0x000000FF);

		BaseX += mS_SPRITE_DIM_X + 1.0;
    	linetracker++;
		if(linetracker == mS_ITEMS_PER_LINE) linetracker = 0;
	}
}
mSele_DestroyPlayerTextdraws(playerid)
{
	for(new i = 0; i < mS_SELECTION_ITEMS; i++)
	{
		PlayerTextDrawDestroy(playerid, mSele_TDInfoExtra[playerid][i]);
	}
}

//------------------------------------------------

public OnGameModeInit() {
    mSele_CreateTextDraws();

	#if defined MSelection_OnGameModeInit
		return MSelection_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit MSelection_OnGameModeInit
#if defined MSelection_OnGameModeInit
	forward MSelection_OnGameModeInit();
#endif

public OnGameModeExit() {
    mSele_DestroyTextDraws();

	#if defined MSelection_OnGameModeExit
		return MSelection_OnGameModeExit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit MSelection_OnGameModeExit
#if defined MSelection_OnGameModeExit
	forward MSelection_OnGameModeExit();
#endif

public OnFilterScriptInit() {
    mSele_CreateTextDraws();

	#if defined MSelection_OnFilterScriptInit
		return MSelection_OnFilterScriptInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit MSelection_OnFilterScriptInit
#if defined MSelection_OnFilterScriptInit
	forward MSelection_OnFilterScriptInit();
#endif

public OnFilterScriptExit() {
    mSele_DestroyTextDraws();

	#if defined MSelection_OnFilterScriptExit
		return MSelection_OnFilterScriptExit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnFilterScriptExit
	#undef OnFilterScriptExit
#else
	#define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit MSelection_OnFilterScriptExit
#if defined MSelection_OnFilterScriptExit
	forward MSelection_OnFilterScriptExit();
#endif

public OnPlayerDisconnect(playerid, reason) {
    mSelection_DestroyPointers(playerid);

	#if defined MSelection_OnPlayerDisconnect
		return MSelection_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect MSelection_OnPlayerDisconnect
#if defined MSelection_OnPlayerDisconnect
	forward MSelection_OnPlayerDisconnect(playerid, reason);
#endif


public OnPlayerConnect(playerid)
{
	// Init all of the textdraw related globals
    gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
   // gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCancelButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

   // mSele@PlayerListitemPointer[playerid] = INVALID_MAP;
    mSele_PlayerSelectionID[playerid] = -1;
    
    //for(new x=0; x < mS_SELECTION_ITEMS; x++) {
      //  gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	//}
	
	#if defined MSelection_OnPlayerConnect
		return MSelection_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect MSelection_OnPlayerConnect
#if defined MSelection_OnPlayerConnect
	forward MSelection_OnPlayerConnect(playerid);
#endif


//-------------------------------------------
// Even though only Player* textdraws are used in this script,
// OnPlayerClickTextDraw is still required to handle ESC

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (clickedid == Text:INVALID_TEXT_DRAW && TD_SkipCancel[playerid]) {
		TD_SkipCancel[playerid] = false;
		return 1;
	}
	// Handle: They cancelled (with ESC)
	if(clickedid == Text:INVALID_TEXT_DRAW && mSelection_IsOpen(playerid)) {
		HideModelSelectionMenu(playerid);
		PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);

		new call_func[MSELECT_MAX_FUNCTION_NAME] = "msr_";
		strcat(call_func, ms_FunctionName[playerid]);

		if (funcidx(call_func) != -1) {
			CallLocalFunction(call_func, "iiiii", playerid, 0, 0, 0, 0);
		}
		return 1;
	}
	if(mSelection_IsOpen(playerid))
	{
		new curpage = mSele_PlayerDialogPage[playerid];

		// Handle: cancel button
		if(clickedid == mSele_TDButtons[2]) {
			HideModelSelectionMenu(playerid);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);

			new call_func[MSELECT_MAX_FUNCTION_NAME] = "msr_";
			strcat(call_func, ms_FunctionName[playerid]);

			if (funcidx(call_func) != -1) {
				CallLocalFunction(call_func, "iiiii", playerid, 0, 0, 0, 0);
			}
			return 1;
		}

		// Handle: next button
		if(clickedid == mSele_TDButtons[0]) {		
			if(curpage < (mS_GetNumberOfPagesEx(playerid) - 1)) {
				mSele_PlayerDialogPage[playerid] = curpage + 1;
				mS_ShowPlayerMPs(playerid);
				mS_UpdatePageTextDraw(playerid);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
			} else {
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
		}

		// Handle: previous button
		if(clickedid == mSele_TDButtons[1]) {
			if(curpage > 0) {
				mSele_PlayerDialogPage[playerid] = curpage - 1;
				mS_ShowPlayerMPs(playerid);
				mS_UpdatePageTextDraw(playerid);
				PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
			} else {
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
			return 1;
		}

		for(new x = 0; x < mS_SELECTION_ITEMS; x++) {
			if(clickedid == mSele_TDModel[x][0]) {
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				//new item_id = gSelectionItemsTag[playerid][x];
				new item_id = ((mSele_PlayerDialogPage[playerid] * (mS_SELECTION_ITEMS)) + x);
				//new selectid = mSele_PlayerSelectionID[playerid];
				
				new Pool:pool = _GetMSelectionPool(playerid); 

				new data[E_MSELECTION_DATA];
				pool_get_arr(pool, item_id, data);

				/*modelid = data[E_MSELECTION_MODELID];
				price = data[E_MSELECTION_PRICE];
				rx = data[E_MSELECTION_RX];
				ry = data[E_MSELECTION_RY];
				rz = data[E_MSELECTION_RZ];
				zoom = data[E_MSELECTION_ZOOM];
				color1 = data[E_MSELECTION_COLOR1];
				color2 = data[E_MSELECTION_COLOR2];*/

				//new Map:listitemPointer = Map:map_get_var(mSele@PlayerListitemPointer[playerid], item_id);
				new modelid, price, extraid;
				//modelid = map_get(listitemPointer, 0);
				//price = map_get(listitemPointer, 1);
				//extraid = map_get(listitemPointer, 8);
				modelid = data[E_MSELECTION_MODELID];
				price = data[E_MSELECTION_PRICE];
				extraid = data[E_MSELECTION_ITEM];

				HideModelSelectionMenu(playerid);

				new call_func[MSELECT_MAX_FUNCTION_NAME] = "msr_";
				strcat(call_func, ms_FunctionName[playerid]);
				if (funcidx(call_func) != -1) {
					CallLocalFunction(call_func, "dddddd", playerid, 1, item_id, modelid, price, extraid);
					return 1;
				}
			}
		}
	}

	#if defined MP_OPCTD
		return MP_OPCTD(playerid, Text:clickedid);
	#else
		return 0;
	#endif
}

#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif

#define OnPlayerClickTextDraw MP_OPCTD
#if defined MP_OPCTD
	forward MP_OPCTD(playerid, Text:clickedid);
#endif

//------------------------------------------------

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(mSelection_IsOpen(playerid))
	{
		new curpage = mSele_PlayerDialogPage[playerid];

		// Handle: cancel button
		if(playertextid == gCancelButtonTextDrawId[playerid]) {
			HideModelSelectionMenu(playerid);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			return 1;
		}

		// Handle: next button
		if(playertextid == gNextButtonTextDrawId[playerid]) {		
			if(curpage < (mS_GetNumberOfPagesEx(playerid) - 1)) {
				mSele_PlayerDialogPage[playerid] = curpage + 1;
				mS_ShowPlayerMPs(playerid);
				mS_UpdatePageTextDraw(playerid);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
			} else {
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
		}

		// Handle: previous button
		if(playertextid == gPrevButtonTextDrawId[playerid]) {
			if(curpage > 0) {
				mSele_PlayerDialogPage[playerid] = curpage - 1;
				mS_ShowPlayerMPs(playerid);
				mS_UpdatePageTextDraw(playerid);
				PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
			} else {
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
			return 1;
		}

		// Search in the array of textdraws used for the items
		/*new x=0;
		while(x != mS_SELECTION_ITEMS) {
		    if(playertextid == gSelectionItems[playerid][x]) {
				new listID = mS_GetPlayerCurrentListID(playerid);
				if(listID == mS_CUSTOM_LISTID)
				{
					PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
					//new item_id = gSelectionItemsTag[playerid][x];
					new item_id = ((mSele_PlayerDialogPage[playerid] * (mS_SELECTION_ITEMS)));
					new extraid = GetPVarInt(playerid, "mS_custom_extraid");
					HideModelSelectionMenu(playerid);
					CallLocalFunction("OnPlayerModelSelectionEx", "dddd", playerid, 1, extraid, item_id);
					return 1;
				}
				else
				{
					PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
					new item_id = gSelectionItemsTag[playerid][x];
					HideModelSelectionMenu(playerid);
					CallLocalFunction("OnPlayerModelSelection", "ddddd", playerid, 1, listID, item_id, gRotZoom[x][4]);
					return 1;
				}
			}
			x++;
		}*/
	}
	#if defined MP_OPCPTD
		return MP_OPCPTD(playerid, playertextid);
	#else
		return 0;
	#endif
}
#if defined _ALS_OnPlayerClickPlayerTD
	#undef OnPlayerClickPlayerTextDraw
#else
	#define _ALS_OnPlayerClickPlayerTD
#endif

#define OnPlayerClickPlayerTextDraw MP_OPCPTD
#if defined MP_OPCPTD
	forward MP_OPCPTD(playerid, PlayerText:playertextid);
#endif


//------------------------------------------------------------------


/*stock LoadModelSelectionMenu(f_name[])
{
	new File:f, str[75];
	format(str, sizeof(str), "%s", f_name);
	f = fopen(str, io_read);
	if( !f ) {
		printf("-mSelection- WARNING: Failed to load list: \"%s\"", f_name);
		return mS_INVALID_LISTID;
	}
	
	if(gListAmount >= mS_TOTAL_LISTS)
	{
		printf("-mSelection- WARNING: Reached maximum amount of lists, increase \"mS_TOTAL_LISTS\"", f_name);
		return mS_INVALID_LISTID;
	}
	new tmp_ItemAmount = gItemAmount; // copy value if loading fails
	
	
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
		new mID = strval( mS_strtok(line,idxx) );
		if((-30000 <= mID <= -1000) || (0 <= mID < 20000))
		{
			gItemList[tmp_ItemAmount][mS_ITEM_MODEL] = mID;
		
			new tmp_mS_strtok[20];
			new Float:mRotation[3], Float:mZoom = 1.0, price;
			new bool:useRotation = false;
			
			tmp_mS_strtok = mS_strtok(line,idxx);
			if(tmp_mS_strtok[0]) {
				useRotation = true;
				mRotation[0] = floatstr(tmp_mS_strtok);
			}
			tmp_mS_strtok = mS_strtok(line,idxx);
			if(tmp_mS_strtok[0]) {
				useRotation = true;
				mRotation[1] = floatstr(tmp_mS_strtok);
			}
			tmp_mS_strtok = mS_strtok(line,idxx);
			if(tmp_mS_strtok[0]) {
				useRotation = true;
				mRotation[2] = floatstr(tmp_mS_strtok);
			}
			tmp_mS_strtok = mS_strtok(line,idxx);
			if(tmp_mS_strtok[0]) {
				useRotation = true;
				price = strval(tmp_mS_strtok);
			}

			if(useRotation)
			{
				new bool:foundRotZoom = false;
				for(new i=0; i < gRotZoomAmount; i++)
				{
					if(gRotZoom[i][0] == mRotation[0] && gRotZoom[i][1] == mRotation[1] && gRotZoom[i][2] == mRotation[2] && gRotZoom[i][3] == mZoom)
					{
						foundRotZoom = true;
						gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = i;
						break;
					}
				}
				if(gRotZoomAmount < mS_TOTAL_ROT_ZOOM)
				{
					if(!foundRotZoom)
					{
						gRotZoom[gRotZoomAmount][0] = mRotation[0];
						gRotZoom[gRotZoomAmount][1] = mRotation[1];
						gRotZoom[gRotZoomAmount][2] = mRotation[2];
						gRotZoom[gRotZoomAmount][3] = mZoom;
						gRotZoom[gRotZoomAmount][4] = price;
						gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = gRotZoomAmount;
						gRotZoomAmount++;
					}
				}
				else print("-mSelection- WARNING: Not able to save rotation/zoom information. Reached maximum rotation/zoom information count. Increase '#define mS_TOTAL_ROT_ZOOM' to fix the issue"); 
			}
			else gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = -1;
			tmp_ItemAmount++;
		}
	}
	if(tmp_ItemAmount > gItemAmount) // any models loaded ?
	{
		gLists[gListAmount][mS_LIST_START] = gItemAmount;
		gItemAmount = tmp_ItemAmount; // copy back
		gLists[gListAmount][mS_LIST_END] = (gItemAmount-1);
		
		gListAmount++;
		return (gListAmount-1);
	}
	printf("-mSelection- WARNING: No Items found in file: %s", f_name);
	return mS_INVALID_LISTID;
}*/
			
	
	
stock mS_strtok(const string[], &index)
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

stock Prev_FetchListitemData(const listitem[], &modelid, &price, &Float:rx, &Float:ry, &Float:rz, &Float:zoom, &color1, &color2) {
	rx = 0.0;
	ry = 0.0;
	rz = -45.0;
	zoom = 1.0;
	color1 = -1;
	color2 = -1;

	new pos, next, count;
	new valuestr[16];
	new modelstr[32 + (sizeof(valuestr) * 7)];
	new pricestr[32];

	pos = strfind(listitem, "\t");

	if (pos == -1) {
		strmid(modelstr, listitem, 0, strlen(listitem));
		//text[0] = EOS;
 	} else {
		strmid(modelstr, listitem, 0, pos);
		strmid(pricestr, listitem, 0, pos + 1);
		price = strval(pricestr);
 	}

	if (modelstr[0] == EOS) {
		return 0;
	}

	pos = strfind(modelstr, "(");
	if (pos == -1) {
	    modelid = strval(modelstr);
		return 1;
	}

	if (strfind(modelstr, ")", false, (pos + 1)) == -1) {
		return 0;
	}

	strmid(valuestr, modelstr, 0, pos);
	modelid = strval(valuestr);

	do {
	    next = strfind(modelstr, ",", false, pos);

	    strmid(valuestr, modelstr, pos, ((next == -1) ? strlen(modelstr) : next), sizeof(valuestr));

  		pos = (next == -1) ? -1 : (next + 1);

		switch (count) {
			case 0: rx = floatstr(valuestr);
			case 1: ry = floatstr(valuestr);
			case 2: rz = floatstr(valuestr);
			case 3: zoom = floatstr(valuestr);
			case 4: color1 = strval(valuestr);
			case 5: color2 = strval(valuestr);
		}
		++count;

	} while (pos != -1 && count != 6);

	return 1;
}

stock mSelection_strcpy(result[], const source[], const size = sizeof(result))
{
	result[0] = 0;
	return strcat(result, source, size);
}