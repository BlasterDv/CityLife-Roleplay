ShowPlayerInventoryTextdraw(playerid)
{
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);
	
	if(PlayerInfo[playerid][p_mPanelCatActive] == 0)
	{
		ShowTextdrawInventory(playerid);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 1)
	{
		CreateTextdrawInvFaction(playerid);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	{
		ShowPlayerPanelGPS(playerid);
	}
	ShowPlayerMenuInvButtons(playerid);
	return 1;
}

HidePlayerInventoryTextdraw(playerid)
{
	rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, false);
	
	if(PlayerInfo[playerid][p_mPanelCatActive] == 0)
	{
		HidePlayerInvPanel(playerid);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 1)
	{
		DestroyTextdrawInvFactionAll(playerid);
		Player.Temp[playerid][@FactionPage] = 0;
		rBit1_Set(eBit1_PlayerInfo[p_ShowPanelFaction], playerid, false);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	{
		HidePlayerPanelGPS(playerid);
	}

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][2]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][2]);
	return 1;
}

/*CreateTextdrawInventory(playerid, Float:posy = 149.0, bool:extraoff = false)
{
	CreatePlayerInventoryTextdraw(playerid, 0, (147.0+(0*41.0)), posy, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][0][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][0][invItem]);
	CreatePlayerInventoryTextdraw(playerid, 1, (147.0+(1*42.0)), posy, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][1][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][1][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 2, (147.0+(2*42.0)), posy, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][2][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][2][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 3, (147.0+(3*42.0)), posy, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][3][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][3][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 4, (147.0+(0*42.0)), posy+49.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][4][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][4][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 5, (147.0+(1*42.0)), posy+49.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][5][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][5][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 6, (147.0+(2*42.0)), posy+49.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][6][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][6][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 7, (147.0+(3*42.0)), posy+49.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][7][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][7][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 8, (147.0+(0*42.0)), posy+98.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][8][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][8][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 9, (147.0+(1*42.0)), posy+98.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][9][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][9][invItem]);	
	CreatePlayerInventoryTextdraw(playerid, 10, (147.0+(2*42.0)), posy+98.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][10][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][10][invItem]);
	CreatePlayerInventoryTextdraw(playerid, 11, (147.0+(3*42.0)), posy+98.0, 41.0, 48.0, InvObjectData[PlayerInventory[playerid][11][invItem]][E_INV_OBJECTMID], PlayerInventory[playerid][11][invItem]);
	
	if(extraoff == false)
	{
		CreatePlayerInventoryTextdraw(playerid, 12, 147.0+(0*35.0), 314.0, 34.0, 38.0, InvObjectData[Player.InvEquiped[playerid][0][@Item]][E_INV_OBJECTMID], Player.InvEquiped[playerid][0][@Item]);	
		CreatePlayerInventoryTextdraw(playerid, 13, 147.0+(1*35.0), 314.0, 34.0, 38.0, InvObjectData[Player.InvEquiped[playerid][1][@Item]][E_INV_OBJECTMID], Player.InvEquiped[playerid][1][@Item]);	
		CreatePlayerInventoryTextdraw(playerid, 14, 147.0+(2*35.0), 314.0, 34.0, 38.0, InvObjectData[Player.InvEquiped[playerid][2][@Item]][E_INV_OBJECTMID], Player.InvEquiped[playerid][2][@Item]);	
		CreatePlayerInventoryTextdraw(playerid, 15, 147.0+(3*35.0), 314.0, 34.0, 38.0, InvObjectData[Player.InvEquiped[playerid][3][@Item]][E_INV_OBJECTMID], Player.InvEquiped[playerid][3][@Item]);	
		CreatePlayerInventoryTextdraw(playerid, 16, 147.0+(4*35.0), 314.0, 34.0, 38.0, InvObjectData[Player.InvEquiped[playerid][4][@Item]][E_INV_OBJECTMID], Player.InvEquiped[playerid][4][@Item]);	

		Player_Textdraws[playerid][pTextdraw_TextInventory][0] = CreatePlayerTextDraw(playerid,277.0, 301.0, "4/4");	
	}
	else
	{
		Player_Textdraws[playerid][pTextdraw_TextInventory][0] = CreatePlayerTextDraw(playerid,300.0, 301.0, "4/4");
	}

	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0.1800, 1.0);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0);

	InventorySpaceBar[playerid][0] = CreatePlayerProgressBar(playerid, 150.00, 307.00, 98.0, 4.0, 0x008BFFFF, 16.0, 2);
	SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
	return 1;
}*/

ShowTextdrawInventory(playerid)
{
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][1], 0.019998, 25.00);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);

	TextDrawSetPreviewModel(Textdraws[sTextdraw_InventoryBoxPlayer][0], PlayerInfo[playerid][pRopa]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][1]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][2]);

	Inventory_AddTextdrawInfo(playerid);

	new offset;
	for(new i = 0; i < (MAX_PLAYER_INVENTORY_ITEMS); i++)
	{
		//Inventory_AddItemsTD(playerid, i);

		
		if(InvObjectData[ PlayerInventory[playerid][i][invItem] ][E_INV_TypeInfo] == 1)
		{
			new data[E_PLAYER_TD_INVITEMS_DATA];

			map_get_arr(Player.Temp[playerid][@InvItemsMap], i, data);

			if(data[E_PLAYER_TD_INVITEMS_LeftInfo] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawShow(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
				new info[20];
				format(info, sizeof(info), "%d", PlayerInventory[playerid][i][invAmount]);
				PlayerTextDrawSetString(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo], info);
			}
		}
		else if(IsInventoryItemTypeInfo(playerid, i) == 2)
		{
			SetProgressBarValue(sProgress_pItemsInventory[i], PlayerInventory[playerid][i][invAmount]);
			ShowProgressBarForPlayer(playerid, sProgress_pItemsInventory[i]);
		}

		if(PlayerInfo[playerid][pInvItemSelected] == i)
		{
			TextDrawColor(sTextdraw_pItemsInventory[i][0], 0xCD5757FF);
			TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i][0]);
		}
		else
		{
			TextDrawColor(sTextdraw_pItemsInventory[i][0], 0xECECECFF);
			TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i][0]);
		}

		offset = InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_PointToRot];
		TextDrawColor(sTextdraw_pItemsInventory[i][1], ARGBToRGBA(InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_COLOR1]));
		TextDrawSetPreviewRot(sTextdraw_pItemsInventory[i][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
		TextDrawSetPreviewModel(sTextdraw_pItemsInventory[i][1], InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_OBJECTMID]);
		TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i][1]);
	}
	for(new i = 0; i < (MAX_PLAYER_INV_ITEMS_EQUIPED); i++)
	{
		//Inventory_AddItemsTD(playerid, i);

		offset = InvObjectData[Player.InvEquiped[playerid][i][@Item]][E_INV_PointToRot];

		TextDrawColor(sTextdraw_pItemsInventory[i+12][1], ARGBToRGBA(InvObjectData[Player.InvEquiped[playerid][i][@Item]][E_INV_COLOR1]));
		TextDrawSetPreviewRot(sTextdraw_pItemsInventory[i][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
		TextDrawSetPreviewModel(sTextdraw_pItemsInventory[i+12][1], InvObjectData[Player.InvEquiped[playerid][i][@Item]][E_INV_OBJECTMID]);
		TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i+12][1]);		

		TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i+12][0]);
	}

	Player_Textdraws[playerid][pTextdraw_TextInventory][0] = CreatePlayerTextDraw(playerid,277.0, 291.0, "4/4");	

	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0.1800, 1.0);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0);

	InventorySpaceBar[playerid][0] = CreatePlayerProgressBar(playerid, 150.00, 297.00, 108.0, 4.0, 0xDF8D17FF, 16.0, 2);
	SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);

	SelectTextDraw(playerid, 0xBBBBBBFF);
	return 1;
}

Inventory_AddItemsTD(playerid, i)
{
	if(!map_valid(Player.Temp[playerid][@InvItemsMap]))
	{
		Player.Temp[playerid][@InvItemsMap] = map_new();
	}
	new data[E_PLAYER_TD_INVITEMS_DATA];

	data[E_PLAYER_TD_INVITEMS_LeftInfo] = PlayerText:INVALID_TEXT_DRAW;
	data[E_PLAYER_TD_INVITEMS_RightInfo] = PlayerText:INVALID_TEXT_DRAW;

	return map_add_arr(Player.Temp[playerid][@InvItemsMap], i, data);
}

