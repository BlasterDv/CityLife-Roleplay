CMD:paja(playerid, const params[]){ApplyAnimationEx(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 1, 0);SendClientMessage(playerid, -1, "Para terminar usa {5EB5FF}/acabar");return 1;}
CMD:mear(playerid, const params[]){SetPlayerSpecialAction(playerid, SPECIAL_ACTION_PISSING);SendClientMessage(playerid, -1, "Presiona {5EB5FF}F {FFFFFF}para terminar.");return 1;}
CMD:llorar(playerid, const params[]){ApplyAnimationEx(playerid,"GRAVEYARD","mrnF_loop",4.1,0,0,0,0,0);return 1;}
CMD:acabar(playerid, const params[]){ApplyAnimationEx(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 0, 0);return 1;}
CMD:bomba(playerid, const params[]){new result; if(sscanf(params, "d", result)) return 1; ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, result);return 1;}
CMD:reir(playerid, const params[]){ApplyAnimationEx(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0,0);return 1;}
CMD:cansado(playerid, const params[]){ApplyAnimationEx(playerid,"PED","WOMAN_runfatold",4.1,7,5,1,1,1);return 1;}
CMD:hablar(playerid, const params[]){ApplyAnimationEx(playerid,"PED","IDLE_chat",4.1,7,5,1,1,1);return 1;}
CMD:fuerza(playerid, const params[]){ApplyAnimationEx(playerid,"benchpress","gym_bp_celebrate",4.1,0,1,1,1,1);return 1;}
CMD:asientosexy(playerid, const params[]){ApplyAnimationEx(playerid,"SUNBATHE","ParkSit_W_idleA",4.000000, 0, 1, 1, 1, 0);SendClientMessage(playerid, -1, "Para pararte usa /pararse");return 1;}
CMD:herido(playerid, const params[]){ApplyAnimationEx(playerid, "SWEET", "LaFin_Sweet", 4.0, 0, 1, 1, 1, 0);return 1;}
CMD:rodar(playerid,const const params[]) {
if(PlayerInfo[playerid][pAgonizando] == 1 || Esposando[playerid] == 2) return 1;
ApplyAnimationEx(playerid,"MD_CHASE","MD_HANG_Lnd_Roll",4.1,0,1,1,1,0);
SendClientMessage(playerid, -1, "Para seguir usa {5EB5FF}/levantarse");
return 1;
}
CMD:asiento(playerid, const params[]){
	ApplyAnimationEx(playerid, "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0);
	SendClientMessage(playerid, -1, "Para pararte usa {5EB5FF}/depie");
	return 1;
}
CMD:asiento2(playerid,const params[]) {
	ApplyAnimationEx(playerid,"Attractors","Stepsit_in",4.1,0,0,0,1,0);
	SendClientMessage(playerid, -1, "Para pararte usa {5EB5FF}/depie2");
	return 1;
}
CMD:asiento3(playerid, const params[]){
return 1;
}
CMD:depie(playerid, const params[]){
    ApplyAnimationEx(playerid, "ped", "SEAT_up", 4.0, 0, 0, 1, 0, 0);
	return 1;
}
CMD:depie2(playerid,const params[]) {
ApplyAnimationEx(playerid,"Attractors","Stepsit_out",4.1,0,0,0,0,0);
return 1;
}
CMD:patinar3(playerid, const params[]){
ApplyAnimation(playerid, "SKATE", "skate_idle", 4.1, 1, 0, 0, 1, 1, 0);
return 1;
}
CMD:dormir(playerid,const params[]) {
ApplyAnimationEx(playerid,"INT_HOUSE","BED_In_R",4.1,0,0,0,1,0);
return 1;
}

CMD:test2(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new vehicleid;
	if(sscanf(params, "d", vehicleid)) return 1;

	new Float:x,Float:y,Float:z;
	GetVehicleOffset(vehicleid, 2, x,y,z);
	SendClientMessageEx(playerid, -1, "Size: %f", GetPlayerDistanceFromPoint(playerid, x,y,z));
	SetPlayerPos(playerid, x,y,z);

	/*new vehicleid = GetPlayerClosestVehicle(playerid);

	new Float:vx,Float:vy,Float:vz;

	GetVehicleOffset(vehicleid, 2, vx,vy,vz);
	if(IsPlayerInRangeOfPoint(playerid, 0.7, vx,vy,vz) && IsPlayerAngleToPoint(playerid, vx,vy,vz))
	{
		if(GetInvValueItemSelected(playerid) == 198)
		{
			if(Player.Temp[playerid][@VehicleActionPr] != 0) return 1;

			TogglePlayerControllable(playerid, 0);

			new Float:curangle = GetAngleToPoint(PlayerInfo[playerid][p_POS_X],PlayerInfo[playerid][p_POS_Y], vx, vy);
			SetPlayerFacingAngle(playerid, curangle);
			ApplyAnimation(playerid, "PED", "CAR_ALIGN_RHS", 4.1, false, false, false, true, 0, false);

			Player.Temp[playerid][@VehicleActionPr] = 4;
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
			PlayerInfoTemp[playerid][pt_TimersE][15] = SetTimerEx("Timer_ApplyPetrolcanVehicle", 1100, true, "ii", playerid, vehicleid);
		}
	}*/
	return 1;
}

/*CMD:test1(playerid, const params[])
{
	new data[E_FAC_QUIZ_PLAYER_DATA];
	new string[128];

	if (!GetPlayerDataListQuiz(playerid, 0, data)) {
       	return 0;
    }
    str_get(data[E_FAC_QUIZ_STRING], string, sizeof(string));	
	printf("Test text 0: %s", string);
	if (!GetPlayerDataListQuiz(playerid, 1, data)) {
       	return 0;
    }
    str_get(data[E_FAC_QUIZ_STRING], string, sizeof(string));	
	printf("Test text 1: %s", string);
	if (!GetPlayerDataListQuiz(playerid, 2, data)) {
       	return 0;
    }
    str_get(data[E_FAC_QUIZ_STRING], string, sizeof(string));	
	printf("Test text 2: %s", string);
	return 1;
}*/

CMD:acciones(playerid, const params[])
{
	new string[256];

	format(string, sizeof(string), "");
	strcat(string, "> {5EB5FF}Asiento\n");
	strcat(string, "> {5EB5FF}Asiento 2\n");
	strcat(string, "> {5EB5FF}Llorar\n");
	strcat(string, "> {5EB5FF}Paja\n");
	strcat(string, "> {5EB5FF}Reir\n");
	strcat(string, "> {5EB5FF}Cansado\n");
	strcat(string, "> {5EB5FF}Hablar\n");
	strcat(string, "> {5EB5FF}Asiento sexy\n");
	strcat(string, "> {5EB5FF}Dormir\n");
	strcat(string, "> {5EB5FF}Rodar\n");
	strcat(string, "> {5EB5FF}Bomba\n");
	ShowPlayerDialog(playerid, DIALOG_ANIMS, DIALOG_STYLE_LIST, "{5EB5FF}Acciones", string, "Seleccionar","Cancelar");
	return 1;
}
//Fin CmdAcciones

//Comandos
CMD:intentar(playerid, const params[]){
if(isnull(params)) return SendClientMessage(playerid, Blanco, "Por favor usa {5EB5FF}/intentar texto{FFFFFF}, por ejemplo: {5EB5FF}/intentar reconocer al sujeto");
new string[128];
new randMSG = random(sizeof(RandomMSG));
if(GetTimerCMD(playerid, 6))
{
	format(string, sizeof(string), "Tienes que esperar {E40000}%d segundos {FFFFFF}para volver a intentar una acci�n.", GetSegTimerCMD(playerid, 6));
	SendClientMessage(playerid, -1, string);
	return 1;
}
GetPlayerName(playerid, string, sizeof(string));
format(string, sizeof(string), "%s intenta %s %s", string, params, RandomMSG[randMSG]);
ProxDetector(15.0, playerid, string, Rol,Rol,Rol,Rol,Rol);
SetTimerCMD(playerid, 6, 20);
return 1;
}

CMD:me(playerid, const params[]){
	if(isnull(params)) return SendClientMessage(playerid, Blanco, "USO: {5EB5FF}/me [Texto]{FFFFFF}, por ejemplo: {5EB5FF}/me tira algo al suelo");
	new string[128];
	format(string, sizeof(string), "* %s %s", GetPlayerNameEx(playerid), params);
	ProxDetector(15.0, playerid, string, Rol,Rol,Rol,Rol,Rol);
	return 1;
}
/*CMD:me(playerid, const params[])
{
	return callcmd::y(playerid, params);
}*/

CMD:b(playerid, const params[]){
	if(isnull(params)) return SendClientMessage(playerid, Blanco, "USO: {5EB5FF}/b [Texto]{FFFFFF}, por ejemplo: {5EB5FF}/b Se me fue la conexi�n.{FFFFFF}");
	new string[128];
	format(string, sizeof(string), "%s: (( %s ))", PlayerInfoTemp[playerid][pt_Name], params);
	ProxDetector(15.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}
CMD:do(playerid, const params[]){
	if(isnull(params)) return SendClientMessage(playerid, Blanco, "Por favor usa {5EB5FF}/do [Texto]{FFFFFF}, por ejemplo: {5EB5FF}/do Se nota algo nervioso.");
	new string[128];
	format(string, sizeof(string), "* %s (( %s ))", params, PlayerInfoTemp[playerid][pt_Name]);
	ProxDetector(15.0, playerid, string, Rol,Rol,Rol,Rol,Rol, 85);
	return 1;
}
CMD:s(playerid, const params[]){
	if(isnull(params)) return SendClientMessage(playerid, Blanco, "Por favor usa {5EB5FF}/s texto{FFFFFF}, por ejemplo: {5EB5FF}/s �Quieres un poco de Cocaina?{FFFFFF}");
	new string[128];
	if(GetPlayerDrunkLevel(playerid) > 4000)
	{
		if(PlayerInfo[playerid][p_Gender] == 1) {format(string, sizeof(string), "%s susurra alcoholizado: %s", GetPlayerNameEx(playerid), params);}
		else if(PlayerInfo[playerid][p_Gender] == 2) {format(string, sizeof(string), "%s susurra alcoholizada: %s", GetPlayerNameEx(playerid), params);}
	} else format(string, sizeof(string), "%s susurra: %s", GetPlayerNameEx(playerid), params);
	ProxDetector(3.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5,85);
	format(string, sizeof(string), "(susurro) %s", params);
	SetPlayerChatBubble(playerid,string,Blanco,5.0,5000);
	return 1;
}
CMD:g(playerid, const params[]){
	if(!isnull(params)){
 		new string[128];
 		if(GetPlayerDrunkLevel(playerid) > 4000)
 		{
 			if(PlayerInfo[playerid][p_Gender] == 1) {format(string, sizeof(string), "%s grita alcoholizado: �%s!", GetPlayerNameEx(playerid), params);}
 			else if(PlayerInfo[playerid][p_Gender] == 2) {format(string, sizeof(string), "%s grita alcoholizada: �%s!", GetPlayerNameEx(playerid), params);}
 		}
 		else format(string, sizeof(string), "%s grita: �%s!", GetPlayerNameEx(playerid), params);
		ProxDetector(30.0, playerid, string,Blanco,Blanco,Blanco,COLOR_FADE1,COLOR_FADE2, 85);
		format(string, sizeof(string), "(grito) %s!", params);
		return SetPlayerChatBubble(playerid,string,Blanco,60.0,5000);
  	} else SendClientMessage(playerid, Blanco, "Por favor usa {5EB5FF}/g texto{FFFFFF}, por ejemplo: {5EB5FF}/g Esperenme.{FFFFFF}");
	return 1;
}
CMD:d(playerid, const params[])
{
	if(!isnull(params))
	{
	    new string[128];
	    if(GetPlayerDrunkLevel(playerid) > 4000)
 		{
 			if(PlayerInfo[playerid][p_Gender] == 1) {format(string, sizeof(string), "%s dice alcoholizado: %s", GetPlayerNameEx(playerid), params);}
 			else if(PlayerInfo[playerid][p_Gender] == 2) {format(string, sizeof(string), "%s dice alcoholizada: %s", GetPlayerNameEx(playerid), params);}
 		} else format(string, sizeof(string), "%s dice: %s", GetPlayerNameEx(playerid), params);
	    ProxDetector(15.0, playerid, string, COLOR_FADE1, COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	}
	return 1;
}

CMD:ayuda(playerid, const params[]){
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		ShowPlayerDialog(playerid, 1555, DIALOG_STYLE_MSGBOX, "{5EB5FF}Ayuda", "\
			{B8B8B8}General\n{5EB5FF}/g{FFFFFF}ritar {5EB5FF}/s{FFFFFF}usurrar {5EB5FF}/b /me /do /reportar /duda /pagar\n\n\
			{B8B8B8}Inventario\n{FFFFFF}Presiona {5EB5FF}N {FFFFFF}para abrir el inventario.\nPresiona {5EB5FF}Y {FFFFFF}para usar.\nPresiona {5EB5FF}ALT IZQ. {FFFFFF}para recoger.",
			"Salir", "");
	}
	return 1;
}

CMD:vehiculos(playerid, const params[])
{
	ShowDialogGPSVehicle(playerid);
	return 1;
}
alias:vehiculos("veh", "vehicles", "v")

CMD:propiedades(playerid, const params[])
{
	ShowDialogGPSProperty(playerid);
	return 1;
}
alias:propiedades("prop", "casas")

CMD:testphone(playerid, const params[])
{
	new db_ID, rows;
	cache_set_active(Player.Temp[playerid][@CachePhone]);
	cache_get_row_count(rows);
	for(new i = 0; i < rows; i++)
	{
		cache_get_value_name_int(i, "id_message", db_ID);

		printf("ID_Message:%d", db_ID);
	}
	return 1;
}
CMD:reglas(playerid, const params[])
{
new reglas[1500];
strcat(reglas, "{FF3C3C}DM:{FFFFFF} DeathMatch, es cuando agredes a alguien sin raz�n alguna, recuerda que esto es un servidor de roleplay.\n\n");
strcat(reglas, "{FF3C3C}AV:{FFFFFF} Es cuando atropellas a alguien con un veh�culo hasta matarlo sin rol alguno.\n\n");
strcat(reglas, "{FF3C3C}PG:{FFFFFF} Realizar acciones que ser�an imposibles en la vida real, o que nunca har�as.\n\n");
strcat(reglas, "{FF3C3C}NRE:{FFFFFF}No rol de entorno, es cuando no respetas el rol de tu entorno.\n");
strcat(reglas, "{FF3C3C}NVPJ:{FFFFFF}No valorar la vida de tu Personaje,\n\n");
strcat(reglas, "Ejemplo: Estas en un tiroteo �Que haces? Esconderte, si te metes en frente no estas valorando la Vida de tu Personaje.\n");
strcat(reglas, "{FF3C3C}Cheats:{FFFFFF}En CityLife Roleplay, esta totalmente prohibido el uso de cheats que den ventajas sobre otros jugadores.\n\n");
strcat(reglas, "{FF3C3C}Pausear:{FFFFFF}Pausear es una Forma para evadir el Rol,\n");
strcat(reglas, "ya sea pausearte para no chocar tu veh�culo o pausear para no Perder armas cuando te matan\n");
strcat(reglas, "Recuerda: Si te pauseas podr�as terminar sancionado.\n");
ShowPlayerDialog(playerid, Reglas1, DIALOG_STYLE_MSGBOX, "{5EB5FF}Reglas", reglas, "Cerrar", "");
return 1;
}

CMD:id(playerid, const params[])
{
	new string[128], giveplayerid, formatping[24];

	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/id [Nombre del Jugador]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
	if(PlayerInfoTemp[giveplayerid][pt_IsLoggedIn] == false || IsPlayerNPC(giveplayerid)) return SendClientMessage(playerid, Blanco, "El jugador se encuentra offline.");
	if(GetPlayerPing(giveplayerid) < 170) { format(formatping, 24, "{2EDC4E}%d", GetPlayerPing(playerid)); }
	else if(GetPlayerPing(giveplayerid) < 300) { format(formatping, 24, "{DCB02E}%d", GetPlayerPing(playerid)); }
	else if(GetPlayerPing(giveplayerid) > 300) { format(formatping, 24, "{E92323}%d", GetPlayerPing(playerid)); }
	if(IsPlayerConnected(giveplayerid))
	{
		format(string, sizeof(string), "{FF7373}El usuario {5EB5FF}%s{FF7373} tiene la ID: {FF9F00}%d{FF7373} | [Nivel: %d] [Ping: %s{FF7373}].",GetPlayerNameEx(giveplayerid), giveplayerid, PlayerInfo[giveplayerid][p_LEVEL], formatping);
		SendClientMessage(playerid, COLOR_HELPCMD, string);
	}
	else SendClientMessage(playerid, Blanco, "No hay ning�n jugador con esa ID.");
	return 1;
}

CMD:peaje(playerid, const params[]){
	if(IsPlayerInRangeOfPoint(playerid,15.0,1722.9510,451.2921,30.7944))
	{
		if(StatePeajeLV[0] == 1) return 1;
  		if(PlayerInfo[playerid][pDinero] > 2)
  		{
   			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
   			{
    			RotateDynamicObjectEx(peajelvabierto1, 0.0000, -15.0000, 161.0000,1.00);
    			RotateDynamicObjectEx(peajelvcerrado2, 0.0000, -91.0000, 161.0000,1.00);
    			RemoveMoney(playerid,2);
				SendClientMessage(playerid, -1, "Tienes 5 segundos para pasar.");
    			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    			StatePeajeLV[0] = 1;
    			SetTimer("cerrarpeajelv1",5000,0);
    			return 1;
   			}
   			else
   			{
    			SendClientMessage(playerid,-1,"No estas en un veh�culo o no eres conductor.");
   			}
   		}
  		else
  		{
   			SendClientMessage(playerid,-1,"No tienes el dinero suficiente.");
  		}
  	}
 	if(IsPlayerInRangeOfPoint(playerid,15.0,1702.2274,447.1076,30.9386))
 	{
 		if(StatePeajeLV[1] == 1) return 1;
		if(PlayerInfo[playerid][pDinero] < 2) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes dinero para pagar.", 2000);
   		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
   		
    	RotateDynamicObjectEx(peajelvabierto3, 0.0000, 90.0000, 160.0000,1.00);
    	RotateDynamicObjectEx(peajelvcerrado4, 0.0000, 18.0000, 161.0000,1.00);
		RemoveMoney(playerid, 2);
    	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    	SetTimer("cerrarpeajelv2",5000,0);
    	StatePeajeLV[1] = 1;
    	return 1;
 	}
 	for(new i = 0; i < MAX_BARRIERS; i++)
 	{
 		if(PlayerToPoint(5.0, playerid, BSVInfo[i][bsvPX], BSVInfo[i][bsvPY], BSVInfo[i][bsvPZ]))
 		{
 			if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != 2) return 1;
 			if(BSVInfo[i][bsvState] == 1) return 1;
 			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
 			RotateDynamicObjectEx(BSVInfo[i][bsvObjectID], /*BSVInfo[i][bsvX],BSVInfo[i][bsvY],BSVInfo[i][bsvZ], 1.00, */BSVInfo[i][bsvRX],/* -14.000*/BSVInfo[i][bsvNewRY]/*+86.000**/, BSVInfo[i][bsvRZ], 1.00);
 		/*	BSVInfo[i][bsvTime] = BSVInfo[i][bsvMaxTime];*/
 			BSVInfo[i][bsvTime] = SetTimerEx("CloseBarriers1", BSVInfo[i][bsvMaxTime]*1000, false, "i", i);
 			BSVInfo[i][bsvState] = 1;
 		}
 	}
	return 1;
}

CMD:pagar(playerid, const params[])
{
	new id, cantidad;

	if(sscanf(params, "ud", id, cantidad)) return SendClientMessage(playerid, -1, "USO: {5EB5FF}/pagar [ID del jugador] [Cantidad]"); 
	if(PlayerInfo[playerid][p_LEVEL] < 3) return ShowPlayerInfoTextdraw(playerid, "~r~Necesitas ser nivel 3 para poder dar~n~dinero a otros jugadores.", 2000);
	new str[128], Float:X, Float:Y, Float:Z;
	GetPlayerPos(id, X, Y, Z);
	if(GetTimerCMD(playerid, 1))
	{
		format(str, sizeof(str), "~r~Debes esperar %d segundos.", GetSegTimerCMD(playerid, 1));
		ShowPlayerInfoTextdraw(playerid, str, 1000);
		return 1;
	}
	if(playerid == id) return ShowPlayerInfoTextdraw(playerid, "~r~Eres tu.", 2000);
	if(cantidad < 1) return ShowPlayerInfoTextdraw(playerid, "~r~Ingresa una cantidad mayor.", 2000);
	if(PlayerInfo[playerid][pDinero] < cantidad) return 1;
	if(!PlayerInfoTemp[id][pt_IsLoggedIn]) return 1;
	if(PlayerToPoint(4.0, playerid, X, Y, Z))
	{
		GivePlayerMoneyEx(id, cantidad, true, true);
		RemoveMoney(playerid, cantidad, true, true);

		format(str, sizeof(str), "* %s le dio dinero a %s.", PlayerInfo[playerid][p_Name], PlayerInfo[id][p_Name]);
		ProxDetector(15.0, playerid, str, Rol, Rol, Rol, Rol, Rol);
		SetPlayerChatBubble(playerid,str,Rol,8.0,4000);
		SetTimerCMD(playerid, 1, 50);
	} else ShowPlayerInfoTextdraw(playerid, "No estas cerca de ese jugador.", 2000);
	return 1;
}

CMD:duda(playerid, const params[]){
	new string[128], text[128];
	if(ChannelQuestions[playerid] == 1) return SendClientMessage(playerid, -1, "Tienes el canal de dudas deshabilitado.");
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/duda [Tu pregunta]");
	/*if(TimeMuted[playerid] > 0)
	{
		if(TimeMuted[playerid] < 60) { format(string, sizeof(string), ""); }
		else if(TimeMuted[playerid] >= 60) { format(string, sizeof(string), "Tienes que esperar %d segundos para."); }
		
	}*/
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		SendPlayerQuestion(playerid, text);
	}
	if(PlayerInfo[playerid][pAdmin] == 0)
	{
		if(QuestionTime[playerid] > 0)
		{
			if(QuestionTime[playerid] < 60) { format(string, sizeof(string), "~r~Tienes que esperar %d segundos.", QuestionTime[playerid]); }
			else if(QuestionTime[playerid] >= 60) { format(string, sizeof(string), "~r~Tienes que esperar %dm %ds.", QuestionTime[playerid]/60, QuestionTime[playerid]%(60)); }
			ShowPlayerInfoTextdraw(playerid,string, 4000);
			return 1;
		}
		else if(GetTimerCMD(playerid, 5))
		{
			format(string, sizeof(string), "~w~Tienes que esperar ~g~%d segundos ~w~ para volver a usar el canal de dudas.", GetSegTimerCMD(playerid, 5));
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_CHANNELDUDE, string, 18);
			return 1;
		}
    	/*if(isnull(params)) return SendClientMessage(playerid,Blanco, "Modo de uso: {5EB5FF}/duda [Pregunta]");
    	format(string, sizeof(string), "{77A7AE}[Canal Dudas] {A1BBBF}- [Nivel %d] - [%s - %s](%d): %s",PlayerInfo[playerid][p_LEVEL], GetNameRangeAdmin(playerid),PlayerName(playerid), playerid, params);*/
    	//QuestionText[playerid] = text;
   		//ShowPlayerDialog(playerid, DIALOG_SENDQUESTION, DIALOG_STYLE_MSGBOX, "Advertencia", "�Estas seguro de enviar esta duda o respuesta?", "Si", "No");
		SendPlayerQuestion(playerid, text);
	}
	return 1;
}

