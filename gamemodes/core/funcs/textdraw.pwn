ShowPlayerTextdrawsATM(playerid, type)
{
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_General][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_General][1]);

	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][0]);
	
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_General][2]);
	if(type == 2)
	{
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][1]);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][2]);

		TextDrawSetStringForPlayer(Textdraws[sTextdraw_ATM_General][2], playerid, "Banco");
	}
	else
	{
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_ATM_General][2], playerid, "Cajero");
	}
	


	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][3]);

	new string[50];

	format(string, sizeof(string), "%s", PlayerInfo[playerid][pNumeroBancario]);
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], string);
	format(string, sizeof(string), "$%s", FormatNumber(PlayerInfo[playerid][pBanco]));
	PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], string);

	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0]);
	PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1]);

	rBit4_Set(eBit4_PlayerInfo[pt_IsOpenMenuTransactions], playerid, type);

	SelectTextDraw(playerid, 0xFFFFFFFFF);
}

HidePlayerTextdrawsATM(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_General][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_General][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_General][2]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][2]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_ATM_Button][3]); 

	rBit4_Set(eBit4_PlayerInfo[pt_IsOpenMenuTransactions], playerid, 0);

	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0]);
	PlayerTextDrawHide(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1]);

	CancelSelectTextDraw(playerid);

	ClearAnimations(playerid);
	return 1;
}

ShowPlayerMobilePhone(playerid, item)
{
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][0], ARGBToRGBA(InvObjectData[item][E_INV_COLOR2]));

	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][1]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][2]);

	ShowPlayerMobilePhoneMenu(playerid, 1);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][3]);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][4]);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][5]);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][6]);
	//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][14]);


	PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] = 1;

	SelectTextDraw(playerid, 0xF08D29FF);

}

HidePlayerMobilePhone(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][0]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][1]);
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][2]);

	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);

	PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] = 0;
	CancelSelectTextDraw(playerid);

}

HidePlayerMobilePhoneMenu(playerid, menutype)
{
	switch(menutype)
	{
		case 1:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][3]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][4]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][5]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][6]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][14]);
		}
		case 2:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			for(new i = 0; i < 5; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case 3:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			for(new i = 0; i < 5; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case 4:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			/*for(new i = 0; i < 4; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}*/
			DestroyPlayerMobileListTD(playerid);
		}
		case 5:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][8]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][11]);
		}
		case 6:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][12]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][13]);
		}
		case 7:
		{
			Player.Temp[playerid][@CalledPlayer] = EOS;

			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][15]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][17]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][18]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			for(new i = 0; i < 10; i ++)
			{
				TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_Numbers][i]);
			}
		}
		case 8: // Add contact
		{
			Player.Temp[playerid][@CalledPlayer] = EOS;

			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][15]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][17]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][18]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			for(new i = 0; i < 10; i ++)
			{
				TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_Numbers][i]);
			}
		}
		case 9:
		{
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][0]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][1]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][2]);
			TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);

			DestroyPlayerMobileListTD(playerid);

			for(new i = 0; i < 2; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
	}
	PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] = menutype;
}

