DropWorldPlayerItem(playerid)
{
	if(CallLocalFunction("OnPlayerDropItem", "dd", playerid, GetInvValueItemSelected(playerid)))
		return 0;

	if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_UseAnimCarry])
		ApplyAnimation(playerid, "CARRY", "putdwn", 5.0, 0, 0, 0, 0, 0);

	else
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_IN", 5.0, 1, 0, 0, 0, 450);


	PlayerInfoTemp[playerid][pt_TimersE][10] =  SetTimerEx("DropPlayerItemDelay", 400, false, "i", playerid);

	Player.Temp[playerid][@InteractingState] = 1;

	return 1;

}

PlayerPickupItem(playerid, itemid)
{
	/*itm_Holding[playerid]			= itemid;
	itm_Holder[itemid]				= playerid;*/
	//if(!IsValidAreaIT(itemid)) return 0;

	if(Player.Temp[playerid][@InteractingItem] != INVALID_ITEM_ID)
		return 0;

	if(Player.Temp[playerid][@InteractingState] != 0)
		return -2;

	if(IsInventoryFull(playerid, ItemsWorld.Info[itemid][@ItemID]) == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 2000);

	new Float:x, Float:y, Float:z;

	GetPlayerPos(playerid, x, y, z);
	ClearAnimations(playerid);
	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, GetAngleToPoint(x, y, ItemsWorld.Info[itemid][@X], ItemsWorld.Info[itemid][@Y]));

	if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_UseAnimCarry])
			ApplyAnimation(playerid, "CARRY", "liftup", 5.0, 0, 0, 0, 0, 400);

		else
			ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_IN", 5.0, 0, 0, 0, 0, 450);

	PlayerInfoTemp[playerid][pt_TimersE][10] = SetTimerEx("PickupItemDelay", 400, false, "iii", playerid, itemid, 0);

	Player.Temp[playerid][@InteractingItem]		= itemid;
	item_Interactor[itemid]			= playerid;

	Player.Temp[playerid][@InteractingState] = 1;
	return 1;

//	RemoveItemFromWorld(itemid);
}

function PickupItemDelay(playerid, id, animtype)
{
	//sif_dp:SIF_DEBUG_LEVEL_INTERNAL:ITEM_DEBUG("[PickUpItemDelay]")<playerid>;
	if(animtype == 0)
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);

	//HideActionText(playerid);
	
	Player.Temp[playerid][@InteractingItem]	= INVALID_ITEM_ID;

	if(CallLocalFunction("OnPlayerPickupItem", "dd", playerid, id))
		return 1;

	//if(IsInventoryFull(playerid)) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 2000);
	Player.Temp[playerid][@InteractingState] = 0;

	GiveWorldItemToPlayer(playerid, id);
	
	return 1;
}

function DropPlayerItemDelay(playerid)
{
	new
		objtype = PlayerInventory[playerid][PlayerInfo[playerid][pInvItemSelected]][invItem],
		amount = PlayerInventory[playerid][PlayerInfo[playerid][pInvItemSelected]][invAmount],
		Float:x,
		Float:y,
		Float:z,
		Float:r;

	//if(!Iter_Contains(itm_Index, itemid))
	//	return 0;
	//if(!IsValidAreaIT(playerid, itemid)) return 0;
	if(objtype == 0) return 0;

	GetPlayerPos(playerid, x,y,z);
	GetPlayerFacingAngle(playerid, r);

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);

	Player.Temp[playerid][@InteractingState] = 0;

	new itemid = CreateItemInvWorld(objtype,
		x + (0.5 * floatsin(-r, degrees)),
		y + (0.5 * floatcos(-r, degrees)),
		z - 0.96,
		0.0, 0.0, r,
		GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), amount, 1);

	
	Streamer_Update(playerid);

	CallLocalFunction("OnPlayerDropItemWorld", "dd", playerid, itemid);

	return 1;
}


