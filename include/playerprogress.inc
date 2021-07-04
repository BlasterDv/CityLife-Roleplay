/**
 *  Progress Bar 1.3.1.0
 *  Copyright 2007-2010 Infernus' Group,
 *  Flávio Toribio (flavio_toibio@hotmail.com)
 *
 *  Updated by Southclaw for use with the PlayerTextDraws of 0.3e
 *  Updated by Southclaw again with some minor fixes and improvements
 * Actualizado por Blaster. 29-11-2018.
 *
 */

#if defined _playerprogress_included
	#endinput
#endif

#if !defined _samp_included
	#tryinclude <a_samp>
	#if !defined _samp_included
		#error could not locate a_samp.inc file, please check your server includes
	#endif
#endif

#define _playerprogress_included
#define _playerprogress_version 0x1310

#define MAX_PLAYER_BARS             (MAX_PLAYER_TEXT_DRAWS / 3)
#define MAX_GLOBAL_BARS				(40)
#define INVALID_PLAYER_BAR_VALUE    (Float:0xFFFFFFFF)
#define INVALID_PLAYER_BAR_ID       (PlayerBar:-1)
#define INVALID_GLOBAL_BAR_ID       (GlobalBar:-1)

#define pbar_percent(%1,%2,%3,%4) ((%1 - 1.2) + ((((%1 + 1.2 + %2 - 2.0) - %1) / %3) * %4))
// Global
#define gbar_percent(%1,%2,%3,%4)	((%1 - 3.0) + (((((%1 - 1.0) + %2) - %1) / %3) * %4))
//gbar_percent(x, width, max, value)

/* Pawno/Infernus Pawn Editor function list
native PlayerBar:CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0);
native DestroyPlayerProgressBar(playerid, PlayerBar:barid);
native ShowPlayerProgressBar(playerid, PlayerBar:barid);
native HidePlayerProgressBar(playerid, PlayerBar:barid);
native SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value);
native Float:GetPlayerProgressBarValue(playerid, PlayerBar:barid);
native SetPlayerProgressBarMaxValue(playerid, PlayerBar:barid, Float:max);
native SetPlayerProgressBarColor(playerid, PlayerBar:barid, color);
native UpdatePlayerProgressBar(playerid, PlayerBar:barid);
*/

forward PlayerBar:CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0, type);
forward Float:GetPlayerProgressBarValue(playerid, PlayerBar:barid);
// Global
forward GlobalBar:CreateProgressBar(Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0, type=0);
forward Float:GetProgressBarValue(GlobalBar:barid);

enum E_BAR_DATA
{
Float:		pbar_x,
Float:		pbar_y,
Float:		pbar_w,
Float:		pbar_h,
Float:		pbar_m,
Float:		pbar_v,
			pbar_type,
bool:		pbar_valid
}

enum E_BAR_TEXT_DRAW
{
//PlayerText:	pbar_textdraw1,
PlayerText:	pbar_textdraw2,
PlayerText:	pbar_textdraw3
}


enum E_GBAR_DATA
{
	Float:gbar_x,
	Float:gbar_y,
	Float:gbar_w,
	Float:gbar_h,
	Float:gbar_m,
	Float:gbar_v,
	Text:gbar_t1,
	Text:gbar_t2,
	gbar_color,
	pbar_type,
	bool:gbar_created
}

static gbar_Data[MAX_GLOBAL_BARS][E_GBAR_DATA];

static
			pbar_Data[MAX_PLAYERS][MAX_PLAYER_BARS][E_BAR_DATA],
			pbar_TextDraw[MAX_PLAYERS][MAX_PLAYER_BARS][E_BAR_TEXT_DRAW];