Inventory_AddTextdrawInfo(playerid, Float:posy = 138.0)
{

	CreatePlayerInvTextdrawEx(playerid, 0, (147.0+(0*41.0)), posy, 41.0, 50.0, 0, true);
	CreatePlayerInvTextdrawEx(playerid, 1, (147.0+(1*42.0)), posy, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 2, (147.0+(2*42.0)), posy, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 3, (147.0+(3*42.0)), posy, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 4, (147.0+(0*42.0)), posy+51.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 5, (147.0+(1*42.0)), posy+51.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 6, (147.0+(2*42.0)), posy+51.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 7, (147.0+(3*42.0)), posy+51.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 8, (147.0+(0*42.0)), posy+102.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 9, (147.0+(1*42.0)), posy+102.0, 41.0, 50.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 10, (147.0+(2*42.0)), posy+102.0, 41.0, 50.0, 0, true);
	CreatePlayerInvTextdrawEx(playerid, 11, (147.0+(3*42.0)), posy+102.0, 41.0, 50.0, 0, true);
	
	CreatePlayerInvTextdrawEx(playerid, 12, 147.0+(0*35.0), 304.0, 34.0, 38.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 13, 147.0+(1*35.0), 304.0, 34.0, 38.0, 0, true);
	CreatePlayerInvTextdrawEx(playerid, 14, 147.0+(2*35.0), 304.0, 34.0, 38.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 15, 147.0+(3*35.0), 304.0, 34.0, 38.0, 0, true);	
	CreatePlayerInvTextdrawEx(playerid, 16, 147.0+(4*35.0), 304.0, 34.0, 38.0, 0, true);	
	return 1;
}

Inventory_AddTextdrawInfoTrans(playerid, Float:posy = 159.0)
{
	CreatePlayerInvTextdrawEx(playerid, 0, (310.0+(0*41.0)), posy, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 1, (310.0+(1*42.0)), posy, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 2, (310.0+(2*42.0)), posy, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 3, (310.0+(3*42.0)), posy, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 4, (310.0+(0*42.0)), posy+51.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 5, (310.0+(1*42.0)), posy+51.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 6, (310.0+(2*42.0)), posy+51.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 7, (310.0+(3*42.0)), posy+51.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 8, (310.0+(0*42.0)), posy+102.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 9, (310.0+(1*42.0)), posy+102.0, 41.0, 50.0, 1, true);	
	CreatePlayerInvTextdrawEx(playerid, 10, (310.0+(2*42.0)), posy+102.0, 41.0, 50.0, 1, true);
	CreatePlayerInvTextdrawEx(playerid, 11, (310.0+(3*42.0)), posy+102.0, 41.0, 50.0, 1, true);

	CreatePlayerInvTextdrawEx(playerid, 0, (117.0+(0*41.0)), posy, 41.0, 50.0);
	CreatePlayerInvTextdrawEx(playerid, 1, (117.0+(1*42.0)), posy, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 2, (117.0+(2*42.0)), posy, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 3, (117.0+(3*42.0)), posy, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 4, (117.0+(0*42.0)), posy+51.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 5, (117.0+(1*42.0)), posy+51.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 6, (117.0+(2*42.0)), posy+51.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 7, (117.0+(3*42.0)), posy+51.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 8, (117.0+(0*42.0)), posy+102.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 9, (117.0+(1*42.0)), posy+102.0, 41.0, 50.0);	
	CreatePlayerInvTextdrawEx(playerid, 10, (117.0+(2*42.0)), posy+102.0, 41.0, 50.0);
	CreatePlayerInvTextdrawEx(playerid, 11, (117.0+(3*42.0)), posy+102.0, 41.0, 50.0);
	return 1;
}

CreateTextdrawInventoryGlobal(Float:posy = 138.0)
{

	for(new i; i < 2; i++)
	{
		CreateInventoryTextdrawGlobal(i, 0, (147.0+(0*41.0)), posy, 41.0, 50.0);
		CreateInventoryTextdrawGlobal(i, 1, (147.0+(1*42.0)), posy, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 2, (147.0+(2*42.0)), posy, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 3, (147.0+(3*42.0)), posy, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 4, (147.0+(0*42.0)), posy+51.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 5, (147.0+(1*42.0)), posy+51.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 6, (147.0+(2*42.0)), posy+51.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 7, (147.0+(3*42.0)), posy+51.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 8, (147.0+(0*42.0)), posy+102.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 9, (147.0+(1*42.0)), posy+102.0, 41.0, 50.0);	
		CreateInventoryTextdrawGlobal(i, 10, (147.0+(2*42.0)), posy+102.0, 41.0, 50.0);
		CreateInventoryTextdrawGlobal(i, 11, (147.0+(3*42.0)), posy+102.0, 41.0, 50.0);
	
		CreateInventoryTextdrawGlobal(i, 12, 147.0+(0*35.0), 304.0, 34.0, 38.0, true);	
		CreateInventoryTextdrawGlobal(i, 13, 147.0+(1*35.0), 304.0, 34.0, 38.0, true);	
		CreateInventoryTextdrawGlobal(i, 14, 147.0+(2*35.0), 304.0, 34.0, 38.0, true);	
		CreateInventoryTextdrawGlobal(i, 15, 147.0+(3*35.0), 304.0, 34.0, 38.0, true);	
		CreateInventoryTextdrawGlobal(i, 16, 147.0+(4*35.0), 304.0, 34.0, 38.0, true);	
	}
	return 1;
}

HidePlayerInvPanel(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBoxPlayer][2]);
	
	new data[E_PLAYER_TD_INVITEMS_DATA];

	new count;
	for(new i = 0; i < (MAX_PLAYER_INVENTORY_ITEMS+MAX_PLAYER_INV_ITEMS_EQUIPED); i++)
	{
		map_get_arr(Player.Temp[playerid][@InvItemsMap], i, data);

		if(data[E_PLAYER_TD_INVITEMS_LeftInfo] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
			map_remove(Player.Temp[playerid][@InvItemsMap], i);
		}

		TextDrawHideForPlayer(playerid, sTextdraw_pItemsInventory[i][0]);
		TextDrawHideForPlayer(playerid, sTextdraw_pItemsInventory[i][1]);
		
		if(count < MAX_PLAYER_INVENTORY_ITEMS)
		{
			HideProgressBarForPlayer(playerid, sProgress_pItemsInventory[i]);
		}
		count++;
	}
	PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][0]);
	DestroyPlayerProgressBar(playerid, InventorySpaceBar[playerid][0]);
	return 1;
}

stock CreateTextdrawModeExchange(playerid)
{
	CreatePlayerInventoryTextdraw(playerid, 0, (171.0+(0*51.0)), 150.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][0][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 1, (171.0+(1*52.0)), 150.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][1][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 2, (171.0+(2*52.0)), 150.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][2][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 3, (171.0+(3*52.0)), 150.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][3][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 4, (171.0+(0*52.0)), 200.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][4][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 5, (171.0+(1*52.0)), 200.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][5][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 6, (171.0+(2*52.0)), 200.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][6][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 7, (171.0+(3*52.0)), 200.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][7][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 8, (171.0+(0*52.0)), 250.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][8][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 9, (171.0+(1*52.0)), 250.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][9][invItem]][E_INV_OBJECTMID]);	
	CreatePlayerInventoryTextdraw(playerid, 10, (171.0+(2*52.0)), 250.0, 51.0, 49.0, InvObjectData[PlayerInventory[playerid][10][invItem]][E_INV_OBJECTMID]);
}

stock CreatePlayerInventoryTextdraw(playerid, i, Float:tx, Float:ty, Float:sizex, Float:sizey, modelid=0, itemid=0)
{
	if(modelid == 0) { modelid = 19382/*11392*/; }

	Player_Textdraws[playerid][pTextdraw_ItemsInventory][i] = CreatePlayerTextDraw(playerid,tx,ty, "_");
	
    if(PlayerInfo[playerid][pInvItemSelected] == i)
    {
    	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], /*255*/0xCD5757FF/*88*/);
    }
    else
    {
		PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], /*255*/0xFFFFFFFF/*77*/);
	}
	PlayerTextDrawAlignment(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 2);	
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 5);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], InvObjectData[itemid][E_INV_COLOR1]);
	PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 0xFFFFFFFF/*InvObjectData[itemid][E_INV_COLOR1]*/);	
	PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 1);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], sizex, sizey);
	PlayerTextDrawSetPreviewModel(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], modelid);
	PlayerTextDrawSetPreviewRot(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], -16.000000, 0.000000, -55.000000, /*0.000000*/0.8);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 1);
	return 1;
}

stock CreateInventoryTextdrawGlobal(type, i, Float:tx, Float:ty, Float:sizex, Float:sizey, bool:bardisable=false)
{
   
	if(type == 1)
	{
		sTextdraw_pItemsInventory[i][type] = TextDrawCreate(tx,ty, "");

		TextDrawFont(sTextdraw_pItemsInventory[i][type], 5);
		TextDrawSetPreviewModel(sTextdraw_pItemsInventory[i][type], 19382);
		TextDrawSetPreviewRot(sTextdraw_pItemsInventory[i][type], -18.000000, 0.000000, -50.000000, 0.8);
		TextDrawColor(sTextdraw_pItemsInventory[i][type], -1);
		TextDrawBackgroundColor(sTextdraw_pItemsInventory[i][type], 0xFFFFFF00);
		TextDrawLetterSize(sTextdraw_pItemsInventory[i][type], 0.500000, 1.000000);
		TextDrawTextSize(sTextdraw_pItemsInventory[i][type], sizex, sizey);

	}
	else
	{
		sTextdraw_pItemsInventory[i][type] = TextDrawCreate(tx,ty, "LD_SPAC:WHITE");
		TextDrawFont(sTextdraw_pItemsInventory[i][type], 4);
		TextDrawColor(sTextdraw_pItemsInventory[i][type], 0xECECECFF);
		TextDrawBackgroundColor(sTextdraw_pItemsInventory[i][type], 255);
		TextDrawLetterSize(sTextdraw_pItemsInventory[i][type], 0.500000, 1.000000);
		TextDrawTextSize(sTextdraw_pItemsInventory[i][type], sizex, sizey);
		TextDrawSetSelectable(sTextdraw_pItemsInventory[i][type], 1);

		if(bardisable == false) sProgress_pItemsInventory[i] = CreateProgressBar(tx+2.0, ty+2.4, sizex+0.10, 1.0, 0x18AB1BFF, 4.0, 0);
	}
	return 1;
}

