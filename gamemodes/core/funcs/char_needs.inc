SetPlayerThirstLevel(playerid, level)
{
	if(PlayerInfo[playerid][pSed] > level)
	{
		PlayerInfo[playerid][pSed] -= level;
		ShowPlayerMessageInfoNeeds(playerid);
	}
	else
	{
		PlayerInfo[playerid][pSed] = 0; 
		ShowPlayerMessageInfoNeeds(playerid);
	}
	return 1;
}

SetPlayerHungryLevel(playerid, amount)
{

	if(PlayerInfo[playerid][pHungry] > amount)
	{
		PlayerInfo[playerid][pHungry] -= amount;
		ShowPlayerMessageInfoNeeds(playerid);
	}
	else
	{
		PlayerInfo[playerid][pHungry] = 0; 
		ShowPlayerMessageInfoNeeds(playerid);
	}
	return 1;
}


function EndPlayerEatingFood(playerid, type, amount)
{
	new item = PlayerInfo[playerid][pInvItemSelected];
	//if(!IsPlayerInvHasFood(PlayerInventory[playerid][item][invItem])) return 1;
	switch(type)
	{
		case 0: { SetPlayerHungryLevel(playerid, amount); }
		case 1: { SetPlayerThirstLevel(playerid, amount); }
		case 2: { SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid)+1000); }
		case 4: { SetPlayerHealthAnalgesic(playerid); }
	}
	PlayerInventory[playerid][item][invAmount] -= 1;
	if(PlayerInventory[playerid][item][invAmount] <= 0)
	{
		GameTextForPlayer(playerid, "~r~Terminado.", 1000, 5);
		if(IsPlayerInvHasFood(PlayerInventory[playerid][item][invItem]))
		{
			RemovePlayerAttachedObject(playerid, 9);
			//SelectNuleItemInventory(playerid);
		}
		RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
	}
	Player.Temp[playerid][@FreezeInventory] = 0;
	rBit1_Set(eBit1_PlayerInfo[pTimeEatingActive], playerid, false);
	return 1;
}

IsPlayerInvHasFood(foodid)
{
	switch(InvObjectData[foodid][E_INV_TYPE])
	{
		case INV_TYPE_DRINK, INV_TYPE_FOOD, INV_TYPE_ANALGESICS: { return 1; }
	}
	//if(InvObjectData[foodid][E_INV_TYPE] == INV_TYPE_DRINK || InvObjectData[foodid][E_INV_TYPE] == INV_TYPE_FOOD) return 1;
	return 0;
}

ShowPlayerMessageInfoNeeds(playerid)
{
	new str[100], info_thirst[40], info_hungry[40];
	if(PlayerInfo[playerid][pSed] == 100)
	{
		format(info_thirst, sizeof(info_thirst), "~r~~h~Estas deshidratado! ");
	}
	else if(PlayerInfo[playerid][pSed] >= 95)
	{
		format(info_thirst, sizeof(info_thirst), "~r~~h~Te estas deshidratado! ");
	}
	else if(PlayerInfo[playerid][pSed] >= 75)
	{	
		format(info_thirst, sizeof(info_thirst), "~g~~h~Te esta dando sed ");
	}
	else if(PlayerInfo[playerid][pSed] > 20)
	{
		format(info_thirst, sizeof(info_thirst), "~g~~h~Normal");
	}
	else if(PlayerInfo[playerid][pSed] > 0)
	{
		format(info_thirst, sizeof(info_thirst), "~g~~h~Satisfecho");
	}

	if(PlayerInfo[playerid][pHungry] == 100)
	{
		format(info_hungry, sizeof(info_hungry), "~r~~h~Come algo o morirás!");
	}
	else if(PlayerInfo[playerid][pHungry] > 95)
	{
		format(info_hungry, sizeof(info_hungry), "~r~~h~Tienes mucha hambre!");
	}
	else if(PlayerInfo[playerid][pHungry] > 75)
	{	
		format(info_hungry, sizeof(info_hungry), "~g~~h~Tienes hambre");
	}
	else if(PlayerInfo[playerid][pHungry] > 20)
	{
		format(info_hungry, sizeof(info_hungry), "~g~~h~Normal");
	}
	else if(PlayerInfo[playerid][pHungry] > 0)
	{
		format(info_hungry, sizeof(info_hungry), "~g~~h~Satisfecho");
	}

	new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_INFONEEDS, true, 48.0);

	funct_CreateTextdrawTextNotif(playerid, i, 0, "Sed~n~~n~Hambre", 0.0);

	format(str, sizeof(str), "%s~n~~n~%s", info_thirst, info_hungry);
	funct_CreateTextdrawTextNotif(playerid, i, 1, str, 108.0, 0.200, 1.2, .align = 3);

	new barid;
	barid = funct_CreatePlayerBarNotif(playerid, i, 0, 18.0, 100.0, 9043967, 4.0);
	funct_SetValuePlayerBarNotif(playerid, barid, 0, PlayerInfo[playerid][pSed]);

	barid = funct_CreatePlayerBarNotif(playerid, i, 1, 41.0, 100.0, 9043967, 4.0);
	funct_SetValuePlayerBarNotif(playerid, barid, 1, PlayerInfo[playerid][pHungry]);

	vNoti_SetTimeHideBox(playerid, i, 10);

	UpdateNotificationForPlayer(playerid, i);
}