stock PlayerBar:CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width = 55.5, Float:height = 3.2, color, Float:max = 100.0, type)
{
	new barid;

	for(barid = 0; barid < MAX_PLAYER_BARS; barid++)
	{
		if(!pbar_Data[playerid][barid][pbar_valid])
			break;
	}

	if(barid == MAX_PLAYER_BARS)
		return INVALID_PLAYER_BAR_ID;

	pbar_TextDraw[playerid][barid][pbar_textdraw2] = PlayerText:INVALID_TEXT_DRAW;	
	pbar_TextDraw[playerid][barid][pbar_textdraw3] = PlayerText:INVALID_TEXT_DRAW;

	switch(type)
	{
		case 1: 
		{

			pbar_TextDraw[playerid][barid][pbar_textdraw3] = CreatePlayerTextDraw(playerid, x + 1.2, y + 1.45, "_");
			PlayerTextDrawTextSize      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], pbar_percent(x, width, max, 1.0), 0.0);
			PlayerTextDrawLetterSize    (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], 1.0, height / 10 - 0.35);
			PlayerTextDrawBoxColor      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], color);
			pbar_Data[playerid][barid][pbar_type] = 1;
		}
		case 2: 
		{
			pbar_TextDraw[playerid][barid][pbar_textdraw2] = CreatePlayerTextDraw(playerid, x /*+ 1.2*/, y /*+ 1.45*/, "_");
			PlayerTextDrawUseBox        (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw2], 1);
			PlayerTextDrawTextSize      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw2], x + width - 2.0, 0.0);
			PlayerTextDrawLetterSize    (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw2], 1.0, height / 10 - 0.35);
			PlayerTextDrawBoxColor      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw2], (color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));

			pbar_TextDraw[playerid][barid][pbar_textdraw3] = CreatePlayerTextDraw(playerid, x /*+ 1.2*/, y /*+ 1.45*/, "_");
			PlayerTextDrawTextSize      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], pbar_percent(x, width, max, 1.0), 0.0);
			PlayerTextDrawLetterSize    (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], 1.0, height / 10 - 0.35);
			PlayerTextDrawBoxColor      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw3], color);
			pbar_Data[playerid][barid][pbar_type] = 2;
		}
	}
	pbar_Data[playerid][barid][pbar_x] = x;
	pbar_Data[playerid][barid][pbar_y] = y;
	pbar_Data[playerid][barid][pbar_w] = width;
	pbar_Data[playerid][barid][pbar_h] = height;
	pbar_Data[playerid][barid][pbar_m] = max;
	pbar_Data[playerid][barid][pbar_valid] = true;

	return PlayerBar:barid;
}

/*stock PlayerBar:CreateGlobalProgressBar(playerid, Float:x, Float:y, Float:width = 55.5, Float:height = 3.2, color, Float:max = 100.0, type)
{
	pbar_TextDraw[barid][pbar_textdraw1] = TextDrawCreate(x, y, "_");
	PlayerTextDrawUseBox        (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw1], 1);
	PlayerTextDrawTextSize      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw1], x + width, 0.0);
	PlayerTextDrawLetterSize    (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw1], 1.0, height / 10);
	PlayerTextDrawBoxColor      (playerid, pbar_TextDraw[playerid][barid][pbar_textdraw1], 0x00000000 | (color & 0x000000FF));
	pbar_Data[playerid][barid][pbar_type] = 1;

}*/

stock DestroyPlayerProgressBar(playerid, PlayerBar:barid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	if(pbar_Data[playerid][_:barid][pbar_type] == 1)
	{
		PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);
	}
	else
	{
		PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw2]);
		PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);		
	}

	pbar_Data[playerid][_:barid][pbar_x] = 0.0;
	pbar_Data[playerid][_:barid][pbar_y] = 0.0;
	pbar_Data[playerid][_:barid][pbar_w] = 0.0;
	pbar_Data[playerid][_:barid][pbar_h] = 0.0;
	pbar_Data[playerid][_:barid][pbar_m] = 0.0;
	pbar_Data[playerid][_:barid][pbar_v] = 0.0;
	pbar_Data[playerid][_:barid][pbar_valid] = false;

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	for(new i; i < MAX_PLAYER_BARS; i++)
		pbar_Data[playerid][_:i][pbar_valid] = false;

	#if defined pgbar_OnPlayerDisconnect
		return pgbar_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
 
#define OnPlayerDisconnect pgbar_OnPlayerDisconnect
#if defined pgbar_OnPlayerDisconnect
	forward pgbar_OnPlayerDisconnect(playerid, reason);
#endif

stock ShowPlayerProgressBar(playerid, PlayerBar:barid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	if(pbar_Data[playerid][_:barid][pbar_type] == 1)
	{
		PlayerTextDrawShow(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);
	}
	else
	{
		PlayerTextDrawShow(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw2]);
		PlayerTextDrawShow(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);

	}
	return 1;
}

stock HidePlayerProgressBar(playerid, PlayerBar:barid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	if(pbar_Data[playerid][_:barid][pbar_type] == 1)
	{
		PlayerTextDrawHide(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);
	}
	else
	{
		PlayerTextDrawHide(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw2]);
		PlayerTextDrawHide(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3]);

	}
	return 1;
}