ShowPlayerMobilePhoneMenu(playerid, menutype)
{
	switch(menutype)
	{
		case 1:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][3]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][4]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][5]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][6]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][14]);

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, "Inicio");
		}
		case 2:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, ConvertEncoding("Contactos"));

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);

			new Query[128];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_book` WHERE `id_phone`=%d LIMIT %d, 5;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 5));
			mysql_tquery(conexion, Query, "LoadMobilePhoneContacts", "d", playerid);
		}
		case 3:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, ConvertEncoding("Teléfono"));

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);

			new Query[128];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_book` WHERE `id_phone`=%d LIMIT %d, 5;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 5));
			mysql_tquery(conexion, Query, "LoadMobilePhoneContacts", "d", playerid);
		}
		case 4:
		{
			//TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			//TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, "Mensajes");

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);

			PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] = 0;

			new Query[128];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_book` WHERE `id_phone`=%d;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 5));
			mysql_tquery(conexion, Query, "LoadMobilePhoneContact", "dd", playerid, 0);

			UpdateMobilePhoneList(playerid, 4);
		}
		case 5:
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, "Mensajes");

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][11]);

			//new Query[255];
			//format(Query, sizeof(Query), "SELECT * FROM `lac_phone_messages` WHERE `to_phone`=%d LIMIT %d, 4;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 4));
			//mysql_tquery(conexion, Query, "LoadMobilePhoneSMS", "d", playerid);
		}
		case 6: // Config
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, ConvertEncoding("Opciones"));

			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);

			UpdateMobilePhoneList(playerid, 6);
		}
		case 7: // Numbers Call
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][15]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][17]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][18]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			for(new i = 0; i < 10; i ++)
			{
				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_Numbers][i]);
			}

		}
		case 8: // Numbers Call
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][10]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][15]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][17]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][18]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);
			for(new i = 0; i < 10; i ++)
			{
				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_Numbers][i]);
			}

		}
		case 9: // Tab Contact
		{
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][0]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][1]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_Text][2]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][16]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][19]);
			TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][7]);

			TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][19], playerid, "Contactos");

			new Query[128];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_book` WHERE `id_phone`=%d;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 5));
			mysql_tquery(conexion, Query, "LoadMobilePhoneContact", "dd", playerid, 1);
		}
	}
	PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] = menutype;
}

UpdateMobilePhoneList(playerid, type)
{
	switch(type)
	{
		case 2:
		{
			for(new i = 0; i < 5; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
			new Query[128];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_book` WHERE `id_phone`=%d LIMIT %d, 5;", GetInvAmountItemSelected(playerid), (PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] * 5));
			mysql_tquery(conexion, Query, "LoadMobilePhoneContacts", "d", playerid);
		}
		case 4:
		{
			for(new i = 0; i < 4; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
			new Query[255];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone_messages` WHERE `to_phone`=%d AND `by_phone`=%d OR `by_phone`=%d AND `to_phone`=%d ORDER BY `date` DESC LIMIT 10;", strval(Player.Temp[playerid][@CalledPlayer]), GetInvAmountItemSelected(playerid), strval(Player.Temp[playerid][@CalledPlayer]), GetInvAmountItemSelected(playerid));
			mysql_tquery(conexion, Query, "LoadMobilePhoneSMS", "d", playerid);
			printf("Query: %s", Query);
			//format(Query, sizeof(Query), SELECT * FROM `lac_phone_messages` WHERE `id_message`=%d; ""
		}
		case 6:
		{
			if(GetInvAmountItemSelected(playerid) == 0) return 1;
			new Query[150];
			format(Query, sizeof(Query), "SELECT * FROM `lac_phone` WHERE `number_phone`=%d;", GetInvAmountItemSelected(playerid));
			mysql_tquery(conexion, Query, "LoadPhoneDataID", "d", playerid);
		}
	}
	return 1;
}

CreateTextdrawBoxSMS(playerid, count, number_contact, Float:total_height, Float:box_size, const message[])
{
	if(number_contact == GetInvAmountItemSelected(playerid)) 
	{
		Player_Textdraws[playerid][pTextdraw_Mobile_TD][count] = CreatePlayerItemListMobileEx(playerid, "LD_SPAC:white", 530.0, total_height+1.0, 1.09, 1.0, 59.0, box_size, 4, 0x008BFFFF);


		Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count] = CreatePlayerTextDraw(playerid,532.0, total_height+(box_size+1.0), message);
		PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 1);
		PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0.190000, 1.000000);
		PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0xFFFFFFFFF);
		PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0);
		PlayerTextDrawShow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count]);
	}
	else
	{ 
		Player_Textdraws[playerid][pTextdraw_Mobile_TD][count] = CreatePlayerItemListMobileEx(playerid, "LD_SPAC:white", 540.0, total_height+1.0, 1.09, 1.0, 59.0, box_size, 4, 0x4291D4FF);

		Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count] = CreatePlayerTextDraw(playerid,542.0, total_height+(box_size+1.0), message);
		PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 1);
		PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0.190000, 1.000000);
		PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0xFFFFFFFFF);
		PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count], 0);
		PlayerTextDrawShow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][count]);
	}
}

