#define PLAYER_MISC_MEDICINES 0
#define PLAYER_MISC_DRUGSC 1
#define PLAYER_MISC_PARTSM 2
#define PLAYER_MISC_PIECESA 3
#define PLAYER_MISC_REFERRALS 4

#define PLAYER_GENERALC_SKILLW 0

#define PLAYER_EXTRAO_GPS 0
#define PLAYER_EXTRAO_PHONEBOOK 1
#define PLAYER_EXTRAO_RADIOC 2

#define MAX_PER_PLAYER_TIMERS 10
#define MAX_PER_PLAYER_TIMERS_E 18

#define MAX_DGUI_MAX_VARS 20
#define INVALID_DGUI_VAR_INVALID -1000000

#define MAX_PLAYER_INVENTORY_ITEMS 12
#define MAX_PLAYER_INV_ITEMS_EQUIPED 5

#define STATE_GAME_NONE 0
#define STATE_GAME_CONNECTED 1

#define TIMER_CMD_MEDICINES 11
#define TIMER_CMD_CRACK 12
#define TIMER_CMD_RENTVEHICLE 14

#define BOXNOTIF_POS_Y 128.0
#define BOXNOTIF_POS_X 495.0
#define BOXNOTIF_MAXBOX (8)
#define BOXNOTIF_MAXTEXTDRAW (10)
#define BOXNOTIF_INVALID_ID (-1)
#define BOX_NOTIF_INVALID_BOX 100

// Size Notif

#define VNOTI_LETTERSIZEX_T_1 (0.240)
#define VNOTI_LETTERSIZEY_T_1 (1.35)

#define VNOTI_LETTERSIZEX_T_2 (0.200)
#define VNOTI_LETTERSIZEY_T_2 (1.1)

#define VNOTI_SIZEY_DEFAULT_TYPE (5.0)
#define VNOTI_LETTERSIZE_T_1 (12.0) // Normal
#define VNOTI_LETTERSIZE_T_2 (10.0) // Faction

#define VNOTI_SIZEBOX_G_X (110.0)

#define MAX_CP_TRUCKJOB 5
#define MAX_PERCP_TRUCKJOB 5

#define WORK_TYPE_TRUCKER 2
#define WORK_TYPE_FARMER 4
#define WORK_TYPE_MINER 5
#define WORK_TYPE_DUMPSTER 7

#define MAX_FACTION_RANKS 10
#define MAX_FACTION_RANKS_SUB 9

#define MAX_FACTION_GRAFITIS 19

#define FACTION_RANK_MAX_SET 4

#define MAX_FACT_DISPUTE_GRAFFITI 7

#define MAX_FACTION_PANEL_ITEMS 7
#define MAX_FACTION_ITEMS_POS_X 161.0

#define MAX_ITEMS_WORLD (500)
#define INVALID_ITEM_ID (-1)

#define INVALID_VEHICLE_ID_EX (-1)

#define MAX_PLAYER_PER_VEHICLES (3)

#define MAX_ROBBERY_ACTORS		(50)

#define MAX_AREAS_GE_INRANGE 8

#define AREA_TYPE_PLAYER_NEAR_VEHICLE 21

#define SLOT_ATTACH_HAND 9

// Items

#define ITEM_FLOOR_OFFSET (0.96)

#define VEHICLE_FORCE_ROTATION 0.07

#define BCRYPT_COST 12

#define OO_TYPE(%6,%7)%0[%1] (_:@vb:@va:%6:%7@%0[%1]
#define @va:%6:%7@%0[%1][@%2] %7%0[%1])[E_%6_%0_%2]
#define @vb:@va:%6:%7@%0[%1][%2][@%3] %7%0[%1])[%2][E_%6_%0_%3]

#define OO_TYPE2(%6,%7) (_:@vd:@vc:%6:%7@
#define @vc:%6:%7@%0[@%2] %7%0)[E_%6_%0_%2]

#define GetInvItemSelected(%0) PlayerInfo[%0][pInvItemSelected]
#define GetPlayerFactionSelectedID(%0) /*FactionCrew.Info[ */Player.Temp[%0][@SelectedFactionID]/* ][@ID]*/

#define IsPlayerLogged(%0) (IsPlayerConnected(%0) && PlayerInfoTemp[%0][pt_IsLoggedIn])

// Work
#define GetPlayerWorkLevel(%0,%1) Player.WorkSkill[%0][%1-1][@Level]
#define GetPlayerWorkSkill(%0,%1) Player.WorkSkill[%0][%1-1][@Skill]

//#define randomEx(%1,%2) (random(%2)+%1) //if you don't want it to be 0 but it might exceed the max, so set max to 9.
#define randomEx(%0,%1) (random(%1-(%0))+%0) //if you don't want it to be 0 but it might exceed the max, so set max to 9.

#define CONVERTIME_EPOCHYEAR 1970

// HOLDING(keys)
#define SAKEY_HOLDING(%0) \
	((newkeys & (%0)) == (%0))

	// PRESSED(keys)
#define SAKEY_PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

	// PRESSING(keyVariable, keys)
#define SAKEY_PRESSING(%0,%1) \
	(%0 & (%1))

	// RELEASED(keys)
#define SAKEY_RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))


#define RGBAToARGB(%0)				((((%0) << 24) & 0xFF000000) | (((%0) >>> 8) & 0xFFFFFF))
#define ARGBToRGBA(%0)				((((%0) << 8) & 0xFFFFFF00) | (((%0) >>> 24) & 0xFF))
#define RGBAToRGB(%0)				(((%0) >>> 8) & 0xFFFFFF)
#define ARGBToRGB(%0)				((%0) & 0x00FFFFFF)

#define LAC_abs(%1) \
    (((%1) < 0) ? (-(%1)) : ((%1)))

forward funct_HideTextdrawNotif(playerid, id);
forward Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);

forward OnPlayerDropItemWorld(playerid, itemid);
forward OnPlayerGetItem(playerid, itemid);
forward OnPlayerPickupItem(playerid, itemid);
forward OnPlayerDropItem(playerid, itemid);

forward Float:frandom(Float:max, Float:min, dp);

forward List:_GetPlayerDataList(playerid);

forward OnPlayerTargetActor(playerid, actorid);