CMD:estadisticas(playerid, const params[]){
	new string[370], necessary_exp;

	necessary_exp = CalcularExpNivel(playerid);


	new i = vNoti_CreatePlayerBox(playerid, VNOTI_TYPE_INFOEXP, 130.0, 20);
	//if(i == BOX_NOfTIF_INVALID_BOX) return 1;

	new string_add[128];

	format(string, sizeof string, "");
	format(string_add, sizeof string_add, "nivel____________________________exp~n~~n~~n~dinero________________________banco~n~~n~~n~trabajo~n~~n~~n~tiempo jugado");
	strcat(string, string_add);

	funct_CreateTextdrawTextNotif(playerid, i, 0, string, 0, 0.200, 1.3);

	format(string, sizeof string, "");
	format(string_add, sizeof string_add, "~n~%d/%d~n~~n~~n~~g~~h~$%s", PlayerInfo[playerid][p_EXP], necessary_exp, FormatNumber(PlayerInfo[playerid][pBanco]));
	strcat(string, string_add);
	funct_CreateTextdrawTextNotif(playerid, i, 1, string, 110.0, 0.240, 1.3, 1, 3);

	new format_time[20];
	if(PlayerInfo[playerid][pHoursPlayed] >= 1) { format(format_time, sizeof(format_time), "%d horas %d min", PlayerInfo[playerid][pHoursPlayed], PlayerInfo[playerid][pMinutesPlayed]); }
	else { format(format_time, sizeof(format_time), "%d minutos", PlayerInfo[playerid][pMinutesPlayed]); }

	format(string, sizeof string, "");
	format(string_add, sizeof string_add, "~n~%d~n~~n~~n~~g~~h~$%s~n~~n~~n~~w~%s~n~~n~~n~%s", PlayerInfo[playerid][p_LEVEL], FormatNumber(PlayerInfo[playerid][pDinero]), GetPlayerJobName(PlayerInfo[playerid][pJob]), format_time);
	strcat(string, string_add);
	funct_CreateTextdrawTextNotif(playerid, i, 2, string, 0, 0.240, 1.3, 1, 1);


	UpdateNotificationForPlayer(playerid, i);

	ShowPlayerMessageInfoNeeds(playerid);
	return 1;
}
alias:estadisticas("est", "stats")

CMD:reportar(playerid, const params[]){
	new id, razon[30];
	if(sscanf(params, "us[29]", id, razon)) return SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/reportar [ID del Jugador] [Raz�n]");
	if(!PlayerInfoTemp[id][pt_IsLoggedIn]) return SendClientMessage(playerid, -1, "Ese jugador no se encuentra conectado.");
	if(IsPlayerNPC(id)) return SendClientMessage(playerid, -1, "USO: {5EB5FF}/reportar [ID del Jugador] [Raz�n]");
	if(PlayerHasReport[playerid] == id) return SendClientMessage(playerid, -1 ,"Ya tienes un reporte activo.");
	SendClientMessage(playerid, -1, "Tu reporte a sido enviado.");
	PlayerHasReport[playerid] = id;
	SendReportThePlayer(playerid, id, razon);

	return 1;
}
CMD:megafono(playerid, const params[]){
	new text[128];
	if(PlayerInfo[playerid][pDutyPolicia] != 1) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(PoliceVehicle(GetPlayerVehicleID(playerid)))
	{
		if(!sscanf(params, "s[128]",text))
		{
			new string[128];
			format(string, sizeof(string), "(Meg�fono) {FFFFFF}%s: {3399FF}�� {FFFFFF}%s{3399FF} !!",GetPlayerNameEx(playerid), text);
			ProxDetector(60.0, playerid, string,COLOR_MEGAPHONE,COLOR_MEGAPHONE,COLOR_MEGAPHONE,COLOR_MEGAPHONE,COLOR_MEGAPHONE);
		}
	}
	return 1;
}