DestroyPlayerMobileListTD(playerid)
{
	for(new i = 0; i < 5; i++)
	{	
		if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] = PlayerText:INVALID_TEXT_DRAW;
		}
		if(Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][i] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][i]); Player_Textdraws[playerid][pTextdraw_Mobile_TD_Text][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}
}

Textdraw_OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] != 0)
	{
		new temp_selected = PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED];

		if(clickedid == Textdraws[sTextdraw_Mobile_TD][3])
		{
			HidePlayerMobilePhoneMenu(playerid, temp_selected);
			ShowPlayerMobilePhoneMenu(playerid, 2);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][4])
		{
			HidePlayerMobilePhoneMenu(playerid, temp_selected);
			ShowPlayerMobilePhoneMenu(playerid, 4);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][5])
		{
			HidePlayerMobilePhoneMenu(playerid, temp_selected);
			ShowPlayerMobilePhoneMenu(playerid, 6);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][6])
		{
			HidePlayerMobilePhoneMenu(playerid, temp_selected);
			ShowPlayerMobilePhoneMenu(playerid, 3);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][7])
		{
			switch(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED])
			{
				case 7:
				{
					HidePlayerMobilePhoneMenu(playerid, temp_selected);
					ShowPlayerMobilePhoneMenu(playerid, 2);
					return 1;
				}
				case 9:
				{
					HidePlayerMobilePhoneMenu(playerid, temp_selected);
					ShowPlayerMobilePhoneMenu(playerid, 2);
					return 1;
				}
			}
			HidePlayerMobilePhoneMenu(playerid, temp_selected);
			ShowPlayerMobilePhoneMenu(playerid, 1);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][14])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] != 0)
			{
				HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);
				HidePlayerMobilePhone(playerid);
				wait_ms(100);
			}
			ShowPlayerPanelGPS(playerid);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][8])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 2)
			{

				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);

				await mysql_aquery_s(conexion, str_format("SELECT COUNT(*) FROM `lac_phone_book` WHERE `id_phone`=%d;", GetInvAmountItemSelected(playerid)));
				
				new pages;
				cache_get_value_index_int(0, 0, pages);

				new Float:tpages = floatdiv(floatround(pages), 5);
				pages = floatround(tpages, floatround_ceil);

				if(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] >= pages - 1) { PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] = pages - 1; }
				else { PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]++; TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]); }

				UpdateMobilePhoneList(playerid, 2);
				

			}
			else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 4)
			{
				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);
				DestroyPlayerMobileListTD(playerid);
				//PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]++;
				LoadPhoneCacheSMS(playerid, 1);
			}
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][9])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 2)
			{
	
				if(PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] <= 0) { PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE] = 0; }
				else { PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]--; /*TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][9]);*/ }

				UpdateMobilePhoneList(playerid, 2);
			}
			else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 4)
			{
				DestroyPlayerMobileListTD(playerid);
				//PlayerInfoTemp[playerid][pt_PHONE_LIST_PAGE]--;
				LoadPhoneCacheSMS(playerid, 0);
			}
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][10])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 2)
			{
				//new temp_selected = PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED];

				HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);
				ShowPlayerMobilePhoneMenu(playerid, 7);
				//ShowDialogEx(playerid, DIALOG_ADD_NUMBER_CONTACT);
			}
			else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 4)
			{
				ShowDialogEx(playerid, DIALOG_SEND_MESSAGE_PHONE);
			}
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][11])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 2)
			{
				ShowDialogEx(playerid, DIALOG_ADD_NUMBER_CONTACT);
			}
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_TD][12])
		{
			new Query[150];
			if(rBit1_Get(eBit1_PlayerInfo[pt_PHONE_STATE], playerid))
			{
				rBit1_Set(eBit1_PlayerInfo[pt_PHONE_STATE], playerid, false);
			}
			else
			{
				rBit1_Set(eBit1_PlayerInfo[pt_PHONE_STATE], playerid, true);
			}
			format(Query, sizeof(Query), "UPDATE `lac_phone` SET `phone_state`=%d WHERE `number_phone`=%d;", rBit1_Get(eBit1_PlayerInfo[pt_PHONE_STATE], playerid), GetInvAmountItemSelected(playerid));
			mysql_tquery(conexion, Query);

			UpdateMobilePhoneList(playerid, 6);
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_Text][0])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 9)
			{
				if(isnull(Player.Temp[playerid][@CalledPlayer])) return 1;

				TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TextAbove][0]);

			
				HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);

				ShowPlayerMobilePhoneMenu(playerid, 4);
			
			}
		}
		else if(clickedid == Textdraws[sTextdraw_Mobile_Text][2])
		{
			if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 9)
			{
				if(isnull(Player.Temp[playerid][@CalledPlayer])) return 1;

				new Query[250];
				format(Query, sizeof(Query), "DELETE FROM `lac_phone_book` WHERE `id_contact`=%d;", strval(Player.Temp[playerid][@CalledPlayer]));
				mysql_tquery(conexion, Query);

				//new temp = PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED];
				HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);
				ShowPlayerMobilePhoneMenu(playerid, 2);

				PlayerPlaySoundEx(playerid,1055,0.0,0.0,0.0);
				//UpdateMobilePhoneList(playerid, 2);
			}
		}
		else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 7)
		{
			for(new i = 0; i < 10; i++)
			{
				if(clickedid == Textdraws[sTextdraw_Mobile_Numbers][i])
				{
					PlayerPlaySoundEx(playerid, 17803, 0.0, 0.0, 0.0);
					if(strlen(Player.Temp[playerid][@CalledPlayer]) > 9) return 1;

					new string_temp[9]; 
					format(string_temp, sizeof(string_temp), "%d", i);
					strcat(Player.Temp[playerid][@CalledPlayer], string_temp);
					
		            TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid, Player.Temp[playerid][@CalledPlayer]);
				}
			}
			if(clickedid == Textdraws[sTextdraw_Mobile_TD][17])
			{
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
        		new length = strlen(Player.Temp[playerid][@CalledPlayer]);
                if(length > 1) strdel(Player.Temp[playerid][@CalledPlayer],length-1,length), TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid, Player.Temp[playerid][@CalledPlayer]);
				else strdel(Player.Temp[playerid][@CalledPlayer],0,1),TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid,"_");
			}
			else if(clickedid == Textdraws[sTextdraw_Mobile_TD][18])
			{
				new infotext[80];
				format(infotext, sizeof(infotext), "{FFFFFF}Ingresa el nombre para el numero {00C0FF}%s{FFFFFF}:", Player.Temp[playerid][@CalledPlayer]);
				Dialog_Show(playerid, dNewContactName, DIALOG_STYLE_INPUT, "{00C0FF}Nuevo contacto", infotext, "Agregar", "Cancelar");        		
			}
		}
		else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 8)
		{
			for(new i = 0; i < 10; i++)
			{
				if(clickedid == Textdraws[sTextdraw_Mobile_Numbers][i])
				{
					PlayerPlaySoundEx(playerid, 17803, 0.0, 0.0, 0.0);
					if(strlen(Player.Temp[playerid][@CalledPlayer]) > 9) return 1;

					new string_temp[9]; 
					format(string_temp, sizeof(string_temp), "%d", i);
					strcat(Player.Temp[playerid][@CalledPlayer], string_temp);
					
		            TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid, Player.Temp[playerid][@CalledPlayer]);
				}
			}
			if(clickedid == Textdraws[sTextdraw_Mobile_TD][17])
			{
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
        		new length = strlen(Player.Temp[playerid][@CalledPlayer]);
                if(length > 1) strdel(Player.Temp[playerid][@CalledPlayer],length-1,length), TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid, Player.Temp[playerid][@CalledPlayer]);
				else strdel(Player.Temp[playerid][@CalledPlayer],0,1),TextDrawSetStringForPlayer(Textdraws[sTextdraw_Mobile_TD][15], playerid,"_");
			}
			else if(clickedid == Textdraws[sTextdraw_Mobile_TD][18])
			{
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
        		
			}
		}
	}
	return 0;
}