stock SetPlayerProgressBarPos(playerid, PlayerBar:barid, Float:x, Float:y)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	if(pbar_Data[playerid][_:barid][pbar_type] == 1)
	{
		PlayerTextDrawSetPos(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3], x,y);
	}
	else
	{
		PlayerTextDrawSetPos(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw2], x,y);
		PlayerTextDrawSetPos(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3], x,y);

	}
	return 1;
}


stock SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	value = (value < 0.0) ? (0.0) : (value > pbar_Data[playerid][_:barid][pbar_m]) ? (pbar_Data[playerid][_:barid][pbar_m]) : (value);

	PlayerTextDrawUseBox(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3], value > 0.0);

	pbar_Data[playerid][_:barid][pbar_v] = value;

	PlayerTextDrawTextSize(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3],
		pbar_percent(pbar_Data[playerid][_:barid][pbar_x] + 4, pbar_Data[playerid][_:barid][pbar_w] - 12, pbar_Data[playerid][_:barid][pbar_m], value), 0.0);

	return 1;
}

stock Float:GetPlayerProgressBarValue(playerid, PlayerBar:barid)
{
	if(!IsPlayerConnected(playerid))
		return INVALID_PLAYER_BAR_VALUE;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return INVALID_PLAYER_BAR_VALUE;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return INVALID_PLAYER_BAR_VALUE;

	return pbar_Data[playerid][_:barid][pbar_v];
}

stock SetPlayerProgressBarMaxValue(playerid, PlayerBar:barid, Float:max)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	pbar_Data[playerid][_:barid][pbar_m] = max;
	SetPlayerProgressBarValue(playerid, barid, pbar_Data[playerid][_:barid][pbar_v]);

	return 1;
}

stock SetPlayerProgressBarColor(playerid, PlayerBar:barid, color)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(PlayerBar:-1 < barid < PlayerBar:MAX_PLAYER_BARS))
		return 0;

	if(!pbar_Data[playerid][_:barid][pbar_valid])
		return 0;

	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw1], 0x00000000 | (color & 0x000000FF));

	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw2], (color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));

	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_textdraw3], color);

	return 1;
}

stock UpdatePlayerProgressBar(playerid, PlayerBar:barid)
{
	return ShowPlayerProgressBar(playerid, barid);
}

// Global

stock GlobalBar:CreateProgressBar(Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0, type = 0)
{
	new
		barid;

	for(barid = 0; barid < sizeof gbar_Data; ++barid)
		if(!gbar_Data[barid][gbar_created]) break;

	if(gbar_Data[barid][gbar_created] || barid == sizeof(gbar_Data[]))
		return INVALID_GLOBAL_BAR_ID;

	gbar_Data[barid][gbar_t1] = Text:INVALID_TEXT_DRAW;
	gbar_Data[barid][gbar_t2] = Text:INVALID_TEXT_DRAW;
	
	new Text:in_t;
	if(type == 1)
	{
		in_t = gbar_Data[barid][gbar_t1] = TextDrawCreate(x, y, "_"); //Old 1.15, 1.15
		TextDrawUseBox		(in_t, 1);
		TextDrawTextSize	(in_t, x + width - /*2.0*/4.0, 0.0);
		TextDrawLetterSize	(in_t, 1.0, height / 10 - 0.35);
		TextDrawBoxColor	(in_t, (color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));
	}

	in_t = gbar_Data[barid][gbar_t2] = TextDrawCreate(x, y, "_"); //Old 1.6
	TextDrawTextSize	(in_t, gbar_percent(x + 1.2, width, max, 1.0), 0.0);
	TextDrawLetterSize	(in_t, 1.0, height / 10 - 0.35);
	TextDrawBoxColor	(in_t, color);

	gbar_Data[barid][gbar_x] = x;
	gbar_Data[barid][gbar_y] = y;
	gbar_Data[barid][gbar_w] = width;
	gbar_Data[barid][gbar_h] = height;
	gbar_Data[barid][gbar_m] = max;
	gbar_Data[barid][gbar_color] = color;
	gbar_Data[barid][gbar_created] = true;
	return GlobalBar:barid;
}

