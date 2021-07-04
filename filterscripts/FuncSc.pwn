// CreateButton V1.0 By Blaster
#include <a_samp>
#include <streamer>


#define MAX_BUTTONS 100
#define ID_OBJECT_BUTTON 19305

#define INVALID_BUTTON_ID_E -1

AntiDeAMX()
{
	new a[][] =
	{
    	"Unarmed (Fist)",
    	"Brass K"
	};
	#pragma unused a
}

enum BUTTONS_INFO_E
{
	ObjectID,
	ObjectID2,
	bool:Created,
	ButtonState,
	Float:buttonPos[4],
	Float:buttonsPos[4],
};

new ButtonInfoE[MAX_BUTTONS+1][BUTTONS_INFO_E];


public OnFilterScriptInit()
{
	AntiDeAMX();
	return 1;
}

Float:Distance3DButtonE(Float:PointA[], Float:PointB[])
{
	new Float:Dist[4];
	for (new i = 0; i < 3; i++)
	{
	    Dist[i] = PointA[i] - PointB[i];
	    Dist[i] *= Dist[i];
	}
	Dist[3] = Dist[0] + Dist[1] + Dist[2];	

	return floatsqroot(Dist[3]);
}

GetClosestButtonE(Float:Point[], &Float:Distance = 0.0)
{
	new Closest = INVALID_BUTTON_ID_E, Float:Distance2 = 100000.0;
	for (new buttonid = 1; buttonid < MAX_BUTTONS; buttonid++)
	{
		if (ButtonInfoE[buttonid][Created])
		{
			Distance = Distance3DButtonE(Point, ButtonInfoE[buttonid][buttonPos]);
			if(Distance < Distance2)
			{
				Distance2 = Distance;
				Closest = buttonid;
			}
		}
	}

	Distance = Distance2;

	return Closest;
}



forward FS_CreateButtonE(Float:X, Float:Y, Float:Z, Float:RZ, Float:sX, Float:sY, Float:sZ, Float:sRZ);
public FS_CreateButtonE(Float:X, Float:Y, Float:Z, Float:RZ, Float:sX, Float:sY, Float:sZ, Float:sRZ)
{
	new buttonid;
	for(buttonid = 1; buttonid <= MAX_BUTTONS; buttonid++)

		if (!ButtonInfoE[buttonid][Created])  
			break;

	ButtonInfoE[buttonid][ObjectID]	= CreateDynamicObject(ID_OBJECT_BUTTON,X,Y,Z,0.0,0.0,RZ);
	ButtonInfoE[buttonid][ObjectID2] = CreateDynamicObject(ID_OBJECT_BUTTON,sX,sY,sZ,0.0,0.0,sRZ);
	ButtonInfoE[buttonid][buttonPos][0] = X;
	ButtonInfoE[buttonid][buttonPos][1] = Y;
	ButtonInfoE[buttonid][buttonPos][2] = Z;
	ButtonInfoE[buttonid][buttonsPos][0] = sX;
	ButtonInfoE[buttonid][buttonsPos][1] = sY;
	ButtonInfoE[buttonid][buttonsPos][2] = sZ;
	ButtonInfoE[buttonid][Created] = true;
	return buttonid;
}

forward FS_IsButtonEnabled(buttonid);
public FS_IsButtonEnabled(buttonid)
{
	return ButtonInfoE[buttonid][ButtonState];
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if(newkeys & 16)
		{
			new Float:Pos[4], Float:distance;
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			new buttonid = GetClosestButtonE(Pos, distance);
			if(buttonid != INVALID_BUTTON_ID_E && IsPlayerInRangeOfPoint(playerid, 1.0, ButtonInfoE[buttonid][buttonPos][0], ButtonInfoE[buttonid][buttonPos][1], ButtonInfoE[buttonid][buttonPos][2]) || IsPlayerInRangeOfPoint(playerid, 1.0, ButtonInfoE[buttonid][buttonsPos][0], ButtonInfoE[buttonid][buttonsPos][1], ButtonInfoE[buttonid][buttonsPos][2]))
			{
				/*ApplyAnimation(playerid, "HEIST9", "Use_SwipeCard", 10.0, 0, 0, 0, 0, 0);*/
				/*SetTimerEx("OnPlayerPressedButtonE_Timer", 500, false, "ii", playerid, buttonid);*/
				if(ButtonInfoE[buttonid][ButtonState] == 0)
				{
					ButtonInfoE[buttonid][ButtonState] = 1;
				}
				else
				{
					ButtonInfoE[buttonid][ButtonState] = 0;
				}
				CallRemoteFunction("OnPlayerPressedButton", "ii", playerid, buttonid);
				return 0;
			}
		}
	}
	return 1;
}

forward OnPlayerPressedButtonE_Timer(playerid, buttonid);
public OnPlayerPressedButtonE_Timer(playerid, buttonid)
{
	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	CallRemoteFunction("OnPlayerPressedButton", "ii", playerid, buttonid);
}