stock GiveWorldItemToPlayer(playerid, itemid)
{
	if(AddItemInvPlayer(playerid, ItemsWorld.Info[itemid][@ItemID], ItemsWorld.Info[itemid][@ItemAmount], true) == -1) return 1;

	RemoveItemFromWorld(itemid);
	//RemoveCurrentItem(GetItemHolder(itemid));

	new type = ItemsWorld.Info[itemid][@ItemID];

	ItemsWorld.Info[itemid][@X]		= 0.0;
	ItemsWorld.Info[itemid][@Y]		= 0.0;
	ItemsWorld.Info[itemid][@Z]		= 0.0;

	//itm_Holding[playerid]			= itemid;
	//itm_Holder[itemid]				= playerid;
	Player.Temp[playerid][@InteractingItem]		= INVALID_ITEM_ID;
	item_Interactor[itemid]			= INVALID_PLAYER_ID;

//	SetPlayerAttachedObject(
//		playerid, ITM_ATTACH_INDEX, itm_TypeData[type][itm_model], itm_TypeData[type][itm_attachBone],
//		itm_TypeData[type][itm_attachPosX], itm_TypeData[type][itm_attachPosY], itm_TypeData[type][itm_attachPosZ],
//		itm_TypeData[type][itm_attachRotX], itm_TypeData[type][itm_attachRotY], itm_TypeData[type][itm_attachRotZ],
//		.materialcolor1 = itm_TypeData[type][itm_colour], .materialcolor2 = itm_TypeData[type][itm_colour]);

	if(InvObjectData[type][E_INV_UseAnimCarry])
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);

	if(CallLocalFunction("OnPlayerGetItem", "dd", playerid, itemid))
		return 0;

	return 1;
}