stock DestroyProgressBar(Bar:barid)
{
	if(barid != INVALID_GLOBAL_BAR_ID && GlobalBar:-1 < barid < GlobalBar:MAX_GLOBAL_BARS)
	{
		if(!gbar_Data[_:barid][gbar_created])
			return 0;

		TextDrawDestroy(gbar_Data[_:barid][gbar_t1]);
		TextDrawDestroy(gbar_Data[_:barid][gbar_t2]);
		TextDrawDestroy(gbar_Data[_:barid][gbar_t3]);

		gbar_Data[_:barid][gbar_t1] = Text:0;
		gbar_Data[_:barid][gbar_t2] = Text:0;
		gbar_Data[_:barid][gbar_x] = 0.0;
		gbar_Data[_:barid][gbar_y] = 0.0;
		gbar_Data[_:barid][gbar_w] = 0.0;
		gbar_Data[_:barid][gbar_h] = 0.0;
		gbar_Data[_:barid][gbar_m] = 0.0;
		gbar_Data[_:barid][gbar_v] = 0.0;
		gbar_Data[_:barid][gbar_color] = 0;
		gbar_Data[_:barid][gbar_created] = false;
		return 1;
	}
	return 0;
}

stock ShowProgressBarForPlayer(playerid, GlobalBar:barid)
{
	if(IsPlayerConnected(playerid) && barid != INVALID_GLOBAL_BAR_ID && GlobalBar:-1 < barid < GlobalBar:MAX_GLOBAL_BARS)
	{
		if(!gbar_Data[_:barid][gbar_created])
			return 0;

		TextDrawShowForPlayer(playerid, gbar_Data[_:barid][gbar_t1]);
		TextDrawShowForPlayer(playerid, gbar_Data[_:barid][gbar_t2]);
		return 1;
	}
	return 0;
}

stock HideProgressBarForPlayer(playerid, GlobalBar:barid)
{
	if(IsPlayerConnected(playerid) && barid != INVALID_GLOBAL_BAR_ID && GlobalBar:-1 < barid < GlobalBar:MAX_GLOBAL_BARS)
	{
		if(!gbar_Data[_:barid][gbar_created])
			return 0;

		TextDrawHideForPlayer(playerid, gbar_Data[_:barid][gbar_t1]);
		TextDrawHideForPlayer(playerid, gbar_Data[_:barid][gbar_t2]);
		return 1;
	}
	return 0;
}

stock SetProgressBarValue(GlobalBar:barid, Float:value)
{
	if(barid == INVALID_GLOBAL_BAR_ID || GlobalBar:MAX_GLOBAL_BARS < barid < GlobalBar:-1)
		return 0;

	if(gbar_Data[_:barid][gbar_created])
	{
		value =
			(value < 0.0) ? (0.0) : (value > gbar_Data[_:barid][gbar_m]) ? (gbar_Data[_:barid][gbar_m]) : (value);

		TextDrawUseBox(gbar_Data[_:barid][gbar_t2], value > 0.0);

        gbar_Data[_:barid][gbar_v] = value;

		TextDrawTextSize(gbar_Data[_:barid][gbar_t2],
			gbar_percent(gbar_Data[_:barid][gbar_x], gbar_Data[_:barid][gbar_w], gbar_Data[_:barid][gbar_m], value), 0.0);

		return 1;
	}
	return 0;
}

stock Float:GetProgressBarValue(GlobalBar:barid)
{
	if(barid == INVALID_BAR_ID || GlobalBar:MAX_BARS < barid < GlobalBar:-1)
		return INVALID_BAR_VALUE;

	if(gbar_Data[_:barid][gbar_created])
		return gbar_Data[_:barid][gbar_v];

	return INVALID_BAR_VALUE;
}

stock SetProgressBarMaxValue(GlobalBar:barid, Float:max)
{
	if(barid == INVALID_BAR_ID || GlobalBar:MAX_BARS < barid < GlobalBar:-1)
		return 0;

	if(gbar_Data[_:barid][gbar_created])
	{
		gbar_Data[_:barid][gbar_m] = max;
		SetProgressBarValue(barid, gbar_Data[_:barid][gbar_v]);
		return 1;
	}
	return 0;
}

stock SetProgressBarColor(Bar:barid, color)
{
	if(barid == INVALID_BAR_ID || GlobalBar:MAX_BARS < barid < GlobalBar:-1)
		return 0;

	if(gbar_Data[_:barid][gbar_created])
	{
		gbar_Data[_:barid][gbar_color] = color;
		TextDrawBoxColor(gbar_Data[_:barid][gbar_t1],
			(color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));

		TextDrawBoxColor(gbar_Data[_:barid][gbar_t2], color);
		return 1;
	}
	return 0;
}

stock UpdateProgressBar(Bar:barid, playerid=INVALID_PLAYER_ID)
{
	if(playerid == INVALID_PLAYER_ID)
	{
		return ShowProgressBarForAll(barid);
	} else {
		return ShowProgressBarForPlayer(playerid, barid);
	}
}