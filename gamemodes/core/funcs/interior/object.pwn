Furniture_ObjectEditModePool(playerid, item, Pool:pool)
{
	TogglePlayerControllableEx(playerid, false);
	ShowMessageInfoEditFurniture(playerid);
	MenuV_Close(playerid);

	new data[E_HOUSE_FURNITURE_DATA];
	pool_get_arr(pool, item, data);

	Player.Temp[playerid][@EditFurniture] = 2;
	Player.Temp[playerid][@EditFurnitureObj] = data[E_HOUSE_FURNITURE_DATA_ObjID];
	Player.Temp[playerid][@EditFurnitureRot] = data[E_HOUSE_FURNITURE_DATA_RotZ];
	Player.Temp[playerid][@EditFurnitureIn] = item;
	new Float:x, Float:y, Float:z, Float:tx, Float:ty, Float:tz;

	if(IsValidDynamicArea(data[E_HOUSE_FURNITURE_DATA_AREA]))
	{
		DestroyDynamicArea(data[E_HOUSE_FURNITURE_DATA_AREA]);
	}

	GetPlayerPos(playerid, x, y, z);
	GetDynamicObjectPos(Player.Temp[playerid][@EditFurnitureObj], tx,ty,tz);
	//new Float:angle = GetAngleToPoint(x, y, tx, ty);

	//GetPointInFrontPos(playerid, x, y, angle, newx, newy, 0.4);

	SetPlayerCameraPos(playerid, x, y, tz + 2.4);
	Streamer_Update(playerid);

	EditFeaturesFurnitureType(Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type], item, pool);
	
	GetPointInFrontPos(playerid, tx, ty, data[E_HOUSE_FURNITURE_DATA_RotZ], tx, ty, 2.4);
	SetPlayerCameraLookAt(playerid, tx, ty, tz);
}

AssignShelfObjectPosition(slot, modelid, Float:x, Float:y, Float:z, Float:rz, worldid = -1)
{
	new object;
	new offset = InvObjectData[modelid][E_INV_PointToRot];
	new Float:tx, Float:ty, Float:tz;

	switch(slot)
	{
		case 0: { tx = x+=0.28210; ty = y-=0.11540; tz = z+1.50940; }
		case 1: { tx = x-=0.32590; ty = y-=0.11530, tz = z+1.50940; }
		case 2: { tx = x+=0.85210; ty = y-=0.11530; tz = z+1.50940; }
		case 3: { tx = x-=0.32590; ty = y-=0.11530; tz = z+0.80620; }
		case 4: { tx = x+=0.26900; ty = y-=0.11540; tz = z+0.80620; }
		case 5: { tx = x+=0.85210; ty = y-=0.11530; z = tz+0.80620; }
		case 6: { tx = x+=0.26900; ty = y-=0.11540; tz = z+0.13180; }
		case 7: { tx = x+=0.85210, ty = y-=0.11530; tz = z+0.13180; }
		case 8: { tx = x-=0.32590, ty = y-=0.11530, tz = z+0.13180; }
		case 9: { tx = x+=0.26900, ty = y-=0.11540; tz = z+2.19030; }
		case 10: { tx = x+=0.85210; ty = y-=0.11530; tz = z+2.19030; }
		case 11: { tx = x-=0.32590; ty = y-=0.11530; tz = z+2.19030; }
	}

	object = CreateDynamicObject(InvObjectData[ modelid ][E_INV_OBJECTMID], tx, ty, (tz+InvObjectData[modelid][invarea_ModelOffset]), DataE.Offset[offset][@FX], DataE.Offset[offset][@FY], rz, worldid);
	return object;
}