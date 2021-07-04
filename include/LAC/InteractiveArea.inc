/*

* Copyright (c) 2018, Blaster Bluestudios.
* Créditos a la comunidad de SA-MP.

*/
#if defined _INTERACTIVEAREA_INCLUDED
	#endinput
#endif

#include <rBits>
#include <YSI_Coding\y_hooks>

#define _INTERACTIVEAREA_INCLUDED

#define MAX_AREAS_INTERACTIVE (8192)

// Vehicles

#define MAX_AREAS_INTERACTIVE_VEH (500)

#define MAX_AREAS_IT_INRANGE (8)
#define INTERACTIVE_AREA_STREAMER (20)
#define INVALID_AREAIT_ID (-1)

#define OO_TYPE(%6,%7)%0[%1] (_:@vb:@va:%6:%7@%0[%1]
#define @va:%6:%7@%0[%1][@%2] %7%0[%1])[E_%6_%0_%2]
#define @vb:@va:%6:%7@%0[%1][%2][@%3] %7%0[%1])[%2][E_%6_%0_%3]

forward CreateInteractiveArea(Float:x, Float:y, Float:z, const text[]="", vw = 0, interior = 0, Float:size = 1.0, type = 0,typeg = 0, bool:label = false, 
	const labelstr[] = "", colourlabel = 0xFFFFFFF0, Float:stream = 4.0, testlos = true, player = -1);
forward Float:absoluteangle_func(Float:angle);
forward Float:GetAngleToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY);
forward Float:Distance_func(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
forward Float:GetPlayerAngleToIT(playerid, areaid);
forward Float:GetITAngleToPlayer(playerid, areaid);

enum {
	KEY_AREAIT_TYPE_ENTER,
	KEY_AREAIT_TYPE_YES,
	KEY_AREAIT_TYPE_COLLECT,

	KEY_AREAIT_TYPE_V_YES,
}

#define Areas. OO_TYPE(AREASIT,Areas)

enum E_AREASIT_DATA {
	AreaIT_TypeG,
	area_it_Text[25 char],
	Float:AreaIT_X,
	Float:AreaIT_Y,
	Float:AreaIT_Z,
	Float:AreaIT_Size,
	AreaIT_VW,
	AreaIT_Int,
	AreaIT_Area,
	areait_Type,

	areait_ExtraData,

	Text3D:areait_Label
}
new AreasInteractive[MAX_AREAS_INTERACTIVE][E_AREASIT_DATA];

new rBit1:AreasInteractiveState<MAX_AREAS_INTERACTIVE>;

enum e_areasit_range_data
{
			AreaIT_ID,
Float:		AreaIT_distance
}

new Iterator:Index_AreaIT<MAX_AREAS_INTERACTIVE>;

new
			areaIT_Near[MAX_PLAYERS][MAX_AREAS_IT_INRANGE],
   Iterator:areaIT_NearIndex[MAX_PLAYERS]<MAX_AREAS_IT_INRANGE>;

CreateInteractiveArea(Float:x, Float:y, Float:z, const text[]="", vw = 0, interior = 0, Float:size = 1.0, type = 0,typeg = 0, bool:label = false, 
	const labelstr[] = "", colourlabel = 0xFFFFFFF0, Float:stream = 4.0, testlos = true, player = -1)
{
	new id = Iter_Free(Index_AreaIT);

	AreasInteractive[id][AreaIT_Area] = CreateDynamicSphere(x, y, z, size, vw, interior, player);

	AreasInteractive[id][AreaIT_X] = x;
	AreasInteractive[id][AreaIT_Y] = y;
	AreasInteractive[id][AreaIT_Z] = z;
	AreasInteractive[id][AreaIT_VW] = vw;
	AreasInteractive[id][AreaIT_Int] = interior;
	AreasInteractive[id][AreaIT_Size] = size;
	AreasInteractive[id][AreaIT_TypeG] = typeg;
	AreasInteractive[id][areait_Type] = type;

	//Areas.Interactive[id][@TypeS] = PLAYER_STATE_ONFOOT;

	strpack(AreasInteractive[id][area_it_Text], text);


	new array[2];
	array[0] = INTERACTIVE_AREA_STREAMER;
	array[1] = id;
	Streamer_SetArrayData(STREAMER_TYPE_AREA, AreasInteractive[id][AreaIT_Area], E_STREAMER_EXTRA_ID, array);

	Iter_Add(Index_AreaIT, id);

	if(label == true)
	{
		AreasInteractive[id][areait_Label] = CreateDynamic3DTextLabel(labelstr, colourlabel, x, y, z, stream, .testlos = testlos, .worldid = vw, .interiorid = interior);
	}
	return id;
}

CreateAreaSphereForVehicles(Float:x, Float:y, Float:z, Float:size, const text[], interior, vw, type = 0, typek = 0)
{
	new id = Iter_Free(Index_AreaIT);

	AreasInteractive[id][AreaIT_Area] = CreateDynamicSphere(x, y, z, size, vw, interior);

	AreasInteractive[id][AreaIT_TypeG] = typek;
	AreasInteractive[id][areait_Type] = type;

	//Areas.Interactive[id][@TypeS] = state_player;
	strpack(AreasInteractive[id][area_it_Text], text);

	new array[2];
	array[0] = INTERACTIVE_AREA_STREAMER;
	array[1] = id;

	Iter_Add(Index_AreaIT, id);

	Streamer_SetArrayData(STREAMER_TYPE_AREA, AreasInteractive[id][AreaIT_Area], E_STREAMER_EXTRA_ID, array);	
}

DestroyInteractiveArea(areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	foreach(new i : Player)
	{
		if(IsPlayerInDynamicArea(i, AreasInteractive[areaid][AreaIT_Area]))
			callback_LeaveDynamicArea(i, AreasInteractive[areaid][AreaIT_Area]);
	}

	DestroyDynamicArea(AreasInteractive[areaid][AreaIT_Area]);

	if(IsValidDynamic3DTextLabel(AreasInteractive[areaid][areait_Label]))
		DestroyDynamic3DTextLabel(AreasInteractive[areaid][areait_Label]);

	AreasInteractive[areaid][AreaIT_Area]		= 0;
	AreasInteractive[areaid][areait_Label]		= Text3D:INVALID_3DTEXT_ID;

	AreasInteractive[areaid][AreaIT_X]		= 0.0;
	AreasInteractive[areaid][AreaIT_Y]		= 0.0;
	AreasInteractive[areaid][AreaIT_Z]		= 0.0;
	AreasInteractive[areaid][AreaIT_Size]	= 0.0;
	AreasInteractive[areaid][AreaIT_VW]		= 0;
	AreasInteractive[areaid][AreaIT_Int]	= 0;

	Iter_Remove(Index_AreaIT, areaid);
	return 1;
}

stock SetAreaITLabel(areaid, const text[], colour = 0xFFFFFFF0, Float:range = 4.0, Float:reducez = 0.0, testlos = true)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	if(IsValidDynamic3DTextLabel(AreasInteractive[areaid][areait_Label]))
	{
		UpdateDynamic3DTextLabelText(AreasInteractive[areaid][areait_Label], colour, text);
		return 2;
	}

	AreasInteractive[areaid][areait_Label] = CreateDynamic3DTextLabel(text, colour,
		AreasInteractive[areaid][AreaIT_X],
		AreasInteractive[areaid][AreaIT_Y],
		AreasInteractive[areaid][AreaIT_Z] - reducez,
		range, _, _, testlos,
		AreasInteractive[areaid][AreaIT_VW], AreasInteractive[areaid][AreaIT_Int], _, range);

	return 1;
}

