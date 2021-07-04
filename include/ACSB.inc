#include <a_samp>
#include <rBits>

#define GetPlayerDialogAC(%0)/* DialogSegureAC[%0]*/ GetPVarInt(%0, "DialogSegureAC")
#define SetPlayerDialogAC(%0, %1) SetPVarInt(%0, "DialogSegureAC", %1)

/*stock GetSquareDistance(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
        x1-=x2;
        y1-=y2;
        z1-=z2;
        x1*=x1;
        y1*=y1;
        z1*=z1;
        return floatround(x1+y1+z1);
}*/

stock /*ACSB_*/ShowPlayerDialogEx(playerid, dialogid, style, const caption[], const info[], const button1[], const button2[])
{
	/*DialogSegureAC[playerid] = dialogid;*/
	/*SetPlayerDialogAC(playerid, 1);*/
	SetPVarInt(playerid, "DialogSegureAC", dialogid);
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
}

stock ACSB_ShowPlayerDialog(playerid, dialogid, style, const caption[], const info[], const button1[], const button2[])
{
	SetPVarInt(playerid, "DialogSegureAC", dialogid);
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
}
#if defined _ALS_ShowPlayerDialog
    #undef ShowPlayerDialog
#else
    #define _ALS_ShowPlayerDialog
#endif
#define ShowPlayerDialog ACSB_ShowPlayerDialog

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(GetPlayerDialogAC(playerid) != dialogid) { Kick(playerid); return 1; } else { DeletePVar(playerid, "DialogSegureAC"); }
    #if defined ACSB_OnDialogResponse
        return ACSB_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif

}

#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif

#define OnDialogResponse ACSB_OnDialogResponse

#if defined ACSB_OnDialogResponse
    forward ACSB_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

/*stock IsPlayerTeleportCheck(i)
{
	if(!IsPlayerInRangeOfPoint(i, 350.0, ACInfo[i][acPosX],ACInfo[i][acPosY] ,ACInfo[i][acPosZ]) &&
 	!rBit1_Get(secureTP, i) && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
	{
		return 1;
	}
	GetPlayerPos(i, ACInfo[i][acPosX],ACInfo[i][acPosY],ACInfo[i][acPosZ]);
	rBit1_Set(secureTP, i, false);
	return 0;
}*/

/*stock IsPlayerAirbreak(playerid)
{

    new Float:xp,Float:yp,Float:zp; 
    new pstate; 
    if(IsPlayerConnected(playerid) && GetPlayerPos(playerid,xp,yp,zp))
    {
        pstate=GetPlayerState(playerid);
     	if(pstate==PLAYER_STATE_DRIVER && getPVSpeed(playerid)<10)
      	{ 
      		
       	    new var=(floatround(floatsqroot(GetSquareDistance(xp,yp,zp,ACInfo[playerid][acPosAX],ACInfo[playerid][acPosAY],ACInfo[playerid][acPosAZ]))*3600)); //Detecta la velocidad de posicion a posicion
            if(var>0) { var = var/(GetTickCount()-ACInfo[playerid][LastTickAB]); }
            if(var>=700 && var<=1500) 
            { 
            	return 1;
            	
            }
        }
     	if(pstate==PLAYER_STATE_ONFOOT && getPVSpeed(playerid)<10)
      	{
       	    new var=(floatround(floatsqroot(GetSquareDistance(xp,yp,zp,ACInfo[playerid][acPosAX],ACInfo[playerid][acPosAY],ACInfo[playerid][acPosAZ]))*3600)); //Detecta la velocidad de posicion a posicion
            if(var>0) { var = var/(GetTickCount()-ACInfo[playerid][LastTickAB]); }

            if(var>=700 && var<=1500 && !rBit1_Get(secureTP,playerid))
            {
            	return 1;
            }
       	}
		ACInfo[playerid][acPosAX]=xp;
		ACInfo[playerid][acPosAY]=yp;
		ACInfo[playerid][acPosAZ]=zp;
		ACInfo[playerid][LastTickAB] = GetTickCount();
	}
	return 0;
}*/


stock AC_SetSpawnInfo(playerid, team, skin, Float:x, Float:y, Float:z, Float:rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
{
	/*rBit1_Set(secureTP, playerid, true);*/
	return SetSpawnInfo(playerid, team, skin,x,y,z,rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo);
}

#if defined _ALS_SetSpawnInfo
        #undef SetSpawnInfo
#else
        #define _ALS_SetSpawnInfo
#endif
#define SetSpawnInfo AC_SetSpawnInfo