stock CreatePlayerInvTextdrawEx(playerid, slot, Float:tx, Float:ty, Float:sizex, Float:sizey, type = 0, bool:create = false)
{
	new PlayerText:textdrawid = CreatePlayerTextDraw(playerid,tx + 40.0,ty + 40.0, "_");
	PlayerTextDrawAlignment(playerid, textdrawid, 3);
	PlayerTextDrawColor(playerid, textdrawid, 0xECECECFF);
	PlayerTextDrawBackgroundColor(playerid, textdrawid, 255);
	PlayerTextDrawLetterSize(playerid, textdrawid, 0.20, 1.0);
	PlayerTextDrawTextSize(playerid, textdrawid, sizex, sizey);
	PlayerTextDrawBackgroundColor(playerid, textdrawid, 0x00000088);
	PlayerTextDrawSetOutline(playerid, textdrawid, 1);

	if(create)
	{
		Inventory_AddItemsTD(playerid, slot);
	}
	
	new data[E_PLAYER_TD_INVITEMS_DATA];
	map_get_arr(Player.Temp[playerid][@InvItemsMap], slot, data);
	
	switch(type)
	{
		case 0:
		{
			data[E_PLAYER_TD_INVITEMS_LeftInfo] = textdrawid;
		}
		case 1:
		{
			data[E_PLAYER_TD_INVITEMS_RightInfo] = textdrawid;
		}
	}

	map_set_arr(Player.Temp[playerid][@InvItemsMap], slot, data);

}

stock CreatePlayerInventoryTextdrawA(playerid, i, Float:tx, Float:ty, Float:sizex, Float:sizey, modelid=0)
{
	if(modelid == 0) { modelid = 19382/*11392*/; }

	Player_Textdraws[playerid][pTextdraw_ItemsInventory][i] = CreatePlayerTextDraw(playerid,tx,ty, "_");
	
	PlayerTextDrawAlignment(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 2);	
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 5);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 0.500000, 1.000000);
	PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 0xFFFFFF00);	
	PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 1);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], sizex, sizey);
	PlayerTextDrawSetPreviewModel(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], modelid);
	PlayerTextDrawSetPreviewRot(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], -16.000000, 0.000000, -55.000000, /*0.000000*/0.8);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ItemsInventory][i], 1);
	return 1;
}

AddItemInvPlayer(playerid, itemid, amount, bool:selected = false)
{
	new i = IsInventoryFull(playerid, itemid);

	if(i == -1) 
	{
		ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 2000);
		return -1;
	}

	//new i = FreeSlotPlayerInventory(playerid);
	PlayerInventory[playerid][i][invItem] = itemid;
	PlayerInventory[playerid][i][invAmount] = amount;

	if(selected == true)
	{
		
		PlayerInfo[playerid][pInvItemSelected] = i;
		SelectNuleItemInventory(playerid);
		SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_ITEMID], i/*PlayerInfo[playerid][pInvItemSelected]*/);

	}
	return 1;
}

AddItemInvPlayerEx(playerid, itemid, amount)
{
	new i = FreeSlotPlayerInventory(playerid);
	PlayerInventory[playerid][i][invItem] = itemid;
	PlayerInventory[playerid][i][invAmount] = amount;

	SelectNuleItemInventory(playerid);
	PlayerInfo[playerid][pInvItemSelected] = i;
	SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_ITEMID], i/*PlayerInfo[playerid][pInvItemSelected]*/);
	return i;
}


RemoveItemInvPlayer(playerid, slot, bool:forcesave = false, bool:nule = true)
{
	if(forcesave) mysql_tquery_s(conexion, str_format("DELETE FROM `lac_user_inventory` WHERE `id_user` = %d AND `index`=%d;", PlayerInfo[playerid][pID], slot));

	PlayerInventory[playerid][slot][invItem] = 0;
	PlayerInventory[playerid][slot][invAmount] = 0;
	if(nule) SelectNuleItemInventory(playerid);
	return 1;
}

FreeSlotPlayerInventory(playerid)
{
	//new count = 0;
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(PlayerInventory[playerid][i][invItem] == 0)
		{
			return i;
		}
	}
	return 0;
}

FreeSlotBootVehicle(vehicleid, addvalue = 0)
{
	new count, free_id = -1;
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(Vehicle.Boot[vehicleid][i][@Item] != 0)
		{
			count += InvObjectData[ Vehicle.Boot[vehicleid][i][@Item] ][E_INV_SIZE];
		}
		else if(Vehicle.Boot[vehicleid][i][@Item] == 0 && free_id == -1)
        {
        	free_id = i;
        }
	}
	count += InvObjectData[addvalue][E_INV_SIZE];
	if(count > Vehicles_Data_Info[Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400][vehicle_data_BOOT_SPACE]) return -1;

	return free_id;
}

FreeSlotGeneralStorage(playerid, addvalue = 0, size = 20)
{
	new count, free_id = -1, data[E_SVGENERAL_STORAGE_INFO];
	map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);

	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(data[E_SVGENERAL_STORAGE_Item][i] != 0)
		{
			count += InvObjectData[ data[E_SVGENERAL_STORAGE_Item][i] ][E_INV_SIZE];
		}
		else if(data[E_SVGENERAL_STORAGE_Item][i] == 0 && free_id == -1)
		{
			free_id = i;
		}
	}
	count += InvObjectData[addvalue][E_INV_SIZE];
	if(count > size) return -1;
	return free_id;
}

AddSlotGeneralStorage(playerid, addvalue = 0, amount = 0, size = 20)
{
	if(!map_has_key(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID])) return 0;
	new count, free_id = -1, data[E_SVGENERAL_STORAGE_INFO];
	map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);

	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(data[E_SVGENERAL_STORAGE_Item][i] != 0)
		{
			count += InvObjectData[ data[E_SVGENERAL_STORAGE_Item][i] ][E_INV_SIZE];
		}
		else if(data[E_SVGENERAL_STORAGE_Item][i] == 0 && free_id == -1)
		{
			free_id = i;
		}
	}
	count += InvObjectData[addvalue][E_INV_SIZE];
	if(count > size) return -1;
	else if(free_id == -1) return -1;

	await mysql_aquery_s(conexion, str_format("INSERT INTO `lac_item_misc` (`storageid`, `slot`, `itemid`, `amount`) VALUES (%d, %d, %d, %d);", Player.Temp[playerid][@InteractID], free_id, addvalue, amount));
	
	data[E_SVGENERAL_STORAGE_Item][free_id] = addvalue;
	data[E_SVGENERAL_STORAGE_Amount][free_id] = amount;
	data[E_SVGENERAL_STORAGE_ID][free_id] = cache_insert_id();

	map_set_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);

	return free_id;
}

stock IsInventoryFull(playerid, addvalue = 0)
{
	new count, free_id = -1;
    for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i ++)
    {	
        if(PlayerInventory[playerid][i][invItem] != 0)
        {
        	count += InvObjectData[ PlayerInventory[playerid][i][invItem] ][E_INV_SIZE];     
        }
        else if(PlayerInventory[playerid][i][invItem] == 0 && free_id == -1)
        {
        	free_id = i;
        }
    }
    count += InvObjectData[addvalue][E_INV_SIZE];
    if(count > 16) return -1;
 
    return free_id;
}

SetPlayerInvItemAmount(playerid, slot, amount)
{
	PlayerInventory[playerid][slot][invAmount] = amount;
	return 1;
}

GetInvValueItemSelected(playerid)
{
	return PlayerInventory[playerid][PlayerInfo[playerid][pInvItemSelected]][invItem];
}
GetInvAmountItemSelected(playerid)
{
	return PlayerInventory[playerid][PlayerInfo[playerid][pInvItemSelected]][invAmount];
}

stock IsWeaponItemInventory(playerid)
{

	new id = PlayerInventory[playerid][invItem][PlayerInfo[playerid][pInvItemSelected]];	
	switch(id)
	{
		case 23: return 1;
	}
	return 0;	
}

