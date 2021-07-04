new rBit1:StateHouseThievesForce<7>;
new rBit1:StateMineralWorkMiner<40>;
new rBit1:MineralWorkMinerValid<40>;
// Minero
//new rBit1:Minerals_PosLevelOneActive< sizeof(Minerals_Zone_Random_Level1) >;

new item_Holding[MAX_PLAYERS];
new item_Interacting[MAX_PLAYERS];

new
			areag_Near[MAX_PLAYERS][MAX_AREAS_GE_INRANGE],
   Iterator:areag_NearIndex[MAX_PLAYERS]<MAX_AREAS_GE_INRANGE>;

new Text:TextdrawServerDisc;
new Text:sTextdraw_pItemsInventory[17][2];
new Text:sTextdraw_pItemsInventoryTrade[MAX_PLAYER_INVENTORY_ITEMS][2];
new Text:sTextdraw_InvChangeItems[MAX_PLAYER_INVENTORY_ITEMS][2];

new Player_VehiclesTime[MAX_PLAYERS][4];
new Player_VehiclesDBID[MAX_PLAYERS][4];

new Player_TempCodeRefer[MAX_PLAYERS];

new IconMapGPSVar[50] = {-1, ...};

new GlobalBar:sProgress_pItemsInventory[MAX_PLAYER_INVENTORY_ITEMS];

new pickup_jobs[11];
new pickup_bars_drink[1];

new dynamic_dgui[MAX_PLAYERS][MAX_DGUI_MAX_VARS];

new count_houses;
new count_server_doors;
new count_server_parkings;
new count_factions_loaded;
new count_server_grafitis;

new disputed_grafiti_actived = -1;

// Minero
new count_miner_rocks_generated[4];
new Miner_TimeGenNewMineral[4];
// Granjero
new FarmerCowsPosition[5];

//new count_server_global_vehicles;

/* Interactive Areas, Last Modified: 16/12/2018 */
// Blank

/* Vehicle Var */
new DumpsterVehicles[4];
new TruckerWorkVehicles[7];
new FarmerWorkVehicles[4];

new LeasedVehicles[15];
/* Actor's, Last Modified 29/01/2019 */