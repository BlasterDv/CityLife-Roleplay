#include "rBits"

// User

enum pInfo
{
	pID,
	p_Name[MAX_PLAYER_NAME],
	pPassword[64],
	pSaltPass[11],
	pAdmin,
	p_LEVEL,
	Float:pHealth,
	Float:pChaleco,
	Float:p_POS_X,
	Float:p_POS_Y,
	Float:p_POS_Z,
	pRopa,
	p_Gender,
	pEdad,
	pDinero,
	pJob,
	pRegistrado,
	pBanco,
	pDuda,
	//pNTelefono[2],
	pPhoneBook,
	pInterior,
	pVirtualWorld,
	/*pWEAPONS_AMMO[13],*/
	pWeapon,
	pWAmmo,
	p_AnalgesicEffect,
	pRadioC,
	pCosechaPoint,
	pEmail[128],
	pLAC,
	p_IP[18],
	p_FactionMember,
	p_FactionRank,
	pDutyPolicia,
	pCargos,
	pQuienC[24],
	pAgonizando,
	pTiempoCarcel,
	pSkinPolicia,
	pTieneEmisora,
	NombreEmisora[50],
	p_INDEX_INTERIOR,
	p_INTERIOR_TYPE,
	p_INTERIOR_EXTRA_ID,
	p_STATE_PLAYER,
	//
	p_VehicleSlot[3],
	p_VehicleState[3],
	//
	pNumeroBancario[18],
	p_EXP,
	pNivelExp,
	pPrecioNivel,
	p_HouseSlotType[3],
	p_HouseSlot[3],
	pSed,
	pHungry,
	pHoursPlayed,
	pMinutesPlayed,
	pSecondsPlayed,
	pPlaceCarcel,
	pLumberjackLvl,
	pLumberjackExp,
	pTimeSan,
	pSanciones,
	pDateVIP,
	pLastTimeLogged,
	pReferrals,
	pPartsM,
	pBedVW,
	pBed,
	// Jobs Level
//	p_FarmerSkill,
//	p_TruckerSkill,
//	p_DumpSkill,
//	p_MinerSkill,
	// Jobs
	// Limits
	p_LimitShopRobbery,
	//
	pUDump,
	pDumpP,
	//
	pCranePermit,
	pCranePermitID,
	/*pDumpCompa,*/
	p_PickedUpPickup,
	p_WherePickup,
	pCountPressKey,
	pInvItemSelected,
	p_PickedUpArea,
	p_WorkTravel,
	p_JobTravelT,
	p_JobTravel,
	p_JobTravelNext,
	p_JobMissionExtra,
	p_JobMissionExtraValue,
	p_JobMissionExtraID,
	p_JobMissionState,
	p_JobTimeMax,
	p_mPanelCatActive,
	p_State_Game,
	p_LastState,
	p_Tutorial,
	p_RentMinutes,
	p_RentSeconds,
	p_SyncUpdate
};
new PlayerInfo[MAX_PLAYERS][pInfo];

enum pInfo_Inventory
{
	//pinvObject,
	invItem,
	invAmount
};
new PlayerInventory[MAX_PLAYERS][MAX_PLAYER_INVENTORY_ITEMS][pInfo_Inventory];

#define Player. OO_TYPE(PLAYER,Player_)

enum E_PLAYER_INVENTORY_EQUIPED
{
	 E_PLAYER_InvEquiped_Object,
	 E_PLAYER_InvEquiped_Item,
	 E_PLAYER_InvEquiped_Amount,
	 E_PLAYER_InvEquiped_Slot
};
new Player_InvEquiped[MAX_PLAYERS][MAX_PLAYER_INV_ITEMS_EQUIPED][E_PLAYER_INVENTORY_EQUIPED];


enum E_PLAYER_WORK_SKILLS
{
	E_PLAYER_WorkSkill_Level,
	E_PLAYER_WorkSkill_Skill
};
new Player_WorkSkill[MAX_PLAYERS][5][E_PLAYER_WORK_SKILLS];

enum pInfo_Bit1
{
	pCrowbar,
	pLockpicks,
	pHammerTool,
	pScrewdriverT,
	p_HoldKey,
	p_ncPressedKey,
	pShowInventory,
	pTimeEatingActive,
	p_TimerCheckEnterIT_A,
	p_TimerCheckEnterArea,
	p_ActiveTimeRentVehicle,
	p_ShowPanelFaction,

	pt_PHONE_STATE,

	p_ConfigChannelDudeState,

	pt_WEAPON_RELOAD,
	pt_ShootAnimWeapon,
	pt_PickedPickup,
	p_StartingEngine,
	p_StatePlayerFarmer
}
new rBit1:eBit1_PlayerInfo[pInfo_Bit1]<MAX_PLAYERS>;

enum E_PLAYERTEMP_BIT1
{
	b1pt_InInmune
}
new rBit1:b1_PlayerTemp[E_PLAYERTEMP_BIT1]<MAX_PLAYERS>;

enum pInfo_Bit4
{
	pt_IsOpenMenuTransactions
}
new rBit4:eBit4_PlayerInfo[pInfo_Bit4]<MAX_PLAYERS>;

enum pInfo_Temp{
	pt_Name[24],
	pt_IP[18],
	bool:pt_IsLoggedIn,
	pt_Timers[MAX_PER_PLAYER_TIMERS],
	pt_TimersE[MAX_PER_PLAYER_TIMERS_E],
	pt_TimersG[2],
	//pt_VehicleRentTime,
	//pt_VehicleRentPrice,
	pt_PLAYER_CHECKPOINT[4],
	pt_PLAYER_AREAS[2],
	pt_VEHICLE_NEAR,
	pt_VEHICLE_BUY_SELECTED_ID,
	pt_PANEL_LIST_SELECTED,
	//pt_PanelFactionList[10],
	pt_PlayerInAreaY,
	bool:pt_KICKED,
	bool:pt_USER_REGISTERED,
	pt_DATA_LOADED_COUNT,
	pt_PHONE_ITEM_SELECTED,
	pt_PHONE_LIST_PAGE,
	pt_PHONE_LIST_ITEMS[8],
	pt_FAC_SELECTED_RANK,
	pt_DIAG_SELECTED_DB_ID,
	pt_INVITE_FACTION_PID,
	pt_INVITE_FACTION_ID,
	//pt_PHONE_LIST_PAGE_ACTIVE
};
new PlayerInfoTemp[MAX_PLAYERS][pInfo_Temp];