stock GetAreaITPos(areaid, &Float:x, &Float:y, &Float:z)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	x = AreasInteractive[areaid][AreaIT_X];
	y = AreasInteractive[areaid][AreaIT_Y];
	z = AreasInteractive[areaid][AreaIT_Z];

	return 1;
}

stock bool:IsValidAreaIT(areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return false;

	return true;
}

/*GetInteractiveArea(playerid)
{
	if(Iter_Count(areaIT_NearIndex[playerid]) > 0)
		{
			if(!IsPlayerInAnyDynamicArea(playerid))
			{
				printf("[WARNING] Player %d is not in areas but list isn't empty. Purging list.", playerid);
				Iter_Clear(areaIT_NearIndex[playerid]);
			}

			new
				areaid,
				Float:x,
				Float:y,
				Float:z,
				Float:a,
				Float:distance,
				list[MAX_AREAS_IT_INRANGE][e_areasit_range_data],
				index;

			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);

			foreach(new i : areaIT_NearIndex[playerid])
			{
				if(index >= MAX_AREAS_IT_INRANGE - 1)
					break;

				areaid = areaIT_Near[playerid][i];

				distance = Distance_func(x, y, z, AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y], AreasInteractive[areaid][AreaIT_Z]);
				angle_pos = GetAngleToPoint();

				if(distance > AreasInteractive[areaid][AreaIT_Size])
					continue;

				if(!(AreasInteractive[areaid][AreaIT_Z] - AreasInteractive[areaid][btn_size] <= z <= AreasInteractive[areaid][AreaIT_Z] + AreasInteractive[areaid][AreaIT_Size]))
					continue;

				if(!AreasInteractive[areaid][AreaIT_Z])


				list[index][AreaIT_ID] = areaid;
				list[index][AreaIT_distance] = distance;

				index++;
			}
			SortAreaIT(list, 0, index);
			for(new i = index - 1; i >= 0; i--)
			{
				return list[i][AreaIT_ID];
					break;
			}
		}
	}
	return -1;
}*/

