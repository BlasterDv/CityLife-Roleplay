static Pool:Pool_DynamicGui[MAX_PLAYERS];

static enum _:E_DYNAMICSGUI_DATA {
	E_DYNAMICSGUI_DATA_Item,
    E_DYNAMICSGUI_DATA_Extra
};

stock DynamicDgui_Start(playerid)
{
	for(new i = 0; i < MAX_DGUI_MAX_VARS; i++)
	{ 
		dynamic_dgui[playerid][i] = INVALID_DGUI_VAR_INVALID;
	}
	return 1;
}

stock DynamicDgui_GetFreeRow(playerid)
{
	for(new i = 0; i < MAX_DGUI_MAX_VARS; i++)
	{
		if(dynamic_dgui[playerid][i] == INVALID_DGUI_VAR_INVALID)
		{
			return i;
		}
	}
	return -1;
}

stock DynamicDgui_AddVar(playerid, value)
{
	new freeslot = DynamicDgui_GetFreeRow(playerid);
	dynamic_dgui[playerid][freeslot] = value;
	return 1;
}

stock DynamicDgui_AddVarEx(playerid, slot, value)
{
	dynamic_dgui[playerid][slot] = value;
	return 1;
}


stock DynamicDgui_GetValue(playerid, value)
{
	return dynamic_dgui[playerid][value];
}

// Pools

stock DynamicSGUI_Start(playerid)
{
	if(pool_valid(Pool_DynamicGui[playerid]))
	{
	  pool_delete(Pool_DynamicGui[playerid]);
	}
	return 1;
}

stock DynamicSGUI_Add(playerid, item, extra = -1)
{
	if(!pool_valid(Pool_DynamicGui[playerid]))
	{
		Pool_DynamicGui[playerid] = pool_new();	
	}
	new data[E_DYNAMICSGUI_DATA];
	data[E_DYNAMICSGUI_DATA_Item] = item;
	data[E_DYNAMICSGUI_DATA_Extra] = extra;
	pool_add_arr(Pool_DynamicGui[playerid], data);
	return 1;
}


stock DynamicSGUI_GetValue(playerid, id, index)
{
	new data[E_DYNAMICSGUI_DATA];
	if(pool_valid(Pool_DynamicGui[playerid]) && pool_has(Pool_DynamicGui[playerid], id))
	{
		pool_get_arr(Pool_DynamicGui[playerid], id, data);

		return data[index];
	}
	return -1;
}

stock DynamicSGUI_ValidItem(playerid, id)
{
	return pool_valid(Pool_DynamicGui[playerid]) && pool_has(Pool_DynamicGui[playerid], id);
}

