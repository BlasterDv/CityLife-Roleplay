new Float:XSaveCP[MAX_PLAYERS][10];
new Float:YSaveCP[MAX_PLAYERS][10];
new Float:ZSaveCP[MAX_PLAYERS][10];

stock SetPlayerCP(playerid, Float:X, Float:Y, Float:Z, idcp)
{
	XSaveCP[playerid][idcp] = X;
	YSaveCP[playerid][idcp] = Y;
	ZSaveCP[playerid][idcp] = Z;
	return 1;
}

stock RemovePlayerCP(playerid, idcp)
{
	XSaveCP[playerid][idcp] = 0;
	YSaveCP[playerid][idcp] = 0;
	ZSaveCP[playerid][idcp] = 0;
	return 1;
}

stock Float:GetPlayerCP(playerid, idcp, typepos)
{
	if(typepos == 0)
	{
		return XSaveCP[playerid][idcp];
	}
	else if(typepos == 1)
	{
		return YSaveCP[playerid][idcp];
	}
	else if(typepos == 2)
	{
		return ZSaveCP[playerid][idcp];
	}
	return 0.0;
}