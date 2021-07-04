Player_ApplyItemBandages(playerid)
{
	Player.Temp[playerid][@HealingProgress] = 8;
	new string[40];
	format(string, sizeof(string), "Vendando... ~r~%d%", Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(playerid,string);

	ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_SHAKE", 4.1, true, false, false, true, 0, false);

	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][14]);
	PlayerInfoTemp[playerid][pt_TimersE][14] = SetTimerEx("Timer_PlayerFinishApplyBandage", 1500, true, "i", playerid);
}

Player_ApplyItemKitMedic(playerid, extraid)
{
	Player.Temp[playerid][@PlayerHealing] = extraid;
	Player.Temp[extraid][@PlayerHealing] = playerid;

	Player.Temp[playerid][@HealingProgress] = 8;
	
	RemoveItemInvPlayer(playerid, GetInvItemSelected(playerid));
	SelectNuleItemInventory(playerid);

	new string[70];
	format(string, sizeof(string), "Curando a %s...~n~~r~%d%", PlayerInfo[extraid][p_Name], Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(playerid,string);
	format(string, sizeof(string), "%s te esta curando...~n~~r~%d%", PlayerInfo[playerid][p_Name], Player.Temp[playerid][@HealingProgress]);
	ShowPlayerInfoTextdraw(extraid,string);

	ApplyAnimationEx(playerid, "COP_AMBIENT", "COPBROWSE_SHAKE", 4.1, true, false, false, true, 0, false);

	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][14]);
	PlayerInfoTemp[playerid][pt_TimersE][14] = SetTimerEx("Timer_PlayerFinishApplyKit", 1100, true, "i", playerid);
}