SelectedItemInventory(playerid, itemid, slot)
{
	switch(InvObjectData[itemid][E_INV_TYPE])
	{
		case INV_TYPE_WEAPON, INV_TYPE_WEAPON2:
		{
			new modelid = InvObjectData[itemid][E_INV_OBJECTMID];

			if(DataE.WeaponsData[ InvObjectData[itemid][E_INV_EXTRADATA] ][@AmmoEnabled])
			{
				if(GetInvAmountItemSelected(playerid) > DataE.WeaponsData[ InvObjectData[itemid][E_INV_EXTRADATA] ][@Ammo]) 
				{ 
					new ammo = DataE.WeaponsData[ InvObjectData[itemid][E_INV_EXTRADATA] ][@Ammo];
					PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] = ammo; 
					PlayerInfo[playerid][pWAmmo] = ammo; 
				}
			}

			SetPlayerAttachedObject(playerid, 9, modelid, 6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0);
			PlayerInfo[playerid][pWeapon] = InvObjectData[ itemid ][E_INV_EXTRADATA] /*GetWeaponIDFromModel(modelid)*/; 
			PlayerInfo[playerid][pWAmmo] = PlayerInventory[playerid][slot][invAmount];
			GivePlayerWeapon(playerid, InvObjectData[ itemid ][E_INV_EXTRADATA], PlayerInventory[playerid][slot][invAmount]);
		}
		case INV_TYPE_FOOD/*, INV_TYPE_CARRY_FARMER*/:
		{
			new modelid = InvObjectData[itemid][E_INV_OBJECTMID];
			AttachPlayerObjectUsed(playerid, modelid, itemid);
		}
		case INV_TYPE_DRINK:
		{
			new modelid = InvObjectData[itemid][E_INV_OBJECTMID];
			//SetPlayerAttachedObject(playerid,9,modelid,6,0.049000,0.051000,0.000000,-11.100009,5.099995,-1.399999,1.000000,1.000000,1.000000);
			SetPlayerAttachedObject(playerid,9,modelid,6,0.034999,0.079000,-0.062999,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
		}
		default:
		{
			new modelid = InvObjectData[itemid][E_INV_OBJECTMID];
			AttachPlayerObjectUsed(playerid, modelid, itemid);			
		}
	}
	if(InvObjectData[itemid][E_INV_UseAnimCarry] == true)
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	}
	return 1;
}
SelectNuleItemInventory(playerid)
{
	/*switch(InvObjectData[itemid][E_INV_TYPE])
	{
		case INV_TYPE_WEAPON:
		{
			PlayerInfo[playerid][pWeapon] = 0; 
			PlayerInfo[playerid][pWAmmo] = 0;
			ResetPlayerWeapons(playerid);
			RemovePlayerAttachedObject(playerid, 9);
		}
		case INV_TYPE_DRINK, INV_TYPE_FOOD, INV_TYPE_HELMET:
		{
			RemovePlayerAttachedObject(playerid, 9);
		}
	}*/
	if(PlayerInfo[playerid][pWeapon] != 0) { 
		if(ResetPlayerWeapons(playerid))
		{ 
			Player.Anticheat[playerid][CHEAT_TYPE_WEAPON][@Inmunity] = gettime() + 3;
			
			PlayerInfo[playerid][pWeapon] = 0; 
			PlayerInfo[playerid][pWAmmo] = 0;
		}
	}
	if(IsPlayerAttachedObjectSlotUsed(playerid, 9)) { RemovePlayerAttachedObject(playerid, 9); }

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	
	return 1;
}

SelectInvSlotPlayerForItem(playerid, itemid)
{
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(PlayerInventory[playerid][i][invItem] == itemid)
		{
			PlayerInfo[playerid][pInvItemSelected] = i;
			SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][i][invItem]][E_INV_ITEMID], i/*PlayerInfo[playerid][pInvItemSelected]*/);
			return 1;
		}
	}
	return 0;
}

/*GetPlayerInvSlotExtraData(playerid, itemid)
{
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		if(PlayerInventory[playerid][i][invItem] == itemid)
		{
			return i;
		}
	}
	return -1;
}*/

SelectedPlayerItemInventory(playerid, slot, bool:nameoff = false)
{
	SelectNuleItemInventory(playerid);
	SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][slot][invItem]][E_INV_ITEMID], slot);
	
	if(!nameoff)
	{
		new name[50];
		format(name, sizeof(name), "~n~~n~~n~~n~~n~~n~~n~~w~%s", InvObjectData[ PlayerInventory[playerid][slot][invItem] ][E_INV_NAME]);
		GameTextForPlayer(playerid, ConvertEncoding(name), 1000, 3);
	}
	return 1;
}

UseItemInventory(playerid, itemid/*, slot*/)
{
	new modelid = InvObjectData[itemid][E_INV_OBJECTMID];
	new skin = GetPlayerSkinPointsSkin(playerid);
	switch(InvObjectData[itemid][E_INV_TYPE])
	{
		case INV_TYPE_HELMET:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Helmet_Pos[skin][0], Accesory_Helmet_Pos[skin][1], Accesory_Helmet_Pos[skin][2],
				Accesory_Helmet_Pos[skin][3], Accesory_Helmet_Pos[skin][4], Accesory_Helmet_Pos[skin][5], Accesory_Helmet_Pos[skin][6], Accesory_Helmet_Pos[skin][7], Accesory_Helmet_Pos[skin][8]);
		}
		case INV_TYPE_CAP:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Cap_Pos[skin][0], Accesory_Cap_Pos[skin][1], Accesory_Cap_Pos[skin][2],
				Accesory_Cap_Pos[skin][3], Accesory_Cap_Pos[skin][4], Accesory_Cap_Pos[skin][5], Accesory_Cap_Pos[skin][6], Accesory_Cap_Pos[skin][7], Accesory_Cap_Pos[skin][8]);
		}
		case INV_TYPE_CAP2:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Cap_Pos[skin][0], Accesory_Cap_Pos[skin][1]+0.002000, Accesory_Cap_Pos[skin][2]+0.004000,
				Accesory_Cap_Pos[skin][3], Accesory_Cap_Pos[skin][4]-5.400001, Accesory_Cap_Pos[skin][5]-2.000000, Accesory_Cap_Pos[skin][6], Accesory_Cap_Pos[skin][7]+0.089000, Accesory_Cap_Pos[skin][8]+0.025000);
		}
		
		case INV_TYPE_HAT2:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Hat2_Pos[skin][0], Accesory_Hat2_Pos[skin][1], Accesory_Hat2_Pos[skin][2],
				Accesory_Hat2_Pos[skin][3], Accesory_Hat2_Pos[skin][4], Accesory_Hat2_Pos[skin][5], Accesory_Hat2_Pos[skin][6], Accesory_Hat2_Pos[skin][7], Accesory_Hat2_Pos[skin][8]);
		}
		case INV_TYPE_BACKPAD:
		{
			SetPlayerAttachedObject(playerid, 1, modelid, 1, Accesory_Backpad_Pos[skin][0], Accesory_Backpad_Pos[skin][1], Accesory_Backpad_Pos[skin][2],
				0.0,0.0,0.0, 1.0, 1.0, 1.0);
		}
		case INV_TYPE_GLASSES:
		{
			SetPlayerAttachedObject(playerid, 3, modelid, 2, Accesory_Glasses_Pos[skin][0], Accesory_Glasses_Pos[skin][1], Accesory_Glasses_Pos[skin][2],
				Accesory_Glasses_Pos[skin][3],Accesory_Glasses_Pos[skin][4],Accesory_Glasses_Pos[skin][5], Accesory_Glasses_Pos[skin][6], 1, 1);
		}
		case INV_TYPE_WATCH:
		{
			SetPlayerAttachedObject(playerid, 5, modelid, 5, Accesory_Watch_Pos[skin][0], Accesory_Watch_Pos[skin][1], Accesory_Watch_Pos[skin][2],
				Accesory_Watch_Pos[skin][3],Accesory_Watch_Pos[skin][4],Accesory_Watch_Pos[skin][5], Accesory_Watch_Pos[skin][6], Accesory_Watch_Pos[skin][7], Accesory_Watch_Pos[skin][8]);
		}
		case INV_TYPE_BERET, INV_TYPE_HAT:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Beret_Pos[skin][0], Accesory_Beret_Pos[skin][1], Accesory_Beret_Pos[skin][2],
				Accesory_Beret_Pos[skin][3],Accesory_Beret_Pos[skin][4],Accesory_Beret_Pos[skin][5], Accesory_Beret_Pos[skin][6], Accesory_Beret_Pos[skin][7], Accesory_Beret_Pos[skin][8]);			
		}
		case INV_TYPE_HAIR:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Hairs_Pos[skin][0], Accesory_Hairs_Pos[skin][1], Accesory_Hairs_Pos[skin][2],
				Accesory_Hairs_Pos[skin][3],Accesory_Hairs_Pos[skin][4],Accesory_Hairs_Pos[skin][5], Accesory_Hairs_Pos[skin][6], Accesory_Hairs_Pos[skin][7], Accesory_Hairs_Pos[skin][8]);			
		}
		case INV_TYPE_HAT3:
		{
			SetPlayerAttachedObject(playerid, 0, modelid, 2, Accesory_Hat_Pos[skin][0], Accesory_Hat_Pos[skin][1], Accesory_Hat_Pos[skin][2],
				Accesory_Hat_Pos[skin][3],Accesory_Hat_Pos[skin][4],Accesory_Hat_Pos[skin][5], Accesory_Hat_Pos[skin][6], Accesory_Hat_Pos[skin][7], Accesory_Hat_Pos[skin][8]);
		}
		case INV_TYPE_MASK:
		{
			SetPlayerAttachedObject(playerid, 4, modelid, 2, Accesory_Mask_Pos[skin][0], Accesory_Mask_Pos[skin][1], Accesory_Mask_Pos[skin][2],
				Accesory_Mask_Pos[skin][3], Accesory_Mask_Pos[skin][4], Accesory_Mask_Pos[skin][5], Accesory_Mask_Pos[skin][6], Accesory_Mask_Pos[skin][7], Accesory_Mask_Pos[skin][8]);
		}
	}
	return 1;
}
RemoveUseItemInventory(playerid, itemid)
{
 	//new modelid = InvObjectData[itemid][E_INV_OBJECTMID];
	//new skin = GetPlayerSkin(playerid);
	switch(InvObjectData[itemid][E_INV_TYPE])
	{
		case INV_TYPE_HELMET, INV_TYPE_CAP, INV_TYPE_CAP2, INV_TYPE_HAT, INV_TYPE_HAT2, INV_TYPE_HAT3:
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		case INV_TYPE_BACKPAD:
		{
			RemovePlayerAttachedObject(playerid, 1);
		}
		case INV_TYPE_GLASSES:
		{
			RemovePlayerAttachedObject(playerid, 3);
		}
		case INV_TYPE_MASK:
		{
			RemovePlayerAttachedObject(playerid, 4);
		}
		case INV_TYPE_WATCH:
		{
			RemovePlayerAttachedObject(playerid, 5);
		}
	}	
	return 1;
}