alias:megafono("m")

CMD:cancelar(playerid, const params[])
{
	switch(PlayerInfo[playerid][p_WorkTravel])
	{
		case WORK_TYPE_TRUCKER:
		{
			CancelTruckerLoad(playerid); ShowPlayerInfoTextdraw(playerid, "~r~Tu cami�n fue destruido.", 5000);
		}
		case WORK_TYPE_FARMER: 
		{
			FinishPlayerJob(playerid);
			CancelWorkTravelFarmer(playerid);
			CancelMissionJobLoad(playerid);
			ShowPlayerInfoTextdraw(playerid, "~r~Tu encargo fue cancelado.", 5000);
		}
	}
	return 1;
}

CMD:oyentes(playerid, const params[])
{
	new string[128], oyentes;
	if(strcmp(params, "radio", true) == 0)
	{
		foreach(new i : Player)
		{
			if(ListeningR[i] == Radios[playerid][CabinaOcupada]) { oyentes++; }
		/*	break;*/
		}
		if(Radios[playerid][EmisoraTrans] == 0) return 1;
		/*new emisoraid = Radios[playerid][CabinaOcupada];*/
		format(string, sizeof(string), "Tienes {FABF00}%d {FFFFFF}oyentes.", oyentes);
		SendClientMessage(playerid, -1, string);
	}
	return 1;
}
CMD:microfono(playerid, const params[])
{
	new text[128];
	if(!sscanf(params, "s[128]", text))
	{
		if(IsPlayerPosRadio(playerid) != 0)
		{
			new emi = IsPlayerPosRadio(playerid);
			if(EmisoraOcupada[emi][1] == playerid)
			{
				RadioStationMessage(emi, text, 1);
			}
			else if(HasMicrophone[playerid] == emi)
			{
				RadioStationMessage(emi, text, 2);
			}
		}
	}
	return 1;
}
CMD:configuraciones(playerid, const params[])
{
	Dialog_ConfigPassword(playerid);
	return 1;
}
alias:configuraciones("config")

CMD:nombresoff(playerid, const params[])
{
	for(new i = 0; i < MAX_PLAYERS; i++) ShowPlayerNameTagForPlayer(playerid, i, 0);
	GameTextForPlayer(playerid, "~W~Nombres ~R~off", 5000, 5);
	return 1;
}
CMD:nombreson(playerid, const params[])
{
	for(new i = 0; i < MAX_PLAYERS; i++) ShowPlayerNameTagForPlayer(playerid, i, 1);
	GameTextForPlayer(playerid, "~W~Nombres ~g~on", 5000, 5);
	return 1;
}
CMD:remolcar(playerid, const params[])
{
	new item[32], param;
	if(!sscanf(params, "s[32]d",item, param))
	{
		if(strcmp(item, "vehiculo", true) == 0)
		{
			if(!IsPlayerHasJob(playerid, 8)) return 1;
			new Float:vx, Float:vy, Float:vz;
			/*new idvehicled = GetClosestVehicle(playerid);*/	
			GetVehiclePos(param, vx,vy,vz);
			if(PlayerToPoint(10.0,playerid,vx,vy,vz))
			{
				if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "No estas como conductor de un veh�culo.");
				//if(PlayerInfo[playerid][pCranePermit] != param || PlayerInfo[playerid][pCranePermit] == INVALID_VEHICLE_ID)  return SendClientMessage(playerid, -1,"No tienes el permiso para remolcar de ning�n veh�culo."); 
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 525) return SendClientMessage(playerid, -1, "No estas en una gr�a.");
				AttachTrailerToVehicle(param, GetPlayerVehicleID(playerid));
			} else SendClientMessage(playerid, -1, "No estas cerca de este veh�culo.");
			
		}
	}
	return 1;
}

CMD:habilidades(playerid, const params[])
{
	ShowPlayerWorkSkills(playerid);
	return 1;
}
alias:habilidades("hab", "habilidad")

CMD:debug(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	/*new Query[200];

	format(Query, sizeof(Query), "insert into `lac_user_notifications` (`id_user`,`extra`,`type`,`body`,`date`) values (1, 0, 0, 'XD', CURRENT_TIMESTAMP);");


	for(new i; i < 4000; i++) { mysql_pquery(conexion, Query); }

	for(new i; i < 10000; i++) { 
		format(Query, sizeof(Query), "insert into `lac_user_notifications` (`id_user`,`extra`,`type`,`body`,`date`) values (%d, 0, 0, 'XD', CURRENT_TIMESTAMP);", random(99999));
	 	mysql_pquery(conexion, Query); 
	}*/
	new actorid;
	if(sscanf(params, "i",actorid)) return 0;
	/*//GameTextForPlayer(playerid, text, time, style);
	new Float:x, Float:y, Float:z;
	GetActorPos(actorid,x,y,z);
	SetPlayerPos(playerid, x,y,z);
	SetPlayerVirtualWorld(playerid, GetActorVirtualWorld(actorid));*/
	DoorRobberyTimerFinish(actorid);
	return 1;
}

CMD:notificaciones(playerid, const params[])
{
	task_yield(1);

	ShowPlayerDialogNotifications(playerid);
	return 1;
}
alias:notificaciones("notif")
//Fin Comandos


//Comandos Admin

CMD:teleport(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	Dialog_Show(playerid, dTeleport, DIALOG_STYLE_LIST, "Teleport", "Negocios\nTrabajos\nAreas Publicas\nTiendas de Ropa\nInteriores\n24/7", "Seleccionar", "Cerrar");
	return 1;
}
alias:teleport("tp")

CMD:ir(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	if(!sscanf(params, "i", params[0]))
	{
		if(IsPlayerConnected(params[0]))
		{
			new Float:p_x,Float:p_y,Float:p_z;
			GetPlayerPos(params[0], p_x,p_y,p_z);
			new Int = PlayerInfo[params[0]][pInterior];
			new VW = PlayerInfo[params[0]][pVirtualWorld];
			SetPlayerPosEx(playerid, p_x,p_y,p_z, 0.0, Int, VW);
			return SendClientMessage(playerid, Blanco, "Teleportado.");
		}else SendClientMessage(playerid, Blanco, "Esa ID es inv�lida.");
	}else SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/ir [ID]");
	return 1;
}

CMD:traer(playerid, const params[]){
	new giveplayerid;
    if(PlayerInfo[playerid][pAdmin] < 3) return 0;
    if(!sscanf(params, "u", giveplayerid)){
    if(IsPlayerConnected(giveplayerid)){
    new Float:p_x,Float:p_y,Float:p_z, p_int,p_vw;
    GetPlayerPos(playerid, p_x,p_y,p_z);
    p_vw = PlayerInfo[playerid][pVirtualWorld];
    p_int = PlayerInfo[playerid][pInterior];
	SetPlayerPosEx(giveplayerid, p_x,p_y,p_z, 0.0, p_int, p_vw);
	return SendClientMessage(giveplayerid, Blanco, "{0CCAF0}Fuistes teleportado por un administrador.");
    } else SendClientMessage(playerid, Blanco, "Esa ID es inv�lida.");
	} else SendClientMessage(playerid, Blanco, "* /traer <PlayerID>");
	return 1;
}
CMD:restart(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new timer, string[128], reason[29], type;
	if(sscanf(params, "dD(0)S(Actualizaci�n del servidor.)[29]", timer,type, reason)) 
	{
		SendClientMessage(playerid, -1, "{5EB5FF}Tipo 0: {FFFFFF}Reinicio normal");
		SendClientMessage(playerid, -1, "{5EB5FF}Tipo 1: {FFFFFF}Reinicio con kickeo");
		SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/restart [Tiempo] [Tipo] [Raz�n]");
		return 1;
	}

	if(timer == 0)
	{
		SetTimer("TimerRestartServer", 1000, true);

  		SendClientMessageToAll(COLOR_SAMP, "Reiniciado el Servidor...");
  		
  		mysql_query(conexion, "UPDATE `lac_users` SET \
		`Online`=0, `InGameID`=-1' WHERE = `Online`=0;");

  		if(type == 0) { SendRconCommand("gmx"); }
  		else if(type == 1) { KickAll(); SendRconCommand("exit"); }
  		KickAll();
  		//SendRconCommand("exit");
  	}
  		
  	else
  	{
  		varinreboot = timer*60;
  		varinreboottime = timer-1;
  		format(string, sizeof(string), "~n~~n~~n~~n~~w~Reinicio en %d minutos~n~Raz�n: %s", floatround(timer*60/60), reason);
  		GameTextForAll(ConvertEncoding(string), 10000, 3);

  		KillTimer(timer_rebootserver);
  		timer_rebootserver = SetTimerEx("TimerRestartServer", 1000, true, "i", type);
  	}
  	return 1;
}

CMD:dararma(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new arma, id, ammo;
	if(!sscanf(params, "udD(0)", id, arma, ammo))
	{
		/*DarArmaValida(params[0], arma);*/
		ResetPlayerWeapons(id);
		PlayerInfo[id][pWeapon] = arma;
		GivePlayerWeapon(id, arma, ammo);
		SendClientMessage(playerid, -1, "Le diste un arma a un usuario");
		SendClientMessage(id, -1, "Un administrador te dio un arma");
	}else SendClientMessage(playerid, -1, "Modo de Uso: {5EB5FF}/dararma [ID del Jugador] [ID del Arma]");
	return 1;
}

CMD:giveplayeritem(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new item, amount, id;
	if(!sscanf(params, "udd", id, item, amount))
	{
		AddItemInvPlayer(id, item, amount);
		SendClientMessage(playerid, -1, "Le diste un objeto a un usuario.");
	}else SendClientMessage(playerid, -1, "Modo de Uso: {5EB5FF}/giveplayeritem [ID del Jugador] [ID]");
	return 1;
}

CMD:removeplayeritem(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new id, slot;
	if(!sscanf(params, "ud", id, slot))
	{
		RemoveItemInvPlayer(id, slot);
		SendClientMessage(playerid, -1, "Le diste un objeto a un usuario.");
	}else SendClientMessage(playerid, -1, "Modo de Uso: {5EB5FF}/removeplayeritem [ID del Jugador] [ID]");
	return 1;
}

CMD:kick(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new str[128], id, razon[64];
	if(sscanf(params, "ds[64]", id, razon)) return SendClientMessage(playerid, -1, "Modo de Uso: {5EB5FF}/kick [ID] [Raz�n]{FFFFFF} para Kickear a un Jugador.");
	if(IsPlayerLogged(id)){
		format(str, sizeof(str), "El administrador te kickeo. Raz�n: {BD3939}%s", PlayerInfo[playerid][p_Name], razon);
		SendClientMessage(id, -1, str);
		SetTimerEx("kickmessage", 100, false, "ii", id, 0);

		format(str, sizeof(str), "Has kickeado a %s. Raz�n: {BD3939}%s", PlayerInfo[id][p_Name], razon);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_ADMINKICKPLAYER, str, 8);
	}
	else SendClientMessage(playerid, Blanco, "Esa ID es inv�lida.");
	return 1;
}
CMD:jetpack(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	return 1;
}
CMD:jet(playerid, const params[]){
	return callcmd::jetpack(playerid,params);
}
CMD:avisosv(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new string[128], mensaje[100];
	if(!sscanf(params, "s[128]", mensaje))
	{
		format(string, 128, "SERVIDOR: %s", mensaje);
		SendClientMessageToAll(ColorAviso, string);
	}
	else
	{
		SendClientMessage(playerid, Blanco, "Modo de uso: [00C0FF]/avisosv [Texto]");
	}
	return 1;
}
CMD:clima(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new weather, string[84];
	if(sscanf(params, "d", weather)) return SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/clima [ID del Clima]");
	if(weather < 0||weather > 45) return SendClientMessage(playerid, Gris, "Nota: 0 a 45.");
	SetWeather(weather);
	gWeather = weather;
	format(string, 256, "Administrador: %s cambi� el clima al ID %d.", GetPlayerNameEx(playerid), gWeather);
	SendClientMessage(playerid, Naranja,string);
	return 1;
}
CMD:settime(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new time;
	if(sscanf(params, "d", time)) return SendClientMessage(playerid, -1, "Uso: /settime [Tiempo]");
	SetWorldTime(time);
	return 1;
}
CMD:borrarlog(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return 0;
	foreach(new i : Player)
	{
		if(ChannelQuestions[i] == 0)
		{
    		LimpiarChat(playerid, 50, 0);
    	}
    }
	return 1;
}

CMD:spect(playerid, const params[])
{
	new Giveplayerid, Name[256], String[256], Name2[256];
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	{
		if (sscanf(params, "d", Giveplayerid)) SendClientMessage(playerid,Blanco, "Usa {5EB5FF}/spectear [ID]{FFFFFF} para Spectear a un Jugador.");
		else if (!IsPlayerConnected(Giveplayerid)) SendClientMessage(playerid,Blanco,"Jugador no conectado");
		else
		{
			if (Specing[Giveplayerid] == 1 )
			{
				SendClientMessage(playerid, Blanco, "La persona que quiere spectar esta specteando a otro jugador");
			}
			else
			{
				GetPlayerName(playerid, Name, 256);
				GetPlayerName(Giveplayerid, Name2, 256);
				format(String, 256, "[%i] %s es ahora spectador [%i] %s",playerid, Name,Giveplayerid, Name2);
				/*CallLocalFunction("ircRemoteSay", "iss", 1, "#FSE", String);*/
				Specing[playerid] = 1;
			}
			if ( !IsPlayerInAnyVehicle(Giveplayerid) )
			{
				if(Specteando[playerid] == 0)
				{
					SpecteandoInt[playerid] = GetPlayerInterior(playerid);
					SpecteandoVW[playerid] = GetPlayerVirtualWorld(playerid);
					GetPlayerPos(playerid,SpectX[playerid],SpectY[playerid],SpectZ[playerid]);
					Specteando[playerid] = 1;
				}
				SetPlayerInterior(playerid,GetPlayerInterior(Giveplayerid));
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(Giveplayerid));
				TogglePlayerSpectating(playerid, 1);
				PlayerSpectatePlayer(playerid, Giveplayerid);
				return 1;
			}
			else
			{
				if(Specteando[playerid] == 0)
				{
					SpecteandoInt[playerid] = GetPlayerInterior(playerid);
					SpecteandoVW[playerid] = GetPlayerVirtualWorld(playerid);
					GetPlayerPos(playerid,SpectX[playerid],SpectY[playerid],SpectZ[playerid]);
					Specteando[playerid] = 1;
				}
				SetPlayerInterior(playerid,GetPlayerInterior(Giveplayerid));
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(Giveplayerid));
				TogglePlayerSpectating(playerid, 1);
				PlayerSpectateVehicle(playerid, GetPlayerVehicleID(Giveplayerid));
				return 1;
			}
		}
	}
	return 1;
}

CMD:specoff(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 3 ) return 0;
	SetPlayerInterior(playerid, SpecteandoInt[playerid]);
	SetPlayerVirtualWorld(playerid, SpecteandoVW[playerid]);
	ResetPlayerWeapons(playerid);
	TogglePlayerSpectating(playerid, 0);
	return 1;
}

CMD:freeze(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new id, string[128];
	if(!sscanf(params, "u" ,id))
	{
		TogglePlayerControllableEx(id, false);
		if(id != playerid)
		{
			format(string,sizeof(string),"[ADMIN]: %s (%d) congelo al jugador %s (%d).", PlayerInfo[playerid][p_Name], playerid, PlayerInfo[id][p_Name]);
			SendAdminMessage(Amarillo, string);
		}
	}
	else
	{
		SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/freeze [ID del Jugador]");
	}
	return 1;
}
CMD:unfreeze(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new id, string[128];
	if(!sscanf(params, "d" ,id))
	{
		TogglePlayerControllableEx(id, true);
		if(id != playerid)
		{
			format(string,sizeof(string),"[ADMIN]: %s (%d) descongelo al jugador %s (%d).", PlayerInfo[playerid][p_Name], playerid, PlayerInfo[id][p_Name]);
			SendAdminMessage(Amarillo, string);
		}
	}else SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/unfreeze [ID del Jugador]");
	return 1;
}
CMD:crearpuerta(playerid, const params[])
{
	new doorname[32], doortype, labeltype, iddoor, Float: dPos[4], string[254], Query[250];
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	if(sscanf(params, "dD(0)D(1)s[128]", labeltype, doortype, iddoor, doorname)) return SendClientMessage(playerid, Blanco, "USO: {5EB5FF}/crearpuerta [Tipo label 1-2] [Tipo puerta: ID] [Number] [Nombre]");
	new id = GetAvailableDoorID();
	new id_table[10];
	format(id_table, 10, "%i", id);
	GetPlayerPos(playerid, dPos[0], dPos[1], dPos[2]);
	GetPlayerFacingAngle(playerid, dPos[3]);
	DoorInfo[id][dID] = 1;
	DoorInfo[id][dName] = doorname;
	DoorInfo[id][dExitX] = dPos[0];
	DoorInfo[id][dExitY] = dPos[1];
	DoorInfo[id][dExitZ] = dPos[2];
	DoorInfo[id][dEnterX] = 0.0;
	DoorInfo[id][dEnterY] = 0.0;
	DoorInfo[id][dEnterZ] = 0.0;
	DoorInfo[id][dInt] = 0;
	DoorInfo[id][dEnterVW] = 0;
	DoorInfo[id][dEnterInt] = 0;
	DoorInfo[id][dExitVW] = GetPlayerVirtualWorld(playerid);
	DoorInfo[id][dExitInt] = GetPlayerInterior(playerid);
	DoorInfo[id][dAnguloExt] = dPos[3]+180;
	DoorInfo[id][dTypeDoor] = doortype;
	DoorInfo[id][diddoor] = iddoor;
	if(labeltype == 1)
	{
		DoorInfo[id][dType] = 1;
		format(string, sizeof(string), "{75D2FF}%s{FFFFFF}\nID: %d | Propietario: {41FFEC}Gobierno{FFFFFF}\n\nUsa {5EB5FF}/entrar {FFFFFF}Para Entrar al Lugar",DoorInfo[id][dName], id);
	}
	else if(labeltype == 2)
	{
		DoorInfo[id][dType] = 2;
		if(DoorInfo[id][dTypeDoor] == 1)
		{
			format(string, sizeof(string), "{75D2FF}%s{FFFFFF}\nTipo: {007FC0}Franquicia %d{FFFFFF}\n\nUsa {5EB5FF}/entrar {FFFFFF}para entrar al lugar.",DoorInfo[id][dName], DoorInfo[id][diddoor], id);
		}
		else
		{
			format(string, sizeof(string), "{75D2FF}%s{FFFFFF}\n\nUsa {5EB5FF}/entrar {FFFFFF}Para Entrar al Lugar",DoorInfo[id][dName], id);
		}
	}
	DoorInfo[id][dLabel_Enter] = CreateDynamic3DTextLabel(string, Blanco, DoorInfo[id][dExitX], DoorInfo[id][dExitY], DoorInfo[id][dExitZ]+0.8, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
	DoorInfo[id][dPickup][0] = CreateDynamicPickup(1318, 23, dPos[0], dPos[1], dPos[2], 0, 0, -1, 50.0);
	format(Query, sizeof(Query), "INSERT INTO `lac_doors` (DoorName, ExitX, ExitY, ExitZ, DoorType) VALUES ('%s', %f, %f, %f, %d);", DoorInfo[id][dName], DoorInfo[id][dExitX], DoorInfo[id][dExitY], DoorInfo[id][dExitZ], DoorInfo[id][dType]);
	mysql_tquery(conexion, Query, "LoadDataID", "ddd", INVALID_PLAYER_ID, id, 2);
	return 1;
}
CMD:getdoor(playerid, const params[])
{
	new item[32], id; 
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	if(strcmp(params, "id", true) == 0)
	{		
		for(new i; i<sizeof(DoorInfo); i++)
		{
		    if(PlayerToPoint(4.0, playerid, DoorInfo[i][dExitX], DoorInfo[i][dExitY], DoorInfo[i][dExitZ]))
		    {
		        new string[128];
		        format(string, sizeof(string), "La ID IN-Game de esta puerta es: {5EB5FF}%d", i);
		        SendClientMessage(playerid, -1, string);
		    }
		}
	}
	if(!sscanf(params, "s[32]d", item, id))
	{
		if(strcmp(item, "vw", true) == 0)
		{
			new string[128];
			format(string, sizeof(string), "El VirtualWorld de esta puerta es: Exterior: %d y Interior: %d", DoorInfo[id][dExitVW], DoorInfo[id][dEnterVW]);
			SendClientMessage(playerid, -1, string);
		}
		else if(strcmp(item, "posint", true) == 0)
		{
			SetPlayerPosEx(playerid, DoorInfo[id][dEnterX], DoorInfo[id][dEnterY], DoorInfo[id][dEnterZ], DoorInfo[id][dAnguloInt]-180, DoorInfo[id][dEnterInt], DoorInfo[id][dEnterVW]);
		}
		else if(strcmp(item, "posext", true) == 0)
		{
			SetPlayerPosEx(playerid, DoorInfo[id][dExitX], DoorInfo[id][dExitY], DoorInfo[id][dExitZ], 0.0, DoorInfo[id][dExitInt], DoorInfo[id][dExitVW]);
		}
	}
	return 1;
}
CMD:editarpuerta(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new string[128], option[32], id, amount[32], Float: Pos[4];
	if(sscanf(params, "ds[32]S(0)[32]", id, option, amount))
	{
		SendClientMessage(playerid, Blanco, "USA: {5EB5FF}/editarpuerta [ID] [Item] [Valor]");
		SendClientMessage(playerid, Blanco, "Opciones: exterior, interior, pickup, borrar");
		return 1;
	}
	if (id < 0 || id > MAX_DOORS)
	{
		format(string, sizeof(string), "Solo ID del 1 al %d.", MAX_DOORS);
  		SendClientMessage(playerid, Gris, string);
    	return 1;
	}
 	if(!DoorInfo[id][dID])
	{
   		SendClientMessage(playerid, Rojo, "ID no Encontrada.");
		return 1;
	}

	if(strcmp(option, "exterior", true) == 0)
	{
		new dname[128];
		new i[10];
		GetPlayerPos(playerid, Pos[0],Pos[1],Pos[2]);
		GetPlayerFacingAngle(playerid, Pos[3]);

		GetPointInFrontPos(playerid, Pos[0], Pos[1], (Pos[3]+180.0), Pos[0], Pos[1], floatstr(amount));
		DoorInfo[id][dExitX] = Pos[0];
		DoorInfo[id][dExitY] = Pos[1];
		DoorInfo[id][dExitZ] = Pos[2];
		DoorInfo[id][dAnguloExt] = (Pos[3]+180.0);
		DoorInfo[id][dExitVW] = GetPlayerVirtualWorld(playerid);
		DoorInfo[id][dExitInt] = GetPlayerInterior(playerid);

		DestroyDynamicPickup(DoorInfo[id][dPickup]);
		DestroyDynamic3DTextLabel(DoorInfo[id][dLabel_Enter]);

 		format(dname, sizeof(dname), "{00CC00}%s{FFFFFF}\nID: %d | Propietario: {41FFEC}Gobierno{FFFFFF}\n\nUsa {DBED15}/entrar {FFFFFF}para entrar",DoorInfo[id][dName], id);
		DoorInfo[id][dLabel_Enter] = CreateDynamic3DTextLabel(dname, Blanco, DoorInfo[id][dExitX], DoorInfo[id][dExitY], DoorInfo[id][dExitZ]+0.8, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
		DoorInfo[id][dPickup][0] = CreateDynamicPickup(19198, 23, Pos[0], Pos[1], Pos[2], 0, 0, -1, 50.0);

		format(i, 10, "%i", DoorInfo[id][dID]);
		GuardarDatoFilaFloat("lac_doors", "ExitX", DoorInfo[id][dExitX], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "ExitY", DoorInfo[id][dExitY], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "ExitZ", DoorInfo[id][dExitZ], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "DoorAngleExt", DoorInfo[id][dAnguloExt], 0, "id", i);
	}
	else if(strcmp(option, "interior", true) == 0)
	{
		new i[10];
		GetPlayerPos(playerid, Pos[0],Pos[1],Pos[2]);
		GetPlayerFacingAngle(playerid, Pos[3]);

		GetPointInFrontPos(playerid, Pos[0], Pos[1], (Pos[3]+180.0), Pos[0], Pos[1], floatstr(amount));
		DoorInfo[id][dEnterX] = Pos[0];
		DoorInfo[id][dEnterY] = Pos[1];
		DoorInfo[id][dEnterZ] = Pos[2];
		DoorInfo[id][dAnguloInt] = Pos[3]+180;
		DoorInfo[id][dEnterVW] = id+100;
	
		DoorInfo[id][dEnterInt] = GetPlayerInterior(playerid);
        format(i, 10, "%i", DoorInfo[id][dID]);
        SetPlayerVirtualWorld(playerid, DoorInfo[id][dEnterVW]);

        GuardarDatoFilaFloat("lac_doors", "EnterX", DoorInfo[id][dEnterX], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "EnterY", DoorInfo[id][dEnterY], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "EnterZ", DoorInfo[id][dEnterZ], 0, "id", i);
		GuardarDatoFilaFloat("lac_doors", "DoorAngleInt", DoorInfo[id][dAnguloInt], 0, "id", i);
		GuardarDatoFilaInt("lac_doors", "EnterVW", DoorInfo[id][dEnterVW], 0, "id", i);
		GuardarDatoFilaInt("lac_doors", "EnterInt", DoorInfo[id][dEnterInt], 0, "id", i);
	}
	else if(strcmp(option, "interiortype", true) == 0)
	{
		new i[10];
		format(i, 10, "%i", id);
		GuardarDatoFilaFloat("lac_doors", "Type_Interior", strval(amount), 0, "id", i);
	}
	else if(strcmp(option, "mapicon", true) == 0)
	{
		new i[10];
		format(i, 10, "%i", id);
		DoorInfo[id][dMapIcon] = 1;
		DoorInfo[id][dMapIconID] = strval(amount);
		CreateDynamicMapIcon(DoorInfo[id][dEnterX],DoorInfo[id][dEnterY],DoorInfo[id][dEnterZ], DoorInfo[id][dMapIconID], 0, 0, 0, -1, 400.0);
		GuardarDatoFilaInt("lac_doors", "MapIcon", DoorInfo[id][dMapIcon], 0, "id", i);
		GuardarDatoFilaInt("lac_doors", "MapIconID", DoorInfo[id][dMapIconID], 0, "id", i); 
	}
	else if(strcmp(option, "vwint",true) == 0)
	{
		new i[10];
		format(i, 10, "%i", id);

		if(strval(amount) == -1)
		{
			DoorInfo[id][dEnterVW] = DoorInfo[id][dExitVW];
		}
		else if(strval(amount) == 0)
		{
			DoorInfo[id][dEnterVW] = id+100;
		}
		else
		{
			DoorInfo[id][dEnterVW] = strval(amount);
		}
		GuardarDatoFilaInt("lac_doors", "EnterVW",DoorInfo[id][dEnterVW], 0, "id", i);
	}
	else if(strcmp(option, "enable", true) == 0)
	{
		new i [10];
		format(i, 10, "%i", id);
		DoorInfo[id][DoorEnabled] = strval(amount);
		GuardarDatoFilaInt("lac_doors", "DoorEnabled",DoorInfo[id][DoorEnabled], 0, "id", i);
	}
	else if(strcmp(option, "nombre", true) == 0)
	{
		new i[10];
		format(i, 10, "%i", id);
		GuardarDatoFilaString("lac_doors", "DoorName", amount, 0, "id", i);
	}
	return 1;
}

CMD:newactorobber(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new name[32], skinid, doorid, money, anim, Float:Pos[4];
	if(sscanf(params, "s[24]dddd", name, skinid, doorid, anim, money)) return SendClientMessage(playerid, -1, "USO: {5EB5FF}/newactorobber [Nombre] [Skin] [Doorid] [Animaci�n ID] [Money]");
	
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[3]);

	new Query[250];
	format(Query, sizeof(Query), "INSERT INTO `lac_actors_robbery` (`name`, `x`, `y`, `z`, `a`, `skin`, `doorid`, `anim`, `money`) VALUES ('%q', %f, %f, %f, %f, %d, %d, %d, %d);", name, Pos[0], Pos[1], Pos[2], Pos[3], skinid, doorid, anim, money);
	mysql_tquery(conexion, Query);

	SendClientMessage(playerid, -1, "Creado.");
	return 1;
}

CMD:crearcasa(playerid, const params[])
{
	task_yield(1);
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
	    new id[10];
        new i = GetAvailableHouseID();
        format(id, 10, "%i", i);
		new precio, nivel, interior, moneda, tipo;
		if(sscanf(params, "iiiii", precio, nivel, interior, moneda, tipo)) return SendClientMessage(playerid, -1, "USA: /crearcasa [precio] [nivel] [InteriorID] [Moneda: DP - 0 y Coins - 1] [0 - Casa]");
		else if(interior < 1 || interior > 1) return SendClientMessage(playerid, -1, "Interior: 1");
		else if(tipo > 0) return 1;
		else if(moneda > 0) return 1;

		new Float:PX, Float:PY, Float:PZ, Float:PAngle;
		GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerFacingAngle(playerid, PAngle);
		CasaInfo[i][cPrecio] = precio;
		CasaInfo[i][cNivel] = nivel;
		CasaInfo[i][cExteriorX] = PX;
		CasaInfo[i][cExteriorY] = PY;
		CasaInfo[i][cExteriorZ] = PZ;
		CasaInfo[i][cAnguloExt] = PAngle+180;
		CasaInfo[i][cSale] = 0;
		CasaInfo[i][cOwnerID] = 0;
		CasaInfo[i][cInteriorID] = interior;
		

		switch(moneda)
		{
			case 0: CasaInfo[i][cHouseType] = 0;
			case 1: CasaInfo[i][cHouseType] = 1;
		}
		switch(tipo)
		{
			case 0: CasaInfo[i][cPropertyType] = 0;
			case 1: CasaInfo[i][cPropertyType] = 1;
			case 2: CasaInfo[i][cPropertyType] = 2;
		}

		CasaInfo[i][cVirtualWorld] = i+30000;

	 	task_await(mysql_aquery_s(conexion, str_format("INSERT INTO `lac_houses` (price, level, pos_x, pos_y, pos_z, `pos_a`, `coins`, `property_type`, `vw`, `interior_id`) VALUES (%d, %d, %f, %f, %f, %f, %d, %d, %d, %d);", 
	 		precio, nivel, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ], CasaInfo[i][cAnguloExt], moneda, tipo, CasaInfo[i][cVirtualWorld], CasaInfo[i][cInteriorID])
	 	));
	 	
	 	CasaInfo[i][id_property] = cache_insert_id();
	 	House_CreateNewInterior(i, interior);
		
		LoadLabelHouse(i);
	}
	else return 0;
	return 1;
}