SortAreaIT(array[][e_areasit_range_data], left, right)
{
	new
		tmp_left = left,
		tmp_right = right,
		Float:pivot = array[(left + right) / 2][AreaIT_distance],
		areaid,
		Float:distance;

	while(tmp_left <= tmp_right)
	{
		while(array[tmp_left][AreaIT_distance] > pivot)
			tmp_left++;

		while(array[tmp_right][AreaIT_distance] < pivot)
			tmp_right--;

		if(tmp_left <= tmp_right)
		{
			areaid = array[tmp_left][AreaIT_ID];
			array[tmp_left][AreaIT_ID] = array[tmp_right][AreaIT_ID];
			array[tmp_right][AreaIT_ID] = areaid;

			distance = array[tmp_left][AreaIT_distance];
			array[tmp_left][AreaIT_distance] = array[tmp_right][AreaIT_distance];
			array[tmp_right][AreaIT_distance] = distance;

			tmp_left++;
			tmp_right--;
		}
	}

	if(left < tmp_right)
		SortAreaIT(array, left, tmp_right);

	if(tmp_left < right)
		SortAreaIT(array, tmp_left, right);
}
/*stock Float:SetPlayerLookAt(playerid, Float:x, Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	return Pa;
}*/

/*hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	if(newkeys & 16 || newkeys & KEY_WALK)
	{
		if(!IsPlayerInAnyVehicle(playerid) && Iter_Count(areaIT_NearIndex[playerid]) > 0)
		{
			if(!IsPlayerInAnyDynamicArea(playerid))
			{
				printf("[WARNING] Player %d is not in areas but list isn't empty. Purging list.", playerid);
				Iter_Clear(areaIT_NearIndex[playerid]);
			}

			new
			areaid,
			Float:x,
			Float:y,
			Float:z,
			Float:distance,
			list[MAX_AREAS_IT_INRANGE][e_areasit_range_data],
			index;

			GetPlayerPos(playerid, x, y, z);

			foreach(new i : areaIT_NearIndex[playerid])
			{
				if(index >= MAX_AREAS_IT_INRANGE - 1)
					break;

				areaid = areaIT_Near[playerid][i];

				distance = Distance_func(x, y, z, AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y], AreasInteractive[areaid][AreaIT_Z]);

				if(distance > AreasInteractive[areaid][AreaIT_Size])
					continue;

				if(!(AreasInteractive[areaid][AreaIT_Z] - AreasInteractive[areaid][AreaIT_Size] <= z <= AreasInteractive[areaid][AreaIT_Z] + AreasInteractive[areaid][AreaIT_Size]))
					continue;

			//if(ConvertDecimalToKeyArea(AreasInteractive[areaid][AreaIT_TypeG]) != key)
			//	continue;

				list[index][AreaIT_ID] = areaid;
				list[index][AreaIT_distance] = distance;

				index++;
			}

			SortAreaIT(list, 0, index);

			for(new i = index - 1; i >= 0; i--)
			{
				printf("Test: %d", i);
				if(Internal_OnPressAreaIT(playerid, list[i][AreaIT_ID]))
					break;
			}
		}
	}
	return 0;
}*/

Internal_OnPressAreaIT(playerid, areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	if(CallLocalFunction("OnPressInteractiveArea", "dd", playerid, areaid))
			return 1;
	return 0;
}