/*IsInvItemEnableEquiped(itemid)
{
	switch(itemid)
	{
		case 44, 47: { return 1; }
	}
	return 0;
}*/

GetInvEquipedFreeSlot(playerid)
{
	for(new i = 0; i < MAX_PLAYER_INV_ITEMS_EQUIPED; i++)
	{
		if(Player.InvEquiped[playerid][i][@Item] == 0) return i;
	}
	return -1;
}

stock GetWeaponIDFromModel(modelid)
{
    new idweapon;
    
    switch(modelid)
	{
       	case 331: idweapon = 1; // Brass Knuckles
       	case 333: idweapon = 2; // Golf Club
       	case 334: idweapon = 3; // Nightstick
      	case 335: idweapon = 4; // Knife
       	case 336: idweapon = 5; // Baseball Bat
       	case 337: idweapon = 6; // Shovel
       	case 338: idweapon = 7; // Pool Cue
       	case 339: idweapon = 8; // Katana
       	case 341: idweapon = 9; // Chainsaw
       	case 321: idweapon = 10; // Double-ended Dildo
       	case 325: idweapon = 14; // Flowers
       	case 326: idweapon = 15; // Cane
       	case 342: idweapon = 16; // Grenade
       	case 343: idweapon = 17; // Tear Gas
       	case 344: idweapon = 18; // Molotov Cocktail
       	case 346: idweapon = 22; // 9mm
       	case 347: idweapon = 23; // Silenced 9mm
       	case 348: idweapon = 24; // Desert Eagle
       	case 349: idweapon = 25; // Shotgun
       	case 350: idweapon = 26; // Sawnoff
       	case 351: idweapon = 27; // Combat Shotgun
       	case 352: idweapon = 28; // Micro SMG/Uzi
       	case 353: idweapon = 29; // MP5
       	case 355: idweapon = 30; // AK-47
       	case 356: idweapon = 31; // M4
       	case 372: idweapon = 32; // Tec-9
       	case 357: idweapon = 33; // Country Rifle
       	case 358: idweapon = 34; // Sniper Rifle
       	case 359: idweapon = 35; // RPG
       	case 360: idweapon = 36; // HS Rocket
       	case 361: idweapon = 37; // Flamethrower
       	case 362: idweapon = 38; // Minigun
       	case 363: idweapon = 39;// Satchel Charge + Detonator
       	case 365: idweapon = 41; // Spraycan
       	case 366: idweapon = 42; // Fire Extinguisher
	}
	
	return idweapon;
}

ShowPlayerMenuInvButtons(playerid)
{
	new active = PlayerInfo[playerid][p_mPanelCatActive];
	//PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active], COLOR_ORANGE1);
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][active], COLOR_ORANGE1);

	//PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0]);
	//PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1]);

	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][1]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][2]);

	SelectTextDraw(playerid, 0xBBBBBBFF);
}

// Last Modified - 17/04/2019

ShowPlayerInvChangeBox(playerid, type, object = 0)
{
	Inventory_AddTextdrawInfoTrans(playerid);

	Player_Textdraws[playerid][pTextdraw_TextInventory][0] = CreatePlayerTextDraw(playerid,234.0, 314.0, "4/4");	
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0.1999, 1.000000);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][0], 0);

	Player_Textdraws[playerid][pTextdraw_TextInventory][1] = CreatePlayerTextDraw(playerid,427.0, 314.0, "4/4");
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][1], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][1], 0.1999, 1.000000);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_TextInventory][1], 0);

	switch(type)
	{
		case 1:
		{
			if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] == INVALID_AREAIT_ID) return 1;
			new vehicleid = GetAreaIT_VehicleID(playerid);

			for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
			{
				Inv_TransUpdateItemsLeft(playerid, i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
				Inv_TransUpdateItemsRight(playerid, i, Vehicle.Boot[vehicleid][i][@Item], Vehicle.Boot[vehicleid][i][@Amount]);
			}

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][8]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][8], playerid, "Maletero");

			Player.Temp[playerid][@InTabInvTrans] = type;

			new modelid = Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400;
			InventorySpaceBar[playerid][1] = CreatePlayerProgressBar(playerid, 313.00, 318.00, 108.0, 4.0, 0xDF8D17FF, Vehicles_Data_Info[modelid][vehicle_data_BOOT_SPACE], 2);
			SetValueProgTransDiagRight(playerid, GetVehicleInventorySizeSpace(vehicleid), Vehicles_Data_Info[modelid][vehicle_data_BOOT_SPACE]);
		}

		case 2:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][8]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][8], playerid, "Mochila");

			InventorySpaceBar[playerid][1] = CreatePlayerProgressBar(playerid, 313.00, 318.00, 108.0, 4.0, 0xDF8D17FF, 20.0, 2);
			//SetValueProgTransDiagRight(playerid, GetStorageBackpadInvSizeSpace(dataextra[E_SVGENERAL_STORAGE_List]), 20);
			ShowInventoryTransStorage(playerid);

			Player.Temp[playerid][@InTabInvTrans] = type;

			ApplyAnimationEx(playerid, "BOMBER", "BOM_PLANT_IN", 4.1, false, false, false, true, 0, false);
		}
		case 3:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][8]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][8], playerid, "Heladera");
			
			ShowInventoryTransStorage(playerid, object, true);
			Player.Temp[playerid][@InTabInvTrans] = type;
		}
		case 4:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][8]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InventoryBox][8], playerid, "Estante");

			//InventorySpaceBar[playerid][1] = CreatePlayerProgressBar(playerid, 313.00, 318.00, 108.0, 4.0, 0x008BFFFF, 20.0, 2);
			

			ShowInventoryTransStorage(playerid, object, true);
			Player.Temp[playerid][@InTabInvTrans] = type;

			
		}
	}
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][7]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][9]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][10]);
	
	InventorySpaceBar[playerid][0] = CreatePlayerProgressBar(playerid, 120.00, 318.00, 108.0, 4.0, 0xDF8D17FF, 16.0, 2);

	SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);

	SelectTextDraw(playerid, 0xFFFFFFFF);
	return 1;
}

HidePlayerInvChangeBox(playerid)
{
	if(Player.Temp[playerid][@InTabInvTrans] != 0)
	{
		new data[E_PLAYER_TD_INVITEMS_DATA];

		for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			map_get_arr(Player.Temp[playerid][@InvItemsMap], i, data);
			if(data[E_PLAYER_TD_INVITEMS_LeftInfo] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
			}
			if(data[E_PLAYER_TD_INVITEMS_RightInfo] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo]);
			}
			map_remove(Player.Temp[playerid][@InvItemsMap], i);

			TextDrawHideForPlayer(playerid, sTextdraw_pItemsInventoryTrade[i][0]);
			TextDrawHideForPlayer(playerid, sTextdraw_pItemsInventoryTrade[i][1]);
			TextDrawHideForPlayer(playerid, sTextdraw_InvChangeItems[i][0]);
			TextDrawHideForPlayer(playerid, sTextdraw_InvChangeItems[i][1]);
		}
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][7]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][8]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][9]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][10]);

		DestroyPlayerProgressBar(playerid, InventorySpaceBar[playerid][0]);
		DestroyPlayerProgressBar(playerid, InventorySpaceBar[playerid][1]);

		PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][0]);
		PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][1]);

		switch(Player.Temp[playerid][@InTabInvTrans])
		{
			case 1:
			{
				if(Player.Temp[playerid][@InteractType] != TYPE_ITEMINTERACT_BOOT) return 1;
				new vehicleid = Player.Temp[playerid][@InteractID];
				if(vehicleid == INVALID_VEHICLE_ID) return 1;
				Vehicles_Info[vehicleid][gi_vehicle_BOOT] = 0;
				UpdateVehicleParams(vehicleid);
			}
			case 2:
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_CROUCH_OUT", 4.1, false, false, false, false, 0, false);
			}
		}

		Player.Temp[playerid][@InTabInvTrans] = 0;
	}
	return 1;
}

// GPS
ShowPlayerPanelGPS(playerid)
{
	//rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, true);
	//PlayerInfo[playerid][p_mPanelCatActive] = 2;

	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][0]);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][1], 0.019998, 33.40);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);

	TextDrawShowForPlayer(playerid, MapaGPS);
	TextDrawShowForPlayer(playerid, MapaGPS2);

	for(new i = 0; i < sizeof(IconListLeftGPS); i++)
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvIconsGPS][i]);
	}
	for(new i = 0; i < 40; i++)
	{
		if(IconMapGPSVar[i] != -1)
        {
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvIconsPointsGPS][i]);
		}
	}

	SelectTextDraw(playerid, 0xFFFFFFFF);
}

HidePlayerPanelGPS(playerid)
{
	//rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, false);
	//PlayerInfo[playerid][p_mPanelCatActive] = 0;
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][1], 0.019998, 25.00);

	//TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][0]);
	//TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][1]);
	TextDrawHideForPlayer(playerid, MapaGPS);
	TextDrawHideForPlayer(playerid, MapaGPS2);

	for(new i = 0; i < sizeof(IconListLeftGPS); i++)
	{
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvIconsGPS][i]);
	}
	for(new i = 0; i < 40; i++)
	{
		if(IconMapGPSVar[i] != -1)
        {
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvIconsPointsGPS][i]);
		}
	}
	HidePlayerPanelGPSInfo(playerid);
}
HidePlayerPanelGPSInfo(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][2]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][3]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][4]);
}

SelectPlayerActiveInventory(playerid, selected)
{
	if(PlayerInfo[playerid][p_mPanelCatActive] == 0)
	{
		HidePlayerInvPanel(playerid);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 1)
	{

		DestroyTextdrawInvFactionAll(playerid);
	}
	else if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	{
		HidePlayerPanelGPS(playerid);
	}
	new active;
	active = PlayerInfo[playerid][p_mPanelCatActive];
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][active], -1);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][active]);

	PlayerInfo[playerid][p_mPanelCatActive] = selected;

	active = PlayerInfo[playerid][p_mPanelCatActive];
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][active], COLOR_ORANGE1);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryButtons][active]);
}

GetPlayerInventorySizeSpace(playerid)
{
	new count;
	for(new i; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		count += InvObjectData[ PlayerInventory[playerid][i][invItem] ][E_INV_SIZE];
	}
	return count;
}

GetVehicleInventorySizeSpace(vehicleid)
{
	new count;
	for(new i; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		count += InvObjectData[ Vehicle.Boot[vehicleid][i][@Item] ][E_INV_SIZE];
	}
	return count;
}

GetStorageBackpadInvSizeSpace(id)
{
	if(!map_has_key(ServerGeneral_StorageMap, id)) return 0;
	new count, data[E_SVGENERAL_STORAGE_INFO];
	map_get_arr(ServerGeneral_StorageMap, id, data);
	
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		count += InvObjectData[ data[E_SVGENERAL_STORAGE_Item][i] ][E_INV_SIZE];
	}
	return count;
}

SetValueProgTransDiagLeft(playerid, value, maxvalue)
{
	/*new count;
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		count += InvObjectData[ Vehicle.Boot[vehicleid][i][@Item] ][E_INV_SIZE];
	}*/
	new str[18];
	format(str, sizeof(str), "%d/%d", value, maxvalue);
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][0], str);	
	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][0]);

	SetPlayerProgressBarValue(playerid, InventorySpaceBar[playerid][0], value);	

	ShowPlayerProgressBar(playerid, InventorySpaceBar[playerid][0]);

}

SetValueProgTransDiagRight(playerid, value, maxvalue)
{
	/*new count;
	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		count += InvObjectData[ Vehicle.Boot[vehicleid][i][@Item] ][E_INV_SIZE];
	}*/
	new str[18];
	format(str, sizeof(str), "%d/%d", value, maxvalue);
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][1], str);	

	SetPlayerProgressBarValue(playerid, InventorySpaceBar[playerid][1], value);	

	ShowPlayerProgressBar(playerid, InventorySpaceBar[playerid][1]);

	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_TextInventory][1]);
}

Inventory_UpdateItemsTrans(playerid, slot, item, amount, slotex, itemex, amountex)
{
	new offset;
	new info[20];
	new data[E_PLAYER_TD_INVITEMS_DATA];

	if(!map_has_key(Player.Temp[playerid][@InvItemsMap], slot)) return 0;
	map_get_arr(Player.Temp[playerid][@InvItemsMap], slot, data);
	PlayerTextDrawHide(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
	if(InvObjectData[ item ][E_INV_TypeInfo] == 1)
	{
		PlayerTextDrawShow(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
		format(info, sizeof(info), "%d", amount);
		PlayerTextDrawSetString(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo], info);
	}

	map_get_arr(Player.Temp[playerid][@InvItemsMap], slotex, data);
	PlayerTextDrawHide(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo]);
	if(InvObjectData[ itemex ][E_INV_TypeInfo] == 1)
	{
		PlayerTextDrawShow(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo]);
		format(info, sizeof(info), "%d", amountex);
		PlayerTextDrawSetString(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo], info);
		
	}

	offset = InvObjectData[item][E_INV_PointToRot];
	TextDrawSetPreviewRot(sTextdraw_pItemsInventoryTrade[slot][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
	TextDrawSetPreviewModel(sTextdraw_pItemsInventoryTrade[slot][1], InvObjectData[item][E_INV_OBJECTMID]);
	TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventoryTrade[slot][1]);

	offset = InvObjectData[itemex][E_INV_PointToRot];
	TextDrawSetPreviewRot(sTextdraw_InvChangeItems[slotex][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
	TextDrawSetPreviewModel(sTextdraw_InvChangeItems[slotex][1], InvObjectData[itemex][E_INV_OBJECTMID]);
	TextDrawShowForPlayer(playerid, sTextdraw_InvChangeItems[slotex][1]);
	return 1;
}

Inv_TransUpdateItemsLeft(playerid, i, item_id, item_amount)
{
	new data[E_PLAYER_TD_INVITEMS_DATA], offset;

	map_get_arr(Player.Temp[playerid][@InvItemsMap], i, data);
	if(InvObjectData[ item_id ][E_INV_TypeInfo] == 1)
	{
		if(data[E_PLAYER_TD_INVITEMS_LeftInfo] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawShow(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo]);
			new info[20];
			format(info, sizeof(info), "%d", item_amount);
			PlayerTextDrawSetString(playerid, data[E_PLAYER_TD_INVITEMS_LeftInfo], info);
		}
	}

	TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventoryTrade[i][0]);
	offset = InvObjectData[ item_id ][E_INV_PointToRot];
	TextDrawSetPreviewRot(sTextdraw_pItemsInventoryTrade[i][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
	TextDrawSetPreviewModel(sTextdraw_pItemsInventoryTrade[i][1], InvObjectData[ item_id ][E_INV_OBJECTMID]);
	TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventoryTrade[i][1]);	
}

Inv_TransUpdateItemsRight(playerid, i, item_ex, item_amount)
{
	new data[E_PLAYER_TD_INVITEMS_DATA], offset;

	map_get_arr(Player.Temp[playerid][@InvItemsMap], i, data);
	if(InvObjectData[ item_ex ][E_INV_TypeInfo] == 1)
	{
		if(data[E_PLAYER_TD_INVITEMS_RightInfo] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawShow(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo]);
			new info[20];
			format(info, sizeof(info), "%d", item_amount);
			PlayerTextDrawSetString(playerid, data[E_PLAYER_TD_INVITEMS_RightInfo], info);
		}
	}

	TextDrawShowForPlayer(playerid, sTextdraw_InvChangeItems[i][0]);
	offset = InvObjectData[ item_ex ][E_INV_PointToRot];
	TextDrawSetPreviewRot(sTextdraw_InvChangeItems[i][1], DataE.Offset[offset][@RX], DataE.Offset[offset][@RY], DataE.Offset[offset][@RZ], DataE.Offset[offset][@Zoom]);
	TextDrawSetPreviewModel(sTextdraw_InvChangeItems[i][1], InvObjectData[ item_ex ][E_INV_OBJECTMID]);
	TextDrawShowForPlayer(playerid, sTextdraw_InvChangeItems[i][1]);
}