CreateItemInvWorld(areaid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, int, vw, amount, applyrotoffsets=1, bool:forcesave = true, playerid = -1)
{
	/*sif_d:SIF_DEBUG_LEVEL_INTERNAL:ITEM_DEBUG("[CreateItemInWorld]");
	if(!Iter_Contains(itm_Index, itemid))
		return 0;

	if(Iter_Contains(itm_WorldIndex, itemid))
		return -1;*/

	

	/*if(!IsValidItemType(itemtype))
		return -2;*/
	new i;
	for ( i = 0; i < MAX_ITEMS_WORLD; ++i )
	{
		if ( ItemsWorld.Info[i][@VALID] )
			continue;
		else
			break;
	}

	//format(InvObjectData[id][E_INV_ENAME], 24, uname);

	ItemsWorld.Info[i][@VALID] = true;
	ItemsWorld.Info[i][@ItemID] = areaid;
	ItemsWorld.Info[i][@ItemAmount] = amount;
	ItemsWorld.Info[i][@X] = x;
	ItemsWorld.Info[i][@Y] = y;
	ItemsWorld.Info[i][@Z] = z;
	ItemsWorld.Info[i][@A] = rz;

	

	//ItemsWorld[areaid][@RX] = rx;
	//ItemsWorld[areaid][itm_rotY] = ry;
	//ItemsWorld[areaid][itm_rotZ] = rz;
	//ItemsWorld.Info[i][itm_world] = world;
	//ItemsWorld.Info[i][itm_interior] = interior;
	//ItemsWorld[areaid][itm_hitPoints] = hitpoints == -1 ? itm_TypeData[itm_Data[areaid][itm_type]][itm_maxHitPoints] : hitpoints;
	new itemtype = ItemsWorld.Info[i][@ItemID];

	ItemsWorld.Info[i][@Time] = gettime() + InvObjectData[itemtype][E_INV_TimeDestroy];

	if(item_Holder[areaid] != INVALID_PLAYER_ID)
	{
		RemovePlayerAttachedObject(item_Holder[areaid], 9);
		SetPlayerSpecialAction(item_Holder[areaid], SPECIAL_ACTION_NONE);

		item_Holding[item_Holder[areaid]] = INVALID_ITEM_ID;
		item_Interacting[item_Holder[areaid]] = INVALID_ITEM_ID;
	}

	item_Interactor[i] = INVALID_PLAYER_ID;
	item_Holder[areaid] = INVALID_PLAYER_ID;

	new offset = InvObjectData[itemtype][E_INV_PointToRot];

	if(applyrotoffsets)
	{
		ItemsWorld.Info[i][@ObjectID] = CreateDynamicObject(InvObjectData[itemtype][E_INV_OBJECTMID],
			x, y, z + InvObjectData[itemtype][invarea_ModelOffset],
			rx + DataE.Offset[offset][@FX],//InvObjectData[itemtype][invarea_offsetRotX],
			ry + DataE.Offset[offset][@FY],//InvObjectData[itemtype][invarea_offsetRotY],
			rz + DataE.Offset[offset][@FZ],//InvObjectData[itemtype][invarea_offsetRotZ],
			vw, int, playerid, .streamdistance = 100.0);
	}
	else
	{
		ItemsWorld.Info[i][@ObjectID] = CreateDynamicObject(InvObjectData[itemtype][E_INV_OBJECTMID],
			x, y, z + InvObjectData[itemtype][invarea_ModelOffset], rx, ry, rz,
			vw, int, playerid, .streamdistance = 100.0);
	}
	if(InvObjectData[itemtype][E_INV_COLOR1] != -1) { SetDynamicObjectMaterial(ItemsWorld.Info[i][@ObjectID], 0, InvObjectData[itemtype][E_INV_OBJECTMID], "none", "none", InvObjectData[itemtype][E_INV_COLOR1]); }

	ItemsWorld.Info[i][@AreaIT] = CreateInteractiveArea(x, y, z + InvObjectData[itemtype][invarea_AreaitOffset], "para ~n~recoger.", vw, int, 1.2, AREAIT_TYPE_PICKUPITEM, KEY_AREAIT_TYPE_COLLECT, .testlos = false, .player = playerid);
	SetInteractiveExtraData(ItemsWorld.Info[i][@AreaIT], i);

	if(ItemsWorld.Info[i][@AreaIT] == -1)
	{
		printf("ERROR: Invalid button ID created for item %d.", areaid);
		return -3;
	}

	//itm_ButtonIndex[itm_Data[areaid][itm_button]] = areaid;

	if(InvObjectData[itemtype][E_INV_COLOR1] != -1)
		SetDynamicObjectMaterial(ItemsWorld.Info[areaid][@ObjectID], 0, InvObjectData[itemtype][E_INV_OBJECTMID], "invalid", "invalid", InvObjectData[itemtype][E_INV_COLOR1]);

	SetAreaITLabel(ItemsWorld.Info[i][@AreaIT], InvObjectData[itemtype][E_INV_NAME], .range = 2.0, .reducez = 0.96, .testlos = false);
	//if(label)
	//	SetButtonLabel(itm_Data[areaid][itm_button], itm_TypeData[itemtype][itm_name], .range = 2.0, .testlos = false);

	/*Iter_Add(itm_WorldIndex, areaid);*/
	if(forcesave) mysql_tquery_s(conexion, str_format("INSERT INTO `lac_servergral_witems`(`id_index`, `itemid`, `item_amount`, `x`, `y`, `z`, `angle`, `time`) VALUES (%d, %d, %d, %f, %f, %f, %f, %d);", i, areaid, amount, x, y, z, rz, ItemsWorld.Info[i][@Time]));
	return i;

}