#define Player. OO_TYPE(PLAYER,Player_)

enum E_PLAYER_TEMP_INFO 
{
	E_PLAYER_Temp_InviteFactionEx[2],
	E_PLAYER_Temp_FactionPage,
	E_PLAYER_Temp_PanelFactionList[MAX_FACTION_PANEL_ITEMS],
	E_PLAYER_Temp_PlayerInAreaAlt,
	E_PLAYER_Temp_InteractingItem,
	E_PLAYER_Temp_InteractingState,
	E_PLAYER_Temp_StateGameo,
	bool:E_PLAYER_Temp_IsInmune,
	Float:E_PLAYER_Temp_DeathX,
	Float:E_PLAYER_Temp_DeathY,
	Float:E_PLAYER_Temp_DeathZ,
	E_PLAYER_Temp_TypeInAreaEn,
	E_PLAYER_Temp_InTabInvTrans,
	E_PLAYER_Temp_PickedUpArea,
	E_PLAYER_Temp_PickedUpAreaF,
	E_PLAYER_Temp_ActorTarget,

	E_PLAYER_Temp_TypeBuyConfirm,
	E_PLAYER_Temp_BuyConfirmValue,
	E_PLAYER_Temp_GPSRouteSelected,
	E_PLAYER_Temp_RentVehicle,
	//
	E_PLAYER_Temp_MenuSelectedType,
	E_PLAYER_Temp_MenuSelected[2],
	E_PLAYER_Temp_MaterialSelect[3],
	E_PLAYER_Temp_MenuIndexRoom,
	E_PLAYER_Temp_EditFurniture,
	E_PLAYER_Temp_EditFurnitureIn,
	E_PLAYER_Temp_EditFurnitureObj,
	E_PLAYER_Temp_PrevFurnitureObj,
	Float:E_PLAYER_Temp_EditFurnitureRot,
	//
	E_PLAYER_Temp_TypeInAreaY,
	E_PLAYER_Temp_InteractType,
	E_PLAYER_Temp_InteractID,
	E_PLAYER_Temp_InvTransSize,

	E_PLAYER_Temp_CriminalActType,
	E_PLAYER_Temp_CriminalActID,
	E_PLAYER_Temp_CriminalActValue,

	E_PLAYER_Temp_JobAreaMission,
	E_PLAYER_Temp_StateFreeze,
	E_PLAYER_Temp_FreezeInventory,
	E_PLAYER_Temp_HealingProgress,
	E_PLAYER_Temp_PlayerHealing,

	E_PLAYER_Temp_VehicleActionPr,

	E_PLAYER_Temp_FactionSelectExID,
	E_PLAYER_Temp_SelectedFactionID,
	E_PLAYER_Temp_ListSelectedDBID,
	E_PLAYER_Temp_CalledPlayer[9],
	E_PLAYER_Temp_FactionQuiz,
	E_PLAYER_Temp_FactionQuizCount,
	// Memory
	List:E_PLAYER_Temp_DataList,
	Map:E_PLAYER_Temp_ItemsGPS,
	Map:E_PLAYER_Temp_InvItemsMap,
	Map:E_PLAYER_Temp_DataVehicles,
	// Cache
	Cache:E_PLAYER_Temp_CachePhone
};

new Player_Temp[MAX_PLAYERS][E_PLAYER_TEMP_INFO];

enum E_PLAYER_FACTION_INFO
{
	bool:E_PLAYER_Faction_Valid,
	E_PLAYER_Faction_Index
};
new Player_Faction[MAX_PLAYERS][E_PLAYER_FACTION_INFO];

enum _:E_FAC_QUIZ_PLAYER_DATA {
	E_FAC_QUIZ_DBID,
    String:E_FAC_QUIZ_STRING,
    String:E_FAC_QUIZ_STRINGDB
};

enum _:E_FAC_GENE_PLAYER_DATA {
	E_FAC_GENE_DATA1,
    String:E_FAC_GENE_STRING,
    E_FAC_GENE_DATA2
};

enum _:E_PLAYER_TD_GPS_DATA {
	PlayerText:E_PLAYER_TD_GPS_DATA_TD,
	E_PLAYER_TD_GPS_DATA_Door
};

enum _:E_PLAYER_TD_INVITEMS_DATA {
	PlayerText:E_PLAYER_TD_INVITEMS_LeftInfo,
	PlayerText:E_PLAYER_TD_INVITEMS_RightInfo
};

enum _:E_PLAYER_VEHICLES_DATA {
	E_PLAYER_VEHICLES_DATA_Model,
	String:E_PLAYER_VEHICLES_DATA_Plate
};

enum _:E_HOUSE_CUSTOMIZE_DATA {
	Pool:E_HOUSE_CUSTOMIZE_DATA_POOL,
	E_HOUSE_CUSTOMIZE_DATA_MATERIAL,
	E_HOUSE_CUSTOMIZE_DATA_DBID
};

enum _:E_HOUSE_FURNITURE_DATA {
	E_HOUSE_FURNITURE_DATA_DBID,
	E_HOUSE_FURNITURE_DATA_ObjID,
	E_HOUSE_FURNITURE_DATA_MODEL,
	E_HOUSE_FURNITURE_DATA_Extra,
	E_HOUSE_FURNITURE_DATA_AREA,
	E_HOUSE_FURNITURE_DATA_MAT,
	E_HOUSE_FURNITURE_DATA_MAT2,
	E_HOUSE_FURNITURE_DATA_MAT3,
	E_HOUSE_FURNITURE_DATA_DATE,
	Float:E_HOUSE_FURNITURE_DATA_X,
	Float:E_HOUSE_FURNITURE_DATA_Y,
	Float:E_HOUSE_FURNITURE_DATA_Z,
	Float:E_HOUSE_FURNITURE_DATA_RotZ
};

enum _:E_HOUSE_FURNITURE_DATA_SORT
{
	Float:E_HOUSE_FURNITURE_SORT_Dist,
	E_HOUSE_FURNITURE_SORT_Model,
	E_HOUSE_FURNITURE_SORT_Date,
	E_HOUSE_FURNITURE_SORT_Item
};
// End User

#define Anticheat. OO_TYPE(ANTICHEAT, Anticheat_)
enum
{
	CHEAT_TYPE_TELEPORT,
	CHEAT_TYPE_WEAPON
}

enum E_ANTICHEAT_INFO
{
	E_ANTICHEAT_Info_Name[24],
	bool:E_ANTICHEAT_Info_Enabled
}
new Anticheat_Info[][E_ANTICHEAT_INFO] = {
	{ "Teleport", true },
	{ "Armas", true }
};

enum E_PLAYER_ANTICHEAT_INFO
{
	E_PLAYER_Anticheat_Inmunity
}
new Player_Anticheat[MAX_PLAYERS][sizeof Anticheat_Info][E_PLAYER_ANTICHEAT_INFO];

enum Player_Textdraw_enum
{
	PlayerText:pTextdraw_MessageInfo,
	PlayerText:pTextdraw_BoxInventory,
	PlayerText:pTextdraw_ItemsInventory[17],
	PlayerText:pTextdraw_ButtonsBoxInventory[2],
	PlayerText:pTextdraw_TextInventory[2],

	PlayerText:pTextdraw_PanelFactionList[MAX_FACTION_PANEL_ITEMS],
	PlayerText:pTextdraw_PanelFactionListR[MAX_FACTION_PANEL_ITEMS],

	PlayerText:pTextdraw_PanelFactionTitle,
	PlayerText:pTextdraw_PanelFactionDesc,
	PlayerText:pTextdraw_PanelFactionInfo[4],
	PlayerText:pTextdraw_PanelFactionLogo,
	PlayerText:pTextdraw_PanelFactionButton[2],

	PlayerText:pTextdraw_ATM_Info_Player[2],
	PlayerText:pTextdraw_Mobile_TD[8],
	PlayerText:pTextdraw_Mobile_TD_Text[5]
};
new Player_Textdraws[MAX_PLAYERS][Player_Textdraw_enum];

/*enum enum_Bit1_Server_Vars{
	e_VFS_TheftDoor[3],

};
new rBit1:arsForServer_Bit1[enum_Bit1_Server_Vars]<MAX_VARS_SERVER>;*/

#define Door. OO_TYPE(DOOR,Door_)

enum dInfo
{
	dID,
	dName[32],
	dDescription[128],
	Float: dEnterX,
	Float: dEnterY,
	Float: dEnterZ,
	Float: dExitX,
	Float: dExitY,
	Float: dExitZ,
	Float:dAnguloInt,
	Float:dAnguloExt,
	Float:dRange,

	dPickup[2],
	dArea[2],
	Text3D:dLabel_Enter,
	Text3D:dLabel_Exit,
	
	dInt,
	dExitVW,
	dExitInt,
	dEnterVW,
	dEnterInt,
	dType,
	dMapIcon,
	dMapIconID,
	dCargos,
	DoorEnabled,
	dTypeDoor,
	diddoor,

	dFactionOwner,
	dTimeDispute,

	//dTimeRobbery,
	//dRobberID,

	dType_Interior
};
new DoorInfo[MAX_DOORS][dInfo];

enum _:ArrayDataDoors_Extra {
	ArrayDataDoors_ID,
	Float:ArrayDataDoors_Range
};

#define Vehicle. OO_TYPE(VEHICLE,Vehicle_)

enum Global_Vehicles_Info
{
	bool:gi_vehicle_VALID,
	gi_vehicle_MODELID,
	gi_vehicle_ENGINE,
	gi_vehicle_LIGHTS,
	gi_vehicle_ALARM,
	gi_vehicle_DOORS,
	gi_vehicle_BONNET,
	gi_vehicle_BOOT,
	gi_vehicle_OBJECTIVE,
	gi_vehicle_SPAWNED,
	Float:gi_vehicle_POS_X,
	Float:gi_vehicle_POS_Y,
	Float:gi_vehicle_POS_Z,
	Float:gi_vehicle_POS_ANGLE,
	Float:gi_vehicle_SPAWN_X,
	Float:gi_vehicle_SPAWN_Y,
	Float:gi_vehicle_SPAWN_Z,
	Float:gi_vehicle_SPAWN_ANGLE,
	gi_vehicle_INT,
	gi_vehicle_VW,
	gi_vehicle_SPAWN_INT,
	gi_vehicle_SPAWN_VW,
	gi_vehicle_COLOR1,
	gi_vehicle_COLOR2,
	gi_vehicle_COMPONENTS[14],
	gi_vehicle_PAINTJOB,
	gi_vehicle_DAMAGE_PANELS,
	gi_vehicle_DAMAGE_DOORS,
	gi_vehicle_DAMAGE_LIGHTS,
	gi_vehicle_DAMAGE_TIRES,
	gi_vehicle_PLATE_NUMBER[32],
	Float:gi_vehicle_HEALTH,
	gi_vehicle_GAS,
	gi_vehicle_TYPE,
	gi_vehicle_LASTDRIVER,
	gi_vehicle_DRIVER,
	bool:gi_vehicle_OCCUPIED,

	gi_vehicle_AREAID,
	Text3D:gi_vehicle_LABEL[2],

	gi_vehicle_OWNER,
	gi_vehicle_KEYS[4],
	gi_vehicle_RADIO
};
new Vehicles_Info[MAX_VEHICLES][Global_Vehicles_Info] ;


enum E_VEHICLE_WORK_INFO
{
	wgi_vehicle_OWNER,
	wgi_vehicle_WORK
}
new VEHICLES_WORKG[MAX_VEHICLES][E_VEHICLE_WORK_INFO];


enum E_VEHICLE_RENTED_INFO
{
	bool:vri_vehicle_VALID,
};
new VEHICLES_RENTED[MAX_VEHICLES][E_VEHICLE_RENTED_INFO];

enum E_VEHICLE_PLAYER_INFO
{
	bool:player_vehicle_VALID,
	player_vehicle_ID,
	player_vehicle_OWNER
}
new VEHICLES_PLAYER[MAX_VEHICLES][E_VEHICLE_PLAYER_INFO];

enum E_VEHICLE_BOOT{
	E_VEHICLE_Boot_Item,
	E_VEHICLE_Boot_Amount
};
new Vehicle_Boot[MAX_VEHICLES][MAX_PLAYER_INVENTORY_ITEMS][E_VEHICLE_BOOT];

enum cInfo
{
	id_property,
	cPrecio,
	cNivel,
	cDueno[24],
	Float:cExteriorX,
	Float:cExteriorY,
	Float:cExteriorZ,
	Float:cAnguloExt,
	cSale,
	cOwnerID,
	Text3D:cTitulo3D,
	
	cInterior,
	cVirtualWorld,
	cLock,
	cInteriorID,
	cHouseType,
	cPropertyType,
	cPickUp[2],
	cAreaHouseID[2],
	cInteriorLoaded,
	cPlayersInHouse,
	Map:hCustomInterior,
	Pool:hPoolFurniture
};
new CasaInfo[MAX_CASAS][cInfo];
new Iterator:HouseIterator<MAX_CASAS>;

// Enums

enum parkingsInfo
{
	pgID,
	pgPrecio,
	pgNivel,
	Float:pgExteriorX,
	Float:pgExteriorY,
	Float:pgExteriorZ,
	Float:pgExteriorA,
	Float:pgInteriorX,
	Float:pgInteriorY,
	Float:pgInteriorZ,
	Float:pgInteriorA,

	Float:pgExtPlayerX,
	Float:pgExtPlayerY,
	Float:pgExtPlayerZ,
	Float:pgIntPlayerX,
	Float:pgIntPlayerY,
	Float:pgIntPlayerZ,
	
	pgVendida,
	pgOwnerID,
	pgOwner[24],
	pgInterior,
	pgVirtualWorld,
	pgInteriorID,
	pgMoneda,
	pgParkingType,
	Text3D:pgTitulo3D,
	pgPickUp[2],
	pgAreaid[2],
	pgInteriorInt,
	pgVWInt,
	Float:pgExteriorLX,
	Float:pgExteriorLY,
	Float:pgExteriorLZ,
};
new ParkingInfo[MAX_PARKING][parkingsInfo];

enum E_VEHICLES_SALE
{
	e_sale_vehicle_PRICE,
	e_sale_vehicle_TYPE,
	bool:e_sale_vehicle_VALID,
};
new VEHICLES_SALE[MAX_VEHICLES][E_VEHICLES_SALE];

#define Actor. OO_TYPE(ACTOR,Actor_)

enum E_ACTOR_ROBBERY_DATA
{
	E_ACTOR_RobberyStore_DBID,
	E_ACTOR_RobberyStore_Actor,
	Float:E_ACTOR_RobberyStore_X,
	Float:E_ACTOR_RobberyStore_Y,
	Float:E_ACTOR_RobberyStore_Z,
	//Float:actor_ang,
	//actor_vw,
	E_ACTOR_RobberyStore_Money,
	E_ACTOR_RobberyStore_Amount,

	E_ACTOR_RobberyStore_Anim,
	E_ACTOR_RobberyStore_DoorID,

	E_ACTOR_RobberyStore_LastRobbed,
	E_ACTOR_RobberyStore_RobberID,
	bool:E_ACTOR_RobberyStore_Created,
	Text3D:E_ACTOR_RobberyStore_Label
}
new Actor_RobberyStore[MAX_ROBBERY_ACTORS][E_ACTOR_ROBBERY_DATA];

enum EmiInfo
{
	NombreEmisora[50],
	TieneEmisora,
	EmisoraID,
	URLEmisora,
	CabinaOcupada,
	EmisoraTrans,
};
new Radios[MAX_PLAYERS][EmiInfo];

enum BarriersInfoE
{
	bsvID,
	bsvObjectID,
	bsvObject,
	Float:bsvX,
	Float:bsvY,
	Float:bsvZ,
	Float:bsvRX,
	Float:bsvRY,
	Float:bsvRZ,
	Float:bsvStreamDistance,
	Float:bsvDrawDistance,
	bsvVW,
	bsvInt,
	bsvType, // 0 Peaje, 1 Barrera, 2 Puerta
	bsvState,
	bsvTime,
	bsvMaxTime,
	Float:bsvPX,
	Float:bsvPY,
	Float:bsvPZ,
	Float:bsvNewRY,
};
new BSVInfo[MAX_BARRIERS][BarriersInfoE];

#define ItemsWorld. OO_TYPE(ITEMSWORLD,ItemsWorld)

enum E_ITEMSWORLD_INFO
{
	bool:E_ITEMSWORLD_Info_VALID,

	E_ITEMSWORLD_Info_ItemID,
	E_ITEMSWORLD_Info_ObjectID,
	E_ITEMSWORLD_Info_ItemAmount,

	Float:E_ITEMSWORLD_Info_X,
	Float:E_ITEMSWORLD_Info_Y,
	Float:E_ITEMSWORLD_Info_Z,
	Float:E_ITEMSWORLD_Info_A,

	//Float:E_ITEMSWORLD_Info_zModelOffset,

	E_ITEMSWORLD_Info_AreaIT,

	E_ITEMSWORLD_Info_Time,

	E_ITEMSWORLD_Info_Label
};

new ItemsWorldInfo[MAX_ITEMS_WORLD][E_ITEMSWORLD_INFO];
new item_Holder[MAX_ITEMS_WORLD];
new item_Interactor[MAX_ITEMS_WORLD];

enum reportsInfoEnum
{
	rReason[128],
	rReportFrom,
	rReportID,
	rSlotUsed
};
new ReportsE[MAX_REPORTS][reportsInfoEnum];


enum enum_Server_Vars{
	e_VFS_TheftDoor[4],
	bool:e_VFS_OpenTheftDoor[4],
	TheftObjects[37],
	E_VFS_TheftDoorClosed[4],
	EventActive

};
new /*rBit1:*/VarsForServer_B[enum_Server_Vars]/*<MAX_VARS_SERVER>*/;

#define ServerGeneral. OO_TYPE2(SVGENERAL,ServerGeneral_)

enum E_SVGENERAL_INFO
{
	E_SVGENERAL_Info_EventActive

};
new ServerGeneral_Info[E_SVGENERAL_INFO];

enum _:E_SVGENERAL_STORAGE_INFO
{
	E_SVGENERAL_STORAGE_ID[MAX_PLAYER_INVENTORY_ITEMS],
	E_SVGENERAL_STORAGE_Item[MAX_PLAYER_INVENTORY_ITEMS],
	E_SVGENERAL_STORAGE_Amount[MAX_PLAYER_INVENTORY_ITEMS],
	E_SVGENERAL_STORAGE_Object[MAX_PLAYER_INVENTORY_ITEMS]
}

enum _:E_SVGENERAL_STORAGE_EXTRA
{
	E_SVGENERAL_STORAGE_DBID,
	E_SVGENERAL_STORAGE_Extra,
	List:E_SVGENERAL_STORAGE_List
}
new Map:ServerGeneral_StorageMap;

enum eServer_Textdraw_Global
{
	Text:sTextdraw_InventoryBox[14],
	Text:sTextdraw_InventoryBoxPlayer[3],
	Text:sTextdraw_InvIconsGPS[14],
	Text:sTextdraw_InvInfoGPS[5],
	Text:sTextdraw_InvIconsPointsGPS[40],
	Text:sTextdraw_InventoryButtons[3],
	Text:sTextdraw_BarProgressGeneral,
	Text:sTextdraw_ATM_General[3],
	Text:sTextdraw_ATM_Button[4],
	Text:sTextdraw_Mobile_TD[20],
	Text:sTextdraw_Mobile_TextAbove[4],
	Text:sTextdraw_Mobile_Numbers[10],
	Text:sTextdraw_Mobile_Text[4],
	Text:sTextdraw_TransScreen[2],
	//Text:sTextdraw_InvChangeItems[MAX_PLAYER_INVENTORY_ITEMS],
	Text:sTextdraw_BoxConfirmBuy[4],
	Text:sTextdraw_BoxConfirmBuyEx[10],
	Text:sTextdraw_BoxPanelFactionList[10]
	//Text:sTextdraw_pItemsInventory[MAX_PLAYER_INVENTORY_ITEMS+MAX_PLAYER_INV_ITEMS_EQUIPED]
};
new Textdraws[eServer_Textdraw_Global];

// Defines

enum
{
	VEHICLE_TYPE_NONE,
	VEHICLE_TYPE_PLAYER,
	VEHICLE_TYPE_RENT,
	VEHICLE_TYPE_WORK,
	VEHICLE_TYPE_SALE,
};

enum {
	AREA_TYPE_NONE,
	AREA_TYPE_TRUCKER_ZONE,
	AREA_TYPE_ZONE_DOOR,
	AREA_TYPE_ZONE_HOUSE,
	AREA_TYPE_ZONE_PARK,
	AREA_TYPE_ZONE_IT_OBJECT
}

enum{
	CHECKPOINT_TYPE_NONE,
	CHECKPOINT_TYPE_FINISH_JOBTRUCK,
	CHECKPOINT_TYPE_NORMAL_JOBTRUCK,
	CHECKPOINT_TYPE_LOAD_JOB_TRUCK,
	CHECKPOINT_TYPE_LOAD_JOBCARRIER,
	CHECKPOINT_TYPE_UNLOAD_CARRIER,
	CHECKPOINT_TYPE_START_FARMER,
	CHECKPOINT_TYPE_FINISH_FARMER,
	CHECKPOINT_TYPE_G_GRAFFITI,
	CHECKPOINT_TYPE_GPS,
	CHECKPOINT_TYPE_GPSVEHICLE
}

enum {
	AREAIT_TYPE_NONE,
	AREAIT_TYPE_BUY_G_HATS,
	AREAIT_TYPE_BUY_G_CAP,
	AREAIT_TYPE_BUY_G_CAP4,
	AREAIT_TYPE_BUY_G_MASK,
	AREAIT_TYPE_BUY_G_MASK4,
	AREAIT_TYPE_BUY_G_WATCHES,
	AREAIT_TYPE_BUY_G_WATCHES1,
	AREAIT_TYPE_BUY_G_GLASSES,
	AREAIT_TYPE_BUY_G_BACKPAD,
	AREAIT_TYPE_RESTAURANTS_DRINK,
	AREAIT_TYPE_SERVICE_MEDIC,
	AREAIT_TYPE_ATM_MONEY,
	AREAIT_TYPE_BANK_MONEY,
	AREAIT_TYPE_BUY_PHONES,
	AREAIT_TYPE_BUY_SKINBINCO,
	AREAIT_TYPE_BUY_SKINZIP,
	AREAIT_TYPE_BUY_SKINDS,
	AREAIT_TYPE_BUY_SKINPROLAPS,
	AREAIT_TYPE_BUY_SKINSUBURBAN,
	AREAIT_TYPE_BUY_VEHICLES1,
	AREAIT_TYPE_BUY_VEHICLES2,
	AREAIT_TYPE_BUY_VEHICLES4,
	AREAIT_TYPE_BUY_BMWEAPON1,
	AREAIT_TYPE_BUY_BMWEAPON2,
	AREAIT_TYPE_BUY_DRINKMARK,
	AREAIT_TYPE_BUY_FOODREST,
	AREAIT_TYPE_BUY_FOODCB,
	AREAIT_TYPE_BUY_DRINKCB,
	AREAIT_TYPE_BUY_FOODBS,
	AREAIT_TYPE_BUY_DRINKBS,
	AREAIT_TYPE_BUY_CHANGESKIN,
	AREAIT_TYPE_BUY_ITEMSMINER,
	AREAIT_TYPE_MINERALCHOP_MINER,

	AREAIT_TYPE_REQUEST_WORKTRUCKER,
	AREAIT_TYPE_REQUEST_WORKFARMER,
	AREAIT_TYPE_REQUEST_WORKMINER,
	
	AREAIT_TYPE_MINER_BUYAPARTAMENT,
	AREAIT_TYPE_BUYSERVICESTORE,
	AREAIT_TYPE_BUYWORKSHOPTOOLS,
	AREAIT_TYPE_SECUREVEHICLES,
	AREAIT_TYPE_SELLVEHICLES,
	
	AREAIT_TYPE_MINER_PROCESS,
	AREAIT_TYPE_BUY_THIEVESHOUSE,

	AREAIT_TYPE_MILKPROCESSMACHINE,
	AREAIT_TYPE_ORDECOW,
	AREAIT_TYPE_PICKUPITEMMILK,

	AREAIT_TYPE_PICKUPITEM
}

enum {
	AREAITV_TYPE_NONE,
	AREAITV_TYPE_LOAD_GAS,
	AREAITV_TYPE_LOAD_WORKSHOP
}

enum {
	GAME_STATE_NORMAL,
	GAME_STATE_CRACK
}

enum {
	PLAYER_INTERIOR_NORMAL,
	PLAYER_INTERIOR_DOOR,
	PLAYER_INTERIOR_PROPERTY

}

enum {
	GAMEO_STATE_NONE,
	GAMEO_STATE_NORMAL,
	GAMEO_STATE_CONNECTED,
	GAMEO_STATE_DEAD
}

enum { //inventario
	INV_TYPE_NONE,
	INV_TYPE_DRINK,
 	INV_TYPE_FOOD,
 	INV_TYPE_WEAPON,
 	INV_TYPE_WEAPON2,
 	INV_TYPE_AMMO,
 	INV_TYPE_HELMET,
 	INV_TYPE_ABODY,
 	INV_TYPE_CARRY_FARMER,
 	INV_TYPE_FARMER_MILKEBUCKET,
 	INV_TYPE_BACKPAD,
 	INV_TYPE_CAP,
 	INV_TYPE_CAP2, // Back
 	INV_TYPE_CAP3, // Trucker
 	INV_TYPE_HAT,
 	INV_TYPE_HAT2, // Miner
 	INV_TYPE_HAT3,
	INV_TYPE_PHONE,
	INV_TYPE_GLASSES,
	INV_TYPE_MASK,
	INV_TYPE_WATCH,
	INV_TYPE_BERET,
	INV_TYPE_HAIR,
	INV_TYPE_HAMMERMINER,
	INV_TYPE_WEAPONAMMO, // 9mm small
	INV_TYPE_WEAPONAMMO2,
	INV_TYPE_WEAPONAMMO3, // 9mm small
	INV_TYPE_WEAPONAMMO4, // 9mm
	INV_TYPE_KITMEDIC,
	INV_TYPE_BANDAGES,
	INV_TYPE_ANALGESICS,
	INV_TYPE_REPAIRKIT,
	INV_TYPE_PETROLCAN,
	// Minerales,
	INV_TYPE_MIN_COPPER, // Lvl 1, 2
	INV_TYPE_MIN_GRANITE, // Lvl 1, 2
	INV_TYPE_MIN_NATURALGRAP, // Lvl 1,
	INV_TYPE_MIN_IRON, // Lvl 2, 3
	INV_TYPE_MIN_COAL, // Lvl 2, 3
	INV_TYPE_MIN_SULFUR, // Lvl 2, 3
	INV_TYPE_MIN_LEAD, // Lvl 2, 3
	INV_TYPE_MIN_SILVER, // Lvl 3, 4
	INV_TYPE_MIN_MAGNESIUM, // 3, 4
	INV_TYPE_MIN_DIAMOND, // Lvl 4
	//
	INV_TYPE_OBJECTTHIEVES
};

// Weapon enum

/*enum
{
	WEAPON_DATA_TYPE_COLT45,
	WEAPON_DATA_TYPE_SILENCED,
	WEAPON_DATA_TYPE_PYTHON,
	WEAPON_DATA_TYPE_SAWNOFF,

};*/

enum
{
	CRIMINAL_ACTIVITY_TYPE_NONE,
	CRIMINAL_ACTIVITY_TYPE_THIEF_H,
	CRIMINAL_ACTIVITY_TYPE_ROBACTOR
};

enum 
{
	TYPE_DIALOG_CONFIRM_COLOR1_V,
	TYPE_DIALOG_CONFIRM_COLOR2_V
}

enum
{
	VNOTI_TYPE_NONE,
	VNOTI_TYPE_ZONEIT,
	VNOTI_TYPE_ZONEIT2, // reserved
	VNOTI_TYPE_INFOIT3, // reserved
	VNOTI_TYPE_INFODRINK,
	VNOTI_TYPE_INFOFOOD,
	VNOTI_TYPE_INFONEEDS,
	VNOTI_TYPE_COUNTFARM,
	VNOTI_TYPE_FARMERPROGRESS,
	VNOTI_TYPE_FACTIONQUIZ,
	VNOTI_TYPE_FACTRANKS,
	VNOTI_TYPE_FACTIONREGISTER,
	VNOTI_TYPE_FACTIONREJECTQUIZ,
	VNOTI_TYPE_DISPUTEGRAFITI,
	VNOTI_TYPE_DISPUTEGRAFITI2,
	VNOTI_TYPE_RECEFACTIONMESSAGE,
	VNOTI_TYPE_FACTIONADDPOINTS,
	VNOTI_TYPE_GIVEPAYDAY,
	VNOTI_TYPE_ANALGESICEFFECT,
	VNOTI_TYPE_OBTAINWORK,
	VNOTI_TYPE_PLAYERSKILLS,
	VNOTI_TYPE_TUTORIAL1,
	VNOTI_TYPE_TUTORIAL2,
	VNOTI_TYPE_GPSVEHICLE,
	VNOTI_TYPE_RENTEDVEHICLE,
	VNOTI_TYPE_BUYVEHICLE,
	VNOTI_TYPE_SELLVEHICLE,
	VNOTI_TYPE_REMOVEVEHICLEKEY,
	VNOTI_TYPE_SHOPTUTORIAL,
	VNOTI_TYPE_MUTEPLAYER,
	VNOTI_TYPE_ADMINKICKPLAYER,
	VNOTI_TYPE_CHANNELDUDE,
	VNOTI_TYPE_NEWEXPERIENCE,
	VNOTI_TYPE_FACTIONNEWRANK,
	VNOTI_TYPE_KILLERPLAYER,
	VNOTI_TYPE_FACTIONDELETERANK,
	VNOTI_TYPE_FACTIONDELETERANK2,
	VNOTI_TYPE_MODIFYRANK,
	VNOTI_TYPE_LEAVEWORK,
	VNOTI_TYPE_NEWMEMBER,
	VNOTI_TYPE_FARMER,
	VNOTI_TYPE_WORKTHIEVESFORCE,
	VNOTI_TYPE_TIMECLOSETHIEVES,
	VNOTI_TYPE_BUYNEWSKIN,
	VNOTI_TYPE_INFOEXP,
	VNOTI_TYPE_BUYNEWHOUSE,
	VNOTY_TYPE_SELLHOUSE,
	VNOTI_TYPE_INFOEDITFURNITURE,
	VNOTI_TYPE_CURINGTIME,
	VNOTI_TYPE_INFONEWUPDATE,
	VNOTI_TYPE_CRANEVEHICLEINFO,
	VNOTI_TYPE_CRANEVEHICLEINFO2,
	VNOTI_TYPE_DEPOSITMONEYBANK,
	VNOTI_TYPE_REMOVEMONEYBANK
}

// enum

enum
{
	FACTION_RANK_INVITE,
	FACTION_RANK_CAST_MEMBERS,
	FACTION_RANK_MODIFY_MEMBERS,
	FACTION_RANK_CLAN_WAR,

	FACTION_RANK_MODIFY_RANKS,
	FACTION_RANK_CHANGE_COLOR,
	FACTION_RANK_CHANGE_NAME,
	FACTION_RANK_DELETE,
	
	FACTION_RANK_MAX // dejar siempre el ultimo
};

enum
{
	FACT_LIST_RANK_INVITE,
	FACT_LIST_RANK_REQUEST,
	FACT_LIST_RANK_SENDMESSAGEALL,
	FACT_LIST_RANK_SENDMESSAGE,
	FACT_LIST_RANK_CAST_MEMBERS,
	FACT_LIST_RANK_MODIFY_MEMBERS,
	FACT_LIST_RANK_MODIFY_RANKS,
	FACT_LIST_RANK_MODIFY_QUESTIONS,
	FACT_LIST_RANK_CHANGE_COLOR,
	FACT_LIST_RANK_CLAN_WAR,
	FACT_LIST_RANK_CHANGE_NAME,
	FACT_LIST_RANK_DELETE,

	FACT_LIST_RANK_MAX
}

#define FactionCrew. OO_TYPE(FACTIONCREW,FactionCrew)

enum E_FACTIONCREW_INFO
{
	bool:E_FACTIONCREW_Info_Valid,
	E_FACTIONCREW_Info_ID,
	E_FACTIONCREW_Info_Name[30],
	E_FACTIONCREW_Info_Points,
	E_FACTIONCREW_Info_Color,

	E_FACTIONCREW_Info_LastWar,
	E_FACTIONCREW_Info_Members,
	E_FACTIONCREW_Info_OnlineMemb,

	E_FACTIONCREW_Info_LastActivity,

	E_FACTIONCREW_Info_Type,

	E_FACTIONCREW_Info_GrafSlot,
	//E_FACTIONCREW_Info_ProgressGraf
}
new FactionCrewInfo[MAX_FACTION][E_FACTIONCREW_INFO];

enum E_FACTIONCREW_INFO_RANKS
{
	bool:E_FACTIONCREW_Rank_Valid,
	E_FACTIONCREW_Rank_ID,
	E_FACTIONCREW_Rank_Name[21],
	E_FACTIONCREW_Rank_Permission[FACTION_RANK_MAX],
}
new FactionCrewRank[MAX_FACTION][MAX_FACTION_RANKS][E_FACTIONCREW_INFO_RANKS];

enum E_FACTIONCREW_INFO_QUESTIONS
{
	E_FACTIONCREW_Question_ID
}
new FactionCrewQuestion[MAX_FACTION][MAX_FACTION_RANKS][E_FACTIONCREW_INFO_QUESTIONS];
new Iterator:FactionQuestionIter[MAX_FACTION]<MAX_FACTION_RANKS>;

#define Grafiti. OO_TYPE(GRAFITI,Grafiti_)

enum E_GRAFITI_INFO
{
	E_GRAFITI_Info_ID,
	E_GRAFITI_Info_Owner,
	E_GRAFITI_Info_Time,
	Float:E_GRAFITI_Info_X,
	Float:E_GRAFITI_Info_Y,
	Float:E_GRAFITI_Info_Z,
	Float:E_GRAFITI_Info_RZ,
	Float:E_GRAFITI_Info_PosX,
	Float:E_GRAFITI_Info_PosY,
	Float:E_GRAFITI_Info_PosZ,
	E_GRAFITI_Info_ObjectID
}
new Grafiti_Info[MAX_FACTION_GRAFITIS][E_GRAFITI_INFO];
//
new Grafiti_CrewsProgress[MAX_FACT_DISPUTE_GRAFFITI];
new Grafiti_CrewsSpray[MAX_FACT_DISPUTE_GRAFFITI];
new Grafiti_CrewsSprayIndex[MAX_FACT_DISPUTE_GRAFFITI];
new Grafiti_CrewsObject[MAX_FACT_DISPUTE_GRAFFITI];
new Grafiti_CrewsZoneName[24];


enum // Type In Area
{
	TYPE_INAREAY_NONE,
	TYPE_INAREAY_BOOT,
	TYPE_INAREAY_HOOD,
	TYPE_INAREAY_PETROLCAP,

	TYPE_INAREAY_AREAIT
};

enum // Type In Area
{
	TYPE_ITEMINTERACT_NONE,
	TYPE_ITEMINTERACT_BOOT,
	TYPE_ITEMINTERACT_HOOD,
	TYPE_ITEMINTERACT_BACKPAD,
	TYPE_ITEMINTERACT_SHELF,
	TYPE_ITEMINTERACT_FRIDGE

	//TYPE_INAREAY_AREAIT
};

enum // Furniture type
{
	FURNITURE_IT_TYPE_NONE,
	FURNITURE_IT_TYPE_SHELF,
	FURNITURE_IT_TYPE_FRIDGE
};

/* enum defines By Blaster */
enum
{	
	LOGIN,
	REGISTRO,
	SEXO,
	EDAD,
	Email,
	// Dialogos Ayuda,Reglas.
	Reglas1,
	Reglas2,
	Reglas3,
	Reglas4,
	AyudaJobs,
	InfoGeneral,
	Teleport,
	Teleport1,
	Teleport2,
	Teleport3,
	Teleport4,
	Teleport5,
	DIALOG_INFOLECHERO,
	DIALOG_CREARRADIO,
	DIALOG_VENDERVEHICULO,
	DIALOG_VENDERVEHICULO2,
	DIALOG_COMPRARBEBIDA,
	DIALOG_SERVICIOGRUA,
	DIALOG_SERVICIOGRUA2,
	DIALOG_SHOPALARM,
	DIALOG_BUYDRINK,
	DIALOG_BANCO,
	DIALOG_BANCO1,
	DIALOG_BANCO2,
	DIALOG_TRANSFER_BANK,
	DIALOG_TRANSFER_BANK_SEND,
	DIALOG_TRABAJOMEDICO,
	DIALOG_INFOCAMION,
	DIALOG_REPORTS,
	DIALOG_SENDQUESTION,
	DIALOG_BUYPARTSM,
	DIALOG_HELPREFERRALS,
	DIALOG_HELPJOBS2,
	DIALOG_SERVICEMEDICH,
	DIALOG_ANIMS,
	DIALOG_ID_NULL_ALL,
	DIALOG_VEHICLECRANEPERMIT,
	DIALOG_LEAVEWORK,
	DIALOG_OBTAINWORK,
	DIALOG_AOPTIONSVEHICLE,

	// Extra Count Dialog
	DIALOG_CONFIGPLAYERG,
	DIALOG_BUY_PLAYER_VEHICLE,
	DIALOG_SELECT_OPTION_FARMER,
	DIALOG_ADD_NUMBER_CONTACT,
	DIALOG_SEND_MESSAGE_PHONE,
	DIALOG_SEND_MESSAGE_PHONE_ID,
	DIALOG_SEND_MESSAGE_PHONE_MSG,
	DIALOG_FACTION_CREATE_RANK,
	DIALOG_FACTION_RANKS,
	DIALOG_FACTION_QUESTIONS,
	DIALOG_FAC_RANK_MODIFY,
	DIALOG_FAC_QUIZ_MODIFY,
	DIALOG_FACTION_MENU,
	DIALOG_FACTION_INVITE,
	DIALOG_RANKF_MODIFY_NAME,
	DIALOG_QUESTION_MODIFY_TEXT,
	DIALOG_RANKF_MODIFY_PERMISS,
	DIALOG_RANKF_DELETE,
	DIALOG_FACTION_OPTIONS_U,
	DIALOG_FAC_MEMBER_MODIFY,
	DIALOG_FAC_CAST_MEMBER_CONFIRM,
	DIALOG_FACTION_SEND_QUIZ,
	DIALOG_START_QUIZ_FACTION,
	DIALOG_FACTION_QUIZ_NEXT,
	DIALOG_FACTION_ACTIVITIES_H,
	DIALOG_FACTION_CREATE_NAME,
	DIALOG_FACTION_CREATE_COLOR,
	DIALOG_FACTION_CREATE_CONFIRM,
	DIALOG_FACTION_SENDMSG,
	DIALOG_FACTION_SENDMSGALL,
	DIALOG_FACTION_REJEREQUESTMSG
}

enum {
	INTERIOR_TYPE_NONE, // 0
	INTERIOR_TYPE_PIZZA, // 1
	INTERIOR_TYPE_DEALER1, // 2
	INTERIOR_TYPE_HOSPITAL, // 3
	INTERIOR_TYPE_WORKFARMER, //4
	INTERIOR_TYPE_SEGUREVEHICLES // 5
}

enum
{
	HOUSE_INTERIOR_BATH,
	HOUSE_INTERIOR_ROOM1,
	HOUSE_INTERIOR_ROOM2,
	
	HOUSE_INTERIOR_MAX // dejar siempre el ultimo
};