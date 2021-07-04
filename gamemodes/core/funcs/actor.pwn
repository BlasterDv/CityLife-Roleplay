CreateActorInterior(typeint, vw, int)
{
	switch(typeint)
	{
		case INTERIOR_TYPE_PIZZA:
		{
			CreateDynamicActor(155, 373.7524,-117.2788,1001.4995, 179.5049, true, 100.0, vw, int);
			CreateDynamicActor(155, 375.7254,-117.2764,1001.4922,179.5049, true, 100.0, vw, int);

		} 
		/*case INTERIOR_TYPE_DEALER1:
		{
			new temp = CreateDynamicActor(170, -112.5454,180.1471,1100.6094,180.3773, true, 100.0, vw, int);
			ApplyDynamicActorAnimation(temp,"ped","SEAT_down",4.1,0,0,0,1,0);
		}*/
		case INTERIOR_TYPE_HOSPITAL:
		{
			new temp = CreateDynamicActor(308, 1157.6432,-1317.3052,1334.2195,267.4020, true, 100.0, vw, int);
			ApplyDynamicActorAnimation(temp,"ped","SEAT_down",4.1,0,0,0,1,0);
		}
		case INTERIOR_TYPE_WORKFARMER:
		{
			new temp = CreateDynamicActor(72, -926.6327,590.8031,1014.1683,90.4208, true, 100.0, vw, int);
			ApplyDynamicActorAnimation(temp,"ped","SEAT_down",4.1,0,0,0,1,0);
		}
		case INTERIOR_TYPE_SEGUREVEHICLES:
		{
			new actor[5];
			actor[0] = CreateDynamicActor(141, 1091.4971,-1794.3807,1017.1729,4.2075, true, 100.0, vw, int);
			actor[1] = CreateDynamicActor(147, 1087.3019,-1794.3805,1017.1729,12.0409, true, 100.0, vw, int);
			actor[2] = CreateDynamicActor(240, 1081.7813,-1794.3806,1017.1729,3.9409, true, 100.0, vw, int);
			actor[3] = CreateDynamicActor(150, 1077.9323,-1794.3807,1017.1729,0.4959, true, 100.0, vw, int);
			for(new i = 0; i < 4; i++)
			{
				ApplyDynamicActorAnimation(actor[i],"INT_OFFICE", "OFF_SIT_TYPE_LOOP", 4.1, true, false, false, 0, false);		
			}
			actor[4] = CreateDynamicActor(91, 1083.9697,-1789.9618,1013.6790,359.5777, true, 100.0, vw, int);
			ApplyDynamicActorAnimation(actor[4],"ped","SEAT_down",4.1,0,0,0,1,0);	
		}
	}
	return 1;
}

#if !defined KEY_AIM
	#define KEY_AIM  128
#endif

#define MAX_ROBBERY_ACTORS		(50)

#define TYPE_SUCCESS        (0)
#define TYPE_FAILED         (1)
#define TYPE_UNFINISHED     (2)

#define MIN_MONEY_ROB       500
#define MAX_MONEY_ROB       10000
#define ROBBERY_WAIT_TIME   (5)


new i_actor = 0;

forward RunActorAnimationSequence(playerid, id, animation_pattern);
forward OnPlayerStartRobbery(playerid, actorid, robbed_recently);