CreateItemInvWorldEx(i, areaid, Float:rx, Float:ry, int, vw, applyrotoffsets=1)
{


	//format(InvObjectData[id][E_INV_ENAME], 24, uname);
	new Float:x, Float:y, Float:z;
	new Float:rz = ItemsWorld.Info[i][@A];

	ItemsWorld.Info[i][@VALID] = true;

	x = ItemsWorld.Info[i][@X];
	y = ItemsWorld.Info[i][@Y];
	z = ItemsWorld.Info[i][@Z];

	//ItemsWorld[areaid][@RX] = rx;
	//ItemsWorld[areaid][itm_rotY] = ry;
	//ItemsWorld[areaid][itm_rotZ] = rz;
	//ItemsWorld.Info[i][itm_world] = world;
	//ItemsWorld.Info[i][itm_interior] = interior;
	//ItemsWorld[areaid][itm_hitPoints] = hitpoints == -1 ? itm_TypeData[itm_Data[areaid][itm_type]][itm_maxHitPoints] : hitpoints;
	new itemtype = ItemsWorld.Info[i][@ItemID];


	if(item_Holder[areaid] != INVALID_PLAYER_ID)
	{
		RemovePlayerAttachedObject(item_Holder[areaid], 9);
		SetPlayerSpecialAction(item_Holder[areaid], SPECIAL_ACTION_NONE);

		item_Holding[item_Holder[areaid]] = INVALID_ITEM_ID;
		item_Interacting[item_Holder[areaid]] = INVALID_ITEM_ID;
	}

	item_Interactor[i] = INVALID_PLAYER_ID;
	item_Holder[areaid] = INVALID_PLAYER_ID;

	new offset = InvObjectData[itemtype][E_INV_PointToRot];

	if(applyrotoffsets)
	{
		ItemsWorld.Info[i][@ObjectID] = CreateDynamicObject(InvObjectData[itemtype][E_INV_OBJECTMID],
			x, y, z + InvObjectData[itemtype][invarea_ModelOffset],
			rx + DataE.Offset[offset][@FX],//InvObjectData[itemtype][invarea_offsetRotX],
			ry + DataE.Offset[offset][@FY],//InvObjectData[itemtype][invarea_offsetRotY],
			rz + DataE.Offset[offset][@FZ],//InvObjectData[itemtype][invarea_offsetRotZ],
			vw, int, .streamdistance = 100.0);
	}
	else
	{
		ItemsWorld.Info[i][@ObjectID] = CreateDynamicObject(InvObjectData[itemtype][E_INV_OBJECTMID],
			x, y, z + InvObjectData[itemtype][invarea_ModelOffset], rx, ry, rz,
			vw, int, .streamdistance = 100.0);
	}
	if(InvObjectData[itemtype][E_INV_COLOR1] != -1) { SetDynamicObjectMaterial(ItemsWorld.Info[i][@ObjectID], 0, InvObjectData[itemtype][E_INV_OBJECTMID], "none", "none", InvObjectData[itemtype][E_INV_COLOR1]); }

	ItemsWorld.Info[i][@AreaIT] = CreateInteractiveArea(x, y, z + InvObjectData[itemtype][invarea_AreaitOffset], "para ~n~recoger.", vw, int, 1.2, AREAIT_TYPE_PICKUPITEM, KEY_AREAIT_TYPE_COLLECT, .testlos = false);
	SetInteractiveExtraData(ItemsWorld.Info[i][@AreaIT], i);

	if(ItemsWorld.Info[i][@AreaIT] == -1)
	{
		printf("ERROR: Invalid button ID created for item %d.", areaid);
		return -3;
	}

	//itm_ButtonIndex[itm_Data[areaid][itm_button]] = areaid;

	if(InvObjectData[itemtype][E_INV_COLOR1] != -1)
		SetDynamicObjectMaterial(ItemsWorld.Info[areaid][@ObjectID], 0, InvObjectData[itemtype][E_INV_OBJECTMID], "invalid", "invalid", InvObjectData[itemtype][E_INV_COLOR1]);

	SetAreaITLabel(ItemsWorld.Info[i][@AreaIT], InvObjectData[itemtype][E_INV_NAME], .range = 2.0, .reducez = 0.96, .testlos = false);
	//if(label)
	//	SetButtonLabel(itm_Data[areaid][itm_button], itm_TypeData[itemtype][itm_name], .range = 2.0, .testlos = false);

	return i;

}

