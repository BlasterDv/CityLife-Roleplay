/*enum e_array_textnotibox
{
	enotiboxid,
	enotiboxstr[258 char]
}
new const array_TextNotiBox[][e_array_textnotibox] = {
	{1, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar" },
	{1,"Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir" }

};*/

/*enum E_DATAEXTRA_VEHICLE_WORK_INFO
{
	
	vehicle_work_MODEL,
	vehicle_work_POS_X,
	vehicle_work_POS_Y,
	vehicle_work_POS_Z,
	vehicle_work_POS_A
}
new Vehicles_Work_Data[7][E_DATAEXTRA_VEHICLE_WORK_INFO] = {
	{ 456, 2201.55, -2219.12, 13.7241, 225.797 },
	{ 414, 2204.92,-2216.17, 13.6969, 225.16 },
	{ 609, 2197.39, -2223.12, 13.7222, 223.457 },
	{ 2208.23, -2212.48, 13.7106, 224.345 },

};*/


enum enum_Inventory_Items{
	E_INV_ITEMID,
	E_INV_TYPE,
	E_INV_EXTRADATA, // Model Extra
	E_INV_NAME[29],
	//E_INV_ENAME[29],
	bool:E_INV_ENAME,
	E_INV_OBJECTMID,
	E_INV_SIZE,
	E_INV_COLOR1,
	E_INV_COLOR2,

	//Float:invarea_offsetRotX,
	//Float:invarea_offsetRotY,
	//Float:invarea_offsetRotZ,
	E_INV_PointToRot,
	E_INV_DATAEXTRA, // Real Extra

	bool:E_INV_Attached,
	E_INV_SlotAttach,
	bool:E_INV_UseAnimCarry,

	Float:invarea_ModelOffset,
	Float:invarea_AreaitOffset,

	E_INV_TypeInfo,
	E_INV_TimeDestroy
};

new InvObjectData[280][enum_Inventory_Items];
new ItemType_Minerals[10];
new ItemType_Phones[10];
new ItemType_Glasses[33];
new ItemType_Masks[10];
new ItemType_Watches[15];

#define DataE. OO_TYPE(DATAE,DataE_)

enum E_DATAE_INV_OFFSET {
	Float:E_DATAE_Offset_RX,
	Float:E_DATAE_Offset_RY,
	Float:E_DATAE_Offset_RZ,
	Float:E_DATAE_Offset_Zoom,

	Float:E_DATAE_Offset_FX,
	Float:E_DATAE_Offset_FY,
	Float:E_DATAE_Offset_FZ
};
new DataE_Offset[][E_DATAE_INV_OFFSET] = {
	{ -18.000000, 0.000000, -50.000000, 0.8 }, // 0
	{ 0.0, -90.0, 90.0, 0.8, 0.0, -90.0, 0.0 }, // Pizza - 1
	{ -18.0, 0.0, -50.0, 0.8, 90.0 }, // Colt - 2
	{ -18.0, 0.0, -90.0, 1.0, 0.0, 0.0, 1.0 }, // Leche - 3
	{ -18.0, 0.0, -50.0, 0.8, 0.0, -90.0, -10.0 }, // Gorras - 4
	{ 0.0, 0.0, 40.0, 1.0 }, // 5 - Jugos
	{ 0.0 }, // 6
	{ -10.0, 0.0, 180.0, 0.8 } // 7 - Kit reparacion
};

enum E_DATAE_INV_Weapons{
	bool:E_DATAE_WeaponsData_AmmoEnabled,
	E_DATAE_WeaponsData_Ammo,
	E_DATAE_WeaponsData_Slot,
	E_DATAE_WeaponsData_LoadType
};
new DataE_WeaponsData[][E_DATAE_INV_Weapons] = 
{
	{ false, 0, 0, INV_TYPE_NONE }, // 0
	{ false, 0, 0, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE },
	{ false, 0, 1, INV_TYPE_NONE }, // 10
	{ false, 0, 10, INV_TYPE_NONE },
	{ false, 0, 10, INV_TYPE_NONE },
	{ false, 0, 10, INV_TYPE_NONE },
	{ false, 0, 10, INV_TYPE_NONE },
	{ false, 0, 10, INV_TYPE_NONE },
	{ false, 0, 10, INV_TYPE_NONE },
	{ true, 0, 8, INV_TYPE_NONE },
	{ true, 0, 8, INV_TYPE_NONE },
	{ true, 0, 8, INV_TYPE_NONE },
	{ false, 0, 0, INV_TYPE_NONE },
	{ false, 0, 0, INV_TYPE_NONE },
	{ false, 0, 0, INV_TYPE_NONE },

	{ true, 14, 2, INV_TYPE_WEAPONAMMO }, // 9mm
	{ true, 14, 2, INV_TYPE_WEAPONAMMO }, // 9mm
	{ true, 7, 2, INV_TYPE_WEAPONAMMO }, // 9mm

	{ true, 2, 3, INV_TYPE_WEAPONAMMO3 }, // 9mm
	{ true, 2, 3, INV_TYPE_WEAPONAMMO3 }, // 9mm
	{ true, 7, 3, INV_TYPE_WEAPONAMMO3 }, // 9mm

	{ true, 21, 4, INV_TYPE_WEAPONAMMO2 }, // Micro-UZI
	{ true, 24, 4, INV_TYPE_WEAPONAMMO2 }, // MP5

	{ true, 21, 5, INV_TYPE_WEAPONAMMO2 }, // Micro-UZI
	{ true, 24, 5, INV_TYPE_WEAPONAMMO2 }, // MP5

	{ true, 21, 4, INV_TYPE_WEAPONAMMO2 }, // TEC-9
	{ true, 10, 6, INV_TYPE_WEAPONAMMO4 }, // Rifle
	{ true, 10, 6, INV_TYPE_WEAPONAMMO4 }, // Rifle
	{ true, 10, 7, INV_TYPE_NONE }, // Rifle
	{ true, 21, 7, INV_TYPE_NONE }, // TEC-9
	{ true, 10, 7, INV_TYPE_NONE }, // Rifle
	{ true, 21, 7, INV_TYPE_NONE }, // TEC-9
	{ true, 10, 8, INV_TYPE_NONE }, // Rifle
	{ true, 21, 12, INV_TYPE_NONE }, // TEC-9
	{ true, 10000, 9, INV_TYPE_NONE } // Spray
	
};

