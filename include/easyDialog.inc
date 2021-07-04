/*
	easyDialog.inc - Dialogs made easier!

	With this useful include, scripters can easily create
	dialogs and show them to players.

	This include will prevent dialog spoofing, ID collision
	and a lot more.

	Created by Emmet on Friday, January 24, 2014.
*/

#if !defined isnull
	#define isnull(%1) \
		((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#define Dialog:%0(%1) \
	forward dialog_%0(%1); public dialog_%0(%1)

#define Dialog_Show(%0,%1, \
	Dialog_Open(%0, #%1,

#define Dialog_Opened(%0) \
	(CallRemoteFunction("Dialog_IsOpened", "i", (%0)))

/*static
	s_DialogName[MAX_PLAYERS][32 char],
	s_DialogOpened[MAX_PLAYERS]
;*/

forward OnDialogPerformed(playerid, dialog[], response, success);

forward @dialog_format(); @dialog_format() {
	format("", 0, "");
}

forward Dialog_IsOpened(playerid);
public Dialog_IsOpened(playerid)
{
	/*return (s_DialogOpened[playerid]);*/
	return (GetPVarType(playerid, "dialogid_name") != PLAYER_VARTYPE_NONE);
}

stock Dialog_Close(playerid)
{
	DeletePVar(playerid, "dialogid_name");
	/*s_DialogOpened[playerid] = 0;*/

	return ShowPlayerDialogEx(playerid, -1, DIALOG_STYLE_MSGBOX, " ", " ", " ", "");
}

stock Dialog_Open(playerid, const function[], style, const caption[], const info[], const button1[], const button2[], {Float,_}:...)
{
	static
	    string[4096],
		args
	;

	if (!strlen(info))
	{
	    return 0;
	}
	if ((args = numargs()) > 7)
	{
	    while (--args >= 7)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S info
		#emit PUSH.C 4096
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit CONST.alt 16
		#emit SUB
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		ShowPlayerDialogEx(playerid, 32700, style, caption, string, button1, button2);
	}
	else
	{
		ShowPlayerDialogEx(playerid, 32700, style, caption, info, button1, button2);
	}
	/*s_DialogOpened[playerid] = 1;*/

	/*strpack(s_DialogName[playerid], function, 32 char);*/
	SetPVarString(playerid, "dialogid_name", function);

	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	static
		s_Public = cellmax;

	if (s_Public == cellmax)
	{
	    s_Public = funcidx("OnDialogPerformed");
	}

	// Sanitize inputs.
	for (new i = 0, l = strlen(inputtext); i < l; i ++)
	{
	    if (inputtext[i] == '%')
		{
			inputtext[i] = '#';
		}
	}
	new dialogstr[40];
	GetPVarString(playerid, "dialogid_name", dialogstr, sizeof(dialogstr));

	if (dialogid == 32700 && strlen(/*GetPVarString(playerid, "dialogid_name")*/dialogstr) > 0)
	{
		new
		    string[40];

		strcat(string, "dialog_");
		strcat(string, dialogstr);

		Dialog_Close(playerid);

		if ((s_Public == -1) || (CallLocalFunction("OnDialogPerformed", "dsdd", playerid, string[7], response, funcidx(string) != -1)))
		{
	 		CallLocalFunction(string, "ddds", playerid, response, listitem, (!inputtext[0]) ? ("\1") : (inputtext));
		}
	}
	#if defined DR_OnDialogResponse
	    return DR_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
	    return 0;
	#endif
}

#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif

#define OnDialogResponse DR_OnDialogResponse

#if defined DR_OnDialogResponse
	forward DR_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif