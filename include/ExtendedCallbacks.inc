#if defined _OnPlayerPause_included
    #endinput
#endif
#define _OnPlayerPause_included

#include <a_samp>

enum _:e_PLAYER_TICK_ENUM {
    e_PLAYER_TICK,
    e_PLAYER_LAST_UPDATE,
};
enum e_PLAYER_DATA {
    e_PLAYER_FLAGS:e_bFlags,
};

enum e_PLAYER_FLAGS (<<= 1) {
    e_bUpdate = 1,
    e_bPaused
};


static
    s_aPlayerInfo[MAX_PLAYERS][e_PLAYER_DATA],
    s_aPlayerTickInfo[MAX_PLAYERS][e_PLAYER_TICK_ENUM];

stock static Callback_GetFlag(playerid, e_PLAYER_FLAGS:flag)
{
    return s_aPlayerInfo[playerid][e_bFlags] & flag;
}

stock static Callback_SetFlag(playerid, e_PLAYER_FLAGS:flag, status)
{
    if(status)
        return s_aPlayerInfo[playerid][e_bFlags] |= flag;
    else
        return s_aPlayerInfo[playerid][e_bFlags] &= ~flag;
}

stock GetPlayerPausedTime(playerid)
{
    return (GetConnectedTime(playerid) - s_aPlayerTickInfo[playerid][e_PLAYER_TICK]);
}

stock IsPlayerPaused(playerid)
{
    return Callback_GetFlag(playerid, e_bPaused);
}

stock GetConnectedTime(playerid)
{
    return NetStats_GetConnectedTime(playerid);
}

public OnGameModeInit()
{
    SetTimer("Callback_TabCheck", 600, true);

    #if defined CB_OnGameModeInit
        return CB_OnGameModeInit();
    #else
        return 1;
    #endif
}

public OnPlayerUpdate(playerid)
{
    if(!Callback_GetFlag(playerid, e_bUpdate))
    {
        Callback_SetFlag(playerid, e_bUpdate, true);
    }

    s_aPlayerTickInfo[playerid][e_PLAYER_LAST_UPDATE] = GetConnectedTime(playerid);

    #if defined CB_OnPlayerUpdate
        return CB_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}

forward Callback_TabCheck();
public Callback_TabCheck()
{
    for(new i = 0, l = GetPlayerPoolSize(); i <= l; i ++)
    {
        switch(GetPlayerState(i))
        {
            case PLAYER_STATE_ONFOOT, PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER:
            {
                if(Callback_GetFlag(i, e_bUpdate))
                {
                    if(Callback_GetFlag(i, e_bPaused))
                    {
                        CallLocalFunction("OnPlayerResume", "ii", i, GetConnectedTime(i) - s_aPlayerTickInfo[i][e_PLAYER_TICK]);
                    }

                    Callback_SetFlag(i, e_bUpdate, false);
                    Callback_SetFlag(i, e_bPaused, false);
                }

                if(!Callback_GetFlag(i, e_bPaused) && (GetConnectedTime(i) - s_aPlayerTickInfo[i][e_PLAYER_LAST_UPDATE]) >= 4000)
                {
                    CallLocalFunction("OnPlayerPause", "i", i);

                    s_aPlayerTickInfo[i][e_PLAYER_TICK] = GetConnectedTime(i);

                    Callback_SetFlag(i, e_bPaused, true);
                }
            }
        }
    }
}

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif

#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif

#define OnGameModeInit          CB_OnGameModeInit
#define OnPlayerUpdate          CB_OnPlayerUpdate

#if defined CB_OnGameModeInit
    forward CB_OnGameModeInit();
#endif
    
#if defined CB_OnPlayerUpdate
    forward CB_OnPlayerUpdate(playerid);
#endif