ReloadPlayerWeaponItem(playerid, itemselected)
{
//	new itemtype = InvObjectData[itemselected][E_INV_TYPE];

	if(PlayerInfo[playerid][pWAmmo] >= DataE.WeaponsData[ InvObjectData[itemselected][E_INV_EXTRADATA] ][@Ammo]) return 1;
	else if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
	else if(rBit1_Get(eBit1_PlayerInfo[pt_WEAPON_RELOAD], playerid)) return 1;
	
	new bool:find;

	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		new itemid = PlayerInventory[playerid][i][invItem];

		if(InvObjectData[ itemid ][E_INV_TYPE] == DataE.WeaponsData[ InvObjectData[itemselected][E_INV_EXTRADATA] ][@LoadType])
		{
			
			rBit1_Set(eBit1_PlayerInfo[pt_WEAPON_RELOAD], playerid, true);
			Player.Temp[playerid][@FreezeInventory] = 1;
			
			PlayerPlaySoundEx(playerid, 36401, 0.0, 0.0, 0.0);
			SetTimerEx("PlayerDelayReloadWeapon", 1000, false, "ii", playerid, i);

			ResetPlayerWeapons(playerid);
	

			find = true;
			break;
		}

	}
	if(!find)
	{
		return 1;
	}
	new Animdata[2][25];

	switch(InvObjectData[itemselected][E_INV_EXTRADATA])
	{
		case 22://9MM
		{
			Animdata[0] = "COLT45";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "colt45_crouchreload";
			}
			else
			{
				Animdata[1] = "colt45_reload";
			}
		}
		case 23://SP
		{
			Animdata[0] = "SILENCED";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "CrouchReload";
			}
			else
			{
				Animdata[1] = "Silence_reload";
			}
		}
		case 24://DK
		{
			Animdata[0] = "PYTHON";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "python_crouchreload";
			}
			else
			{
				Animdata[1] = "python_reload";
			}
		}
			case 25, 33, 34: //Shotgun, rifle
			{
				Animdata[0] = "BUDDY";
				if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
				{
					Animdata[1] = "buddy_crouchreload";
				}
				else
				{
					Animdata[1] = "buddy_reload";
				}
			}
		case 26: //Sawnoff
		{
			Animdata[0] = "COLT45";
			Animdata[1] = "sawnoff_reload";
		}
		case 27: //Shotgun
		{
			Animdata[0] = "BUDDY";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "buddy_crouchreload";
			}
			else
			{
				Animdata[1] = "buddy_reload";
			}
		}
		case 28, 29: //UZI & MP5
		{
			Animdata[0] = "UZI";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "UZI_crouchreload";
			}
			else
			{
				Animdata[1] = "UZI_reload";
			}
		}
		case 30, 31: //AK & M4
		{
			Animdata[0] = "RIFLE";

			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "RIFLE_crouchload";
			}
			else
			{
				Animdata[1] = "RIFLE_load";
			}
		}
		case 32: //TEC
		{
			Animdata[0] = "TEC";
			if( GetPlayerSpecialAction(playerid) & SPECIAL_ACTION_DUCK )
			{
				Animdata[1] = "TEC_crouchreload";
			}
			else
			{
				Animdata[1] = "TEC_reload";
			}
			
		}
	}

	ApplyAnimation(playerid, Animdata[0], Animdata[1], 4.0, 0, 0, 0, 0, 1000, true);
	return 0;
}

// Register