enum E_DATAE_CREW_COLORINFO {
	E_DATAE_CrewColor_Color,
	E_DATAE_CrewColor_TextColor[10],
	E_DATAE_CrewColor_ID
};

new DataE_CrewColor[][E_DATAE_CREW_COLORINFO] = {
	{ 0x4D88F8FF, "~r~~h~", 1 },
	{ 0xD85050FF, "~g~~h~", 2 },
	{ 0xD8AC58FF, "", 3 },
	{ 0x704C98FF, "", 4 },
	{ 0x38B488FF, "", 5 }
};

new const CONVERTTIME_MONTHDAYS[12]	= {
	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};

enum E_DATAE_HOUSE_INTERIOR
{
	Float:E_DATAE_HouseInterior_X,
	Float:E_DATAE_HouseInterior_Y,
	Float:E_DATAE_HouseInterior_Z,
	Float:E_DATAE_HouseInterior_A,
	E_DATAE_HouseInterior_Int,
	E_DATAE_HouseInterior_Rooms[HOUSE_INTERIOR_MAX]
	//E_DATAE_HouseInterior_ObjectCount
}

new DataE_HouseInterior[][E_DATAE_HOUSE_INTERIOR] = {
	{ 0.0, 0.0, 0.0, 0.0, 0 },
	{ 444.2333, 673.6519, 1101.0859, 90.4835, 0 } // 1
};


new Date_InteriorRooms[][HOUSE_INTERIOR_MAX] = {
	{ 0, 0, 0 },
	{ 1, 1, 1 }
};

#define Texture. OO_TYPE(TEXTUREDATA,TextureData_)

enum E_TEXTUREDATA_MATERIAL_DATA
{
	E_TEXTUREDATA_Info_Name [22],
	E_TEXTUREDATA_Info_ModelID,
	E_TEXTUREDATA_Info_TXD [18],
	E_TEXTUREDATA_Info_Texture [20],
	E_TEXTUREDATA_Info_Color,
	E_TEXTUREDATA_Info_Extra,
	E_TEXTUREDATA_Info_Price
}

new TextureData_Info[50][E_TEXTUREDATA_MATERIAL_DATA];

#define Furniture. OO_TYPE(FURNITUREDATA,FurnitureData_)

enum E_FURNITUREDATA_HOUSE_DATA
{
	E_FURNITUREDATA_Info_Name [22],
	bool:E_FURNITUREDATA_Info_New,
	E_FURNITUREDATA_Info_Model,
	E_FURNITUREDATA_Info_Price,
	E_FURNITUREDATA_Info_Slot,
	E_FURNITUREDATA_Info_Slot2,
	E_FURNITUREDATA_Info_Slot3,
	E_FURNITUREDATA_Info_Type,
	E_FURNITUREDATA_Info_Message,
	E_FURNITUREDATA_Info_Capacity,
	Float:E_FURNITUREDATA_Info_OffsetX,
	Float:E_FURNITUREDATA_Info_OffsetY,
	Float:E_FURNITUREDATA_Info_Range
}

new FurnitureData_Info[100][E_FURNITUREDATA_HOUSE_DATA];

enum E_RADIO_STATION_DATA
{
	E_RADIO_STATION_DATA_NAME[24],
	E_RADIO_STATION_DATA_TYPE[24],
	E_RADIO_STATION_DATA_URL[128]
}
new RADIO_STATION_DATA[][E_RADIO_STATION_DATA] =
{
	{ "", "", "" },
	{ "Loca Latino FM", "Reggaeton", "https://panel.blindstream.com/radio/8030/radio.mp3" },
	{ "Cadena 100 FM", "Varios", "http://cadena100-streamers-mp3.flumotion.com/cope/cadena100.mp3" }
};

/*new const CONVERTTIME_MONTH_NAMES[12][] = {
	"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
};*/