CheckPlayerPressInAreaIT(playerid, key)
{
	if(!IsPlayerInAnyVehicle(playerid) && Iter_Count(areaIT_NearIndex[playerid]) > 0)
	{
		if(!IsPlayerInAnyDynamicArea(playerid))
		{
			printf("[WARNING] Player %d is not in areas but list isn't empty. Purging list.", playerid);
			Iter_Clear(areaIT_NearIndex[playerid]);
		}

		new
		areaid,
		Float:x,
		Float:y,
		Float:z,
		Float:distance,
		list[MAX_AREAS_IT_INRANGE][e_areasit_range_data],
		index;

		GetPlayerPos(playerid, x, y, z);

		foreach(new i : areaIT_NearIndex[playerid])
		{
			if(index >= MAX_AREAS_IT_INRANGE - 1)
				break;

			areaid = areaIT_Near[playerid][i];

			distance = Distance_func(x, y, z, AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y], AreasInteractive[areaid][AreaIT_Z]);

			if(distance > AreasInteractive[areaid][AreaIT_Size])
				continue;

			if(!(AreasInteractive[areaid][AreaIT_Z] - AreasInteractive[areaid][AreaIT_Size] <= z <= AreasInteractive[areaid][AreaIT_Z] + AreasInteractive[areaid][AreaIT_Size]))
				continue;

			if(ConvertDecimalToKeyArea(AreasInteractive[areaid][AreaIT_TypeG]) != key)
				continue;

			list[index][AreaIT_ID] = areaid;
			list[index][AreaIT_distance] = distance;

			index++;
		}

		SortAreaIT(list, 0, index);

		for(new i = index - 1; i >= 0; i--)
		{
			return list[i][AreaIT_ID];

		}
	}
	return -1;
}

CheckPlayerPressInAreaIT_Ex(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid) && Iter_Count(areaIT_NearIndex[playerid]) > 0)
	{
		if(!IsPlayerInAnyDynamicArea(playerid))
		{
			printf("[WARNING] Player %d is not in areas but list isn't empty. Purging list.", playerid);
			Iter_Clear(areaIT_NearIndex[playerid]);
		}

		new
		areaid,
		Float:x,
		Float:y,
		Float:z,
		Float:distance,
		list[MAX_AREAS_IT_INRANGE][e_areasit_range_data],
		index;

		GetPlayerPos(playerid, x, y, z);

		foreach(new i : areaIT_NearIndex[playerid])
		{
			if(index >= MAX_AREAS_IT_INRANGE - 1)
				break;

			areaid = areaIT_Near[playerid][i];

			distance = Distance_func(x, y, z, AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y], AreasInteractive[areaid][AreaIT_Z]);

			if(distance > AreasInteractive[areaid][AreaIT_Size])
				continue;

			if(!(AreasInteractive[areaid][AreaIT_Z] - AreasInteractive[areaid][AreaIT_Size] <= z <= AreasInteractive[areaid][AreaIT_Z] + AreasInteractive[areaid][AreaIT_Size]))
				continue;

			list[index][AreaIT_ID] = areaid;
			list[index][AreaIT_distance] = distance;

			index++;
		}

		SortAreaIT(list, 0, index);

		for(new i = index - 1; i >= 0; i--)
		{
			return list[i][AreaIT_ID];

		}
	}
	return -1;
}

ConvertDecimalToKeyArea(key)
{
	switch(key)
	{
		case KEY_AREAIT_TYPE_ENTER:
		{
			return KEY_SECONDARY_ATTACK;
		}
		case KEY_AREAIT_TYPE_YES:
		{
			return KEY_YES;
		}
		case KEY_AREAIT_TYPE_COLLECT:
		{
			return KEY_WALK;
		}
	}
	return -1;
}

GetInteractiveAreaID_Ex(playerid)
{
	if(!IsPlayerConnected(playerid))
		return INVALID_AREAIT_ID;

	if(Iter_Count(areaIT_NearIndex[playerid]) == 0)
		return INVALID_AREAIT_ID;

	new
	Float:x,
	Float:y,
	Float:z,
	curid,
	closestid = -1,
	Float:curdistance,
	/*Float:curangle,*/
	Float:closetsdistance = 99999.9;
	/*Float:angle;*/

	GetPlayerPos(playerid, x, y, z);
/*	GetPlayerFacingAngle(playerid, angle);*/

	foreach(new i : areaIT_NearIndex[playerid])
	{
		curid = areaIT_Near[playerid][i];

		curdistance = Distance_func(x, y, z, AreasInteractive[curid][AreaIT_X], AreasInteractive[curid][AreaIT_Y], AreasInteractive[curid][AreaIT_Z]);

		if(curdistance < closetsdistance)
		{
			closetsdistance = curdistance;
			closestid = curid;
		}
	}
	return closestid;
}


hook OnPlayerEnterDynArea(playerid, areaid)
{
	if(Iter_Count(areaIT_NearIndex[playerid]) < MAX_AREAS_IT_INRANGE)
	{
		new data[2];
		
		Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 2);
		if(data[0] == INTERACTIVE_AREA_STREAMER)
		{
			if(Iter_Contains(Index_AreaIT, data[1]))
			{
				new cell = Iter_Free(areaIT_NearIndex[playerid]);

				areaIT_Near[playerid][cell] = data[1];
				Iter_Add(areaIT_NearIndex[playerid], cell);
				CallLocalFunction("OnPlayerEnterITArea", "dd", playerid, data[1]);
			}
		}
	}
}

