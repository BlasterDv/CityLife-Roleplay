BuyPlayerStoreItems(playerid, itemid, amount, price)
{
	if(PlayerInfo[playerid][pDinero] < price) return ShowPlayerInfoTextdraw(playerid, "~r~Dinero insuficiente.", 2000);
	if(AddItemInvPlayer(playerid, itemid, amount, true) == -1) return 0;
	RemoveMoney(playerid, price, true);
	return 1;
}

OpenDialogLeftMenuShop(playerid, const title[], const desc[], price)
{
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][0]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][1]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][2]);
	TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][5]);

	new header_string[128];
	format(header_string, sizeof(header_string), "%s~n~~g~~h~$%d", title, price);
	TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][1], playerid, ConvertEncoding(header_string));

	format(header_string, sizeof(header_string), "%s", desc);
	TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][2], playerid, ConvertEncoding(header_string));
}

HideDialogLeftMenuShop(playerid, type = 0)
{
	if(type == 0)
	{
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][0]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][1]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][2]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][5]);
	}
	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][3]);	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][4]);	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][6]);	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][7]);	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][8]);	
	TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_BoxConfirmBuyEx][9]);
}