RemoveItemFromWorld(itemid)
{
	DestroyDynamicObject(ItemsWorld.Info[itemid][@ObjectID]);

	DestroyInteractiveArea(ItemsWorld.Info[itemid][@AreaIT]);

	ItemsWorld.Info[itemid][@VALID] = false;

	ItemsWorld.Info[itemid][@ItemID] = 0;
	ItemsWorld.Info[itemid][@ObjectID] = 0;
}

PlayerPressKeyDropItem(playerid)
{
	new animidx = GetPlayerAnimationIndex(playerid);

	if(!IsPlayerMovingAnim(animidx)) return 0;

	if(GetInvValueItemSelected(playerid) == 0) return 0;

	if(Player.Temp[playerid][@InteractingItem] != INVALID_ITEM_ID)
		return -1;

	if(Player.Temp[playerid][@InteractingState] != 0)
		return -2;

	DropWorldPlayerItem(playerid);

	return 1;
}

DefineItemInvType(id, type, extradata, const name[], bool:ename, objectmid, size = 1, color1 = -1, PointToRot = 0, bool:Attached = false, SlotAttach = 0, bool:UseAnimCarry = false, Float:ModelOffset = 0.0, Float:AreaitOffset = ITEM_FLOOR_OFFSET, color2 = -1, extratype = 0, typeinfo = 0, timedestroy = 10)
{
	//new id = item_TypeTotal;

	//item_TypeTotal++;

	//InvObjectData[id][E_INV_ITEMID] = type;
	format(InvObjectData[id][E_INV_NAME], 29, name);

	InvObjectData[id][E_INV_ITEMID] = id;
	InvObjectData[id][E_INV_TYPE] = type;
	InvObjectData[id][E_INV_EXTRADATA] = extradata;
	InvObjectData[id][E_INV_ENAME] = ename;
	InvObjectData[id][E_INV_OBJECTMID] = objectmid;
	InvObjectData[id][E_INV_SIZE] = size;
	InvObjectData[id][E_INV_COLOR1] = color1;
	InvObjectData[id][E_INV_COLOR2] = color2;
	InvObjectData[id][E_INV_PointToRot] = PointToRot;
	InvObjectData[id][E_INV_DATAEXTRA] = extratype;

	InvObjectData[id][E_INV_Attached] = Attached;
	InvObjectData[id][E_INV_SlotAttach] = SlotAttach;
	InvObjectData[id][E_INV_UseAnimCarry] = UseAnimCarry;

	InvObjectData[id][invarea_ModelOffset] = ModelOffset;
	InvObjectData[id][invarea_AreaitOffset] = AreaitOffset;

	InvObjectData[id][E_INV_TypeInfo] = typeinfo;
	InvObjectData[id][E_INV_TimeDestroy] = timedestroy;
	return id;
}

//
RemoveItemWorldTypeForDB(type, amount)
{
	switch(InvObjectData[type][E_INV_TYPE])
	{
		case INV_TYPE_PHONE:
		{
			await mysql_aquery_s(conexion, str_format("DELETE FROM `lac_phone` WHERE `number_phone`=%d;", type, amount));
		}
		case INV_TYPE_BACKPAD:
		{
			mysql_tquery_s(conexion, str_format("DELETE FROM `lac_item_storage` WHERE `id`=%d;", amount));
			if(map_has_key(ServerGeneral_StorageMap, amount))
			{
				map_remove_deep(ServerGeneral_StorageMap, amount);
			}
		}
	}
	//mysql_tquery_s(conexion, str_format("SELECT * FROM `lac_servergral_witems` WHERE `itemid`=%d=%d;", type, amount));
}