hook OnPlayerLeaveDynArea(playerid, areaid)
{
	callback_LeaveDynamicArea(playerid, areaid);
}

callback_LeaveDynamicArea(playerid, areaid)
{
	if(!IsValidDynamicArea(areaid)) { return 1; }

	if(Iter_Count(areaIT_NearIndex[playerid]) == 0) { return 2; }

	new data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 2);
	
	if(data[0] != INTERACTIVE_AREA_STREAMER) { return 4; }

	if(!Iter_Contains(Index_AreaIT, data[1])) { return 3; }

	CallLocalFunction("OnPlayerLeaveITArea", "dd", playerid, data[1]);
	foreach(new i : areaIT_NearIndex[playerid])
	{

		if(areaIT_Near[playerid][i] == data[1])
		{
			Iter_Remove(areaIT_NearIndex[playerid], i);
			break;
		}
	}
	return 0;
}

GetInteractiveAreaType(areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid)) return -1;
	return AreasInteractive[areaid][areait_Type];
}

stock GetInteractiveAreaTypeG(areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid)) return -1;
	return AreasInteractive[areaid][AreaIT_TypeG];
}

GetInteractiveAreaText(areaid, text[])
{
	if(!Iter_Contains(Index_AreaIT, areaid)) return -1;
	//text[0] = EOS;

	new temp[25];
	strunpack(temp, AreasInteractive[areaid][area_it_Text]);
	strcat(text, temp, 58);
	//printf("String3: %s", text);
	return 1;
}

// Extra Data - Last Modified 11/03/2019

stock SetInteractiveExtraData(areaid, data)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	AreasInteractive[areaid][areait_ExtraData] = data;

	//#if defined DEBUG_LABELS_BUTTON
	//	UpdateButtonDebugLabel(areaid);
	//#endif

	return 1;
}

stock SetInteractiveAreaState(areaid, data)
{
	if(!Iter_Contains(Index_AreaIT, areaid)) 
		return 0;

	rBit1_Set(AreasInteractiveState, areaid, true);
	//Areas.Interactive[areaid][@TypeS] = data;

	return 1;
}

stock GetInteractiveExtraData(areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	return AreasInteractive[areaid][areait_ExtraData];
}

stock GetInteractiveAreaState(areaid, data)
{
	if(!Iter_Contains(Index_AreaIT, areaid)) 
		return 0;

	return rBit1_Set(AreasInteractiveState, areaid, false);
	//Areas.Interactive[areaid][@TypeS] = data;
}

stock GetPlayerCountAreaIT(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(Iter_Count(areaIT_NearIndex[playerid]) == 0)
		return 0;

	return Iter_Count(areaIT_NearIndex[playerid]);
}

// Position

stock IsPlayerInPosAreaIT(playerid, areaid, Float:range)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0;

	new Float:x = AreasInteractive[areaid][AreaIT_X];
	new Float:y = AreasInteractive[areaid][AreaIT_Y];
 	new Float:z = AreasInteractive[areaid][AreaIT_Z];

	if(IsPlayerInRangeOfPoint(playerid, range, x,y,z)) return 1;

	return 0;
}

// Angles - Last Modified 11/03/2019

stock Float:GetPlayerAngleToIT(playerid, areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0.0;

	if(!IsPlayerConnected(playerid))
		return 0.0;

	new
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

	return GetAngleToPoint(x, y, AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y]);
}

stock Float:GetITAngleToPlayer(playerid, areaid)
{
	if(!Iter_Contains(Index_AreaIT, areaid))
		return 0.0;

	if(!IsPlayerConnected(playerid))
		return 0.0;

	new
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

	return GetAngleToPoint(AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y], x, y);
}

stock IsItAngleZValid(playerid, areaid, Float:hitz = 0.3)
{
	new Float:curangle, Float:angle, Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	curangle = GetAngleToPoint(x,y,AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y]);

	if((curangle-80.0) <= angle <= (curangle+80.0) && ((z - AreasInteractive[areaid][AreaIT_Z]) < hitz)) return 1;
			
	return 0;
}

stock IsInteractiveAreaAngleValid(playerid, areaid)
{
	new Float:curangle, Float:angle, Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	curangle = GetAngleToPoint(x,y,AreasInteractive[areaid][AreaIT_X], AreasInteractive[areaid][AreaIT_Y]);

	if((curangle-70.0) <= angle <= (curangle+70.0)) return 1;
			
	return 0;
}