stock CreateActorRobberyDoor(dbid, doorid, skinid, Float:x, Float:y, Float:z, Float:ang, actor_vwid = 0, r_moneymax = MAX_MONEY_ROB, anim = 0, const name[] = "")
{

	new actorid = GetActorFreeID();

	if(actorid == -1)
	{
		print("ERROR: MAX_ROBBERY_ACTOR reached, increase the limit size.");
		return -1;
	}

	Actor.RobberyStore[actorid][@DBID] = dbid;
	Actor.RobberyStore[actorid][@Actor] = CreateActor(skinid, x, y, z, ang);
	SetActorVirtualWorld(Actor.RobberyStore[actorid][@Actor], actor_vwid);
	//Actor.RobberyStore[actorid][@Actor] = CreateDynamicActor(skinid, x, y, z, ang);
	//SetDynamicActorVirtualWorld(Actor.RobberyStore[actorid][@Actor], actor_vwid);

	Actor.RobberyStore[actorid][@Created] = true;
	Actor.RobberyStore[actorid][@X] = x;
	Actor.RobberyStore[actorid][@Y] = y;
	Actor.RobberyStore[actorid][@Z] = z;

	Actor.RobberyStore[actorid][@Amount] = randomEx(7, 12);
	Actor.RobberyStore[actorid][@Money] = r_moneymax;

	CreateDynamic3DTextLabel(name, COLOR_WHITE, x + 0.0, y + 0.0, z + 1.0, 14.0,
		INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0,
		actor_vwid, -1, -1,
		STREAMER_3D_TEXT_LABEL_SD);

	Actor.RobberyStore[actorid][@DoorID] = doorid;
	Actor.RobberyStore[actorid][@Anim] = anim;
	ApplyDefaultAnimationActor(Actor.RobberyStore[actorid][@Actor], Actor.RobberyStore[actorid][@Anim]);

	return (++ i_actor - 1); 
}

static GetActorFreeID() 
{
	for(new i = 0; i < MAX_ROBBERY_ACTORS; i++) 
	{ 
		if(!Actor.RobberyStore[i][@Created]) return i;
	}
	return -1;
}

/****
	Robbery by Blaster 2019.
****/