Inventory_OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(rBit1_Get(eBit1_PlayerInfo[pShowInventory], playerid))
	{
		for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			if(clickedid == sTextdraw_pItemsInventory[i][0])
			{
				HidePlayerInventoryTextdraw(playerid);
				CancelSelectTextDraw(playerid);
				if(PlayerInventory[playerid][i][invItem] != 0)
				{
					PlayerInfo[playerid][pInvItemSelected] = i;
					SelectedPlayerItemInventory(playerid, i);
					PlayerPlaySound(playerid,1084,0.0,0.0,0.0);
				}
				else
				{
					SelectNuleItemInventory(playerid);
					PlayerInfo[playerid][pInvItemSelected] = i;
				}
				
				return 1;
			}
		}
		
		for(new i = 0; i < MAX_PLAYER_INV_ITEMS_EQUIPED; i++)
		{
			if(clickedid == sTextdraw_pItemsInventory[i+12][0])
			{
				if(Player.InvEquiped[playerid][i][@Item] == 0) return 1;
				new slot = IsInventoryFull(playerid, Player.InvEquiped[playerid][i][@Item]);
				if(slot == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 2000);
	        		//new itemid = InvObjectData[PlayerInventory[playerid][item][invItem]][E_INV_ITEMID];

				RemoveUseItemInventory(playerid, Player.InvEquiped[playerid][i][@Item]);

				PlayerInventory[playerid][slot][invItem] = Player.InvEquiped[playerid][i][@Item];
				PlayerInventory[playerid][slot][invAmount] = Player.InvEquiped[playerid][i][@Amount];
				Player.InvEquiped[playerid][i][@Item] = 0;
				Player.InvEquiped[playerid][i][@Amount] = 0;
				SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][slot][invItem]][E_INV_ITEMID], PlayerInfo[playerid][pInvItemSelected]);
				TextDrawSetPreviewModel(sTextdraw_pItemsInventory[i + 12][1], InvObjectData[Player.InvEquiped[playerid][i][@Item]][E_INV_OBJECTMID]);
				TextDrawSetPreviewModel(sTextdraw_pItemsInventory[slot][1], InvObjectData[PlayerInventory[playerid][slot][invItem]][E_INV_OBJECTMID]);
				TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[i + 12][1]);
				TextDrawShowForPlayer(playerid, sTextdraw_pItemsInventory[slot][1]);

				SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
			}
		}

		if(PlayerInfo[playerid][p_mPanelCatActive] == 1)
		{

			for(new i = 0; i < MAX_FACTION_PANEL_ITEMS; i++)
			{
				if(clickedid == Textdraws[sTextdraw_BoxPanelFactionList][i])
				{
					if(Dialog_IsOpened(playerid)) return 1;
					if(Player.Temp[playerid][@SelectedFactionID] == -1)
					{
	    				PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] = i;
						Player.Temp[playerid][@SelectedFactionID] = Player.Temp[playerid][@PanelFactionList][i];
						ShowLeftPanelGeneral(playerid);
					}
					else if(PlayerInfo[playerid][p_FactionMember] != 0 && Player.Temp[playerid][@SelectedFactionID] == PlayerInfo[playerid][p_FactionMember]) 
					{
						if(!Player.Faction[playerid][@Valid]) return 1;
	    				PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] = i;
						Player.Temp[playerid][@ListSelectedDBID] = Player.Temp[playerid][@PanelFactionList][i];
						ShowDialogEx(playerid, DIALOG_FACTION_OPTIONS_U);
					}
				}
			}
			if(clickedid == Textdraws[sTextdraw_InventoryBox][5])
			{
				ShowDialogEx(playerid, DIALOG_FACTION_ACTIVITIES_H);
			}
			else if(clickedid == Textdraws[sTextdraw_InventoryBox][11])
			{
				if(PlayerInfo[playerid][p_FactionMember] == 0 && Player.Temp[playerid][@SelectedFactionID] != -1)
				{
					ShowDialogEx(playerid, DIALOG_START_QUIZ_FACTION);
				}
				else
				{
					ShowDialogEx(playerid, DIALOG_FACTION_CREATE_NAME);
				}
			}
			else if(clickedid == Textdraws[sTextdraw_InventoryBox][12])
			{
				Player.Temp[playerid][@SelectedFactionID] = -1;
				HideLeftPanelGeneral(playerid);
			}
	    }
	    else if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	    {
	    	for(new i = 0; i < 40; i++)
	    	{
	    		if(clickedid == Textdraws[sTextdraw_InvIconsPointsGPS][i])
	    		{
	    			new Float:x, Float:y;
	    			GetPosSpriteMapTextdraw(DoorInfo[ IconMapGPSVar[i] ][dExitX], DoorInfo[ IconMapGPSVar[i] ][dExitY], x,y);
	    			TextDrawSetPos(Textdraws[sTextdraw_InvInfoGPS][0],x+2.0,y+2.0);
	    			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][0]);

	    			TextDrawSetPos(Textdraws[sTextdraw_InvInfoGPS][1],x+4.0,y+3.0);
	    			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][1]);
	    			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InvInfoGPS][1], playerid, ConvertEncoding(DoorInfo[ IconMapGPSVar[i] ][dName]));

	    			TextDrawSetPos(Textdraws[sTextdraw_InvInfoGPS][2],x+4.0,y+20.0);
	    			TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][2], x+279.0, 10.0);
	    			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][2]);
					
					TextDrawSetPos(Textdraws[sTextdraw_InvInfoGPS][3],x+84.0,y+54.0);
	    			TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][3], x+110.0, 10.0);
	    			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][3]);

					new description[128];
	    			if(Player.Temp[playerid][@GPSRouteSelected] == i)
	    			{
	    				TextDrawSetStringForPlayer(Textdraws[sTextdraw_InvInfoGPS][3], playerid, "Cancelar");
	    				format(description, sizeof(description), "Ruta seleccionada.");
	    			}
	    			else
	    			{
	    				TextDrawSetStringForPlayer(Textdraws[sTextdraw_InvInfoGPS][3], playerid, "Localizar");
	    				format(description, sizeof(description), DoorInfo[ IconMapGPSVar[i] ][dDescription]);
	    			}

	    			SplitTextDrawString(description, 108.0, 0.150, 1);
	    			TextDrawSetStringForPlayer(Textdraws[sTextdraw_InvInfoGPS][2], playerid, ConvertEncoding(description));

	    			TextDrawSetPos(Textdraws[sTextdraw_InvInfoGPS][4],x+104.0,y+4.0);
	    			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InvInfoGPS][4]);

	    			PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED] = i;
	    		}
	    	}
	    	if(clickedid == Textdraws[sTextdraw_InvInfoGPS][3])
	    	{
	    		new i = PlayerInfoTemp[playerid][pt_PANEL_LIST_SELECTED];
	    		if(Player.Temp[playerid][@GPSRouteSelected] != i)
	    		{
	    			SetPlayerDynCP(playerid, 1, DoorInfo[ IconMapGPSVar[i] ][dExitX], DoorInfo[ IconMapGPSVar[i] ][dExitY], DoorInfo[ IconMapGPSVar[i] ][dExitZ], 4.0, CHECKPOINT_TYPE_GPS, true, 1);
	    			Streamer_Update(playerid);
	    			//
	    			Player.Temp[playerid][@GPSRouteSelected] = i;
	    		}
	    		else
	    		{
	    			DestroyPlayerDynCP(playerid, 1, true);
	    			Player.Temp[playerid][@GPSRouteSelected] = -1;	
	    		}
	    		HidePlayerPanelGPSInfo(playerid);
	    	}
	    	else if(clickedid == Textdraws[sTextdraw_InvInfoGPS][4])
	    	{
	    		HidePlayerPanelGPSInfo(playerid);
	    		PlayerPlaySound(playerid,1084,0.0,0.0,0.0);
	    	}
	    }
	}
	else if(Player.Temp[playerid][@InTabInvTrans] != 0)
	{

		for(new i = 0; i </*=*/ MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			if(clickedid == sTextdraw_pItemsInventoryTrade[i][0])
			{
				switch(Player.Temp[playerid][@InTabInvTrans])
				{
					case 1: // Boot
					{					
						if(Player.Temp[playerid][@InteractType] != TYPE_ITEMINTERACT_BOOT) return 1;
						new vehicleid = Player.Temp[playerid][@InteractID];

						if(PlayerInventory[playerid][i][invItem] == 0) return 1;
						new slot_free = FreeSlotBootVehicle(vehicleid, PlayerInventory[playerid][i][invItem]);
						if(slot_free == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Maletero lleno.", 2000);

						Vehicle.Boot[vehicleid][slot_free][@Item] = PlayerInventory[playerid][i][invItem];
						Vehicle.Boot[vehicleid][slot_free][@Amount] = PlayerInventory[playerid][i][invAmount];

						PlayerInventory[playerid][i][invItem] = 0;
						PlayerInventory[playerid][i][invAmount] = 0;

						SelectNuleItemInventory(playerid);
						ApplyAnimationEx(playerid, "CARRY", "PUTDWN05", 3.1, false, false, false, false, 0, false);

						new modelid = Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400;
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
						SetValueProgTransDiagRight(playerid, GetVehicleInventorySizeSpace(vehicleid), Vehicles_Data_Info[modelid][vehicle_data_BOOT_SPACE]);

						Inventory_UpdateItemsTrans(playerid, i, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount], slot_free, Vehicle.Boot[vehicleid][slot_free][@Item], Vehicle.Boot[vehicleid][slot_free][@Amount]);
					}
					case 2:
					{
						if(PlayerInventory[playerid][i][invItem] == 0) return 1;

						new slot_free = AddSlotGeneralStorage(playerid, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
						if(slot_free == -1) return GameTextForPlayerError(playerid, "~r~Eso no entra.", 2000);

						foreach(new playerex : Player)
						{
							if(Player.Temp[playerid][@InteractID] != Player.Temp[playerex][@InteractID]) continue;
							else if(Player.Temp[playerex][@InTabInvTrans] == 0) continue;
							Inventory_UpdateItemsTrans(playerex, i, 0, 0, slot_free, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
							SetValueProgTransDiagRight(playerex, GetStorageBackpadInvSizeSpace(Player.Temp[playerid][@InteractID]), 20);
						}

						PlayerInventory[playerid][i][invItem] = 0;
						PlayerInventory[playerid][i][invAmount] = 0;
						SelectNuleItemInventory(playerid);

						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
						
					}
					case 3:
					{
						if(PlayerInventory[playerid][i][invItem] == 0) return 1;
						else if(InvObjectData[ PlayerInventory[playerid][i][invItem] ][E_INV_TYPE] != INV_TYPE_FOOD && InvObjectData[ PlayerInventory[playerid][i][invItem] ][E_INV_TYPE] != INV_TYPE_DRINK) return 1;

						new slot_free = AddSlotGeneralStorage(playerid, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
						if(slot_free == -1) return GameTextForPlayerError(playerid, "~r~Eso no entra.", 2000);
						
						foreach(new playerex : Player)
						{
							if(Player.Temp[playerex][@InteractID] != Player.Temp[playerid][@InteractID]) continue;
							Inventory_UpdateItemsTrans(playerex, i, 0, 0, slot_free, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
							SetValueProgTransDiagRight(playerex, GetStorageBackpadInvSizeSpace(Player.Temp[playerid][@InteractID]), 25);
						}

						PlayerInventory[playerid][i][invItem] = 0;
						PlayerInventory[playerid][i][invAmount] = 0;
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);	
					}
					case 4:
					{
						if(PlayerInventory[playerid][i][invItem] == 0) return 1;

						new slot_free = FreeSlotGeneralStorage(playerid, PlayerInventory[playerid][i][invItem]);
						if(slot_free == -1) return GameTextForPlayerError(playerid, "~r~Eso no entra.", 2000);

						new Pool:pool, vw;
						GetFurnitureTypeProperty(PlayerInfo[playerid][p_INTERIOR_TYPE], PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], pool, vw);
						new info[2];
						Streamer_GetArrayData(STREAMER_TYPE_AREA, Player.Temp[playerid][@PickedUpAreaF], E_STREAMER_EXTRA_ID, info);

						new data[E_HOUSE_FURNITURE_DATA];
						pool_get_arr(pool, info[1], data);

						new datainv[E_SVGENERAL_STORAGE_INFO];
						map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], datainv);
						
						await mysql_aquery_s(conexion, str_format("INSERT INTO `lac_item_misc` (`storageid`, `slot`, `itemid`, `amount`) VALUES (%d, %d, %d, %d);", Player.Temp[playerid][@InteractID], slot_free, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]));

						datainv[E_SVGENERAL_STORAGE_ID][slot_free] = cache_insert_id();
						datainv[E_SVGENERAL_STORAGE_Item][slot_free] = PlayerInventory[playerid][i][invItem];
						datainv[E_SVGENERAL_STORAGE_Amount][slot_free] = PlayerInventory[playerid][i][invAmount];
						datainv[E_SVGENERAL_STORAGE_Object][slot_free] = AssignShelfObjectPosition(slot_free, PlayerInventory[playerid][i][invItem], data[E_HOUSE_FURNITURE_DATA_X], data[E_HOUSE_FURNITURE_DATA_Y], data[E_HOUSE_FURNITURE_DATA_Z], data[E_HOUSE_FURNITURE_DATA_RotZ], vw);
						Streamer_Update(playerid);

						map_set_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], datainv);
						
						foreach(new playerex : Player)
						{
							if(Player.Temp[playerid][@InteractID] != Player.Temp[playerex][@InteractID]) continue;
							Inventory_UpdateItemsTrans(playerex, i, 0, 0, slot_free, PlayerInventory[playerid][i][invItem], PlayerInventory[playerid][i][invAmount]);
							SetValueProgTransDiagRight(playerex, GetStorageBackpadInvSizeSpace(Player.Temp[playerid][@InteractID]), Player.Temp[playerid][@InvTransSize]);
						}

						PlayerInventory[playerid][i][invItem] = 0;
						PlayerInventory[playerid][i][invAmount] = 0;
						SelectNuleItemInventory(playerid);
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
					}
				}
			}
		}
	}
	return 0;
}

/*IsInventoryItemIsFood(playerid, slot)
{
	new type = InvObjectData[ PlayerInventory[playerid][slot][invItem] ][E_INV_TYPE];
	if(type == INV_TYPE_FOOD || type == INV_TYPE_DRINK) { return 1; }
	return 0;
}*/

IsInventoryItemTypeInfo(playerid, slot)
{
	return InvObjectData[ PlayerInventory[playerid][slot][invItem] ][E_INV_TypeInfo];
}