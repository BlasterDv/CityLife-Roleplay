forward OnPlayerPressedButton(playerid, buttonid);

/*native CreateButtonE(Float:X, Float:Y, Float:Z, Float:RZ, Float:sX, Float:sY, Float:sZ, Float:sRZ);*/

stock CreateButtonE(Float:X, Float:Y, Float:Z, Float:RZ, Float:sX, Float:sY, Float:sZ, Float:sRZ)
	return CallRemoteFunction("FS_CreateButtonE", "ffffffff", X, Y, Z, RZ, sX, sY, sZ, sRZ);

stock IsButtonEnabled(buttonid)
	return CallRemoteFunction("FS_IsButtonEnabled", "i", buttonid);