CMD:getidhouse(playerid, const params[])
{
	foreach(new i : HouseIterator)
	{
		if(IsPlayerInRangeOfPoint(playerid,2.0,CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]))
		{
			new string[128];
			format(string, sizeof(string), "Casa: ID-Juego: {5EB5FF}%d {FFFFFF}y ID-DB: {5EB5FF}%d", i, CasaInfo[i][id_property]);
			SendClientMessage(playerid, Blanco, string);
		}
	}
	return 1;
}

CMD:nombrepuerta(playerid, const params[])
{
	new string[300], id, doorname[32];
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(sscanf(params, "ds[32]", id, doorname)) return SendClientMessage(playerid, Blanco, "USAGE: /nombrepuerta [id] [nombre]");
		if (id < 1 || id > MAX_DOORS)
		{
			format(string, sizeof(string), "Solo id del 1 al %d.", MAX_DOORS);
  			SendClientMessage(playerid, Gris, string);
    		return 1;
		}
 		if(!DoorInfo[id][dID])
	 	{
   			SendClientMessage(playerid, Gris, "Id no encontrada.");
			return 1;
		}

		DoorInfo[id][dName] = doorname;
		DestroyDynamic3DTextLabel(DoorInfo[id][dLabel_Enter]);
		format(string, sizeof(string), "{00CC00}%s{FFFFFF}\nID: %d | Propietario: {41FFEC}Gobierno{FFFFFF}\n\nUsa {DBED15}/entrar {FFFFFF}para entrar",DoorInfo[id][dName], id);
		DoorInfo[id][dLabel_Enter] = CreateDynamic3DTextLabel(string, Blanco, DoorInfo[id][dEnterX], DoorInfo[id][dEnterY], DoorInfo[id][dEnterZ]+0.8, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
	}
	else
	{
		SendClientMessage(playerid,Gris,"Primero logueate como rcon admin");
	}
	return 1;
}

CMD:irpos(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new Float:X, Float:Y, Float:Z;
	if(sscanf(params, "fff", X, Y, Z)) return SendClientMessage(playerid, Blanco, "USO: /irpos [PosX] [PosY] [PosZ]");
	SetPlayerPosEx(playerid, X, Y, Z);
	return 1;
}

CMD:setint(playerid, const params[]){
	new id, interior;
	if(sscanf(params, "ud", id, interior)) return SendClientMessage(playerid, Blanco, "USO: /setinterior [ID del jugador] [ID Interior]");
	SetInterior(id, interior);
	return 1;
}

CMD:setvw(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	if(sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, Blanco, "USO: /setvirtualworld [ID del jugador] [Mundo Virtual]");
	PlayerInfo[params[0]][pVirtualWorld] = params[1];
	SetVW(params[0], params[1]);
	return 1;
}
CMD:getvw(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, Blanco, "USO: /getvw [ID del jugador] [Mundo Virtual]");
	new string[40];
	format(string, sizeof(string), "Esta en el mundo virtual: {5EB5FF}%d", PlayerInfo[params[0]][pVirtualWorld]);
	SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:givelac(playerid, const params[])
{
	new id, amount;
	if(PlayerInfo[playerid][pAdmin] < 6) return 0;
	if(sscanf(params, "ud", id, amount)) return SendClientMessage(playerid, -1, "Modo de uso: /givelac [ID del jugador] [Cantidad]");
	PlayerInfo[id][pLAC] += amount;
	return 1;
}
CMD:setscore(playerid, const params[])
{
	new id, score;
	if(PlayerInfo[playerid][pAdmin] < 6) return 0;
	if(sscanf(params, "ud", id, score)) return SendClientMessage(playerid, -1, "Modo de uso: /setscore [ID del Jugador] [Nivel]");
	PlayerInfo[id][p_LEVEL] = score;
	CalcularExpNivel(playerid);
	SetPlayerScore(id, score);
	SetPlayerStatsWeapons(id);
	new Query[140];
	format(Query, sizeof(Query), "UPDATE `lac_users` SET `level`=%d WHERE `id`=%d", PlayerInfo[id][p_LEVEL], PlayerInfo[id][pID]);
	mysql_tquery(conexion, Query);

	return 1;
 }
CMD:givedrink(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new id, level;
	if(sscanf(params, "ud", id, level)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/givedrink [ID] [Nivel de sed]");
	if(level < 0 || level > 100) return SendClientMessage(playerid, -1, "Nivel de sed permitido: {5EB5FF}0 - 100");
	PlayerInfo[id][pSed] = level;
	return 1;
}
CMD:setskin(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new id, skin;
	if(sscanf(params, "ud", id, skin)) return SendClientMessage(playerid, Blanco, "/setskin [ID del Jugador] [ID]");
	if(!IsPlayerLogged(id)) return 1;
	PlayerInfo[id][pRopa] = skin;
	SetPlayerSkin(id, skin);
	return 1;
}
CMD:darvehiculo(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	if(sscanf(params, "dD(0)", params[0], params[1])) return SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/darvehiculo [Model ID] Optional: [Type]");
	if(params[0] < 400 || params[0] > 611) return SendClientMessage(playerid, -1, "Menor 400 y Mayor 611.");
	
	new vehicleid = CrearVehiculoAdmin(playerid, params[0], params[1], 1);

	new string[58];
	format(string, sizeof(string), "[ADMIN]: %s (%d) genero un veh�culo (%d).", PlayerInfo[playerid][p_Name], playerid, vehicleid);
	SendAdminMessage(Amarillo, string);
	return 1;
}
CMD:agregarvehiculo(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new color1, color2, comprable, precio, moneda, propietario[30],edit, vehicle;
	if(sscanf(params, "ddddddD(0)s[30]", color1, color2, comprable, precio, moneda, edit, vehicle, propietario)) return SendClientMessage(playerid, Blanco, "/agregarvehiculo [Color1] [Color2] [Comprable 0-1] [Precio] [Moneda 0-1] [Propietario]");
	new Float:X,Float:Y,Float:Z,Float:z_A,vehicleid,modelo,Query[256];
	vehicleid = GetPlayerVehicleID(playerid);/* } else { vehicleid = VSInfo[vehicle][vsIcID]; }*/
	GetVehiclePos(vehicleid, X,Y,Z);
	GetVehicleZAngle(vehicleid, z_A);
	modelo = GetVehicleModel(vehicleid);
	/*SendClientMessage(playerid,Blanco,"El Veh�culo se Creo Correctamente.");*/
	if(edit == 0)
	{
		format(Query, sizeof(Query), "INSERT INTO `lac_vehicles` (modelo, precio,x,y,z,a,color1,color2,comprable,moneda, propietario) VALUES ('%d','%d','%f','%f','%f','%f','%d','%d','%d','%d', '%s')", modelo,precio,Float:X,Float:Y,Float:Z,Float:z_A,color1,color2,comprable,moneda, propietario);
		SendClientMessage(playerid,Blanco,"El Veh�culo se Creo Correctamente.");
	}
	else
	{
		format(Query, sizeof(Query), "UPDATE `lac_vehicles` SET `modelo`='%d', `precio`='%d',`x`='%f',`y`='%f',`z`='%f',`a`='%f',`color1`='%d',`color2`='%d',`comprable`='%d',`moneda`='%d', propietario='%s' WHERE `id` = '%i'", modelo,precio,Float:X,Float:Y,Float:Z,Float:z_A,color1,color2,comprable,moneda, propietario,vehicle);
		SendClientMessage(playerid,Blanco,"El Veh�culo se Creo Correctamente.");
	}
	mysql_tquery(conexion, Query);
	DestroyVehicle(vehicleid);
	CreateVehicle(modelo, X,Y,Z,z_A,color1, color2,900);
	return 1;
}
/*CMD:editvehicle(playerid, const params[])
{
	new id, string[128], vehicleidt = GetPlayerVehicleID(playerid);
	new item[32];
	if(!sscanf(params, "s[32]d", item, id))
	{
		if(PlayerInfo[playerid][pAdmin] < 7) return 0;
		if(strcmp(item, "pos", true) == 0)
		{
			new Float:x, Float:y, Float:z, Float:a;
			new vehicleid = VSInfo[id][vsIcID];
			new newmodel = GetVehicleModel(vehicleidt);

			GetVehiclePos(vehicleidt, x, y, z);
			GetVehicleZAngle(vehicleidt, a);
			VSInfo[vehicleid][vsX] = x;
			VSInfo[vehicleid][vsY] = y;
			VSInfo[vehicleid][vsZ] = z;
			VSInfo[vehicleid][vsA] = a;
			VSInfo[vehicleid][vsModelo] = newmodel;
			EnAuto[playerid] = vehicleid;
			BajandoVehiculo[playerid] = 0;
			PutPlayerInVehicle(playerid, vehicleid, 0);
			SetVehiclePos(vehicleid, x, y, z);
			SetVehicleZAngle(vehicleid, a);
			SendClientMessage(playerid, -1, "Se modifico la posici�n el veh�culo."); 
			SaveVehicleServer(vehicleid);
		}
		else if(strcmp(item, "setpos", true) == 0)
		{
			new vehicleid = id;
			SetPlayerPos(playerid, VSInfo[vehicleid][vsX],VSInfo[vehicleid][vsY],VSInfo[vehicleid][vsZ]);
		}
	}
	else
	{
		if(strcmp(params, "getid", true) == 0)
		{
			format(string, sizeof(string), "Este veh�culo es el ID: %d en la DB. %d", VSInfo[vehicleidt][vsID], vehicleidt);
			SendClientMessage(playerid, -1, string);
		}
		
	}
	return 1;
}*/
CMD:destroyvehicle(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, Blanco, "/destroyvehicle [ID del Veh�culo]");
	DestroyVehicleEx(params[0]);
	return 1;
}