public RunActorAnimationSequence(playerid, id, animation_pattern)
{
	if(Player.Temp[playerid][@CriminalActType] != CRIMINAL_ACTIVITY_TYPE_ROBACTOR) return 1;

	new actorid = Actor.RobberyStore[id][@Actor];
	switch(animation_pattern)
	{
		case 0:
		{
			for(new r = 0; r < MAX_ROBBERY_ACTORS; r++)
			{
				if(Actor.RobberyStore[r][@DoorID] == Actor.RobberyStore[id][@DoorID] && r != id)
				{
					ClearActorAnimations(r);
					ApplyActorAnimation(r, "PED", "DUCK_cower", 4.1, 1, 1, 1, 1, 1);
				}	
			}

			ClearActorAnimations(actorid);
			ApplyActorAnimation(actorid, "SHOP", "SHP_Rob_HandsUp", 4.1, 0, 1, 1, 1, 0);
			
			KillTimer(Actor.RobberyStore[id][@RobberID]);
			Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * ROBBERY_WAIT_TIME, false, "iii", playerid, id, 3);

			Actor.RobberyStore[id][@Label] = CreateDynamic3DTextLabel("Por favor no me haga daño le daré\ntodo el dinero", COLOR_WHITET, Actor.RobberyStore[id][@X], Actor.RobberyStore[id][@Y], Actor.RobberyStore[id][@Z]+1.2, 5.0);
			Streamer_Update(playerid);

			//SetTimerEx("DoorRobberyTimerFinish", 4000 * 60, false, "ii", playerid, id);


			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
		
			foreach (new i : Player)
			{
				if(!IsPlayerConnected(i)) { continue; }
				PlayerPlaySound(i, 3401, x, y, z);
			}
		}
		case 1:
		{	
			
			if(GetPlayerTargetActor(playerid) != Actor.RobberyStore[ Player.Temp[playerid][@CriminalActID] ][@Actor])
			{
				RunActorAnimationSequence(playerid, id, 4);
				return 1;	
			}
			else if(!IsPlayerInRangeOfPoint(playerid, 10.0, Actor.RobberyStore[id][@X], Actor.RobberyStore[id][@Y], Actor.RobberyStore[id][@Z]))
			{
				RunActorAnimationSequence(playerid, id, 4);
			}
			else 
			{
				
				new money[50];
				format(money, sizeof(money), "Le da {00E500}$%d {FFFFFF}a %s.", Actor.RobberyStore[id][@Money], PlayerInfo[playerid][p_Name]);
				UpdateDynamic3DTextLabelText(Actor.RobberyStore[id][@Label], COLOR_WHITET, money);
			
				GivePlayerMoneyEx(playerid, Actor.RobberyStore[id][@Money], true, true);

				Actor.RobberyStore[id][@Amount]--;

				KillTimer(Actor.RobberyStore[id][@RobberID]);
				Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * 2, false, "iii", playerid, id, 3);	
				
			}
		}
		case 2:
		{
			ClearActorAnimations(actorid);
			ApplyActorAnimation(actorid, "PED", "DUCK_cower", 4.1, 1, 1, 1, 1, 1);
			if(Actor.RobberyStore[id][@Amount] != 0)
			{
				Player.Temp[playerid][@CriminalActValue] = 1;
			}
			else
			{
				
				Actor.RobberyStore[id][@Amount] = randomEx(7, 12);

				DestroyDynamic3DTextLabel(Actor.RobberyStore[id][@Label]);

				Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_NONE;
				Player.Temp[playerid][@CriminalActID] = 0;
				Player.Temp[playerid][@CriminalActValue] = 0;

				Actor.RobberyStore[id][@LastRobbed] = gettime() + 1200;

				KillTimer(Actor.RobberyStore[id][@RobberID]);
				Actor.RobberyStore[id][@RobberID] = 0;
				SetTimerEx("DoorRobberyTimerFinish", /*4000 * 60*/10000, false, "i", Actor.RobberyStore[id][@DoorID]);
				
				if(PlayerInfo[playerid][p_FactionMember] != 0)
				{
					new index_faction = Player.Faction[playerid][@Index];

					FactionCrew.Info[index_faction][@Points] += 2;
					mysql_tquery_s(conexion, str_format("UPDATE `lac_facciones` SET `Points`=%d WHERE `id`=%d;",FactionCrew.Info[index_faction][@Points], FactionCrew.Info[index_faction][@ID]));
					CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_FACTIONADDPOINTS, "~w~Se sumaron ~y~+2 puntos ~w~a ~n~tu banda.", 15, false);
				}
			}

			//SetTimerEx("RunActorAnimationSequence", 1000 * 60 * ROBBERY_WAIT_TIME, false, "iii", playerid, id, 3);
			
		}
		case 3:
		{
			UpdateDynamic3DTextLabelText(Actor.RobberyStore[actorid][@Label], COLOR_WHITET, "");

			KillTimer(Actor.RobberyStore[id][@RobberID]);
			if(Actor.RobberyStore[id][@Amount] <= 0){
			Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * 3, false, "iii", playerid, id, 2);
			} else {
			ApplyActorAnimation(actorid, "SHOP", "SHP_Rob_GiveCash", 4.1, 0, 1, 1, 1, 0);
			Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * 3, false, "iii", playerid, id, 1); }	
		}
		case 4:
		{
			ClearActorAnimations(actorid);
			ApplyActorAnimation(actorid, "PED", "DUCK_cower", 4.1, 1, 1, 1, 1, 1);

			KillTimer(Actor.RobberyStore[id][@RobberID]);
			Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * 5, false, "iii", playerid, id, 5);

		}
		case 5:
		{
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, Actor.RobberyStore[id][@X], Actor.RobberyStore[id][@Y], Actor.RobberyStore[id][@Z]))
			{
				Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_NONE;
				Player.Temp[playerid][@CriminalActID] = 0;
				Player.Temp[playerid][@CriminalActValue] = 0;

				Actor.RobberyStore[id][@LastRobbed] = gettime() + 1500;

				KillTimer(Actor.RobberyStore[id][@RobberID]);
				Actor.RobberyStore[id][@RobberID] = 0;
			
			}
			else
			{
				KillTimer(Actor.RobberyStore[id][@RobberID]);
				Actor.RobberyStore[id][@RobberID] = SetTimerEx("RunActorAnimationSequence", 1000 * 2, false, "iii", playerid, id, 3);
			}
		}

	}
	return 1;
}