CMD:stoprent(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	if(sscanf(params, "dd", params[0])) return SendClientMessage(playerid, Blanco, "/stoprent [ID]");

	new vehicleid = Player.Temp[params[0]][@RentVehicle];
	Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
	PlayerInfo[params[0]][p_RentSeconds] = 0;
	PlayerInfo[params[0]][p_RentMinutes] = 0;

	new Query[200];
	format(Query, sizeof(Query), "DELETE FROM `lac_uservehicles` WHERE `Car_ID`=%d;",
		VEHICLES_PLAYER[ Player.Temp[params[0]][@RentVehicle] ][player_vehicle_ID]);
	mysql_tquery(conexion, Query);

	Player.Temp[params[0]][@RentVehicle] = -1;

	SetTimerEx("RespawnearVehiculo", 2000, false, "ii", vehicleid, 1);
	RemovePlayerFromVehicle(params[0]);
	funct_HideTextdrawNotif(params[0], VNOTI_TYPE_RENTEDVEHICLE);
	return 1;
}

CMD:respawnvehicle(playerid, const params[]){
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, Blanco, "Modo de Uso: /respawnvehicle [ID del Veh�culo]");
	SetVehicleToRespawn(params[0]);
	return 1;
}

CMD:banear(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	new string[128], id, razon[128];
	if(sscanf(params, "us[128]",id, razon)) return SendClientMessage(playerid, Blanco, "Modo de uso: {5EB5FF}/banear [ID - Nombre del Jugador] [Raz�n]");
	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) return ShowPlayerInfoTextdraw(playerid, "~r~No puedes hacer esto.", 2000);
	if(!PlayerInfoTemp[id][pt_IsLoggedIn]) return SendClientMessage(playerid, Blanco, "No hay ning�n jugador con esa ID o el jugador aun no ha ingresado.");
	
	AddPlayerBan(PlayerInfo[id][pID], PlayerInfo[id][p_IP], PlayerInfo[playerid][pID], 2, razon);
	format(string, sizeof(string), "El administrador {5EB5FF}%s (%d) {FFFFFF}te ha baneado. Raz�n: %s", PlayerInfoTemp[playerid][pt_Name], playerid, razon);
	SendClientMessage(id, -1, string);
	KickEx(id, 500, 1);

	format(string, sizeof(string), "[ADMIN]: %s (%d) baneo a %s (%d). Raz�n: %d", PlayerInfo[playerid][p_Name], playerid, PlayerInfo[id][p_Name], id, razon);
	SendAdminMessage(Amarillo, string);
	return 1;
}
alias:banear("ban")