function Actor_OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	//if((newkeys & KEY_AIM) == KEY_AIM && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	//{
		
		//new actorid = GetPlayerTargetActor(playerid);

				/*if(actorid == INVALID_ACTOR_ID)
					return 1;

				if(gettime() - Actor.RobberyStore[actorid][@LastRobbed] < 60 * ROBBERY_WAIT_TIME)
					return OnPlayerStartRobbery(playerid, actorid, 1);

				Actor.RobberyStore[actorid][@LastRobbed] = gettime();
				RunActorAnimationSequence(playerid, actorid, 0);*/	
	//}
	return 1;
}

public OnPlayerStartRobbery(playerid, actorid, robbed_recently)
{
    new string[128];
    if(robbed_recently)
    {
        format(string, sizeof(string), "ActorID: %i -> has been robbed recently, please try again later!");
        SendClientMessage(playerid, -1, string);
        return 0;
    }
    else 
    {
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));

        format(string, sizeof(string), "Player %s(%i) has begun robbing actorid: %i", name, playerid, actorid);
        SendClientMessage(playerid, -1, string);
    }
    return 1;
}

public OnPlayerTargetActor(playerid, actorid)
{
	if(Player.Temp[playerid][@CriminalActType] == CRIMINAL_ACTIVITY_TYPE_ROBACTOR)
	{
		if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_TYPE] != INV_TYPE_WEAPON) return 1;
		else if(GetInvAmountItemSelected(playerid) == 0) return 1;
		else if(!Player.Temp[playerid][@CriminalActValue]) return 1;
		else if(Actor.RobberyStore[ Player.Temp[playerid][@CriminalActID] ][@Actor] != actorid) return 1;

		Player.Temp[playerid][@CriminalActValue] = 0;
		RunActorAnimationSequence(playerid, Player.Temp[playerid][@CriminalActID], 3);
	}
	else
	{

		for(new r; r < MAX_ROBBERY_ACTORS; r++)
		{
			if(Actor.RobberyStore[r][@Actor] == actorid)
			{
				if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_TYPE] != INV_TYPE_WEAPON) continue;
				if(GetInvAmountItemSelected(playerid) == 0) continue;
				else if(Actor.RobberyStore[r][@LastRobbed] > gettime()) return ShowPlayerInfoTextdraw(playerid, "~r~Este lugar ya fue robado.", 4000);
				else if(Actor.RobberyStore[r][@RobberID] != 0) return ShowPlayerInfoTextdraw(playerid, "~r~Este negocio ya fue robado.", 4000);
				else if(PlayerInfo[playerid][p_LimitShopRobbery] >= 5) return ShowPlayerInfoTextdraw(playerid, "~r~Ya robaste suficiente inténtalo~n~de nuevo más tarde", 4000);

				Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_ROBACTOR;
				Player.Temp[playerid][@CriminalActID] = r;
				Player.Temp[playerid][@CriminalActValue] = 0;

				PlayerInfo[playerid][p_LimitShopRobbery]++;
				mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `LimitShopRobbery`=%d WHERE `id`=%d;", PlayerInfo[playerid][p_LimitShopRobbery], PlayerInfo[playerid][pID]));

				RunActorAnimationSequence(playerid, r, 0);

				break;

			}
		}
	}
	return 1;
}

ResetDoorRobberyVariables(playerid, id)
{
	Actor.RobberyStore[id][@Amount] = randomEx(7, 12);

	DestroyDynamic3DTextLabel(Actor.RobberyStore[id][@Label]);

	Player.Temp[playerid][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_NONE;
	Player.Temp[playerid][@CriminalActID] = 0;
	Player.Temp[playerid][@CriminalActValue] = 0;

	Actor.RobberyStore[id][@LastRobbed] = gettime() + 50;

	KillTimer(Actor.RobberyStore[id][@RobberID]);
	Actor.RobberyStore[id][@RobberID] = 0;
	SetTimerEx("DoorRobberyTimerFinish", /*4000 * 60*/10000, false, "i", Actor.RobberyStore[id][@DoorID]);
}

ApplyDefaultAnimationActor(actorid, animid)
{
	switch(animid)
	{
		case 1: // Seated
		{
			ApplyActorAnimation(actorid,"ped","SEAT_down",4.1,0,0,0,1,0);
		}
	}
}