CMD:san(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new string[128], id, tiempo, razon[52];
	if(sscanf(params, "uds[52]", id, tiempo, razon)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/san [ID del Jugador] [Tiempo] [Raz�n]");
	if(!IsPlayerLogged(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
	format(string, sizeof(string), "%s te ha sancionado por %dm. Raz�n: %s", PlayerInfoTemp[playerid][pt_Name], tiempo, razon);
	SendClientMessage(id, 0xCD928BFF,string);

	AddPlayerBan(PlayerInfo[id][pID], PlayerInfo[id][p_IP], PlayerInfo[playerid][pID], 3, razon, tiempo);
	KickEx(id, 500);

	return 1;
}
CMD:rvplayer(playerid, const params[]){
	new id;
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, Blanco, "Modo de Uso: /rvplayer [ID o Nombre del Jugador]");
	if(!IsPlayerLogged(id)) return SendClientMessage(playerid, -1, "Ese jugador no esta conectado.");
	if(PlayerInfo[id][p_State_Game] != GAME_STATE_CRACK) return 1;
	PlayerInfo[id][p_State_Game] = GAME_STATE_NORMAL;
	ClearAnimations(id);
	ApplyAnimation(id, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	SetHealth(id, 100);
	//DarArmas(id);
	return 1;
}
CMD:crearpropiedad(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
	    new id[10];
        new i = GetAvailablePropertyID();
        format(id, 10, "%i", i);
		new precio, nivel, interior, tipo, moneda;
		if(sscanf(params, "iiiii", precio, nivel, interior, tipo, moneda)) return SendClientMessage(playerid, Blanco, "USA: /crearpropiedad [precio] [nivel] [interior ID] [Tipo: 0 - 1] [Moneda: DP - 0 y LAC - 1]");
		new query[512], Float:PX, Float:PY, Float:PZ, Float:PAngle;
		GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerFacingAngle(playerid, PAngle);
		ParkingInfo[i][pgID] = 1;
		ParkingInfo[i][pgPrecio] = precio;
		ParkingInfo[i][pgNivel] = nivel;
		ParkingInfo[i][pgExteriorX] = PX;
		ParkingInfo[i][pgExteriorY] = PY;
		ParkingInfo[i][pgExteriorZ] = PZ;
		ParkingInfo[i][pgExteriorA] = PAngle+180;
		ParkingInfo[i][pgVendida] = 0;
		ParkingInfo[i][pgOwnerID] = 0;

		switch(tipo)
		{
			case 0: ParkingInfo[i][pgParkingType] = 0;
			case 1: ParkingInfo[i][pgParkingType] = 1;
		}
		switch(moneda)
		{
			case 0: ParkingInfo[i][pgMoneda] = 0;
			case 1: ParkingInfo[i][pgMoneda] = 1;
		}

	 	format(query, sizeof(query), "INSERT INTO `lac_parkings` (Precio, Nivel, ExteriorX, ExteriorY, ExteriorZ, ExteriorA, InteriorID, ParkingType) VALUES (%d, %d, %f, %f, %f, %f, %d, %d)", precio, nivel, ParkingInfo[i][pgExteriorX], ParkingInfo[i][pgExteriorY], ParkingInfo[i][pgExteriorZ], ParkingInfo[i][pgExteriorA], ParkingInfo[i][pgInteriorID], ParkingInfo[i][pgParkingType]);
	 	mysql_tquery(conexion, query, "", "", i);
		ParkingInfo[i][pgVirtualWorld] = i+100000;
		GuardarDatoFilaInt("lac_parkings", "VWInt", ParkingInfo[i][pgVWInt], 0, "id_parking", id);
	}
	else return 0;
	return 1;
}
CMD:dartrabajo(playerid, const params[]){
	new id, slotid, trabajoid;
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	if(sscanf(params, "udd", id, slotid, trabajoid)) return SendClientMessage(playerid, Blanco, "Modo de Uso: /dartrabajo [Nombre o ID del Jugador] [Trabajo 1 o 2] [Numero del Trabajo]");
	if(slotid == 1)
	{ PlayerInfo[id][pJob] = trabajoid; }
	else
	{  }
	return 1;
}
CMD:zlapm(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new Float:newX, Float:newY, Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(!sscanf(params, "ff", newX, newY))
	{
		SetPlayerPos(playerid, X+newX, Y+newY, Z);
	}
	return 1;
}
CMD:jump(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	new userid, Float:X,Float:Y,Float:Z;
	if(sscanf(params, "u", userid)) return SendClientMessage(playerid, -1, "Modo de uso: /jump [ID del Jugador]");
	GetPlayerPos(userid, X,Y,Z);
	SetPlayerPos(userid, X,Y,Z+20.0);
	return 1;
}
CMD:fixvehicle(playerid, const params[])
{
	new type;
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	if(sscanf(params, "D(0)", type)) return SendClientMessage(playerid, -1, "Modo de uso: /fixvehicle [0 Default - 1]");
	if(type == 0)
	{
		RepairVehicle(GetPlayerVehicleID(playerid));
		SetVehicleHealthEx(GetPlayerVehicleID(playerid), 1000.0);
	}
	else
	{
		for(new v = 1, j = GetVehiclePoolSize(); v <= j; v++)
		{
			RepairVehicle(v);
			SetVehicleHealthEx(v, 1000.0);
		}
	}
	return 1;
}
CMD:sethpveh(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new vehicleid, Float:health;
	if(!sscanf(params, "df", vehicleid, health))
	{
		SetVehicleHealthEx(vehicleid, health);
	} else SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/sethpveh [ID del Veh�culo]");
	return 1;
}
CMD:traerv(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new vehicleid, Float:X, Float:Y, Float:Z;
	if(sscanf(params, "d", vehicleid)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/traerv [ID del veh�culo]");
	GetPlayerPos(playerid, X, Y, Z);
	SetVehiclePosEx(vehicleid, X, Y, Z);
	LinkVehicleToInteriorEx(vehicleid, GetPlayerInterior(playerid));
	SetVehicleVWEx(vehicleid, GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicleEx(playerid, vehicleid, 0);
	return 1;
}
CMD:setposv(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new vehicleid;
	if(sscanf(params, "d", vehicleid)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/setposv [ID del veh�culo]");
	if(!Vehicles_Info[vehicleid][gi_vehicle_VALID]) return SendClientMessage(playerid, -1, "Veh�culo invalido.");
	SetVW(playerid, Vehicles_Info[vehicleid][gi_vehicle_VW]);
	SetInterior(playerid, Vehicles_Info[vehicleid][gi_vehicle_INT]);
	PutPlayerInVehicleEx(playerid, vehicleid, 0);
	return 1;
}

CMD:editarcasa(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new string[128], option[32], id, amount, Float:x, Float:y, Float:z, Float:angle;
	if(sscanf(params, "ds[32]D(10)", id, option, amount))
	{
		SendClientMessage(playerid, Blanco, "USA: {5EB5FF}/editarcasa [ID] [Opcion] [Valor]");
		SendClientMessage(playerid, Blanco, "Opciones: exterior, interior, pickup, borrar");
		return 1;
	}
	if (id < 1 || id > MAX_CASAS)
	{
		format(string, sizeof(string), "Solo ID del 1 al %d.", MAX_CASAS);
		SendClientMessage(playerid, Gris, string);
		return 1;
	}
	if(!CasaInfo[id][id_property])
	{
		SendClientMessage(playerid, Rojo, "ID no Encontrada.");
		return 1;
	}
	if(strcmp(option, "interior", true) == 0)
	{
		if(sscanf(params, "ds[32]d", id, option, amount)) return SendClientMessage(playerid, -1, "InteriorID");
		

	}
	else if(strcmp(option, "exterior", true) == 0)
	{
		if(sscanf(params, "ds[32]d", id, option)) return SendClientMessage(playerid, -1, "<ID>");
		new i[10];
		GetPlayerPos(playerid, x,y,z);
		GetPlayerFacingAngle(playerid, angle);
		format(i, 10, "%i", CasaInfo[id][id_property]);
		CasaInfo[id][cExteriorX] = x;
		CasaInfo[id][cExteriorY] = y;
		CasaInfo[id][cExteriorZ] = z;
		CasaInfo[id][cAnguloExt] = angle+180;

		GuardarDatoFilaFloat("lac_casas", "ExteriorX", CasaInfo[id][cExteriorX], 0, "id_casa", i);
		GuardarDatoFilaFloat("lac_casas", "ExteriorY", CasaInfo[id][cExteriorY], 0, "id_casa", i);
		GuardarDatoFilaFloat("lac_casas", "ExteriorZ", CasaInfo[id][cExteriorZ], 0, "id_casa", i);
		GuardarDatoFilaFloat("lac_casas", "AngleExt", CasaInfo[id][cAnguloExt], 0, "id", i);
		SendClientMessage(playerid, -1, "Le has cambiado el exterior a la propiedad.");
	}
	else if(strcmp(option, "precio", true) == 0)
	{
		if(sscanf(params, "ds[32]d", id, option, amount)) return SendClientMessage(playerid, -1, "InteriorID");
		new i[10];
		format(i, 10, "%i", CasaInfo[id][id_property]);
		CasaInfo[id][cPrecio] = amount;

		GuardarDatoFilaInt("lac_casas", "Precio", CasaInfo[id][cPrecio], 0, "id_casa", i);
		SendClientMessage(playerid, -1, "Le has cambiado el precio a la propiedad.");
	}
	else if(strcmp(option, "moneda", true) == 0)
	{
		if(sscanf(params, "ds[32]d", id, option, amount)) return SendClientMessage(playerid, -1, "InteriorID");
		new i[10];
		format(i, 10, "%i", CasaInfo[id][id_property]);
		CasaInfo[id][cHouseType] = amount;

		GuardarDatoFilaInt("lac_casas", "HouseType", CasaInfo[id][cHouseType], 0, "id_casa", i);
		SendClientMessage(playerid, -1, "Le has cambiado la moneda a la propiedad.");
	}
	return 1;
}

CMD:editparking(playerid, const params[])
{
	new string[128], option[32], id, amount, Float:x, Float:y, Float:z, Float:a;
	if(sscanf(params, "ds[32]D(10)", id, option, amount))
	{
		SendClientMessage(playerid, Blanco, "USA: {5EB5FF}/editparking [ID] [Opcion] [Valor]");
		SendClientMessage(playerid, Blanco, "Opciones: exterior, interior, extra_pos, borrar");
		return 1;
	}
	if (id < 0 || id > MAX_PARKING)
	{
		format(string, sizeof(string), "Solo ID del 0 al %d.", MAX_CASAS);
		SendClientMessage(playerid, Gris, string);
		return 1;
	}
	if(!ParkingInfo[id][pgID])
	{
		SendClientMessage(playerid, Rojo, "ID no Encontrada.");
		return 1;
	}
	if(strcmp(option, "interior", true) == 0)
	{
		if(sscanf(params, "ds[32]", id, option)) return SendClientMessage(playerid, -1, "InteriorID");

		GetPlayerPos(playerid, x,y,z);
		GetPlayerFacingAngle(playerid, a);
		ParkingInfo[id][pgInteriorX] = x;
		ParkingInfo[id][pgInteriorY] = y;
		ParkingInfo[id][pgInteriorZ] = z;
		ParkingInfo[id][pgInteriorA] = a;
		ParkingInfo[id][pgInteriorInt] = GetPlayerInterior(playerid);


		new Query[255];
		format(Query, sizeof(Query), "UPDATE `lac_parkings` SET `IntX`=%f, `IntY`=%f, `IntZ`=%f, `IntA`=%f, `InteriorInt`=%d WHERE `id_parking` = %d", x,y,z,a,GetPlayerInterior(playerid), ParkingInfo[id][pgID]);
		mysql_tquery(conexion, Query);

		SendClientMessage(playerid, -1, "Le has cambiado el interior a la propiedad.");
	}

	return 1;
}
CMD:getidparking(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	for(new i = 0; i < MAX_PARKING; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid,2.0,ParkingInfo[i][pgExteriorX], ParkingInfo[i][pgExteriorY], ParkingInfo[i][pgExteriorZ]))
		{
			new string[50];
			format(string, sizeof(string), "ID del parqueo en DB: %d y In-Game: %d", ParkingInfo[i][pgID], i);
			SendClientMessage(playerid, -1, string);
		}
	}
	return 1;
}

CMD:setskinpolice(playerid, const params[])
{
	new id, skinid;
	if(PlayerInfo[playerid][p_FactionMember] != 1) return 0;
	if(sscanf(params, "ud", id, skinid)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/setskinpolice [ID del Jugador] [0-311]");
	if(skinid < 0 && skinid > 311) return SendClientMessage(playerid, -1, "No menor a 0, ni mayor a 311.");
	SetPlayerSkin(id, skinid);
	PlayerInfo[id][pSkinPolicia] = skinid;
	return 1;
}
/*CMD:giveplayerveh(playerid, const params[])
{
	new string[128], Query[256], player, price, model, moneda, color1, color2;
	new Float:X, Float:Y, Float:Z;
	if(PlayerInfo[playerid][pAdmin] < 6) return 0;
	if(!sscanf(params, "uddddd", player, price, model, moneda, color1, color2))
	{
		GetPlayerPos(playerid, X, Y, Z);
		if(carsforplayer[player] >= 2 && PlayerInfo[player][pVip] == 0) return SendClientMessage(playerid, -1, "Los jugadores sin cuenta Premium Silver o Premium Gold no pueden tener mas de 2 veh�culos.");
		else if(carsforplayer[player] >= 3 && PlayerInfo[player][pVip] == 1) return SendClientMessage(playerid, -1, "Los jugadores sin cuenta Premium Gold no pueden tener mas de 3 veh�culos.");
		else if(carsforplayer[player] == 4 && PlayerInfo[player][pVip] == 2) return SendClientMessage(playerid, Blanco, "Ya tienes 4 veh�culos.");
		new v = GetPlayerAvailableVehicleID();
		format(VehicleInfo[v][vMatricula], 32, "%s%s%s%s %d%d%d", LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], random(10), random(10), random(10));
		format(Query, sizeof(Query), "INSERT INTO `lac_uservehicles` (OwnerID, OwnerName, VehicleName, vModel, vColor1, vColor2, vPrecio, vMoneda, vMatricula) VALUES ('%d', '%s', '%s', '%d', '%d', '%d', '%d', '%d', '%s')",
		PlayerInfo[player][pID], GetPlayerNameEx(player), VehicleName[model - 400], model, color1, color2, price, moneda, VehicleInfo[v][vMatricula]);
		mysql_tquery(conexion, Query, "CargarDatoVehiculoJugador", "ii", playerid, v);
		VehicleInfo[v][vOwnerID] = PlayerInfo[player][pID];
		format(VehicleInfo[v][vOwnerName], 54, "%s", GetPlayerNameEx(player));
		VehicleCreated[v] = 1;
		VehicleInfo[v][vModel] = model;
		VehicleInfo[v][vSpawnX] = X;
		VehicleInfo[v][vSpawnY] = Y;
		VehicleInfo[v][vSpawnZ] = Z;
		VehicleInfo[v][vSpawnA] = 0.0;
		VehicleInfo[v][vColor1] = color1;
		VehicleInfo[v][vColor2] = color2;
		VehicleInfo[v][vPrecio] = price;
		VehicleInfo[v][vMoneda] = moneda;

		VehicleInfo[v][vICID] = CreateVehicle(model,X,Y,Z,0.0,color1,color2,-1);
	   	SetVehicleNumberPlate(VehicleInfo[v][vICID], VehicleInfo[v][vMatricula]);
	    Vehicles_Info[VehicleInfo[v][vICID]][gi_vehicle_GAS] = 40;
		VehicleTrunk[v] = GetTrunkSpaces(VehicleInfo[v][vModel]);

		format(string, 128, "El administrador %s te dio un {5EB5FF}%s {FFFFFF}| Matricula: {FABF00}%s{FFFFFF}.", PlayerName(playerid),VehicleName[VehicleInfo[v][vModel] - 400], VehicleInfo[v][vMatricula]);
		SendClientMessage(player, Blanco, string);
		carsforplayer[player]++;
	} else SendClientMessage(playerid, -1, "Modo de uso: /giveplayerveh [ID del Jugador] [Precio] [Modelo] [Moneda] [Color 1] [Color 2]");
	return 1;
}*/
CMD:giveadmin(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new id, admin;
	if(sscanf(params, "ud", id, admin)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/giveadmin [ID del Jugador] [Nivel de administrador]");
	if(admin == 1) { SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Ayudante."); }
	else if(admin == 2){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Moderador del canal de ayuda."); }
	else if(admin == 3){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Moderador del juego a prueba."); }
	else if(admin == 4){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Moderador del juego."); }
	else if(admin == 5){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Moderador global."); }
	else if(admin == 6){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Administrador."); }
	else if(admin == 7){SendClientMessage(id, -1, "{00E500}�Felicidades!,{FFFFFF} ahora te asignaron el rango Administrador due�o."); }
	new string[50];
	format(string, sizeof(string), "Le diste un rango administrativo a %s", PlayerInfoTemp[id][pt_Name]);
	SendClientMessage(playerid, -1, string);
	PlayerInfo[id][pAdmin] = admin;

	new Query[158];
	format(Query, sizeof(Query), "UPDATE `lac_users` SET `admin`=%d WHERE `id`=%d;", PlayerInfo[id][pAdmin], PlayerInfo[id][pID]);
	mysql_tquery(conexion, Query);
	return 1;
}
CMD:setfactionplayer(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new id, faccion, rank, string[128];
	if(sscanf(params, "udd", id, faccion, rank)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/setfactionplayer [ID del Jugador] [Facci�n ID] [Rango: 0 - 9]");
	if(faccion == 0) return SendClientMessage(playerid, -1, "La facci�n debe ser mayor a 0.");
	if(!FactionCrew.Info[id][@Valid]) return SendClientMessage(playerid, -1, "Esa banda no existe.");
	PlayerInfo[id][p_FactionMember] = faccion;
	PlayerInfo[id][p_FactionRank] = rank;

	new bool:search_faction;

	for(new i = 0; i < MAX_FACTION; i++)
	{
		if(PlayerInfo[playerid][p_FactionMember] == FactionCrew.Info[i][@ID])
		{
			Player.Faction[playerid][@Valid] = true;
			Player.Faction[playerid][@Index] = i;
			Player.Temp[playerid][@SelectedFactionID] = PlayerInfo[playerid][p_FactionMember];
			FactionCrew.Info[i][@OnlineMemb]++;
			search_faction = true;

			break;
		}
	}
	if(search_faction == false)
	{
		new DB_Query[128];
		new id_faction = FindUnloadFactionInactive();

		new update_time = gettime();
		ResetDataFactionInactive(id_faction);
		format(DB_Query, sizeof DB_Query, "UPDATE `lac_facciones` SET `LastUserActivity`=%d, `State`=0 WHERE `id` = %d;", update_time, FactionCrew.Info[id_faction][@ID]);
		mysql_tquery(conexion, DB_Query);

		Player.Faction[playerid][@Valid] = true;
		Player.Faction[playerid][@Index] = id_faction;
		FactionCrew.Info[id_faction][@OnlineMemb]++;

		format(DB_Query, sizeof DB_Query, "SELECT * FROM `lac_facciones` WHERE `id` = %d;", PlayerInfo[playerid][p_FactionMember]);
		mysql_tquery(conexion, DB_Query, "LoadDataPlayerFaction", "ii", playerid, id_faction);

	}
	FactionWarnGrafiti(playerid);

	format(string, sizeof(string), "%s te uni� a la banda {5EB5FF}%s{FFFFFF}.", PlayerInfoTemp[playerid][pt_Name], FactionCrew.Info[faccion][@Name]);
	SendClientMessage(id, -1, string);
	new Query[158];
	
	format(Query, sizeof(Query), "UPDATE `lac_users` SET `faction_id`=%d, `fact_rank`=%d WHERE `id`=%d;", PlayerInfo[id][p_FactionMember], PlayerInfo[id][p_FactionRank], PlayerInfo[id][pID]);
	mysql_tquery(conexion, Query);
	return 1;
}
CMD:givehealth(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new id, Float:health;
	if(sscanf(params, "uf", id, health)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/givehealth [ID del Jugador] [Vida]");
	if(!IsPlayerLogged(id)) return SendClientMessage(playerid, -1, "Jugador no conectado");
	SetHealth(id, health);
	SendClientMessage(playerid, -1, "Le Diste Vida a un Usuario.");
	SendClientMessage(id, -1, "Un administrador te dio Vida.");
	return 1;
}
CMD:givearmour(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new id, Float:armour;
	if(sscanf(params, "uf", id, armour)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/givearmour [ID del Jugador] [Armadura]");
	SetArmour(id, armour);
	SendClientMessage(playerid, -1, "Le Diste Chaleco a un Usuario.");
	return 1;
}
CMD:givemoney(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new string[128], id, money, fixed;
	if(sscanf(params, "udd", id, money, fixed)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/givemoney [ID del Jugador] [Dinero] [Fix: 0 - 1]");
	if(fixed == 0)
	{
		DarDinero(id, money);
	}
	else if(fixed == 1)
	{
		GivePlayerMoneyEx(playerid, money, false, true);
	}
	SendClientMessage(playerid, -1, "Le Diste Vida a un Usuario.");
	format(string, sizeof(string), "El administrador %s te dio $%d.", PlayerName(id), money);
	SendClientMessage(id, -1, string);
	return 1;
}
CMD:unprision(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return 0;
	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/unprision [ID del Jugador]");
	PlayerInfo[id][pTiempoCarcel] = 0;
	PlayerInfo[id][pPlaceCarcel] = 0;
	Jail[id] = 0;
	SetPlayerPos(id, 1511.5284,-1672.4637,14.0469);
	SetPlayerInterior(id, 0);
	SetPlayerVirtualWorld(id, 0);
	return 1;
}
/*CMD:ansan(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < )
	return 1;
}*/
CMD:w(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	new text[100], string[128];
	if(sscanf(params, "s[100]", text)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/w [Texto]");
	format(string, sizeof(string), "%s[%s](%d): %s", PlayerName(playerid), GetNameRangeAdmin(playerid), playerid, text);
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pAdmin] >= 3)
		{
			SendClientMessage(i, Amarillo, string);
		}
	}
	return 1;
}
CMD:reports(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return 0;
	new reportd[2000], items = 0, reason[54];

	DynamicDgui_Start(playerid);
	for(new i = 0; i < MAX_REPORTS; i++)
	{
		if(ReportsE[i][rSlotUsed] == 1 && items < 20)
		{
			new idreport = ReportsE[i][rReportID];
			DynamicDgui_AddVarEx(playerid, items, i);
			items++;
			if(strlen(ReportsE[i][rReason]) > 51)
			{
				strmid(reason,ReportsE[i][rReason], 0, 51);
				format(reason, sizeof(reason), "%s...",reason);
			}
			else
			{
				format(reason, sizeof(reason), "%s", ReportsE[i][rReason]);
			}
			format(reportd, sizeof(reportd), "%sID: %i - Nivel: %i - R: %s\n", reportd,idreport,PlayerInfo[idreport][p_LEVEL], reason/*ReportsE[i][rReason]*/);
		}
		else if(ReportsE[i][rSlotUsed] == 0 && items < 20)
		{
			DynamicDgui_AddVarEx(playerid, items, -1);
			items++;
			format(reportd, sizeof(reportd), "%s-\n", reportd);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_REPORTS, DIALOG_STYLE_LIST, "{5EB5FF}Reportes", reportd, "Ver reporte", "Salir");
	return 1;
}
CMD:mute(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return 0;
	new string[128], id, timem, reason[64];
	if(sscanf(params, "uis[64]", id, timem, reason)) return SendClientMessage(playerid, -1, "Modo de uso: {5EB5FF}/mute [ID del Jugador] [Tiempo] [Raz�n]");
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Ese jugador no se encuentra conectado.");
	QuestionTime[id] = timem*60;
		
	format(string, sizeof(string), "%s te acaba de mutear por %s.", PlayerName(playerid), reason);
	CreatePlayerNotificationSimple(id, VNOTI_TYPE_MUTEPLAYER, string, 18);

	format(string, sizeof(string), "Acabas de mutear a %s por %s.", PlayerName(id), reason);
	CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_MUTEPLAYER, string, 18);

	//RemoveMoney(id, timem*60);
	//format(string, sizeof(string), "Se te descontaron {00E500}$%d {FFFFFF}por el muteo en el canal de dudas.", timem*60);
	//SendClientMessage(id, -1, string);
	return 1;
}
CMD:editbarrier(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new id, string[128];
	new item[32];
	if(!sscanf(params, "s[32]d", item, id))
	{
		if(strcmp(item, "pos", true) == 0)
		{
			new Float:x, Float:y, Float:z;

			GetPlayerPos(playerid, x, y, z);
			BSVInfo[id][bsvPX] = x;
			BSVInfo[id][bsvPY] = y;
			BSVInfo[id][bsvPZ] = z;
			SendClientMessage(playerid, -1, "Se modifico la posici�n el jugador en barreras."); 
			SaveBarrierServer(id);
		}
		/*else if(strcmp(item,"poslabel", true) == 0)
		{
			new Float:x, Float:y, Float:z;

			GetPlayerPos(playerid, x, y, z);
			BSVInfo[id][bsvLX] = x;
			BSVInfo[id][bsvLY] = y;
			BSVInfo[id][bsvLZ] = z;
			SendClientMessage(playerid, -1, "Se modifico la posici�n del label de la barrera."); 
			SaveBarrierServer(id);
		}*/
		else if(strcmp(item,"postp", true) == 0)
		{
			SetPlayerPos(playerid, BSVInfo[id][bsvX], BSVInfo[id][bsvY], BSVInfo[id][bsvZ]);
			SendClientMessage(playerid, -1, "Se modifico la posici�n del label de la barrera."); 
			/*SaveBarrierServer(id);*/
		}
	}
	else
	{
		if(strcmp(params, "getid", true) == 0)
		{
			for(new i = 0; i < MAX_BARRIERS; i++)
			{
				if(PlayerToPoint(5.0, playerid, BSVInfo[i][bsvX], BSVInfo[i][bsvY], BSVInfo[i][bsvZ]))
			/*	if(GetPlayerDistanceFromPoint(playerid, BSVInfo[i][bsvX], BSVInfo[i][bsvY], BSVInfo[i][bsvZ]) >= 5.0)*/
				{
					format(string, sizeof(string), "Esta barrera es el ID: {5EB5FF}%d {FFFFFF}In-Game y {5EB5FF}%d {FFFFFF}en la DB.", i, BSVInfo[i][bsvID]);
					SendClientMessage(playerid, -1, string);
					/*return 1;*/
				}
			}
		}
	}
	return 1;
}
CMD:crono(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	if(cronotimestate == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "Cronometro activado.");
		cronotimestate = 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "Cronometro Desactivado");
		cronotimestate = 0;
		new string[52];
		format(string, sizeof(string), "Tiempo: %d", cronotime);
		SendClientMessage(playerid, COLOR_WHITE, string);
		cronotime = 0;
	}
	return 1;
}
CMD:editgender(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new idplayer, gender;
	if(!sscanf(params, "ud", idplayer, gender))
	{
		if(gender < 0 || gender > 1) return SendClientMessage(playerid, -1, "{5EB5FF}Modo de uso: {FFFFFF}0 - Masculino : 1 - Femenino");
		if(!IsPlayerLogged(idplayer)) return SendClientMessage(playerid, -1, "Jugador no conectado.");
		PlayerInfo[idplayer][p_Gender] = gender;

		new Query[140];
		format(Query, sizeof(Query), "UPDATE `lac_users` SET `Genero`=%d WHERE `id`=%d", PlayerInfo[playerid][p_Gender], PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, Query);

		if(gender == 0) { SendClientMessage(playerid, -1, "Ahora el genero es Masculino."); } else { SendClientMessage(playerid, -1, "Ahora el genero es Femenino."); }
	} else SendClientMessage(playerid, -1, "{FFFFFF}Modo de uso: {5EB5FF}/editgender [ID] [0-1]");
	return 1;
}
CMD:servicepolice(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return 0;
	if(PlayerInfo[playerid][pDutyPolicia] == 1)
	{
		PlayerInfo[playerid][pDutyPolicia] = 0;
		SendClientMessage(playerid, -1, "Ahora estas fuera de servicio.");
	}
	else 
	{ 
		PlayerInfo[playerid][pDutyPolicia] = 1; 
		SendClientMessage(playerid, -1, "Ahora estas en servicio.");
	}
	return 1;
}
CMD:setangleplayer(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new id, Float:angle;
	if(sscanf(params, "Uf", id, angle)) return 1;

	SetPlayerFacingAngle(id, angle);
	return 1;
}
CMD:resetmission(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	PlayerInfo[playerid][p_WorkTravel] = 0;
	PlayerInfo[playerid][p_JobTravelT] = 0;
	PlayerInfo[playerid][p_JobTravel] = 0;
	PlayerInfo[playerid][p_JobTravelNext] = 0;
	PlayerInfo[playerid][p_JobMissionExtra] = 0;
	PlayerInfo[playerid][p_JobMissionExtraValue] = 0;
	PlayerInfo[playerid][p_JobMissionExtraID] = 0;
	DestroyVehicle(CamionID[playerid]);
	CamionID[playerid] = INVALID_VEHICLE_ID;
	return 1;
}

CMD:resetservergraffitis(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	for(new i = 0; i < MAX_FACTION_GRAFITIS; i++)
	{
		if(Grafiti.Info[i][@ID] == 0) continue;
		Grafiti.Info[i][@Time] = (3600*i);
		mysql_tquery_s(conexion, str_format("UPDATE `lac_faction_grafitis` SET `time` = %d WHERE `id_grafiti`=%d;",Grafiti.Info[i][@Time], Grafiti.Info[i][@ID]));
	}
	return 1;
}



CMD:testvehicle(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	
	new clase[2];
	new Map:clasem;
	
	new data[2];
	clasem = map_new();
	data[0] = 20;
	data[1] = 80;
	map_add_arr(clasem, 0, data);

	clase[0] = 20;
	clase[1] = 80;

	new OnGameModeInitCount = GetTickCount();

	SendClientMessageEx(playerid, -1, "%d y %d", clase[0], clase[1]);
	
    printf("Excecuted OnGameModeInit, time taken: %d", GetTickCount() - OnGameModeInitCount);

    new datatest[2];

    OnGameModeInitCount = GetTickCount();

    map_get_arr(clasem, 0, datatest);

	SendClientMessageEx(playerid, -1, "%d y %d", datatest[0], datatest[1]);
	
    printf("Excecuted OnGameModeInit Test, time taken: %d", GetTickCount() - OnGameModeInitCount);
	//new Float:rx,Float:ry, Float:rz, Float:z_angle;
    //GetVehicleRotation(GetPlayerVehicleID(playerid), rx, ry, rz);
    //GetVehicleZAngle(GetPlayerVehicleID(playerid), z_angle);
    //SendClientMessageEx(playerid, -1, "%f, %f, %f y z: %f, absolute %f", rx,ry,rz, z_angle, absoluteangle_func(z_angle));
	return 1;
}

CMD:debug2(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	SetPlayerAmmo(playerid, PlayerInfo[playerid][pWeapon], 40);
	return 1;
}

CMD:resethousethief(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return 0;
	VarsForServer_B[e_VFS_TheftDoor][0] = gettime()-1800;
	VarsForServer_B[e_VFS_OpenTheftDoor][0] = false;
	VarsForServer_B[e_VFS_TheftDoor][1] = gettime()-1800;
	VarsForServer_B[e_VFS_OpenTheftDoor][1] = false;
	return 1;
}

new sphere;
CMD:testnpc(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new vehicleid, Float:radius;
	if(sscanf(params, "df", vehicleid, radius)) return 1;
	
	new Float:x, Float:y, Float:z;
	GetVehiclePos(vehicleid, x,y,z);
	DestroyDynamicArea(sphere);
	
	new Float:X, Float:Y, Float:Z;
	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
	if(radius == 0.0)
	{
		
		radius = (Y/2)+0.8;
	}
	printf("Size: %f y %f", (Y/2)+0.0, Y);


	sphere = CreateDynamicSphere(0.0, 0.0, 0.0, radius);
	AttachDynamicAreaToVehicle(sphere, vehicleid);
	//pritnf("ID: %d o %d", IsPlayerInAnyDynamicArea(playerid));
	return 1;
}

CMD:testcheckpoint(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new vehicleid;
	if(sscanf(params, "d", vehicleid)) return 1;
	SetVehiclePos(vehicleid, -206.6460 + (4.0 * randomEx(1, 20)), 47.6699, 1100.1149);
	SetVehicleZAngle(vehicleid, 0.0);
	return 1;
}

CMD:getposme(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return 0;
	new string[64], Float:x,Float:y,Float:z;
	GetPlayerPos(playerid, x,y,z);
	format(string, sizeof(string),"X - %f, Y - %f, Z - %f",x,y,z);
	SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:pd(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	SendPaydayForPlayer(playerid);
	return 1;
}

CMD:deletetext(playerid, const params[])
{
	printf("Anim: %d", GetPlayerAnimationIndex(playerid));
	//new Float:x,Float:y,Float:z;
	//if(sscanf(params, "fff", x,y,z)) return 1;
	//SetVehicleAngularVelocity(GetPlayerVehicleID(playerid), x,y,z);
	return 1;
}
CMD:text(playerid, const params[])
{
	new message[400], name[30];

	new data[E_FAC_GENE_PLAYER_DATA];

	if (!GetPlayerDataListGene(playerid, 0, data)) {
	    return 0;
	}
	//if(sscanf(params, "s[400]", message)) return 1;
	str_get(data[E_FAC_GENE_STRING], name, sizeof(name));

	format(message, sizeof(message), "%s", name);
	SplitTextDrawString(message, 110.0, 0.240, 1);
	new lines = GetTextDrawLineCount(message);

	new i = vNotif_CreatePlayerBoxID(playerid, VNOTI_TYPE_FACTIONREGISTER, true);

	vNotif_CreatePlayerBoxTD(playerid, i, 38.0+(lines*VNOTI_LETTERSIZE_T_1));

	funct_CreateTextdrawTextNotifEx(playerid, i, 0, message, 1, .color = DataE.CrewColor[ data[E_FAC_GENE_DATA2] ][@Color]);
	funct_CreateTextdrawTextNotifEx(playerid, i, 1, "iTu banda fue creada!, puedes~n~invitar a otros jugadores~n~presionando 'Opciones'.", 1, 0.0, 4.0+(lines*VNOTI_LETTERSIZE_T_1), VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2);
	vNoti_SetTimeHideBox(playerid, i, 4);
	UpdateNotificationForPlayer(playerid, i);
	return 1;
}

CMD:getfrontpos(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new Float:x,Float:y,Float:z, Float:angle, Float:newx, Float:newy, Float:range, type;
	if(sscanf(params, "D(0)F(0.0)", type, range)) return 1;
	
	if(type == 0)
	{
		/*SetPlayerFacingAngle(playerid, angle);
		SetPlayerPos(playerid, x, y,z);*/
	}
	else
	{
		GetPlayerPos(playerid, x,y,z);
		GetPlayerFacingAngle(playerid, angle);
		GetPointInFrontPos(playerid, x, y, angle, newx, newy, range);
		/*SetPlayerPos(playerid, newx, newy, z);*/
		printf("[GetFrontPos] - %0.4f, %0.4f, %0.4f", newx, newy, z);
		
	}

	return 1;
}

new spheretest;
CMD:testmap(playerid, const params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	Timer_PlayerNewUpdate(playerid, 0);
	new Float:x, Float:y, Float:z, Float:radius;
	if(sscanf(params, "f", radius)) return 1;
	
	DestroyDynamicArea(spheretest);
	GetPlayerPos(playerid, x, y, z);
	spheretest = CreateDynamicSphere(x,y,z, radius);
	return 1;
}

new Float:AttachObject[MAX_PLAYERS][9];
CMD:testattach(playerid, params[])
{
	new id, Float:pos[9];
	if(sscanf(params, "dfffffffff", id, pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8])) return 1;

	AttachObject[playerid][0] = pos[0];
	AttachObject[playerid][1] = pos[1];
	AttachObject[playerid][2] = pos[2];
	AttachObject[playerid][3] = pos[3];
	AttachObject[playerid][4] = pos[4];
	AttachObject[playerid][5] = pos[5];
	AttachObject[playerid][6] = pos[6];
	AttachObject[playerid][7] = pos[7];
	AttachObject[playerid][8] = pos[8];

	SetPlayerAttachedObject(playerid,9,id,2,pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
		
	
	return 1;
}

CMD:desbugadminfaction(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;
	new index;
	if(sscanf(params, "d", index)) return SendClientMessage(playerid, -1, "{5EB5FF}USO: {FFFFFF}/desbugadminfaction [ID Faction]");

	AssignValueDefaultRank(index, 9, "Lider");
	AssignValueDefaultRank(index, 8, "Sublider");
	AssignValueDefaultRank(index, 7, "Veterano");
	AssignValueDefaultRank(index, 0, "Nuevo");

	RegisterNewFactionRank(playerid,index,9);
	RegisterNewFactionRank(playerid,index,8);
	RegisterNewFactionRank(playerid,index,7);
	RegisterNewFactionRank(playerid,index,0);
	return 1;
}

CMD:tpdesbug(playerid, params[])
{
	SetPlayerPosEx(playerid, 1178.7699,-1325.6493,14.1365, 0.0, 0, 0);
	return 1;
}

CMD:events(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;

	LAC_EventChristmasState(true);
	return 1;
}

CMD:reloadmaps(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 0;

	TogglePlayerControllable(playerid, 0);
	SendRconCommand("unloadfs Mapeos");
	SendRconCommand("loadfs Mapeos");
	TogglePlayerControllable(playerid, 1);
	return 1;
}
//Fin CmdAdmin