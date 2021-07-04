/******************************************************************************

LosAngelesCalifornia Roleplay v2.8.1 - Last Modified 24/04/2019. By Blaster

 ******************************************************************************/

// LAC-Project
// Copyright 2020 BlasterDv
// 
// Licensed under the Apache License, Version 2.0 throw new ArgumentNullException(nameof(player));(the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS 650

#include <YSF>

#include <streamer>
#include <sscanf2>
#include <a_mysql>

#define PP_SYNTAX_AWAIT
#define PP_MULTILINE_AWAIT
#define PP_SYNTAX_YIELD
#define PP_SYNTAX_STRING_OP
#define PP_SYNTAX_FOR_POOL
#define PP_SYNTAX_FOR_LIST
#define PP_SYNTAX_FOR_MAP
#include <PawnPlus>
#include <pp-mysql>
#include <async-dialogs>

#define YSI_NO_HEAP_MALLOC
//#include <YSI_Coding\y_inline>
//#include <foreach>
#include <md-sort\md-sort>
#define YSI_NO_KEYWORD_yield
#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_inline>
//#define YSI_NO_OPTIMISATION_MESSAGE

//#include <samp-precise-timers>

#include <Pawn.CMD>
#include <Pawn.RakNet>

#include <LAC/td-string-width>
#include <LAC/PlayerGangZone>
#include <LAC/mSelectionNew>
#include <LAC/Menu>
#include <strlib>

#include <playerprogress>
#include <map-zones>
#include <samp_bcrypt>
#include <CreateCP>
#include <CreateRace>
#include <CreateButton>
#include <Dini>
#include <ACSB>
#include <rBits>
#include <ExtendedCallbacks>

#include <easyDialog>
#include <LAC/InteractiveArea>

#define GPS_MODE_ALL
#include <LAC/LAC-GPS>

#pragma unused strtok

#define SPECIAL_ACTION_PISSING 68

//Define ModelsEx
#define USARPRENDAS 0
#define EDITARPRENDAS 1
#define QUITARPRENDAS 2
#define EDITARTUNEOS 3
#define QUITARTUNEOS 4
#define MODELEX2_DEJARMADERA 5

#define MODEL_SKINSM_BINCO 1
#define MODEL_SKINSM_SUBURBAN 2
#define MODEL_SKINSM_ZIP 3
#define MODEL_SKINSM_VICTIM 4

#define CLOTHES_TYPE_HELMET 0

// Timers ID
#define WTIMER_DRIVEOUT 9

#define MAXIMOS_INTENTAR     1

#define COLOR_FADE1         0xE6E6E6E6
#define COLOR_FADE2         0xC8C8C8C8
#define COLOR_FADE3         0xAAAAAAAA
#define COLOR_FADE4         0x8C8C8C8C
#define COLOR_FADE5         0x6E6E6E6E

#define compra 509// 247
////////////// MACROS NO LOS BORRES ////////////////////////////////////
#define PlayerToPoint(%1,%2,%3,%4,%5) IsPlayerInRangeOfPoint(%2,%1,%3,%4,%5)
#define	Params>	 if(!strlen(tmp))
#define	function%0(%1)	 forward %0(%1); public %0(%1)
#define	SIN_RESULTADO        	0
#define GText GameTextForPlayer
#define Skin SetPlayerSkin
#define GlobalMsg SendClientMessageToAll
#define Message SendClientMessage
//
#define SpeedCalculate(%0,%1,%2,%3,%4) floatround(floatsqroot(%4?(%0*%0+%1*%1+%2*%2):(%0*%0+%1*%1))*%3*1.7) //Detectara velocidad
/*#define ShowPlayerDialog(%1, %2, %3, %4, %5, %6, %7) ShowPlayerDialog(%1, %2, %3, %4, %5, %6, %7) DialogSegureA[%1] = %2*/
#define IsNull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#define MAX_PING 700 //Mï¿½ximo ping permitido
#define MAX_REPORTS 100
#define MAX_BARRIERS 50
#define INVALID_REPORTS_ID -1
/*#define MAX_STRING 256*/
#define MAX_DOORS 200
//#define MAX_VEHICLES_PLAYER (70)
#define MAX_VEHICLES_PLAYER (3)
#define MAX_FACTION 80//100
#define MAX_PLAYER_PRENDAS 4
#define MAX_VARS_SERVER 10
#define 			GetVehicleName(%0) 			VehicleName[%0-400]
#define GetVehicleNameEx(%0) VehicleName[%0-400]
#define SetPlayerHoldingObject(%1,%2,%3,%4,%5,%6,%7,%8,%9) SetPlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1,%2,%3,%4,%5,%6,%7,%8,%9)
#define StopPlayerHoldingObject(%1) RemovePlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define IsPlayerHoldingObject(%1) IsPlayerAttachedObjectSlotUsed(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
/*#undef MAX_PLAYERS
#define MAX_PLAYERS 500*/

//COLORES
#define DEFAULT_COLOR      	0xFFFFFF00
#define COLOR_SAMP 			0xA9C4E4FF
#define C_Error				0xEE00009B
#define C_Aviso            	0xFF0000FF
#define C_Positivo          0x00D200FF
#define Rojo                0xFF0000FF
#define RojoOscuro          0xDE0000FF
#define Azul               	0x0000FFFF
#define Amarillo            0xFFFF00FF
#define AmarilloClaro       0xFFFFA8FF
#define Verde               0x00CF11FF
#define VerdeClaro          0x00FF0056
#define VerdeOscuro         0x00A200FF
#define Naranja             0xFFAC00FF
#define NaranjaOscuro       0xFF8800FF
#define Morado              0xB043FFFF
#define Fucia               0xE800E877
#define Violeta             0xB0BEFFFF
#define Gris                0xb0b0b0FF
#define GrisOscuro          0x666666FF
#define Blanco              0xFFFFFFFF
#define COLOR_WHITE         0xFFFFFFFF
#define Blanco2             0xFFFFFF00
#define Negro               0x000000FF
#define Marron              0x562C2CD2
#define AzulOscuro          0x0000C1FF
#define AzulClaro           0x0072FFFF
#define Rosa                0xFFB4D3FF
#define Celeste             0x33CCAAFF
#define COLOR_HABILIDAD     0xDBCA58FF
#define COLOR_POLICIA       0x3399FF00
#define COLOR_BANDA         0x4EB24EFF
#define COLOR_ORANGE1       0x5EB5FFFF//0xE7B564FF
#define COLOR_MEDICP		0x4DCF5EFF
#define COLOR_HELPCMD		0xFF7373FF
#define COLOR_ADMAD 	0xFFC400FF
#define COLOR_PAYDAY	0xFFFEC9FF
#define COLOR_DIALOG_SKIN  0x178ECF5F
#define COLOR_DIALOG_SKINS  0x178EFF5D
#define COLOR_DIAG_SKINH	0x178EFF5D
#define COLOR_MECA 0x00BBFFFF
#define COLOR_DOORT			0xFFFFFFF0
#define COLOR_WHITET 		0xFFFFFFF0
#define COLOR_HOUSET 		0xFFFFFFF0
#define COLOR_TXT3DT 		0xFFFFFFFE
#define COLOR_TXT3DT2 		0xFFFFFFF0
#define COLOR_TXT3DIT 		0xFFFFFFFF
#define COLOR_TOWING 0x354B72FF

#define C_BLANCO "{FFFFFF}"
#define C_POLICE "{3399FF}"

#define Hablar     			0xE6E6E6E6
#define Hablar2    			0xC8C8C8C8
#define Hablar3    			0xAAAAAAAA
#define Hablar4    			0x8C8C8C8C
#define Hablar5    			0x6E6E6E6E

#define Rol         		0xB998D7FF
#define ColorAviso       	0x99CCFF
#define ColorBots           0x00C8FEFF

#define COLOR_MEGAPHONE 0x3399FF00
#define c0_color 0xFFFFFF00 //Color del cargo 0
#define c1_color 0xFFFDBAFF //Color del cargo 1
#define c2_color 0xFFC600FF //Color del cargo 2
#define c3_color 0xFFA200FF //Color del cargo 3
#define c4_color 0xFF8400FF //Color del cargo 4
#define c5_color 0xFF5A00FF //Color del cargo 5
#define c6_color 0xFF1E00FF //Color del cargo 6
#define TEAM_BLUE_COLOR 0x3399FF00

#define 			TIME_RESPAWN 				(7200) // Cars Respawn Time
#define 			TIME_JobsRespawn				(2) //RespawnJobs
#define SERVER_VERSION "4.1.7"
#define SERVER_BUILD (417)
/*#define C_Blanco         0xFFFFFFFF*/
#define OXL_C            "{29DDB9}"
#define VALUE_MOTOR 300.0
#define MAX_CASAS           	(300)
#define MAX_PARKING        (20)
#define MAX_TUNEOS	500
#if !defined isnull
    #define isnull(%1) \
                ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#define MAX_TIMERSESPERA (15) //El maximo de contadores que se podran crear. 
#define SetTimerCMD(%0,%1,%2) WaitTime[%0][%1]=gettime()+%2 //Para Establecer el Tiempo que se debe esperar entre segundos para utilizar la funcion correspondiente.
#define GetTimerCMD(%0,%1) WaitTime[%0][%1]>gettime() //Para Chequear si un contador esta activo.
#define GetSegTimerCMD(%0,%1) WaitTime[%0][%1]-gettime() //Para Chequear Los Segundos que debe esperar para utilizar La Funcion correspondiente. [NOTA]: Utilizar con format.
#define GetMinTimerCMD(%0,%1) floatround((WaitTime[%0][%1]-gettime())/60)
new WaitTime[MAX_PLAYERS][MAX_TIMERSESPERA]; // 8 Creados

#define MAX_TIMERSESPERAJOB (11) //El maximo de contadores que se podran crear. 
#define SetTimerJob(%0,%1,%2) WaitTimeJob[%0][%1]=gettime()+%2 //Para Establecer el Tiempo que se debe esperar entre segundos para utilizar la funcion correspondiente.
#define GetTimerJob(%0,%1) WaitTimeJob[%0][%1]>gettime() //Para Chequear si un contador esta activo.
#define GetSegTimerJob(%0,%1) WaitTimeJob[%0][%1]-gettime() //Para Chequear Los Segundos que debe esperar para utilizar La Funcion correspondiente. [NOTA]: Utilizar con format.
#define DeleteTimerJob(%0,%1) WaitTimeJob[%0][%1]=0
new WaitTimeJob[MAX_PLAYERS][MAX_TIMERSESPERAJOB]; // 7 Creados
new WaitTimeJobT[MAX_PLAYERS][MAX_TIMERSESPERAJOB];

// 0 = Armero

native WP_Hash(buffer[], len, const str[]);

new RandomMSG[][] =
{
"y lo logra.",
"y no lo logra."
};
new LetterList[26][] =
{
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
};

stock Float:player_get_speed(playerid)
{
	new Float: Floats[3];
	GetVehicleVelocity(GetPlayerVehicleID(playerid), Floats[0], Floats[1], Floats[2]);
	return floatsqroot(Floats[0] * Floats[0] + Floats[1] * Floats[1] + Floats[2] * Floats[2])*103.0*1.7/* 180.00*/;
}

//////////////////////////////// Registro son las varibales
new Text:CN; new Text:CN2;
new Text:textdraw_desbug;
new Vehicle_Time_Gasoline[MAX_VEHICLES];
new rBit1:SiendoCurado<MAX_PLAYERS>;
new FirstSpawn[MAX_PLAYERS];
new PuertasLSPD[19];
new PuertasEmisoras[4];
new PuertasAbiertasID[5];
new EmisoraOcupada[5][4];
new FactPayDay;
new varinreboot, timer_rebootserver;
new varinreboottime;
new cronotime, cronotimestate;
/*new TimeTemp[MAX_PLAYERS];*/
//VariablesTextDrawInicio
new Text:LoginMenu[2];
new Text:TextInicioWeb;
new Text:TextInicioVersion;
//new VehicleAvionTest;
//Variables
//new tuningsale = mS_INVALID_LISTID;
new /*EstadoCapo[MAX_VEHICLES];*/rBit1:EstadoCapo<MAX_VEHICLES>;
new peajelvabierto1, peajelvcerrado2;
new peajelvabierto3, peajelvcerrado4;
new StatePeajeLV[2];
new gWeather;
new ShowingGPS[MAX_PLAYERS];
new MatarMotor[MAX_PLAYERS];
new QuestionTime[MAX_PLAYERS];
new QuestionText[128][MAX_PLAYERS];
new ChannelQuestions[MAX_PLAYERS];
new AdminChat[MAX_PLAYERS];
new Aggressor[MAX_PLAYERS];
new AggressorTime[MAX_PLAYERS];
new OnCall[MAX_PLAYERS];
new MobileSub[MAX_PLAYERS];
new PlayerBeingCalled[MAX_PLAYERS];
new SaveNumPhone[MAX_PLAYERS];
new Intentos[MAX_PLAYERS];
new carsforplayer[MAX_PLAYERS];
new Specteando[MAX_PLAYERS], SpecteandoInt[MAX_PLAYERS], SpecteandoVW[MAX_PLAYERS], Specing[MAX_PLAYERS], Float:SpectX[MAX_PLAYERS], Float:SpectY[MAX_PLAYERS], Float:SpectZ[MAX_PLAYERS];
new EstadoRadio[MAX_PLAYERS];
new Esposando[MAX_PLAYERS];
new Oficial[MAX_PLAYERS];
new VariableAbatido[MAX_PLAYERS];
new Curando[MAX_PLAYERS];
new CargoAdvertido[MAX_PLAYERS];
new Jail[MAX_PLAYERS];
new LlamadaMecanico[MAX_PLAYERS];
new PlayerBar:ProgressCargando[MAX_PLAYERS];
new PlayerBar:ProgressDescargando[MAX_PLAYERS];
new PlayerBar:ProgressGeneral[MAX_PLAYERS];
new EnAuto[MAX_PLAYERS];
new BajandoVehiculo[MAX_PLAYERS];
new ListeningR[MAX_PLAYERS];
new HasMicrophone[MAX_PLAYERS];
new CargandoGasolina[MAX_PLAYERS];
new Bidon[MAX_PLAYERS];
new BedVar[38]/* = INVALID_PLAYER_ID*/;
//new OpcionRemolcar[MAX_PLAYERS];
new CombatMode[MAX_PLAYERS];
new CombatModeGang;
new LocalizandoV[MAX_PLAYERS];
new Objeto[MAX_PLAYERS];
new TimerMapGPS[MAX_PLAYERS];
new DialogSegureA[MAX_PLAYERS];
new TransferBankID[MAX_PLAYERS];
new San[MAX_PLAYERS];
new PlayerHasReport[MAX_PLAYERS];
new PlayerStatus[MAX_PLAYERS]; //Estados: 1 - Anim
/*new LastSyncPos[MAX_PLAYERS];*/
//
/*new rBit1:secureTP <MAX_PLAYERS> ;*/
//Player
new PlayerObjects[MAX_PLAYERS][11];
// Player - General

// Jobs
new DumpCompa[MAX_PLAYERS];
new DumpPlace[MAX_PLAYERS];
new DumpTravel[MAX_PLAYERS];

//Variables Timer's
new LlenandoTanque[MAX_PLAYERS];
new TimerLlamadaT1[MAX_PLAYERS];
new TimerLlamadaT2[MAX_PLAYERS];
new TimerRemoveWanted[MAX_PLAYERS];
new TimerNotificationTextDraw[MAX_PLAYERS];
new TimerMeca[MAX_PLAYERS];
new TimerCombatMode[MAX_PLAYERS];
new Cosechando[MAX_PLAYERS],PCosechar[MAX_PLAYERS];
new ChoferCamion[MAX_VEHICLES], CamionID[MAX_PLAYERS], CamionCargado[MAX_VEHICLES];
new Cargando[MAX_PLAYERS] = 0;
new TimerDescargando[MAX_PLAYERS];
new Descargando[MAX_PLAYERS];
new MecanicoServicio[MAX_PLAYERS];
new Mecanico[MAX_PLAYERS];
new MecanicoPrecio[MAX_PLAYERS];
new MecaVar[MAX_PLAYERS];
new CallTaxi[MAX_PLAYERS][2];
new Taximeter[MAX_PLAYERS];
new TaximeterAmount[MAX_PLAYERS];
new TaxiDriver[MAX_PLAYERS];
new TaximeterTimer[MAX_PLAYERS];
new rBit1:InTaxiVar<MAX_PLAYERS>;
new CallMedic[MAX_PLAYERS][2];
new Reanimated[MAX_PLAYERS];
new StatePatient[MAX_PLAYERS];
new Objetos[MAX_PLAYERS]/*[4]*/;
new Objetos2[MAX_PLAYERS];
new Objetos3[MAX_PLAYERS];
//new Objetos4[MAX_PLAYERS];
new rBit1:CallTowing<MAX_PLAYERS>;
/*new CallRTaxi[MAX_PLAYERS];*/
//Variables Tiempo
new AntiFlood[MAX_PLAYERS];
//Variables Ofrecer
new PlayerOffer[MAX_PLAYERS];
new PriceOffer[MAX_PLAYERS];
/*new ConsumablesGram[MAX_PLAYERS];
new ConsumablesType[MAX_PLAYERS];
new OfferedCoins[MAX_PLAYERS];
new OfferedPieces[MAX_PLAYERS];
new OfferedWeaponPlayer[MAX_PLAYERS];
new OfferedWeaponPrice[MAX_PLAYERS];
new OfferedWeapon[MAX_PLAYERS];*/
//
new LastCheck[MAX_PLAYERS], //Guardara tiempo para checkear las posiciones
Float:CurrentPosX[MAX_PLAYERS],
Float:CurrentPosY[MAX_PLAYERS],
Float:CurrentPosZ[MAX_PLAYERS];
//Variables TextDraw GameMode
new Text:MapaGPS;
new Text:MapaGPS2;
new Text:MapaGPS4;
new Text:MapaGPS5;
new PlayerText:IconMap3D[MAX_PLAYERS][20];
new PlayerText:TaximeterTextdraw[MAX_PLAYERS][3];
//Pickups Servicios y Otros
new AreaAeropuertos[5];
new AreaCabinas[5];
new ButtonPress[9];
// Variables Actores
new ActorBank[5];
new ActorJobs[4];

//New 3DLabelsText
new Text3D:CabinasTextLabels[5];
//Variables del Servidor
/*new payday = 0;*/
new object_plane[2];
//
/*new strinmode[MAX_STRING];*/
new Float:zones_points_0[] = {
	-1084.0,-213.0,-1236.0,-689.0,-1272.0,213.0,-1084.0,-213.0
}; //(AREA) New Area
new Float:zones_points_1[] = {
	-1544.0,-683.0,-1538.0,-431.0,-1616.0,-89.0,-1272.0,213.0,-1236.0,-685.0,-1544.0,-683.0
}; //(AREA) New Area
new Float:zones_points_2[] = {
	1331.0,1864.0,1330.0,1807.0,1313.0,1792.0,1311.0,1671.0,1256.0,1671.0,1258.0,1210.0,1280.0,1212.0,1275.0,1220.0,1447.0,1200.0,1467.0,1168.0,
	1631.0,1156.0,1643.0,1276.0,1642.0,1278.0,1638.0,1325.0,1729.0,1644.0,1695.0,1700.0,1551.0,1708.0,1555.0,1860.0,1331.0,1864.0
}; //(AREA) New Area

static Buy_Skins_Binco_WOMEN[] = {9, 10, 13, 31, 39, 40, 38, 41, 53, 54, 56, 63, 64, 65, 69, 75, 85, 90, 88, 89, 129, 130, 131, 151, 152, 298 };
static Buy_Skins_Binco_MEN[] = { 7, 19, 20, 21, 24, 25, 28, 29, 30, 47, 48, 66, 67, 102, 103, 104, 105, 106, 107, 144, 149, 156, 176, 177, 180, 179, 184, 188 }; // Binco Women
new Buy_Skins_Zip_Men[] = { 3, 4, 5, 17, 26, 46, 59, 60, 68, 98, 120, 118, 117, 119, 124, 125, 126, 123, 122, 127, 147, 165, 166, 170, 208, 228, 272 };
new Buy_Skins_Zip_Women[] = { 55, 76, 91, 93, 141, 150, 169, 192, 191, 214, 215, 216, 219, 224, 233, 263 };
static Buy_Skins_Suburban_Women[] = { 87, 92, 148, 157, 178, 196, 198, 199, 201, 225, 232, 231, 237, 238, 243, 244, 245, 246, 256, 257 };
static Buy_Skins_Suburban_Men[] = { 1, 2, 6, 8, 16, 14, 15, 23, 27, 32, 33, 34, 42, 43, 44, 49, 57, 58, 72, 73, 78, 79, 94, 95, 100, 101, 108, 109, 110, 114, 115, 116, 121, 137, 135, 134, 136, 133, 132, 142, 143, 146, 159, 161, 185, 184, 200, 173, 174 };
new Buy_Skins_Men_DS[] = { 61, 11, 112, 113, 153, 163, 164, 170, 171, 186, 187, 189, 208, 227, 240, 250, 255, 258, 259, 289, 290, 291, 294, 295, 296, 299, 303, 304, 305 };
new Buy_Skins_Women_DS[] = { 11, 172, 194 };
new Buy_Skins_Men_Prolaps[] = { 18, 22, 35, 36, 37, 51, 52, 45, 70, 80, 81, 96, 87, 154, 203, 204, 221, 223, 252 };
new Buy_Skins_Women_Prolaps[] = { 138, 139, 140, 145, 190, 193, 195, 226, 251 };
//forwards
//forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward FloodTerminado(playerid);
forward cerrarpeajelv2(playerid);
forward cerrarpeajelv1(playerid);
forward cerrarpeajelv4(playerid);
forward cerrarpeajelv3(playerid);
forward ConectarJugador(playerid, contra[]);
forward ColorJugadorDefault(playerid);
forward Conectar(playerid);
/*forward Float:getVehicleSpeed(vehicleid);*/
//Variables Vehiculos 2
new Text:VeloBox[3];
new PlayerText:VeloText[MAX_PLAYERS][2];
/*new Text:SpeedometerText[2];*/
new PlayerBar:Velocidad[MAX_PLAYERS];
new PlayerBar:Gasolina[MAX_PLAYERS];
new PlayerBar:InventorySpaceBar[MAX_PLAYERS][2];
/*new VehicleFuel[MAX_VEHICLES];*/
/*new MaxGasolina[MAX_VEHICLES];*/

//Variables Vehiculos
static CurrentDialog[MAX_PLAYERS];

new NombreArma[47][] = // As below
{
	"","Manopla","Palo de Golf","Palo de policï¿½a","Cuchillo","Bate de bï¿½isbol","Pala","Palo de billar","Katana","chainsaw","Consolador morado","Consolador blanco","Gran Vibrador blanco","Vibrador plateado",
	"bouquet of flowers","Baston","Granada","Lacrimonega","cocktel molotov","jetpack"," "," ","9mm","9mm silenciada","Desert Eagle","Escopeta","sawn-off shotgun","Escopeta de combate",
	"Uzi","MP5","AK-47","M4","TEC-9","Rifle","Rifle francotirador","rocket launcher","heatseeker","Lanzallamas","minigun","satchel charge","detonator","spray can","fire extinguisher",
	"Camara","Nightvision Goggles", "thermal goggles","parachute"
};

/*new NombreArmaInventario[47][] =
{
"","{E21313}Manopla | ","{E21313}palo-de-golf {FFFFFF}| ","{E21313}Porra {FFFFFF}| ","{E21313}Cuchillo {FFFFFF}| ","{E21313}bate-de-beisbol {FFFFFF}| ","{E21313}pala {FFFFFF}| ","{E21313}palo-de-billar {FFFFFF}| ","{E21313}katana {FFFFFF}| ","{E21313}chainsaw {FFFFFF}| ","{E21313}Consolador morado {FFFFFF}| ","{E21313}small white vibrator {FFFFFF}| ","{E21313}large white vibrator {FFFFFF}| ","{E21313}silver vibrator {FFFFFF}| ",
"{E21313}bouquet of flowers {FFFFFF}| ","{E21313}Baston {FFFFFF}| ","{E21313}granada {FFFFFF}| ","{E21313}Lacrimonega {FFFFFF}| ","{E21313}cocktel molotov {FFFFFF}| ","{E21313}jetpack {FFFFFF}| ","{FFFFFF}| ","{FFFFFF}| ","{E21313}9mm {FFFFFF}| ","{E21313}9mm-silenciada {FFFFFF}| ","{E21313}Desert-Eagle {FFFFFF}| ","{E21313}Escopeta {FFFFFF}| ","{E21313}sawn-off shotgun {FFFFFF}| ","{E21313}Escopeta-de-Combate {FFFFFF}| ",
"{E21313}Uzi {FFFFFF}| ","{E21313}MP5 {FFFFFF}| ","{E21313}AK-47 {FFFFFF}| ","{E21313}M4 {FFFFFF}| ","{E21313}TEC-9 {FFFFFF}| ","{E21313}Rifle {FFFFFF}| ","{E21313}sniper rifle {FFFFFF}| ","{E21313}rocket launcher {FFFFFF}| ","{E21313}heatseeker {FFFFFF}| ","{E21313}flamethrower {FFFFFF}| ","{E21313}minigun {FFFFFF}| ","{E21313}satchel charge {FFFFFF}| ","{E21313}detonator {FFFFFF}| ","{E21313}spray can {FFFFFF}| ","{E21313}Fire Extinguisher {FFFFFF}| ",
"{E21313}camara {FFFFFF}| ","{E21313}nightvision goggles {FFFFFF}| ", "{E21313}thermal goggles {FFFFFF}| ","{E21313}parachute {FFFFFF}| "
};*/

new VehicleName[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Perennial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch",
	"Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi",
	"Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator",
	"Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit", "Romero",
	"Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed",
	"Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler",
	"ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper",
	"Rancher","FBI Rancher","Virgo","Greenwood","Jetmax","Hotring Racer","Sandking","Blista Compact","Police Maverick",
	"Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT",
	"Elegant","Journey","Bike","Mountain Bike","Beagle","Cropduster","Stuntplane","Tanker","Road Train","Nebula","Majestic",
	"Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV-1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent",
	"Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility",
	"Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger",
	"Flash","Tahoma","Savanna","Bandito","Freight","Trailer","Kart","Mower","Duneride","Sweeper","Broadway",
	"Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer",
	"Euros","Hotdog","Club","Trailer","Trailer","Andromada","Dodo","RCCam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A",
	"Luggage Trailer B","Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};
/*ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
	DialogSegureA[playerid] = dialogid;
	printf("%i xd", dialogid);
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
}
#define ShowPlayerDialog ShowPlayerDialogEx*/
//
/*----------------------------------- End  --------------------------------------------*/
#include "core/defines.inc"
#include "core/vars_second.inc" // Global Vars
#include "core/vars_first.inc"

#include "core/enum.inc"

#include "core/others/vars_third.inc"
#include "core/others/vars_fourth.inc"

#include "core/vars_clothesplayer.inc"
#include "core/vars_Vehicle.inc"

#include "core/callbacks_first.pwn"
#include "core/connection.inc"
#include "core/funcs_notification.pwn"
#include "core/funcs/dialogs.pwn"
#include "core/funcs/dialogs_selection.pwn"
#include "core/funcs/menus.pwn"
#include "core/funcs/dynamic_dgui.pwn"
#include "core/db_funcs_u.inc"
#include "core/db_funcs_uextra.inc"
#include "core/funcs/first_callbacks.inc"
#include "core/funcs/textdraw.pwn"
#include "core/dataload.inc"
#include "core/callbacks.pwn"
#include "core/funcs/callbacks_areas.pwn"
#include "core/funcs/function_db.pwn"
#include "core/funcs/areas.pwn"
#include "core/funcs/maths.pwn"
#include "core/funcs/timers.pwn"
#include "core/funcs/faction.pwn"
#include "core/funcs/player.pwn"
#include "core/funcs/actor.pwn"
#include "core/funcs/anticheat.pwn"
#include "core/funcs/register_log.pwn"

#include "core/funcs/inventory.pwn"
#include "core/funcs/items.pwn"
#include "core/funcs/items_define.pwn"
#include "core/funcs/utils_shop.pwn"

// Interior
#include "core/funcs/interior/house.pwn"
#include "core/funcs/interior/material.pwn"
#include "core/funcs/interior/furn_define.pwn"
#include "core/funcs/interior/furniture.pwn"

#include "core/funcs/interior/object.pwn"
//
#include "core/funcs/sv_events.pwn"

#include "core/funcs/vehicles.inc"
#include "core/funcs/checkpoint.pwn"

#include "core/funcs/char_needs.inc"
#include "core/funcs/char_interactions.pwn"

#include "core/other_funcs.inc"
#include "core/simple_funcs.inc"
#include "core/funcs/job_funcs.pwn"
#include "core/funcs_jobs.inc"
#include "core/funcs/callback_jobs.pwn"
#include "core/jobThief.inc"
#include "core/check_functions.inc"
#include "core/cmd.pwn"

AntiDeAMX()
{
	new a[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};
	#pragma unused a
}

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}


main()
{
	print(" ");
	print("-----------------------------------");
	print(" Gamemode LAC Cargado Correctamente ");
	print("-----------------------------------");
	print(" ");
	WasteDeAMXersTime();
	return 1;
}

// Parts enum

PreloadAnimLib(playerid, const animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);
}

/*---------------------------------- End Vars ----------------------------------------*/

/*new MySQL:conexion;*/
public OnGameModeInit()
{	
	//mysql_log(ALL);

	MysqlConnect();

	pp_use_funcidx(true);

	new szCmd[64];
	format(szCmd, sizeof(szCmd), "hostname %s", dini_Get("confsv.ini", "Hostname"));
	SendRconCommand(szCmd);
	SendRconCommand("mapname LS /SF / LV");
	SetGameModeText(dini_Get("confsv.ini", "Gametext"));
	SendRconCommand("weburl http://citylife-rp.com/foro/");
	SendRconCommand("language Espa�ol - Spanish");
	SendRconCommand("loadfs ls_elevator");
	SendRconCommand("loadfs ls_beachside");
	SendRconCommand("loadfs Mapeos");
	SendRconCommand("loadfs FuncSc");
	SendRconCommand("unbanip *.*.*.*");
	ShowNameTags(1);
	DisableInteriorEnterExits();
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	SetNameTagDrawDistance(40.0);
    AllowInteriorWeapons(1);
    SetWeather(14);
	//UsePlayerPedAnims();
	
	WasteDeAMXersTime();
 	AntiDeAMX();

 	LoadServerFunctionFirst();

 	ActorBank[0] = CreateActor(17, 1271.2968,-1658.2446,13.5477, 302.4401);
 	ApplyActorAnimation(ActorBank[0], "ped", "SEAT_down", 4.000000, 0, 0, 0, 1, 0);
 	ActorJobs[2] = CreateActor(30, 2526.8936,-1472.7380,23.9640,359.9570); //Actor Armero

    SetTimer("ServerClock", 1000*60, true);
	SetTimer("CargarFunciones", 1000, false);
	SetTimer("UpdateFuelVehicle",500,true);
	SetTimer("Anticheat", 250, true);
	SetTimer("EMSUpdate", 2000, true);
	SetTimer("severTimers", 1000, true);
	SetTimer("severTimers2", 1000, true);
	SetTimer("severTimerFive", 5000, true);
	SetTimer("CheckTimerTenSeconds", 10000, true);

	SetTimer("TimerFiveMinutes", 1000*60*5, true);

	AreaAeropuertos[1] = CreateDynamicRectangle(2088.0000,-2387.0000, 1826.0000,-2223.0000);
	AreaAeropuertos[2] = CreateDynamicRectangle(2088.0000,-2387.0000, 1410.0000,-2647.0000);
	AreaAeropuertos[0] = CreateDynamicPolygon(zones_points_0);
	AreaAeropuertos[3] = CreateDynamicPolygon(zones_points_1);
	AreaAeropuertos[4] = CreateDynamicPolygon(zones_points_2);
	AreaCabinas[0] = CreateDynamicRectangle(423.8692-0.4,79.8429+0.4, 430.2896+0.4,70.5434-0.4);
	AreaCabinas[1] = CreateDynamicRectangle(431.4214,79.9130+0.4, 438.3152+0.4,70.4908-0.4);
	AreaCabinas[2] = CreateDynamicRectangle(438.7861,52.7870, 431.1711,63.2180);
	AreaCabinas[3] = CreateDynamicRectangle(430.5381+0.4,53.3267-0.4, 423.8695-0.4,62.6917+0.4);

	LoadServerFunctionsInitial();

	LoadGlobalServerItemsWorld();

	/*AddPlayerClass(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);*/

	CN = TextDrawCreate(297.000000, -23.000000, "    ");
	TextDrawAlignment(CN, 2);
	TextDrawBackgroundColor(CN, 255);
	TextDrawFont(CN, 1);
	TextDrawLetterSize(CN, 1.049998, 2.0);
	TextDrawColor(CN, -1);
	TextDrawSetOutline(CN, 0);
	TextDrawSetProportional(CN, 1);
	TextDrawSetShadow(CN, 1);
	TextDrawUseBox(CN, 1);
	TextDrawBoxColor(CN, 129);
	TextDrawTextSize(CN, 50.000000, -728.000000);
	TextDrawSetSelectable(CN, 0);

	/*CN2 = TextDrawCreate(346.000000, 401.000000, "    ");
	TextDrawAlignment(CN2, 2);
	TextDrawBackgroundColor(CN2, 255);
	TextDrawFont(CN2, 1);
	TextDrawLetterSize(CN2, 0.300000, 2.300000);
	TextDrawColor(CN2, -1);
	TextDrawSetOutline(CN2, 0);
	TextDrawSetProportional(CN2, 1);
	TextDrawSetShadow(CN2, 1);
	TextDrawUseBox(CN2, 1);
	TextDrawBoxColor(CN2, 126);
	TextDrawTextSize(CN2, 10.000000, -729.000000);
	TextDrawSetSelectable(CN2, 0);*/

	LoginMenu[0] = TextDrawCreate(84.0+(370.0), 418.0, "CityLife");
	TextDrawBackgroundColor(LoginMenu[0], -1);
	TextDrawFont(LoginMenu[0], 3);
	TextDrawLetterSize(LoginMenu[0], 0.58, 2.28);
	TextDrawColor(LoginMenu[0], 8257535);
	TextDrawSetOutline(LoginMenu[0], 1);
	TextDrawSetShadow(LoginMenu[0], 0);
	TextDrawSetProportional(LoginMenu[0], 1);
	TextDrawSetSelectable(LoginMenu[0], 0);

	LoginMenu[1] = TextDrawCreate(170.0+(370.0), 418.0, "Roleplay");
	TextDrawBackgroundColor(LoginMenu[1], 8257535);
	TextDrawFont(LoginMenu[1], 3);
	TextDrawLetterSize(LoginMenu[1], 0.58, 2.28);
	TextDrawColor(LoginMenu[1], 0xFFFFFFFF);
	TextDrawSetOutline(LoginMenu[1], 1);
	TextDrawSetShadow(LoginMenu[1], 0);
	TextDrawSetProportional(LoginMenu[1], 1);
	TextDrawSetSelectable(LoginMenu[1], 0);

	TextInicioVersion = TextDrawCreate(70.0, 10.0, ConvertEncoding("Versiï¿½n actual v"SERVER_VERSION" Beta"/*"v2.67"*/));
	TextDrawBackgroundColor(TextInicioVersion, 255);
	TextDrawFont(TextInicioVersion, 1);
	TextDrawLetterSize(TextInicioVersion, 0.28, 1.20);
	TextDrawColor(TextInicioVersion, -1);
	TextDrawSetOutline(TextInicioVersion, 1);
	TextDrawSetProportional(TextInicioVersion, 1);
	TextDrawSetSelectable(TextInicioVersion, 0);

	TextInicioWeb = TextDrawCreate(610.0, 10.0, "Web: www.citylife-rp.com");
	TextDrawBackgroundColor(TextInicioWeb, -1);
	TextDrawFont(TextInicioWeb, 1);
	TextDrawLetterSize(TextInicioWeb, 0.28, 1.12);
	TextDrawColor(TextInicioWeb, 8257535);
	TextDrawSetOutline(TextInicioWeb, 1);
	TextDrawSetProportional(TextInicioWeb, 1);
	TextDrawAlignment(TextInicioWeb, 3);

	TextdrawServerDisc = TextDrawCreate(280.0, 10.0, "Discord: discord.gg/k4HSVMD");
	TextDrawBackgroundColor(TextdrawServerDisc, 255);
	TextDrawFont(TextdrawServerDisc, 1);
	TextDrawLetterSize(TextdrawServerDisc, 0.28, 1.20);
	TextDrawColor(TextdrawServerDisc, -1);
	TextDrawSetOutline(TextdrawServerDisc, 1);
	TextDrawSetProportional(TextdrawServerDisc, 1);

//TextDraw GameMode
	/*MapaGPS = TextDrawCreate(509.000000, 12.000000, "__");
	TextDrawAlignment(MapaGPS, 2);
	TextDrawBackgroundColor(MapaGPS, 255);
	TextDrawFont(MapaGPS, 1);
	TextDrawLetterSize(MapaGPS,	0.509998, 32.200000);
	TextDrawColor(MapaGPS, -1);
	TextDrawSetOutline(MapaGPS, 0);
	TextDrawSetProportional(MapaGPS, 1);
	TextDrawSetShadow(MapaGPS, 1);
	TextDrawUseBox(MapaGPS, 1);
	TextDrawBoxColor(MapaGPS, 976894719);
	TextDrawTextSize(MapaGPS, 49.000000, 253.000000);
	TextDrawSetSelectable(MapaGPS, 0);*/

	MapaGPS4 = TextDrawCreate(526.000000, 13.000000, "Para cerrarlo usa ~g~/ocultar mapa");
	TextDrawBackgroundColor(MapaGPS4, 255);
	TextDrawFont(MapaGPS4, 1);
	TextDrawLetterSize(MapaGPS4, 0.200000, 0.799999);
	TextDrawColor(MapaGPS4, 0xFFFFFFFF);
	TextDrawSetOutline(MapaGPS4, 0);
	TextDrawSetProportional(MapaGPS4, 1);
	TextDrawSetShadow(MapaGPS4, 1);
	TextDrawSetSelectable(MapaGPS4, 0);

	MapaGPS5 = TextDrawCreate(386.000000, 11.000000, "GPS");
	TextDrawBackgroundColor(MapaGPS5, 255);
	TextDrawFont(MapaGPS5, 1);
	TextDrawLetterSize(MapaGPS5, 0.500000, 1.400000);
	TextDrawColor(MapaGPS5, -1);
	TextDrawSetOutline(MapaGPS5, 0);
	TextDrawSetProportional(MapaGPS5, 1);
	TextDrawSetShadow(MapaGPS5, 1);
	TextDrawSetSelectable(MapaGPS5, 0);

	//Fin TextDraw

	//prendas = LoadModelSelectionMenu("prendas.txt");
	//tuningsale = LoadModelSelectionMenu("tuningsale.txt");

	/*LoadObjectsPosList("objectspos/skins/gorras.txt");*/

 	//CreateDynamicMapIcon(1185.0560,-1323.9019,13.5730, 22, 0, 0, 0, -1, 500.0); // Hospital
	//CreateDynamicMapIcon(1547.4792,-1675.3093,13.5541, 30, 0, 0, 0, -1, 500.0); // SAPD
	//CreateDynamicMapIcon(2229.5786,-1721.5316,13.5638, 54, 0, 0, 0, -1, 500.0); // GYM
	//CreateDynamicMapIcon(2244.4,-1664.9,15.4,45, 0, 0, 0, -1, 500.0); //Binco Grove :3
	//CreateDynamicMapIcon(-154.9691,-1611.6494,4.7973, 60, 0, 0, 0, -1, 400.0); //MapIcon Trabajo Piloto
	//CreateDynamicMapIcon(1560.4813,-2167.7349,13.5587, 61, 0, 0, 0, -1, 500.0); //MapIcon Trabajo Mecï¿½nico
	//CreateDynamicMapIcon(2526.8142,-1472.0265,23.9631, 60, 0, 0, 0, -1, 300.0); //MapIcon Job Armero
	//CreateDynamicMapIcon(-555.4631,-197.5723,78.4063, 60, 0, 0, 0, -1, 300.0); //MapIcon Job Grï¿½
	ServerLoadLabels();
	ServerLoadPickups();
    CabinasTextLabels[1] = CreateDynamic3DTextLabel("{FFFFFF}Cabina disponible {CDCDCD}(#1)", -1, 426.3874,69.9747,1020.3960+1.7, 6);
	CabinasTextLabels[2] = CreateDynamic3DTextLabel("{FFFFFF}Cabina disponible {CDCDCD}(#2)", -1, 435.7229,70.1634,1020.3960+1.7, 6);
	CabinasTextLabels[3] = CreateDynamic3DTextLabel("{FFFFFF}Cabina disponible {CDCDCD}(#3)", -1, 435.6993,63.1072,1020.3960+1.7, 6);
	CabinasTextLabels[4] = CreateDynamic3DTextLabel("{FFFFFF}Cabina disponible {CDCDCD}(#4)", -1, 426.3738,63.2898,1020.3960+1.7, 6);

	//LabelsText Paradas Ls,Sf,Lv
	Create3DTextLabel("{5EB5FF}Parada 1:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -12.6314,-1537.3475,2.7861, 10, 0, 0); //Parada 1 Sf
	Create3DTextLabel("{5EB5FF}Parada 2:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -328.6381,-847.6752,47.2260, 10, 0, 0); //Parada 2 Sf
	Create3DTextLabel("{5EB5FF}Parada 3:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -1749.9272,-601.6943,16.5735, 10, 0, 0); //Parada 3 Sf
	Create3DTextLabel("{5EB5FF}Parada 4:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -1555.7808,-1592.8215,38.0859, 20, 0, 0); //Parada 4 Sf
	Create3DTextLabel("{5EB5FF}Parada 5:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -988.0367,-1930.5004,80.2874, 20, 0, 0); //Parada 5 Sf
	Create3DTextLabel("{5EB5FF}Parada 6:\n{FFB464}Descripcion: Empresa de Transportes\nBuses San Fierro\n{FFFFFF}Costo al Subirse: {76FF86}100$", 0x008080FF, -875.2134,-2569.0369,90.7450, 20, 0, 0); //Parada 6 Sf
	//Mapeo Peaje Las Venturas
	peajelvcerrado2 = CreateDynamicObject(968, 1715.8568, 443.0451, 30.7205, 0.00000, -15.00000, 161.00000);
	peajelvabierto1 = CreateDynamicObject(968, 1720.1266, 454.9482, 30.5805, 0.00000, -91.00000, 161.00000);
	peajelvabierto3 = CreateDynamicObject(968, 1708.9697, 455.1684, 30.8225, 0.00000, 16.00000, 160.00000);
	peajelvcerrado4 = CreateDynamicObject(968, 1704.9807, 443.1882, 30.8225, 0.00000, 90.00000, 161.00000);
	return 1;
}

public OnGameModeExit()
{
	SendRconCommand("unloadfs ls_elevator");
	SendRconCommand("unloadfs ls_beachside");
	SendRconCommand("unloadfs Mapeos");
	SendRconCommand("unloadfs FuncSc");

	mysql_close(conexion);
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	Player.Temp[playerid][@StateGameo] = STATE_GAME_CONNECTED;

	resetPlayerVariablesConnect(playerid);

	SetPlayerTeam(playerid, 0);
	
	InterpolateCameraPos(playerid, 1791.130737, -1570.935546, 209.488677, 1791.130737, -1570.935546, 209.488677, 0, CAMERA_CUT);
 	InterpolateCameraLookAt(playerid, 1787.104736, -1567.996215, 209.098770, 1787.104736, -1567.996215, 209.098770, 0, CAMERA_CUT);

	//SetTimerEx("OnPlayerConnect_Extra", 400, false, "i", playerid);
 	//EnablePlayerCameraTarget(playerid, 1);

//	SiendoCurado[playerid] = false;
	rBit1_Set(SiendoCurado, playerid, false);
	GetPlayerName(playerid, PlayerInfoTemp[playerid][pt_Name], 24);
	GetPlayerIp(playerid, PlayerInfoTemp[playerid][pt_IP], 18);
	//CreatePlayerNoticesTextdraw(playerid);
	CreatePlayerGeneralTextdraw(playerid);
	LimpiarChat(playerid, 25, 1);
	ColorJugadorDefault(playerid);
	TogglePlayerControllable(playerid, true);

	//SetKeySyncBlocked(playerid, true);
	CreateTextdrawPlayer(playerid);

	//new PlayerText:desbug =CreatePlayerTextDraw(playerid, 0.0,0.0, "_");
	//PlayerTextDrawFont(playerid, desbug, 0);
	//PlayerTextDrawShow(playerid, desbug);
	TextDrawShowForPlayer(playerid, textdraw_desbug);

	//CreateTextdrawInventory(playerid);

	TextDrawShowForPlayer(playerid, CN);
	//TextDrawShowForPlayer(playerid, CN2);
	TextDrawShowForPlayer(playerid, LoginMenu[0]);
	TextDrawShowForPlayer(playerid, LoginMenu[1]);
	TextDrawShowForPlayer(playerid, TextInicioWeb);
	TextDrawShowForPlayer(playerid, TextInicioVersion);
	TextDrawShowForPlayer(playerid, TextdrawServerDisc);

	//Velocidad[playerid] = CreatePlayerProgressBar(playerid, 533.00, 356.00, 49.50, 6.19, 680972543, 300.0); CreatePlayerProgressBar(playerid, 533.00, 359.00, 95.50, 5.19, 9174984, 300.0);
	//Gasolina[playerid] = CreatePlayerProgressBar(playerid, 533.00, 390.00, 51.50, 6.19, -3079937, 100.0); CreatePlayerProgressBar(playerid, 533.00, 393.00, 95.50, 5.19, 0xFEC90EC8, 100.0);

	ProgressCargando[playerid] = CreatePlayerProgressBar(playerid, 255.0, 414.0, 150.0, 6.49998, 0x47D745FF, 100.0, 1);
	ProgressDescargando[playerid] = CreatePlayerProgressBar(playerid, 280.00, 399.00, 81.50, 5.50, 14879743, 100.0, 1);
	ProgressGeneral[playerid] = CreatePlayerProgressBar(playerid, 277.00, 427.00, 100.50, 3.20, 13766399, 100.0, 1);

	SetPlayerProgressBarMaxValue(playerid, ProgressCargando[playerid], 10.0);
	SetPlayerProgressBarMaxValue(playerid, ProgressDescargando[playerid], 10.0);

	if(!IsPlayerNPC(playerid))
	{
		new pName[24];GetPlayerName(playerid, pName, 24);
		new plname[MAX_PLAYER_NAME];
		GetPlayerName(playerid, plname, sizeof(plname));
		new sendername[MAX_PLAYER_NAME];
		if(!checkNameValid(plname))
		{
			if(strcmp(pName, "Blaster", false) != 0 && strcmp(pName, "Rocket", false) != 0 && strcmp(pName, "UnBit", false) != 0 && strcmp(pName, "Jack", false) != 0)
			{
			new string[256];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string,sizeof(string), "_________________________________________________________________________");
			SendClientMessage(playerid,-1,string);
			format(string,sizeof(string), "Importante para jugar en el servidor");
			SendClientMessage(playerid,-1,string);
			format(string,sizeof(string), "{5EB5FF}Inmigraciï¿½n:{FFFFFF} Tu nombre es invalido, el formato valido para el nombre es ({5EB5FF}Nombre_Apellido{FFFFFF}).");
			SendClientMessage(playerid,-1,string);
			format(string,sizeof(string), "Luego podrï¿½s jugar en el servidor.");
			SendClientMessage(playerid,-1,string);
			format(string,sizeof(string), "_________________________________________________________________________");
			SendClientMessage(playerid,-1,string);
			KickEx(playerid, 500);
			return 1;
			}
		}
	}

	new DB_Query[550];
	format(DB_Query, sizeof DB_Query, "SELECT NOW() AS `NOW`, `lac_banned`.*, `lac_bad_history`.* FROM `lac_banned`, `lac_bad_history` WHERE (`lac_banned`.`IP` = '%q') AND `lac_bad_history`.`id` = `lac_banned`.`id_history`;", PlayerInfoTemp[playerid][pt_IP]);
	mysql_tquery(conexion, DB_Query, "PlayerBannedCheck", "ii", playerid, 0);
	//new Query[128];
	//format(Query, sizeof(Query), "SELECT * FROM `lac_users` WHERE `name` = '%s'", PlayerInfoTemp[playerid][pt_Name], PlayerInfo[playerid][pPassword]);
    //mysql_tquery(conexion, Query, "CargarDatos", "ii", playerid, 1);


//	new query[128];
//	format(query, sizeof(query), "SELECT * FROM lac_users WHERE Nombre = '%s'", GetPlayerNameEx(playerid));
//	mysql_tquery(conexion, query, "VerificarCuenta", "i", playerid);
	
//	SetPlayerCameraPos(playerid, 1791.130737, -1570.935546, 209.488677);
 //	SetPlayerCameraLookAt(playerid, 1787.104736, -1567.996215, 209.098770);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	if(PlayerInfoTemp[playerid][pt_IsLoggedIn] == true) return SpawnPlayer(playerid);
    return 0;
}

public OnPlayerRequestClass(playerid,classid)
{
	//TogglePlayerSpectating(playerid, true);
	//InterpolateCameraPos(playerid, 1791.130737, -1570.935546, 209.488677, 1791.130737, -1570.935546, 209.488677, 4000);
 	//InterpolateCameraLookAt(playerid, 1787.104736, -1567.996215, 209.098770, 1787.104736, -1567.996215, 209.098770, 4000);
	
	if(IsPlayerLogged(playerid))
		SpawnPlayer(playerid);
	return 0;
}

/*public OnIncomingConnection(playerid, ip_address[], port)
{
	printf("Incoming connection for player ID %i [IP/port: %s:%i]", playerid, ip_address, port);
    return 1;
}*/

public OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfoTemp[playerid][pt_IsLoggedIn] == true){
		PlayerInfoTemp[playerid][pt_IsLoggedIn] = false;

		if(Player.Faction[playerid][@Valid]) FactionCrew.Info[ Player.Faction[playerid][@Index] ][@OnlineMemb] --;

		FinishPlayerJob(playerid);

		GuardarCuenta(playerid);
		SavePlayerVehicles(playerid, 1);
		SavePlayerInventoryItems(playerid);
		SavePlayerWorkSkills(playerid);
		SavePlayerFactionFuncs(playerid);
		
		if(CombatMode[playerid] == 1)
		{
			if(reason == 1)
			{
				
			}
		}
		if(ListeningR[playerid] != 0)
		{
			StopAudioStreamForPlayer(playerid);
			ListeningR[playerid] = 0;
		}
		if(DumpCompa[playerid] != INVALID_PLAYER_ID)
		{
			ShowPlayerInfoTextdraw(DumpCompa[playerid], "~r~Tu compaï¿½ero se ha marchado.", 2000);
			resetVehicleVariables(DumpCompa[playerid]);
		}
		if(PlayerInfo[playerid][pCranePermitID] != INVALID_PLAYER_ID)
		{
			PlayerInfo[PlayerInfo[playerid][pCranePermitID]][pCranePermit] = INVALID_VEHICLE_ID;
			PlayerInfo[PlayerInfo[playerid][pCranePermitID]][pCranePermitID] = INVALID_PLAYER_ID;
		}
		if(Player.Temp[playerid][@CriminalActType] == CRIMINAL_ACTIVITY_TYPE_ROBACTOR)
		{
			ResetDoorRobberyVariables(playerid, Player.Temp[playerid][@CriminalActID]);
		}
	}
	for(new i = 0; i != MAX_PER_PLAYER_TIMERS_E; i++) KillTimer(PlayerInfoTemp[playerid][pt_TimersE][i]);
	for(new i = 0; i != MAX_PER_PLAYER_TIMERS; i++) KillTimer(PlayerInfoTemp[playerid][pt_Timers][i]);
	ResetPlayerCheckpoints(playerid);
	resetPlayerVariables(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{ 
/*	if(GetPlayerDialogAC(playerid) != dialogid) { Kick(playerid); return 1; } else { DeletePVar(playerid, "DialogSegureAC"); }*/
	new string[256];
	switch(dialogid)
	{
		case LOGIN:
		{
			if(response)
			{
				bcrypt_verify(playerid, "OnPlayerPasswordChecked", inputtext, PlayerInfo[playerid][pPassword]);
			}
			else
			{
				Kick(playerid);
			}
		}
		case REGISTRO:
		{
			if(!response)
			{
				Kick(playerid);
			}
			if(response)
			{
				/*if(!strlen(inputtext))
				{
					Kick(playerid);
				}*/
				if(strlen(inputtext) >= 5)
    			{
    				bcrypt_hash(playerid, "OnPlayerPasswordHashed", inputtext, BCRYPT_COST);
   				}
    			else
    			{
    				format(string, sizeof(string), "{5EB5FF}%s {FFFFFF}ingresa una contraseï¿½a con un mï¿½nimo de 5 caracteres.", PlayerInfoTemp[playerid][pt_Name]);
    				ShowPlayerDialog(playerid, REGISTRO, DIALOG_STYLE_PASSWORD, "{5EB5FF}Registra una cuenta nueva", string, "Siguiente", "Salir"); 
    			}
			}
		}
		case SEXO:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						PlayerInfo[playerid][p_Gender] = 0;
						PlayerInfo[playerid][pRopa] = 46;
						Dialog_Show(playerid, DialogSelectAge, DIALOG_STYLE_INPUT, "{5EB5FF}Ingresa tu edad de tu personaje", "{FFFFFF}Ingresa tu edad de 18-90 aï¿½os.", "Siguiente", "Cancelar");
					}
					case 1:
					{
						PlayerInfo[playerid][p_Gender] = 1;
						PlayerInfo[playerid][pRopa] = 12;
						Dialog_Show(playerid, DialogSelectAge, DIALOG_STYLE_INPUT, "{5EB5FF}Ingresa tu edad de tu personaje", "{FFFFFF}Ingresa tu edad de 18-90 aï¿½os.", "Siguiente", "Cancelar");
					}
				}
			} else { Kick(playerid); }
		}
		case Email:
		{
			if(response)
			{
				if(strlen(inputtext) < 50)
				{
					new Query[128];
					format(Query, sizeof(Query), "SELECT * FROM `lac_users` WHERE `email`='%s';", inputtext);
					mysql_query(conexion, Query);
					new search_f = strfind(inputtext, "@", true);
					new search_pos = strfind(inputtext, ".", true, (search_f + 1));
					if(search_pos < (search_f + 1))
					{
						format(string,sizeof(string),"Ingresa un correo electrï¿½nico valido:");
						ShowPlayerDialog(playerid, Email,DIALOG_STYLE_INPUT,"Email",string,"Registrar","Cancelar");
					}
					else if(cache_num_rows() != 0)
					{
						format(string,sizeof(string),"{F73C3C}El correo electrï¿½nico ingresado\n{F73C3C}ya se encuentra en uso");
						ShowPlayerDialog(playerid, Email,DIALOG_STYLE_INPUT,"Email",string,"Registrar","Cancelar");
					}
					else
					{

						format(PlayerInfo[playerid][pEmail], 128, "%s", inputtext);
						KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
						PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("RegistrarCuenta", 100, false, "id", playerid, 0);
					}
				}
			}
			else
			{
				Kick(playerid);
			}
		}
		case Reglas1:{
			if(response)
			{
				ShowPlayerDialog(playerid, Reglas2, DIALOG_STYLE_MSGBOX, "Reglas", "{5EB5FF}Canal DP:{FFFFFF} En Este Canal solo Podras hablar cosas Dentro del Personaje Ejemplo: ï¿½Hola como te Llamas?\n{5EB5FF}Canal FP:{FFFFFF} En este Canal puedes hablar de todo lo que no este relacionado con el Juego Ejemplo: ï¿½Hablemos por FaceBook?\n{5EB5FF}Canales @ y @@:{FFFFFF} Estos 2 Canales con para Hablar por Radio de Banda, @DP @@FP.", "Siguiente", "");
			}
		}
		case Reglas2:{
			if(response)
			{
				ShowPlayerDialog(playerid, Reglas3, DIALOG_STYLE_MSGBOX, "Reglas", "{5EB5FF}CC:{FFFFFF} Es cuando Confundes los Canales Dp y Fp.\n{5EB5FF}Canal Dudas:{FFFFFF} Canal dudas[/duda] Recuerda que este es un Canal Fp, sirve para preguntar dudas del GM, Ejemplo: /duda [ï¿½Como veo las Reglas?].\n{5EB5FF}GM:{FFFFFF} GameMode en Espaï¿½ol Modo Juego.", "Siguiente", "");
			}
		}
		case Reglas3:{
			if(response)
			{
				ShowPlayerDialog(playerid, Reglas4, DIALOG_STYLE_MSGBOX, "Fin de las Reglas", "{5EB5FF}Recuerda:{FFFFFF} Si no cumples estas Reglas Podrias Terminar Sancionado o asta Baneado.\n{5EB5FF}Estas no son todas las Reglas del Servidor para Ver las Demas Ingresa a: http:www.losangelescalifornia.com", "Listo", "");
			}
		}
		case AyudaJobs:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: //case 1
					{
						ShowPlayerDialog(playerid, InfoGeneral, DIALOG_STYLE_MSGBOX, "Informacion General", "Para poder ganarte la vida necesitas obtener un trabajo, los trabajos se encuentran repartidos por todo San Andreas.", "Aceptar", "");
					}
					case 2: // Camionero
					{
						format(string,sizeof(string), "{FFFFFF}El trabajo de camionero se encuentra en la fabrica de Fallen Tree.\n");
						format(string, sizeof(string), "%sLa paga inicial es de {00E500}$600{FFFFFF} e ira incrementando conforme subas de nivel.\nEste trabajo tambiï¿½n cuenta con ganancias extras.",string);
						ShowPlayerDialog(playerid, DIALOG_ID_NULL_ALL,DIALOG_STYLE_MSGBOX,"Ayuda trabajos - Camionero", string, "Aceptar", "");
					}
					case 4: //case 2
					{
						ShowPlayerDialog(playerid, DIALOG_ID_NULL_ALL, DIALOG_STYLE_MSGBOX, "Ayuda Trabajo Lechero", "{FFFFFF}Para conseguir el trabajo del lechero debes ir a la granja de Whetstone.\n\nRequisitos:\nComo mï¿½nimo 1 punto de reputaciï¿½n.", "Aceptar", "");
					}
					case 5: //case 3
					{	
						format(string, sizeof(string), "{FFFFFF}Busca el trabajo de chalequero en los callejones de commerce.\n\n");
						format(string, sizeof(string), "%sUsa {5EB5FF}/vender protecciï¿½n [Nombre o ID] [Precio] {FFFFFF}para vender un chaleco.\n",string);
						format(string, sizeof(string), "%sEl precio mï¿½nimo es de {00E500}$200 {FFFFFF} y el mï¿½ximo de {00E500}$400",string);
						ShowPlayerDialog(playerid, DIALOG_ID_NULL_ALL, DIALOG_STYLE_MSGBOX, "Ayuda trabajos - Chalequero", string, "Aceptar", "");
					}
					case 3:
					{

					}
					case 6:
					{
						new string2[238];
						format(string2, sizeof(string2), "{FFFFFF}El trabajo de leï¿½ador se consigue en el aserradero de The Panopticon.\n");
						format(string2, sizeof(string2), "%sEn este trabajo deberï¿½s cortar la madera, que este cerca del aserradero.\n", string2);
						format(string2, sizeof(string2), "%sA medida que subas de nivel, podrï¿½s cortar madera mas cercara al punto de entrega.", string2);
						ShowPlayerDialog(playerid, DIALOG_HELPJOBS2, DIALOG_STYLE_MSGBOX, "Ayuda trabajos - Leï¿½ador", string2, "Aceptar", "");

					}
					case 7: // 6 - Transportista
					{
						new string2[400];
						format(string2, sizeof(string2), "{FFFFFF}El trabajo de transportista se trata de recoger y entregar\n");
						format(string2, sizeof(string2), "%suna carga de un lugar a otro, este trabajo se obtiene en los muelles de San Fierro.\n\n", string2);
						format(string2, sizeof(string2), "%sRequisitos:\nNivel 2 de camionero.\nCamiï¿½n DFT-30.\nNivel 5 de personaje.\n\n", string2);
						format(string2, sizeof(string2), "%sCon cada nuevo nivel se aumenta la paga $100 y tambiï¿½n se obtiene un\n", string2);
						format(string2, sizeof(string2), "%spago extra si se cuenta con membresï¿½a {00E500}Premium Silver {FFFFFF}o {00E500}Premium Gold{FFFFFF}.", string2);
						ShowPlayerDialog(playerid, DIALOG_ID_NULL_ALL, DIALOG_STYLE_MSGBOX, "Transportista", string2, "Aceptar","");
					}
					case 8:
					{
						new string2[500];
						format(string2, sizeof(string2), "{FFFFFF}Para obtener el trabajo de mecï¿½nico debes ir al taller Verdant Bluffs.\n\n");
						format(string2, sizeof(string2), "%sRequisitos:\n2 puntos de reputaciï¿½n.\nTener vehï¿½culo propio(Opcional).\n\n", string2);
						format(string2, sizeof(string2), "%sPara reparar un vehï¿½culo tienes que estar frente a el y usar {5EB5FF}/reparar [PRECIO]{FFFFFF}.\n",string2);
						format(string2, sizeof(string2), "%sPara ver cuantos repuestos necesita el vehï¿½culo usa {5EB5FF}/revisar vehiculo{FFFFFF}.", string2);
						ShowPlayerDialog(playerid, DIALOG_HELPJOBS2, DIALOG_STYLE_MSGBOX, "Ayuda trabajos - Mecï¿½nico", string2, "Aceptar", "");
					}
					case 9:
					{
						new string2[428];
						format(string2, sizeof(string2), "{FFFFFF}Para obtener el trabajo de basurero tienes que ir al basurero ubicado en Flint County.\n");
						format(string2, sizeof(string2), "%sPara trabajar de basurero requieres mï¿½nimo 1 punto de experiencia(se consiguen cada 1 hora).\n", string2);
						format(string2, sizeof(string2), "%sEste es un trabajo para 2 personas(conductor y recolector), por lo que necesitaras 1 compaï¿½ero para trabajar.\n\n", string2);
						format(string2, sizeof(string2), "%sLa paga depende del recorrido y nivel de basurero, cada nivel de basurero aumenta la velocidad de recolecciï¿½n.\n", string2);
						ShowPlayerDialog(playerid, DIALOG_HELPJOBS2, DIALOG_STYLE_MSGBOX, "Ayuda trabajos - Basurero", string2, "Aceptar", "");
					}
				}
			}
		}
		case Teleport2:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					SetPlayerPosEx(playerid, 2205.7927,-2246.5378,13.5469, 0.0, 0, 0);
					case 1:
					SetPlayerPosEx(playerid, -134.8307,-1572.5967,8.0454, 0.0, 0, 0);
					case 2:
					SetPlayerPosEx(playerid, -1746.9478,-117.4675,3.5547, 0.0, 0, 0);
					case 3:
					SetPlayerPosEx(playerid, 1713.5614,-1864.8674,13.5669, 0.0, 0, 0);
					case 4:
					SetPlayerPosEx(playerid, -1439.6177,-1536.5747,101.7578, 0.0, 0, 0);
				}
			}
		}
		case Teleport3:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					SetPlayerPosEx(playerid, 1566.0696,1326.5245,10.8652, 0.0, 0, 0);
				}
			}
		}
		case Teleport1:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					SetPlayerPosEx(playerid, 1178.7699,-1325.6493,14.1365, 0.0, 0, 0);
				}
			}
		}
		case DIALOG_BUYDRINK:
		{
			if(!response) return 1;
			new i = PlayerObjects[playerid][listitem];
			switch(i)
			{
				case 1:{
					BuyPlayerStoreItems(playerid, 36, 4, 60);
				}
				case 2:{
					BuyPlayerStoreItems(playerid, 37, 4, 70);
				}
				case 3:{
					BuyPlayerStoreItems(playerid, 38, 4, 80);
				}
				case 4:{
					//SetPlayerAttachedObject(playerid,9,19570,6,0.082999,0.065999,-0.133999,0.000000,0.000000,0.000000,0.550999,0.601999,0.807000);
					BuyPlayerStoreItems(playerid, 39, 4, 100);
				}
			}
		}
		case DIALOG_BANCO1:
		{
			if(response)
			{

				if(sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, -1, "Ingresa un numero valido.");
					ShowDialogPlayerEx(playerid, dialogid);
					return 1;
				}
				if(inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, -1, "Introduce un valor valido.");
					ShowDialogPlayerEx(playerid, dialogid);
					return 1;
				}
				if(inputtext[0] > PlayerInfo[playerid][pBanco])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, -1, "No tienes esa cantidad de dinero.");
					ShowDialogPlayerEx(playerid, dialogid);
					return 1;
				}

				GivePlayerMoneyEx(playerid, inputtext[0], true, true);
				PlayerInfo[playerid][pBanco] -= inputtext[0];

				new Query[120];
				mysql_format(conexion, Query, sizeof Query, 
				"UPDATE `lac_users` SET `BankBalance`= BankBalance - %d WHERE `id`=%d;", inputtext[0], PlayerInfo[playerid][pID]);
				mysql_tquery(conexion, Query);

				format(string, sizeof(string), "$%s", FormatNumber(PlayerInfo[playerid][pBanco]));
				PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], string);
				PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1]);

				new message[100];
				format(message, sizeof(message), "Retiraste $%s de tu cuenta.", FormatNumber(inputtext[0]));
				CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_DEPOSITMONEYBANK, message, 10);
				AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, string);

			}
		}
		case DIALOG_BANCO2:
		{
			if(!response) return 1;
			if(sscanf(inputtext, "d", inputtext[0]))
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "Ingresa un numero valido.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}
			if(inputtext[0] <= 0)
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "Introduce un valor valido.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}
			if(inputtext[0] > PlayerInfo[playerid][pDinero])
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "No tienes esa cantidad de dinero.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}

			RemoveMoney(playerid, inputtext[0], true, true);
			PlayerInfo[playerid][pBanco] += inputtext[0];

			mysql_tquery_s(conexion,
				str_format("UPDATE `lac_users` SET `BankBalance`= BankBalance + %d WHERE `id`=%d;", inputtext[0], PlayerInfo[playerid][pID]));

			new message[100];
			format(message, sizeof(message), "Depositaste $%s en tu cuenta.", FormatNumber(inputtext[0]));
			CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_DEPOSITMONEYBANK, message, 10);
			AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, string);

			format(string, sizeof(string), "$%s", FormatNumber(PlayerInfo[playerid][pBanco]));
			PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], string);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1]);
		}
		case DIALOG_TRANSFER_BANK:
		{
			if(response == 1)
			{
				new idplayer;
				if(sscanf(inputtext, "u", idplayer))
				{
					SendClientMessage(playerid, -1, "Ingresa la ID o Nombre del jugador.");
					return 1;
				}
				if(idplayer <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, -1, "Introduce un valor valido.");
					return 1;
				}
				if(IsPlayerConnected(idplayer) && IsPlayerLogged(idplayer))
				{
					TransferBankID[playerid] = idplayer;
					ShowDialogPlayerEx(playerid, DIALOG_TRANSFER_BANK_SEND);
				} else { ShowPlayerInfoTextdraw(playerid, "~r~ID o Nombre del jugador invalido.", 2000); }
			}
		}
		case DIALOG_TRANSFER_BANK_SEND:
		{
			if(!response) return 1;
			if(sscanf(inputtext, "d", inputtext[0]))
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "Introduce un numero valido.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}
			if(inputtext[0] <= 0)
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "Introduce un valor valido.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}
			if(inputtext[0] > PlayerInfo[playerid][pBanco])
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, -1, "No tienes esa cantidad de dinero en el banco.");
				ShowDialogPlayerEx(playerid, dialogid);
				return 1;
			}
			new old = PlayerInfo[playerid][pBanco];
			
			new transfer_player = TransferBankID[playerid];
			if(!IsPlayerLogged(transfer_player)) return 1;

			PlayerInfo[playerid][pBanco] -= inputtext[0];
			PlayerInfo[transfer_player][pBanco] += inputtext[0];

			mysql_tquery_s(conexion, str_format(
				
				"\
				UPDATE `lac_users` SET `BankBalance`= BankBalance + %d WHERE `id`=%d; \
				UPDATE `lac_users` SET `BankBalance`=%d WHERE `id`=%d;",
				
				strval(inputtext), transfer_player,
				PlayerInfo[playerid][pBanco], PlayerInfo[playerid][pID] 
				));

			RegisterBankPlayerTransaction(PlayerInfo[playerid][pID], PlayerInfo[transfer_player][pID], strval(inputtext), 0);

			TransferBankID[playerid] = 0;

			SendClientMessage(playerid, -1, "_______________Actualizaciï¿½n de cuenta bancaria_______________");
			format(string, sizeof(string), "Acabas de transferir {00E500}%d$ {FFFFFF}a la cuenta bancaria de {FABF00}%s{FFFFFF}.", inputtext[0], PlayerInfoTemp[transfer_player][pt_Name]);
			SendClientMessage(playerid, -1, string);
			format(string, sizeof(string), "Antiguo saldo: {00E500}%d${FFFFFF}.", old);
			SendClientMessage(playerid, -1, string);
			format(string, sizeof(string), "Nuevo saldo: {00E500}%d${FFFFFF}.", PlayerInfo[playerid][pBanco]);
			SendClientMessage(playerid, -1, string);
			SendClientMessage(playerid, -1, "____________________________________________________________");
			
			format(string, sizeof(string), "$%s", FormatNumber(PlayerInfo[playerid][pBanco]));
			PlayerTextDrawSetString(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], string);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1]);
		}
		case DIALOG_TRABAJOMEDICO:
		{
			if(response)
			{
				if(PlayerInfo[playerid][pDinero] < 9000) return SendClientMessage(playerid, -1, "No tienes el dinero suficiente para conseguir el trabajo de mï¿½dico.");
				if(PlayerInfo[playerid][pJob] == 0)
				{
					SendClientMessage(playerid, -1, "{00E500}ï¿½Felicidades!{FFFFFF}, te dieron el trabajo de mï¿½dico, si necesitas informaciï¿½n sobre el trabajo usa {5EB5FF}/ayuda trabajos{FFFFFF}.");
					PlayerInfo[playerid][pJob] = 1;
				}
				RemoveMoney(playerid, 9000);
			}
		}
		case DIALOG_REPORTS:
		{
			if(!response) return 1;
			new reportid = DynamicDgui_GetValue(playerid, listitem);
			if(ReportsE[reportid][rSlotUsed] == 1)
			{
				format(string, sizeof(string), "[ADMIN]: %s reviso el reporte de %s.", PlayerInfo[playerid][p_Name], PlayerInfo[ ReportsE[reportid][rReportFrom] ][p_Name]);
				SendAdminMessage(Amarillo, string);
				ReportsE[reportid][rReportFrom] = INVALID_PLAYER_ID;
				ReportsE[reportid][rReportID] = INVALID_PLAYER_ID;
				ReportsE[reportid][rSlotUsed] = 0;
				format(ReportsE[reportid][rReason], 128, "");
			}
		}
		case DIALOG_SENDQUESTION:
		{
			if(response)
			{
				SendPlayerQuestion(playerid, QuestionText[playerid]);
			}
		}
		case DIALOG_BUYPARTSM:
		{
			if(response)
			{
				if(strval(inputtext) == 0 /*|| strval(inputtext) >= 120*/) return 1;
				new operation = 90-PlayerInfo[playerid][pPartsM]/*+strval(inputtext)*/;
				if(operation == 0) return SendClientMessage(playerid, -1, "No puedes llevar mï¿½s de 120 repuestos en el uniforme.");
				if(operation >=/*=*/ strval(inputtext))
				{
					if(PlayerInfo[playerid][pDinero] < strval(inputtext)*90) return SendClientMessage(playerid,-1,"No tienes el dinero suficiente.");
					PlayerInfo[playerid][pPartsM] += strval(inputtext)/*operation*/;
					RemoveMoney(playerid, strval(inputtext)*90);
					format(string, sizeof(string), "Acabas de comprar %d repuestos por el costo de {00E500}$%d{FFFFFF}.", strval(inputtext), strval(inputtext)*120);
					SendClientMessage(playerid, -1, string);
				} 
				else if(operation < strval(inputtext))
				{
					if(PlayerInfo[playerid][pDinero] < strval(inputtext)*90) return SendClientMessage(playerid,-1,"No tienes el dinero suficiente.");
					PlayerInfo[playerid][pPartsM] += operation;
					RemoveMoney(playerid, operation*90);
					format(string, sizeof(string), "Acabas de comprar %d repuestos por el costo de {00E500}$%d{FFFFFF}.", operation, operation*120);
					SendClientMessage(playerid, -1, string);
				}
				/*if(operation == 0) { SendClientMessage(playerid, -1, "No puedes llevar mï¿½s de 120 repuestos en el uniforme."); }*/
			}
			return 1;
		}
    	case DIALOG_SERVICEMEDICH:
    	{
    		if(response)
    		{
    			switch(listitem)
    			{
    				case 0:
    				{
    					if(PlayerInfo[playerid][pDinero] < 400) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);
    					AddItemInvPlayer(playerid, 193, 0, true);
    					RemoveMoney(playerid, 400);

    				}
    				case 1:
    				{
    					if(PlayerInfo[playerid][pDinero] < 100) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);

    					AddItemInvPlayer(playerid, 194, 5, true);
    					RemoveMoney(playerid, 100);

    				}
    				case 2:
    				{
    					if(PlayerInfo[playerid][pDinero] < 150) return ShowPlayerInfoTextdraw(playerid, "~r~No tienes el dinero suficiente.", 2000);
    					AddItemInvPlayer(playerid, 192, 5, true);
    					RemoveMoney(playerid, 150);
    				}
    				case 3:
    				{
    					new Float:health;
    					GetPlayerHealth(playerid, health);
    					new Float:operation = 100-health;
    					new operationend = floatround(operation, floatround_round);
    					if(PlayerInfo[playerid][pDinero] < operationend*10) 
    					{
    						GivePlayerMoneyEx(playerid, 0);
    					}
    					else
    					{
    						RemoveMoney(playerid, operationend*10);
    					}
    					SetPlayerMedicalBed(playerid, 1);
    					ApplyAnimationEx(playerid,"INT_HOUSE","BED_In_R",4.1,0,0,0,1,0,1);
    				}
    			}
    		} CancelPlayerDialogShop(playerid);
    	}
    	case DIALOG_ANIMS:
    	{
    		if(response)
    		{
    			switch(listitem)
    			{
    				case 0: callcmd::asiento(playerid, "params");
    				case 1: callcmd::asiento2(playerid, "");
    				case 2: callcmd::llorar(playerid, "");
    				case 3: callcmd::paja(playerid, "");
    				case 4: callcmd::reir(playerid, "");
    				case 5: callcmd::cansado(playerid, "");
    				case 6: callcmd::hablar(playerid, "");
    				case 7: callcmd::asientosexy(playerid, "");
    				case 8: callcmd::dormir(playerid, "");
    				case 9: callcmd::rodar(playerid, "");
    				case 10: callcmd::bomba(playerid, "");
    			}
    		}
    	}
		case DIALOG_LEAVEWORK:
		{
			if(response)
			{
				new id = PlayerObjects[playerid][listitem];
				new str[55];
				if(PlayerInfo[playerid][pJob] == id)
				{
					format(str, sizeof(str), "~w~Has dejado el trabajo~n~de ~y~%s~w~.", GetPlayerJobName(PlayerInfo[playerid][pJob]));
					PlayerInfo[playerid][pJob] = 0;
				}
				CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_LEAVEWORK, str, 10, false);
			}
		}
		case DIALOG_OBTAINWORK:
		{
			if(response)
			{
				new str[59];
				new id = DynamicDgui_GetValue(playerid, 0);
				if(IsPlayerHasJob(playerid, id)) return 1;
				if(PlayerInfo[playerid][pJob] == id /*|| PlayerInfo[playerid][pJob2] == id*/) return SendClientMessage(playerid, -1, "No puedes tener 2 trabajos iguales.");
				if(PlayerInfo[playerid][pJob] == 0)
				{
					format(str, sizeof(str), "Has sido contratado en el trabajo de %s.", GetPlayerJobName(id));
					CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_OBTAINWORK, str, 8);
					PlayerInfo[playerid][pJob] = id;
				}
				/*else if(PlayerInfo[playerid][pJob] != 0 && PlayerInfo[playerid][pJob2] == 0 && PlayerInfo[playerid][pVip] >= 2)
				{
					format(str, sizeof(str), "Has sido contratado en el trabajo de %s.", GetPlayerJobName(id));
					SendClientMessage(playerid, -1, str);
					PlayerInfo[playerid][pJob2] = id;
				}*/
			}
		}
	/*	case DIALOG_HELPGETWORK:
		{
			if(response)
			{
				new id = DynamicDgui_GetValue(playerid, 0);
				switch(id)
				{
					case 2:
					{
						format(string,sizeof(string), "{FFFFFF}El trabajo de camionero se encuentra en la fabrica de Fallen Tree.\n");
						format(string, sizeof(string), "%sLa paga inicial es de {00E500}$600{FFFFFF} e ira incrementando conforme subas de nivel.\nEste trabajo tambiï¿½n cuenta con ganancias extras.",string);
						ShowPlayerDialog(playerid, DIALOG_ID_NULL_ALL,DIALOG_STYLE_MSGBOX,"Ayuda trabajos - Camionero", string, "Aceptar", "");
					}
				}
			}
		}*/
		case DIALOG_AOPTIONSVEHICLE:
		{
			if(!response) return 1;
			new id = DynamicDgui_GetValue(playerid, listitem);
			new vehicleid = GetPlayerVehicleID(playerid);
			switch(id)
			{
				case 0:
				{
					if(vehicle_getLights(vehicleid))
					{
						vehicle_setLights(vehicleid, false);
					}
					else { vehicle_setLights(vehicleid, true); }
					ShowDialogOptionsVehicle(playerid);
				}
				case 4:
				{
					new Float:health;
					GetVehicleHealth(vehicleid, health);
					if(LlamadaMecanico[playerid] == 0 && IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						if(health > 350.0) return 1;
						if(LlamadaMecanico[playerid] == 0)
						{
							foreach (new i : Player)
							{
								if(IsPlayerHasJob(i, 8) && MecanicoServicio[i] == 1)
								{
									SetPlayerMarkerForPlayer(i, playerid, Rol);
									SendClientMessage(i, Blanco, "Hay un nuevo cliente solicitando {5EB5FF}/servicio mecanico{FFFFFF}, para avisarle que vas a llegar usa {5EB5FF}/responder mecanico");
								}
							}
						}
						SetTimerEx("CancelServiceMeca", 1000*5*60, false, "i", playerid);
						SendClientMessage(playerid, -1, "Has llamado la central de mecï¿½nicos, espera a que alguien llegue.");
						LlamadaMecanico[playerid] = 1;
						Mecanico[playerid] = INVALID_PLAYER_ID;
						MecanicoPrecio[playerid] = -1;
					}
				}
				case 5:
				{
					Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
					PlayerInfo[playerid][p_RentSeconds] = 0;
					PlayerInfo[playerid][p_RentMinutes] = 0;

					new Query[200];
					format(Query, sizeof(Query), "DELETE FROM `lac_uservehicles` WHERE `Car_ID`=%d;",
						VEHICLES_PLAYER[ Player.Temp[playerid][@RentVehicle] ][player_vehicle_ID]);
					mysql_tquery(conexion, Query);

					Player.Temp[playerid][@RentVehicle] = -1;

					SetTimerEx("RespawnearVehiculo", 2000, false, "ii", vehicleid, 1);
					RemovePlayerFromVehicle(playerid);
					funct_HideTextdrawNotif(playerid, VNOTI_TYPE_RENTEDVEHICLE);
				}
				case 7:
				{
					UpdateVehiclePark(playerid);
				}
			}
		}
	/*	case DIALOG_VEHICLECRANEPERMIT:
		{
			if(response)
			{
				new id = VehiclesPlayer[playerid][listitem];
				PlayerInfo[
			}
		}*/
	}
	return /*0*/1;
}
    //Fin Dialogos

public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
	{
		return 1;
	}
	if(FirstSpawn[playerid] == 0)
	{
		KillTimer(PlayerInfoTemp[playerid][pt_Timers][1]);
		PlayerInfoTemp[playerid][pt_Timers][1] = SetTimerEx("TimerInicio", 2500, false, "i", playerid);
		TogglePlayerControllableEx(playerid,false);
		StopAudioStreamForPlayer(playerid);
		TextDrawHideForPlayer(playerid, LoginMenu[0]);
		TextDrawHideForPlayer(playerid, LoginMenu[1]);
		TextDrawHideForPlayer(playerid, TextInicioWeb);
		TextDrawHideForPlayer(playerid, TextInicioVersion);
		TextDrawHideForPlayer(playerid, TextdrawServerDisc);

		SetCameraBehindPlayer(playerid);
		if(PlayerInfo[playerid][pLastTimeLogged] != 0)
		{
			SendClientMessage(playerid, -1, "Bienvenido de nuevo.");
		}
		GiveThingsSpawn(playerid);
		CalcularExpNivel(playerid);
		SetPlayerStatsWeapons(playerid);
		//SetPlayerConfigOptions(playerid);

		if(PlayerInfo[playerid][pCargos] > 0)
		{
			SetTimerEx("Encerrando",100,false,"dd",playerid, 0);
		}
		if(PlayerInfo[playerid][pTiempoCarcel] > 0)
		{
			SetTimerEx("Encerrando",100,false,"dd",playerid, 1);
		}

		if(PlayerInfo[playerid][p_WorkTravel] != 0)
		{
			switch(PlayerInfo[playerid][p_WorkTravel])
			{
				case 2:
				{
					if(PlayerInfo[playerid][p_JobTravelT] == 1) { SetPlayerNextCheckpointTrucker(playerid); }
					else if(PlayerInfo[playerid][p_JobTravelT] == 2) { SetPlayerCarrierCheckpoint(playerid); }		
				}
				case WORK_TYPE_FARMER:
				{
					SelectStageWorkFarmer(playerid);
				}
			}
		}
		if(QuestionTime[playerid] == 0)
		{
			QuestionTime[playerid] = 3*60;
		}
	//	DarRopa(playerid);
		PreloadAnimLibAll(playerid);

		FirstSpawn[playerid] = 1;
	}
	if(Specteando[playerid] == 1)
	{
		SetPlayerPos(playerid, SpectX[playerid], SpectY[playerid], SpectZ[playerid]);
		Specteando[playerid] = 0;
		SetCameraBehindPlayer(playerid);
	}
	/*if(PlayerInfo[playerid][pAgonizando] == 1 || PlayerInfo[playerid][pAgonizando] == 3)
	{
		PlayerInfo[playerid][pAgonizando] = 1;
		DarRopa(playerid);
		ResetPlayerWeapons(playerid);
		SetPlayerHealth(playerid, 100.0);
		PlayerInfo[playerid][pHealth] = 100;
		SetInterior(playerid, PlayerInfo[playerid][pInterior]);
		SetVW(playerid, PlayerInfo[playerid][pVirtualWorld]);
		
	}*/
	/*if(PlayerInfo[playerid][pAgonizando] == 2)
	{
		ApareceHospital(playerid);
	}*/
	if(PlayerInfo[playerid][p_State_Game] == GAME_STATE_CRACK && Player.Temp[playerid][@StateGameo] == GAMEO_STATE_DEAD)
	{
		new hp = HospitalCercano(playerid);
		if(hp == 1)
		{
			SetVW(playerid, 105);
			SetHealth(playerid, 10.0);
			SetPlayerMedicalBed(playerid, 1);
		}
		else if(hp == 2)
		{
			SetVW(playerid, 131);
			SetHealth(playerid, 10.0);
			SetPlayerMedicalBed(playerid, 1);
		}
		else if(hp == 3)
		{
			SetVW(playerid, 131);
			SetHealth(playerid, 10.0);
			SetPlayerMedicalBed(playerid, 1);
		}
		else if(hp == 4)
		{
			SetVW(playerid, 131);
			SetHealth(playerid, 10.0);
			SetPlayerMedicalBed(playerid, 1);
		}
		Streamer_Update(playerid);

		PlayerInfo[playerid][p_State_Game] = GAME_STATE_NORMAL;

		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_TransScreen][0]);
		TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_TransScreen][1]);

		PlayerInfo[playerid][pHungry] = 40;
		PlayerInfo[playerid][pSed] = 40;
	}
	else if(Player.Temp[playerid][@StateGameo] == GAMEO_STATE_DEAD)
	{
		SetHealth(playerid, 100.0);

		PlayerInfo[playerid][p_State_Game] = GAME_STATE_CRACK;

		SetInterior(playerid, PlayerInfo[playerid][pInterior]);
		SetVW(playerid, PlayerInfo[playerid][pVirtualWorld]);

		ApplyAnimationEx(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, false, 0, false);
	}
	if(Jail[playerid] == 1)
	{
		SetPlayerHealth(playerid, 100.0);
		SetPlayerJailCell(playerid);
	}
	//PlayerInfoTemp[playerid][pt_StateGame] = GAME_STATE_NORMAL;

	Player.Temp[playerid][@StateGameo] = GAME_STATE_NORMAL;

	DarRopa(playerid);

	SelectedItemInventory(playerid, GetInvValueItemSelected(playerid), GetInvItemSelected(playerid));

	for(new i = 0; i < MAX_PLAYER_INV_ITEMS_EQUIPED; i++)
	{
		if(Player.InvEquiped[playerid][i][@Item] != 0)
		{
			UseItemInventory(playerid, Player.InvEquiped[playerid][i][@Item]);
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{

	/*if(PlayerInfo[playerid][pDutyPolicia] == 1 && Aggressor[playerid] != INVALID_PLAYER_ID)
	{
		if(PlayerInfo[Aggressor[playerid]][pDutyPolicia] != 1)
		{
			AssignWantedSafeZone(Aggressor[playerid], 2, "", PlayerName(playerid));
		}
	}
	else
	{
		ZonasSeguras(Aggressor[playerid], 0);
	}*/
	/*if(IsPlayerConnected(killerid) && PlayerInfo[playerid][p_State_Game] == GAME_STATE_NORMAL && PlayerInfo[killerid][p_State_Game] == GAME_STATE_NORMAL)
	{*/
	SendDeathPlayerMessage(playerid, killerid);
	/*}*/
	
	if(PlayerInfo[playerid][p_State_Game] == GAME_STATE_CRACK)
	{
		

		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_TransScreen][0]);
		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_TransScreen][1]);
	//	new Float:mX, Float:mY, Float:mZ;
	//	GetPlayerPos(playerid, mX, mY, mZ);
	//	DeathX[playerid] = mX;
	//	DeathY[playerid] = mY;
	//	DeathZ[playerid] = mZ;
	//	PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);
	//	PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
	//	SetSpawnInfo(playerid,0,PlayerInfo[playerid][pRopa],DeathX[playerid], DeathY[playerid], DeathZ[playerid],0,0,0,0,0,0,0);
	
	}
	else
	{
		GetPlayerPos(playerid, Player.Temp[playerid][@DeathX], Player.Temp[playerid][@DeathY], Player.Temp[playerid][@DeathZ]);
	//	PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);
	//	PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
		SetSpawnInfo(playerid,0,PlayerInfo[playerid][pRopa],Player.Temp[playerid][@DeathX], Player.Temp[playerid][@DeathY], Player.Temp[playerid][@DeathZ],0,0,0,0,0,0,0);
	}
	Player.Temp[playerid][@StateGameo] = GAMEO_STATE_DEAD;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags) 
{
    if(!IsPlayerLogged(playerid)) return 0;
   	if(!DetectCMDNoTime(cmd) && AntiFlood[playerid] > GetTickCount())
   	{
		//SendClientMessage(playerid, Blanco, "No puedes usar mas de {5EB5FF}1 comando {FFFFFF}por segundo.");
		
		return 0;
	}
	AntiFlood[playerid] = GetTickCount() + 1000;
	return true;
}

//Comandos Acciones

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags) 
{
	/*if(!success)*/
	if(result == -1 || result == 0)
	{
		SendClientMessageEx(playerid, -1, "El comando {5EB5FF}/%s {FFFFFF}no existe, usa {5EB5FF}/ayuda{FFFFFF}.", cmd);
	}
	/*else
	{
		AntiFlood[playerid] = gettime();
	}*/
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	EnAuto[playerid] = INVALID_VEHICLE_ID;
	/*if(vehicleid == VSInfo[vehicleid][vsIcID])
	{
		VehicleDriver[vehicleid] = 0;
	}*/
	if(BajandoVehiculo[playerid] == 0)
	{
		BajandoVehiculo[playerid] = 1;
	}
	/*if(EscuchandoEmisora[vehicleid] == ListeningR[playerid])
	{
		StopAudioStreamForPlayer(playerid);
		EmisoraOcupada[EscuchandoEmisora[vehicleid]][2]--;
		ListeningR[playerid] = 0;
	}*/
	if(CAMIONNORMAL(vehicleid)) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(ChoferCamion[vehicleid] == INVALID_PLAYER_ID && CamionCargado[vehicleid] == 0)
			{
				SetTimerEx("RespawnearVehiculo", 3000, false, "i", vehicleid);
			}
		}
	}
	return 1;
}
public OnVehicleDeath(vehicleid, killerid)
{
	Vehicles_Info[vehicleid][gi_vehicle_SPAWNED] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_DRIVER] = INVALID_PLAYER_ID;
	Vehicles_Info[vehicleid][gi_vehicle_LASTDRIVER] = INVALID_PLAYER_ID;

    Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
    rBit1_Set(EstadoCapo, vehicleid, false);
    KillTimer(MatarMotor[killerid]);
	
	switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
	{
		case VEHICLE_TYPE_WORK:
		{
			switch(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK])
			{
				case WORK_TYPE_TRUCKER:
				{
					if(PlayerInfo[VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER]][p_WorkTravel] == 2)
					{
						CancelTruckerLoad(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER]);
					}
				}
				case WORK_TYPE_FARMER:
				{
					CancelMissionJobLoad(Vehicles_Info[vehicleid][gi_vehicle_OWNER]); 
					ShowPlayerInfoTextdraw(Vehicles_Info[vehicleid][gi_vehicle_OWNER], "~r~Tu encargo fue cancelado.", 5000);
				}
			}
			VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = INVALID_PLAYER_ID;
		}
		case VEHICLE_TYPE_RENT:
		{
			new player = Vehicles_Info[vehicleid][gi_vehicle_OWNER];
			if(Player.Temp[player][@RentVehicle] == vehicleid)
			{
				Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
				PlayerInfo[player][p_RentSeconds] = 0;
				PlayerInfo[player][p_RentMinutes] = 0;

				mysql_tquery_s(conexion, str_format("DELETE FROM `lac_uservehicles` WHERE `Car_ID`=%d;",
					VEHICLES_PLAYER[ Player.Temp[player][@RentVehicle] ][player_vehicle_ID]));
				
				Player.Temp[player][@RentVehicle] = -1;

				DestroyVehicleEx(vehicleid);
				funct_HideTextdrawNotif(player, VNOTI_TYPE_RENTEDVEHICLE);
			}
		}
	}
 	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new engine,lights,alarm,doors,bonnet,boot,objective;
 	new vehicleid = GetPlayerVehicleID(playerid);
 	new newcar = GetPlayerVehicleID(playerid);

 	/*new playerState = GetPlayerState(playerid);*/
 	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
 	{
 		GetVehicleParamsEx(newcar,engine,lights,alarm,doors,bonnet,boot,objective);
 		if(!IsABike(vehicleid) && Vehicles_Info[vehicleid][gi_vehicle_ENGINE] == 0) 
 		{	
 			

 		}
 		if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_RENT && !IsPlayerInVehicleRent(playerid, vehicleid))
 		{
 			if(Player.Temp[playerid][@RentVehicle] != -1 && Vehicles_Info[vehicleid][gi_vehicle_OWNER] != playerid) return Kick(playerid);
 			DynamicDgui_Start(playerid);
			DynamicDgui_AddVar(playerid,vehicleid);
 			Dialog_Show(playerid, DialogRentVehicle, DIALOG_STYLE_MSGBOX, 
 				"{5EB5FF}Rentar vehï¿½culo",
 				"{FFFFFF}El costo por rentar el vehï¿½culo es de {33AA33}$200 + $25 {FFFFFF}por minuto.\n\nï¿½Quieres rentarlo?",
 				"Rentar", "Cancelar");
 		}
 		if(TAXI(vehicleid))
 		{
 			if(Taximeter[playerid] > 0)
 			{
 				PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][0]);
 				PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][1]);
 				PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][2]);
 			}
 			rBit1_Set(InTaxiVar, playerid, true);
 		}
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(!IsABike(GetPlayerVehicleID(playerid)))
		{
    		SetPlayerArmedWeapon(playerid, 0);
			ShowPlayerSpeedoMeter(playerid);
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	
		//PlayerInfo[playerid][p_LastState] = PLAYER_STATE_ONFOOT;
	//	printf("Change State: %d Foot", PlayerInfo[playerid][p_LastState]);
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_VALID])
		{
			switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
			{
				case VEHICLE_TYPE_WORK:
				{
					if(!IsPlayerHasJob(playerid, VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK])) 
					{ 
						Kick(playerid);
						return 1;
					}
				}
			}

			switch(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK])
			{
				case WORK_TYPE_TRUCKER:
				{
					if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != INVALID_PLAYER_ID)
					{
						if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid) { Kick(playerid); }
					}
					else
					{
						if(CamionID[playerid] != INVALID_VEHICLE_ID) return Kick(playerid);
						//for(new veh = 0; veh < sizeof TruckerWorkVehicles[]; veh++) { if(TruckerWorkVehicles[veh] == vehicleid) TruckerWorkVehicles[veh] = INVALID_VEHICLE_ID; break; }

						new modelid = Vehicles_Info[vehicleid][gi_vehicle_MODELID];
						if(modelid == 456 || modelid == 414 || modelid == 609 || modelid == 499)
						{
							new rand = random(3);
							PlayerInfo[playerid][p_JobTravel] = rand;
							SetPlayerNextCheckpointTrucker(playerid);
							PlayerInfo[playerid][p_JobTravelT] = 1;
						}
						else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 578)
						{
							new rand = randomEx(1, 3);
							PlayerInfo[playerid][p_JobTravelT] = 2;
							PlayerInfo[playerid][p_JobTravel] = rand;
							PlayerInfo[playerid][p_JobTravelNext] = 1;
							SetPlayerCarrierCheckpoint(playerid);
						}
						VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = playerid;
						CamionID[playerid] = vehicleid;

						KillTimer(PlayerInfoTemp[playerid][pt_TimersG][0]);
						PlayerInfoTemp[playerid][pt_TimersG][0] = SetTimerEx("CheckDistanceVehicleJob", 2050, true, "i", playerid, 2);

						PlayerInfo[playerid][p_WorkTravel] = 2;
						new string[50];
						format(string, sizeof(string), "Ve a recoger la carga a ~b~%s",GetTruckerZoneName(PlayerInfo[playerid][p_JobTravel], PlayerInfo[playerid][p_JobTravelNext]));
						ShowPlayerInfoTextdraw(playerid, string, 4000);
					
					}
				}
				case WORK_TYPE_FARMER:
				{
					if(PlayerInfo[playerid][p_WorkTravel] != WORK_TYPE_FARMER)
					{
						ShowDialogEx(playerid, DIALOG_SELECT_OPTION_FARMER);
					}
				}
			}
		}
		Vehicles_Info[vehicleid][gi_vehicle_DRIVER] = playerid;
 		Vehicles_Info[vehicleid][gi_vehicle_OCCUPIED] = true; 

 		PlayerInfo[playerid][p_LastState] = PLAYER_STATE_DRIVER;

		if(IsPlayerGPSIsActive(playerid))
		{
			RestorePlayerGPSRoutes(playerid);
		}
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		if(ThisInVehicleS(vehicleid, 9) && DumpCompa[playerid] == INVALID_PLAYER_ID)
		{
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_RADIO] != 0)
		{
			new emisoraid;
			emisoraid = Vehicles_Info[vehicleid][gi_vehicle_RADIO];
			
			PlayAudioStreamForPlayer(playerid, RADIO_STATION_DATA[emisoraid][E_RADIO_STATION_DATA_URL]);			
			ListeningR[playerid] = emisoraid;					
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		if(PlayerInfo[playerid][pAgonizando] == 1 /*|| VariableAbatido[playerid] == 1 */&& StatePatient[playerid] != 2)
		{
			RemovePlayerFromVehicle(playerid);
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
		if(!IsABike(GetPlayerVehicleID(playerid)))
		{
			HidePlayerSpeedoMeter(playerid);
		}
		if(rBit1_Get(InTaxiVar, playerid))
		{
			rBit1_Set(InTaxiVar,playerid,false);
			PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][0]);
 			PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][1]);
 			PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][2]);
		}
		if(IsPlayerGPSIsActive(playerid))
		{
			HideGPSRoutes(playerid);
		}
		PlayerInfo[playerid][p_LastState] = newstate;
	}
	if(newstate == PLAYER_STATE_PASSENGER)
	{
		if(TAXI(vehicleid))
		{
			new string[128];
			foreach (new i : Player)
			{
				if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
				{
					TaxiDriver[playerid] = i;
					format(string, sizeof(string), "Te subiste al taxi del taxista {FABF00}%s {FFFFFF}el costo por ficha es de {00E500}$%d{FFFFFF}.", PlayerName(i), Taximeter[i]);
					SendClientMessage(playerid, -1, string);
					TaximeterTimer[playerid] = SetTimerEx("TaximeterT", 10000, true, "i", playerid);
					PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][0]);
					PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][1]);
					PlayerTextDrawShow(playerid, TaximeterTextdraw[playerid][2]);
				}
			}
		}
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		if(TaxiDriver[playerid] != INVALID_PLAYER_ID)
		{
			if(TaximeterAmount[TaxiDriver[playerid]] > 0)
			{
			
				new string[128], stringt[20];
				PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][0]);
 				PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][1]);
 				PlayerTextDrawHide(playerid, TaximeterTextdraw[playerid][2]);
				/*format(string, sizeof(string), "El chï¿½fer del taxi ha dejado de estar en servicio, el costo total por el recorrido es de {00E500}$%d{FFFFFF}.", TaximeterAmount[TaxiDriver[playerid]]);*/
				format(string, sizeof(string), "Le has pagado al chï¿½fer del taxi {00E500}$%d {FFFFFF}en el recorrido.", TaximeterAmount[TaxiDriver[playerid]]);
				SendClientMessage(playerid, -1, string);
				format(string, sizeof(string), "El pasajero se ha bajado del taxi, has recaudado {00E500}$%d {FFFFFF}por el recorrido.", TaximeterAmount[TaxiDriver[playerid]]);
				SendClientMessage(TaxiDriver[playerid], -1, string);
				KillTimer(TaximeterTimer[playerid]);
				format(stringt, sizeof(stringt), "$%d", TaximeterAmount[TaxiDriver[playerid]]);
				PlayerTextDrawSetString(TaxiDriver[playerid], TaximeterTextdraw[playerid][2], stringt);
				DarDinero(TaxiDriver[playerid], TaximeterAmount[TaxiDriver[playerid]]);
				TaximeterAmount[TaxiDriver[playerid]] = 0;
				TaxiDriver[playerid] = INVALID_PLAYER_ID;
			}
		}
	}
	switch(newstate)
	{
		case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER:
		{
			if(IsPlayerLogged(playerid))
			{
				if(EnAuto[playerid] != GetPlayerVehicleID(playerid) && BajandoVehiculo[playerid] == 1)
				{
					BaneoAnticheat(playerid, "{BD3939}Cheat de vehï¿½culos{FFFFFF}.", 1);
				}
			}
		}
	}
	/*if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_ONFOOT)
	{*/
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(ListeningR[playerid] != 0)
		{	
			StopAudioStreamForPlayer(playerid);
			ListeningR[playerid] = 0;
		}
	}
	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid, price)
{
   /* if(listid == tuningsale)
    {
    	if(response)
    	{
    		switch(modelid)
    		{
    			case 1003, 1006, 1142, 1144, 19307 ,19306:
    			{
    				BuyTuningObject(playerid, 1000);
    				TuningBuySelected[playerid] = modelid;
    			}
    			case 19078, 19317, 19280: 
    			{
    				BuyTuningObject(playerid, 3000);
    				TuningBuySelected[playerid] = modelid;
    			}
    			case 1081:
    			{
    				BuyTuningObject(playerid, 5000);
    				TuningBuySelected[playerid] = modelid;
    			}
    			case 19917:
    			{
    				BuyTuningObject(playerid, 10000);
    				TuningBuySelected[playerid] = modelid;
    			}
    		}
    	}
    	return 1;
    }*/
	return 1;
}

ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5, length = 0)
{
	new line1_str[165], line2_str[165], bool:line2_used;
	
	if(length)
	{
		format(line1_str, length + 1, "%s", string);
		if(strlen(string) > length)
		{
			format(line2_str, sizeof line2_str, "ï¿½ %s", string[length]);
			line2_used = true;
		}
	}
	else format(line1_str, sizeof line1_str, "%s", string);

	new current_vw = GetPlayerVirtualWorld(playerid), current_int = GetPlayerInterior(playerid);
	new Float:oldposx, Float:oldposy, Float:oldposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(GetPlayerVirtualWorld(i) != current_vw) continue;
		if(GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, radi/16, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col1, line1_str);
			if(length && line2_used) SendClientMessage(i, col1, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/8, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col2, line1_str);
			if(length && line2_used) SendClientMessage(i, col2, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/4, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col3, line1_str);
			if(length && line2_used) SendClientMessage(i, col3, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/2, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col4, line1_str);
			if(length && line2_used) SendClientMessage(i, col4, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col5, line1_str);
			if(length && line2_used) SendClientMessage(i, col5, line2_str);
		}
	}
	


	return 1;
}

stock NameJ(playerid)
{
	new Nombre[24];
	GetPlayerName(playerid,Nombre,24);
	new N[24];
	strmid(N,Nombre,0,strlen(Nombre),24);
	for(new i = 0; i < MAX_PLAYER_NAME; i++)
	{
	if (N [i] == '_') N[i] = ' ';
	}
	return N;
}

forward Entrar(playerid);
public Entrar(playerid)
{
	/*if(IsPlayerInRangeOfPoint(playerid, 2.0, 276.1984,122.1430,1004.6172))
	{
		if(PlayerInfo[playerid][pMiembro] != 1) return 1;
		SetPlayerPos(playerid, 251.0216,76.4671,1003.6406);
		SetPlayerFacingAngle(playerid, 178.5598);
		SetInterior(playerid,6);
		SetVW(playerid, DoorInfo[2][dEnterVW]);
		LoadObjects(playerid);
	}*/
	if(IsPlayerInRangeOfPoint(playerid, 1.0, 1172.08,-1323.3,15.4029))
	{
		PlayerInfo[playerid][p_INTERIOR_TYPE] = PLAYER_INTERIOR_DOOR;
		PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = DoorInfo[4][dID];
		SetPlayerPosInt(playerid, DoorInfo[4][dEnterX],DoorInfo[4][dEnterY],DoorInfo[4][dEnterZ], DoorInfo[4][dAnguloInt], DoorInfo[4][dEnterInt], DoorInfo[4][dEnterVW]);
		return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2.0, DoorInfo[14][dExitX],DoorInfo[14][dExitY], DoorInfo[14][dExitZ]))
	{
		if(PlayerInfo[playerid][p_LEVEL] < 2) return SendClientMessage(playerid, -1, "Necesitas nivel 2 para poder entrar a la Estaciï¿½n de Radio y Televisiï¿½n.");
		Streamer_UpdateEx(playerid, DoorInfo[14][dEnterX], DoorInfo[14][dEnterY], DoorInfo[14][dEnterZ], -1, DoorInfo[14][dEnterInt]);
		SetPlayerPos(playerid, DoorInfo[14][dEnterX],DoorInfo[14][dEnterY], DoorInfo[14][dEnterZ]);  //HSTL Central Ls - Entrar
		SetPlayerFacingAngle(playerid, DoorInfo[14][dAnguloInt]);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid, 105);
		LoadObjects(playerid);
		return 1;
	}
	return 0;
}

forward Salir(playerid);
public Salir(playerid)
{
	/*if(IsPlayerInRangeOfPoint(playerid, 2.0, 251.0216,76.4671,1003.6406))
	{
		if(PlayerInfo[playerid][pMiembro] != 1) return 1;
		SetPlayerPos(playerid, 276.1984,122.1430,1004.6172);
		SetPlayerFacingAngle(playerid, 269.3831);
		SetInterior(playerid,DoorInfo[2][dEnterInt]);
		SetVW(playerid, DoorInfo[2][dEnterVW]);
		LoadObjects(playerid);
	}*/
	return 1;
}

stock ApareceHospital(playerid)
{
	SetPlayerHealth(playerid,4.0);
	if(PlayerInfo[playerid][pDutyPolicia] != 1)
	{
	//	QuitarArmas(playerid);
	}
	DarRopa(playerid);
	DarArmas(playerid);
	HospitalCercano2(playerid);
	SetInterior(playerid,0);
	SetVW(playerid, 0);

//	PlayerInfo[playerid][pAgonizando] = 0;

	TogglePlayerControllable(playerid,0);
	SendClientMessage(playerid, COLOR_WHITE,"{00D989}Perdiste la conciencia y fuiste trasladado al hospital y atendido rï¿½pidamente.");//Le enviara el mensaje de que espere
	RemoveMoney(playerid,250);

	ShowPlayerProgressBar(playerid, HungryBar[playerid]);
	SetTimerEx("ComenzarCurar",2000,false,"d",playerid);
	return 1;
}

function ApareceHospital2(playerid)
{
	SendClientMessage(playerid, COLOR_WHITE, "{00D989}El costo de los servicios fue de {2BFF00}$500");
	TogglePlayerControllable(playerid,1); //Descongela al Jugador
	SetCameraBehindPlayer(playerid);//Le quitara las armas
	return 1;
}

stock HospitalCercano2(playerid)
{
    new Float:HospitalLS,Float:HospitalLS2,Float:HospitalLV,Float:HospitalSF;
	HospitalLS = GetPlayerDistanceFromPoint(playerid, 1191.43,-1326.39,13.40);
	HospitalLS2 = GetPlayerDistanceFromPoint(playerid, 2030.36,-1419.79,16.99);
	HospitalLV = GetPlayerDistanceFromPoint(playerid, 1605.58,1830.17,10.82);
	HospitalSF = GetPlayerDistanceFromPoint(playerid, -2662.87,631.44,14.45);
	if(HospitalLS < HospitalLS2 && HospitalLS < HospitalLV && HospitalLS < HospitalSF)
	{
		SetPlayerPos(playerid, 1172.79,-1321.24,15.40);
		SetPlayerCameraPos(playerid,1216.6165,-1284.9585,23.7114);
		SetPlayerCameraLookAt(playerid,1178.9612,-1324.9348,14.1459);
	}
	else if(HospitalLS2 < HospitalLS && HospitalLS2 < HospitalLV && HospitalLS2 < HospitalSF)
	{
		SetPlayerPos(playerid,2036.8506,-1403.4642,17.2841);
		SetPlayerCameraPos(playerid,1956.5846,-1463.3260,46.8506);
		SetPlayerCameraLookAt(playerid,2036.8506,-1403.4642,17.2841);
	}
	else if(HospitalLV < HospitalLS && HospitalLV < HospitalLS2 && HospitalLV < HospitalSF)
	{
	    SetPlayerPos(playerid,1598.6957,1816.0245,10.8203);
		SetPlayerCameraPos(playerid,1565.7708,1896.5101,47.7212);
		SetPlayerCameraLookAt(playerid,1598.6957,1816.0245,10.8203);
	}
	else if(HospitalSF < HospitalLS && HospitalSF < HospitalLS2 && HospitalSF < HospitalLV)
	{
	    SetPlayerPos(playerid,-2638.0701,636.5035,14.4531);
		SetPlayerCameraPos(playerid,-2542.7778,552.2639,74.6866);
		SetPlayerCameraLookAt(playerid,-2638.0701,636.5035,14.4531);
	}
}

stock HospitalCercano(playerid)
{
    new Float:HospitalLS,Float:HospitalLS2,Float:HospitalLV,Float:HospitalSF;
	HospitalLS = GetPlayerDistanceFromPoint(playerid, 1191.43,-1326.39,13.40);
	HospitalLS2 = GetPlayerDistanceFromPoint(playerid, 2030.36,-1419.79,16.99);
	HospitalLV = GetPlayerDistanceFromPoint(playerid, 1605.58,1830.17,10.82);
	HospitalSF = GetPlayerDistanceFromPoint(playerid, -2662.87,631.44,14.45);
	if(HospitalLS < HospitalLS2 && HospitalLS < HospitalLV && HospitalLS < HospitalSF)
	{
		return 1;
	}
	else if(HospitalLS2 < HospitalLS && HospitalLS2 < HospitalLV && HospitalLS2 < HospitalSF)
	{
	   	return 2;
	}
	else if(HospitalLV < HospitalLS && HospitalLV < HospitalLS2 && HospitalLV < HospitalSF)
	{
	    return 3;
	}
	else if(HospitalSF < HospitalLS && HospitalSF < HospitalLS2 && HospitalSF < HospitalLV)
	{
	   	return 4;
	}
	return 0;
}

function ComenzarCurar(playerid)
{
    Curando[playerid] = 1;
}

forward CurarProgress();
public CurarProgress()
{
    for(new u = 0; u < MAX_PLAYERS; u++)
	{
 		new Float:health;
 		GetPlayerHealth(u,health);
 		if(PlayerInfoTemp[u][pt_IsLoggedIn] == true)
 		{
	    if(Curando[u] == 1)
	    {
	    if(health >= 60)
	    {
	        Curando[u] = 0;
	        SetPlayerHealth(u, 60);
	        SetTimerEx("ApareceHospital2", 1000, false, "d", u);//En 15 segundos llamara a la siguiente public
	    }
	    else
	    {
		 	SetPlayerHealth(u, health+2.0);
	    }
	    }
	    }
	}
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	EnAuto[playerid] = vehicleid;
	BajandoVehiculo[playerid] = 0;
	if(!ispassenger && cocheocupado(vehicleid))
	{
		new Float:cjx, Float:cjy, Float:cjz;
		GetPlayerPos(playerid, cjx, cjy, cjz);
		SetPlayerPos(playerid, cjx, cjy, cjz);
		ShowPlayerInfoTextdraw(playerid, "No intentes robar vehï¿½culos~n~congelado por 2 segundos.", 2000);
		TogglePlayerControllable(playerid, 0);
		SetPlayerVirtualWorld(playerid, playerid+100000);
		SetTimerEx("descongelar", 2000, 0, "i", playerid);
	}			
	if(!ispassenger)
	{
		if(PoliceVehicle(vehicleid))
		{
			if(PlayerInfo[playerid][pDutyPolicia] != 1) {
				RemovePlayerFromVehicle(playerid);
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
				ShowPlayerInfoTextdraw(playerid, "~r~No eres policï¿½a.", 4000);
			}
			return 1;
		}
		if(Vehicles_Info[vehicleid][gi_vehicle_VALID] && Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			switch(VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK])
			{
				case 2:
				{
					if(!IsPlayerHasJob(playerid, 2))
					{
						ShowPlayerInfoTextdraw(playerid, "~r~No eres camionero.", 4000);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					if(CamionID[playerid] != INVALID_VEHICLE_ID && CamionID[playerid] != vehicleid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes un camiï¿½n en uso.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 609 && GetPlayerWorkLevel(playerid, WORK_TYPE_TRUCKER) < 2)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Necesitas nivel 2 de camionero.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;	
					}
					else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 499 && GetPlayerWorkLevel(playerid, WORK_TYPE_TRUCKER) < 3)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Necesitas nivel 3 de camionero.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;	
					}

					else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 578 && GetPlayerWorkLevel(playerid, WORK_TYPE_TRUCKER) < 4)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Necesitas nivel 4 de camionero.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;	
					}
					else if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != INVALID_PLAYER_ID && VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Este camiï¿½n ya tiene dueï¿½o.");
						SetPlayerPosPlayer(playerid);
					}
				}
				case 4:
				{
					if(!IsPlayerHasJob(playerid, WORK_TYPE_FARMER))
					{
						ShowPlayerInfoTextdraw(playerid, "~r~No eres granjero.", 4000);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					else if(CamionID[playerid] != INVALID_VEHICLE_ID && CamionID[playerid] != vehicleid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Ya te encuentras trabajando.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					else if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != INVALID_PLAYER_ID && VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Este vehï¿½culo ya tiene dueï¿½o.");
						SetPlayerPosPlayer(playerid);
					}
				}
				case WORK_TYPE_DUMPSTER:
				{
					if(!IsPlayerHasJob(playerid, WORK_TYPE_DUMPSTER))
					{
						ShowPlayerInfoTextdraw(playerid, "~r~No eres basurero.", 4000);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					else if(CamionID[playerid] != INVALID_VEHICLE_ID && CamionID[playerid] != vehicleid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Ya te encuentras trabajando.", 4000);
						RemovePlayerFromVehicle(playerid);
						SetPlayerPosPlayer(playerid);
						return 1;
					}
					else if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != INVALID_PLAYER_ID && VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != playerid)
					{
						ShowPlayerInfoTextdraw(playerid, "~r~Este vehï¿½culo ya tiene dueï¿½o.", 2000);
						SetPlayerPosPlayer(playerid);
					}
				}
			}
		}
		switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
		{
			case VEHICLE_TYPE_SALE:
			{
				SetPlayerPosPlayer(playerid);
				ShowPlayerInfoTextdraw(playerid, "~r~Vehï¿½culo de exposiciï¿½n.", 4000);
				return 1;
			}
			case VEHICLE_TYPE_PLAYER:
			{
				if(!IsPlayerHasVehicleKeys(playerid, vehicleid))
				{
					SetPlayerPosPlayer(playerid);
					new infotext[70];
					format(infotext, sizeof(infotext), "~r~Este vehï¿½culo pertenece a %s", PlayerInfo[ Vehicles_Info[vehicleid][gi_vehicle_OWNER] ][p_Name]);
					ShowPlayerInfoTextdraw(playerid, infotext, 2000);
				}
			}
		}
	}
	if(ispassenger == 0)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_RENT)
		{
			if(Vehicles_Info[vehicleid][gi_vehicle_OWNER] != INVALID_PLAYER_ID && Vehicles_Info[vehicleid][gi_vehicle_OWNER] != playerid)
			{
				ShowPlayerInfoTextdraw(playerid, "~r~Este vehï¿½culo ya se encuentra rentado.", 4000);
				RemovePlayerFromVehicle(playerid);
				SetPlayerPosPlayer(playerid);
			}	
			else if(Player.Temp[playerid][@RentVehicle] != -1 && Vehicles_Info[vehicleid][gi_vehicle_OWNER] != playerid)
			{
				ShowPlayerInfoTextdraw(playerid, "~r~Ya tienes rentado un vehï¿½culo.", 4000);
				RemovePlayerFromVehicle(playerid);
				SetPlayerPosPlayer(playerid);
			}
		}
	}
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	if(engine == VEHICLE_PARAMS_UNSET) switch(GetVehicleModel(vehicleid))
	{
		case 509, 481, 510: Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 1, SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective), Vehicles_Info[vehicleid][gi_vehicle_ENGINE]= 1;
		default: SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective), Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
	}
	return 1;
}

stock PoliceVehicle(carid)
{
	if(GetVehicleModel(carid) == 596 ||GetVehicleModel(carid) == 528 || GetVehicleModel(carid) == 597|| GetVehicleModel(carid) == 598)
	{
		return 1;
	}
	return 0;
}
Cosecha(carid)
{
	if(GetVehicleModel(carid) == 532)
	{
		return 1;
	}
	return 0;
}

stock WaltonLechera(carid)
{
	if(Vehicles_Info[carid][gi_vehicle_MODELID] == 478) { return 1; }
	return 0;
}

stock CAMIONNORMAL(carid)
{

	if(Vehicles_Info[carid][gi_vehicle_MODELID] == 609 || Vehicles_Info[carid][gi_vehicle_MODELID] == 456)
	{
		return 1;
		
	}
	else if(Vehicles_Info[carid][gi_vehicle_MODELID] == 609 )
	{
		return 1;

	} 
	return 0;
}

IsABike(carid)
{
	if(GetVehicleModel(carid) == 509 || GetVehicleModel(carid) ==  481 || GetVehicleModel(carid) == 510)
	{
		return 1;
	}
	return 0;
}

stock AVION(carid)
{
	new v = GetVehicleModel(carid);
	if(v == 511 || v == 593 || v == 553 || v == 519)
	{
		return 1;
	}
	return 0;
}

TAXI(carid)
{
new v = GetVehicleModel(carid);
if(v == 420 || v == 438)
{
return 1;
}
return 0;
}

ThisInVehicleS(carid, type)
{
	new v = GetVehicleModel(carid);
	if(type == 1)
	{
		if(v == 416)
		{
			return 1;
		}
	}
	else if(type == 9)
	{
		new model = Vehicles_Info[carid][gi_vehicle_MODELID];
		if (model == 408)
		{
			return 1;
		}
	}
	return 0;
}

stock IsNumeric(string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}	
	return 1;
}
forward Congelar(playerid); //Congelar al jugador
public Congelar(playerid)
{
	TogglePlayerControllable(playerid, 0);
    return 1;
}

forward Descongelar(playerid); //Descongelar al jugador
public Descongelar(playerid)
{
	TogglePlayerControllable(playerid, 1);
    return 1;
}

forward GetPlayersProx(Float:radi, playerid, targetid); //Cercanï¿½a de jugadores
public GetPlayersProx(Float:radi, playerid, targetid)
{
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	GetPlayerPos(targetid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	tempposz = (oldposz -posz);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
	    return 1;
	}
	return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    return 1;
}
public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	PlayerInfo[playerid][p_PickedUpPickup] = pickupid;
	return 1;
}

forward LimpiarChat(playerid, lines, type);
public LimpiarChat(playerid, lines, type)
{
	for (new a = 0; a < lines; a++)
	{
		if(type == 0)
		{
			SendClientMessageToAll(COLOR_SAMP, " ");
		}
		else
		{	
			SendClientMessage(playerid, Blanco, " ");
		}
	}
}

stock GetPlayerNameEx(playerid)
{
     new pName[25];
     GetPlayerName(playerid, pName, sizeof(pName));
     return pName;
}

strtok(const string[], &index)
{
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' '))
    {
        index++;
    }

    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
    {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}
stock GetClosestVehicle(playerid, Float:range = 4.0)
{
	new Float:x, Float:y, Float:z;
	new Float:dist, Float:closedist=range, closeveh;
	for(new i=1; i < MAX_VEHICLES; i++)
	{
		if(!Vehicles_Info[i][gi_vehicle_VALID]) continue;
		GetVehiclePos(i, x, y, z);
		dist = GetPlayerDistanceFromPoint(playerid, x, y, z);
		if(dist < closedist)
		{
			closedist = dist;
			closeveh = i;		
		}
	}
	return closeveh;
}

stock PlayerToVehicle(playerid, vehicleid, Float:dist)
{
	new Float:pos[3];
	GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
	return IsPlayerInRangeOfPoint(playerid, dist, pos[0], pos[1], pos[2]);
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	new autoid = GetPlayerVehicleID(playerid);
	if(Cosechando[playerid] == 1)
	{
		if(Cosecha(autoid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			SetPlayerProgressBarValue(playerid, ProgressCargando[playerid], PCosechar[playerid]);
			ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
			if(PCosechar[playerid] < GetProgressRacePlayer(4))
			{
				SetPlayerCPRace(playerid, 4, 0, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(4))
			{
				SetPlayerCPRace(playerid, 4, 1, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(4)+1)
			{
				DisablePlayerRaceCheckpoint(playerid);
				PayJobHarvester(playerid, 0);
				SetVehicleToRespawn(autoid);
				Cosechando[playerid] = 0;
				PCosechar[playerid] = 0;
				HidePlayerProgressBar(playerid, ProgressCargando[playerid]);
			}
			PCosechar[playerid]++;
			PlayerPlaySound(playerid, 1056, 0.0, 0.0, 10.0);
		}	
	}
	if(Cosechando[playerid] == 2)
	{
		if(Cosecha(autoid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			SetPlayerProgressBarValue(playerid, ProgressCargando[playerid], PCosechar[playerid]);
			ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
			if(PCosechar[playerid] < GetProgressRacePlayer(1))
			{
				SetPlayerCPRace(playerid, 1, 0, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(1))
			{
				SetPlayerCPRace(playerid, 1, 1, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(1)+1)
			{
				DisablePlayerRaceCheckpoint(playerid);
				PayJobHarvester(playerid, 0);
				SetVehicleToRespawn(autoid);
				Cosechando[playerid] = 0;
				PCosechar[playerid] = 0;
				HidePlayerProgressBar(playerid, ProgressCargando[playerid]);
			}
			PCosechar[playerid]++;
			PlayerPlaySound(playerid, 1056, 0.0, 0.0, 10.0);
		}
	}
	if(Cosechando[playerid] == 3)
	{
		if(Cosecha(autoid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			SetPlayerProgressBarValue(playerid, ProgressCargando[playerid], PCosechar[playerid]);
			ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
			if(PCosechar[playerid] < GetProgressRacePlayer(2))
			{
				SetPlayerCPRace(playerid, 2, 0, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(2))
			{
				SetPlayerCPRace(playerid, 2, 1, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(2)+1)
			{
				DisablePlayerRaceCheckpoint(playerid);
				PayJobHarvester(playerid, 1);
				SetVehicleToRespawn(autoid);
				Cosechando[playerid] = 0;
				PCosechar[playerid] = 0;
				HidePlayerProgressBar(playerid, ProgressCargando[playerid]);
			}
			PCosechar[playerid]++;
			PlayerPlaySound(playerid, 1056, 0.0, 0.0, 10.0);
		}
	}
	if(Cosechando[playerid] == 4)
	{
		if(Cosecha(autoid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			SetPlayerProgressBarValue(playerid, ProgressCargando[playerid], PCosechar[playerid]);
			ShowPlayerProgressBar(playerid, ProgressCargando[playerid]);
			if(PCosechar[playerid] < GetProgressRacePlayer(3))
			{
				SetPlayerCPRace(playerid, 3, 0, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(3))
			{
				SetPlayerCPRace(playerid, 3, 1, PCosechar[playerid], PCosechar[playerid]+1);
			}
			else if(PCosechar[playerid] == GetProgressRacePlayer(3)+1)
			{
				DisablePlayerRaceCheckpoint(playerid);
				PayJobHarvester(playerid, 1);
				SetVehicleToRespawn(autoid);
				Cosechando[playerid] = 0;
				PCosechar[playerid] = 0;
				HidePlayerProgressBar(playerid, ProgressCargando[playerid]);
			}
			PCosechar[playerid]++;
			PlayerPlaySound(playerid, 1056, 0.0, 0.0, 10.0);
		}
	}
	return 1;
}


/*public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	printf("[MySQL Error] ErrorID: %d - Error: %s - Callback: %s - Handle: %d\nQuery: %s", errorid, error, callback,  _:handle, query);
	return 1;
}*/


function SafeLoadObjects(playerid)
{
	if(GetPVarType(playerid, "LoadingObjects"))
	{
		DeletePVar(playerid, "LoadingObjects");
		TogglePlayerControllable(playerid, 1);
	}
}

LoadObjects(playerid, time = 1000)
{
	if(GetPVarInt(playerid, "LoadingObjects")) return 1;
	TogglePlayerControllable(playerid, 0);
	SetPVarInt(playerid, "LoadingObjects", 1);
	GameTextForPlayer(playerid, "~g~Cargando objetos.~w~ Por favor espera...", time, 5);
	return SetTimerEx("SafeLoadObjects", time, 0, "d", playerid);
}
forward TimerInicio(playerid);
public TimerInicio(playerid)
{
	TogglePlayerControllableEx(playerid, true);
	TextDrawHideForPlayer(playerid, CN);
	TextDrawHideForPlayer(playerid, CN2);

	if(CamionID[playerid] != INVALID_VEHICLE_ID)
	{
		if(PlayerInfo[playerid][p_LastState] == PLAYER_STATE_DRIVER)
		{
			PutPlayerInVehicleEx(playerid, CamionID[playerid], 0);
		}
	}
}

function SetVehicleEngine(vehicleid, playerid, accion)
{
	new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);

   	rBit1_Set(eBit1_PlayerInfo[p_StartingEngine], playerid, false);
    if(accion == 2)
    {
		SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
		Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
 	}
 	if(accion == 1)
 	{
 		new Float: f_vHealth;
 		GetVehicleHealth(vehicleid, f_vHealth);
 		if(f_vHealth > 350.0){
 			SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
 			Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 1;
 			Vehicle_Time_Gasoline[vehicleid] = gettime();
 		} else {
 			new arrancar = random(3);
 			switch(arrancar)
 			{
 				case 0, 1: 
 				{
 					ShowPlayerInfoTextdraw(playerid, "~r~Intenta encender el motor de nuevo.", 4000);
 				}
 				case 2:
 				{
 					SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
 					SetTimerEx("CheckStateVehicle", 2000, false, "d", playerid);
 					Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 1;
 				}
 			}
 		}
 	}
 	HidePlayerInfoTextdraw(playerid);
	return 1;
}

KickEx(playerid, time = 0, type = 0)
{
	PlayerInfoTemp[playerid][pt_KICKED] = true;
	if(!time) Kick(playerid);
	else
	{
		KillTimer(PlayerInfoTemp[playerid][pt_Timers][2]);
		PlayerInfoTemp[playerid][pt_Timers][2] = SetTimerEx("kickmessage", time, false, "ii", playerid, type);
	}
	return 1;
}

forward kickmessage(playerid, type);
public kickmessage(playerid, type)
{
	switch(type)
	{
		case 0: Kick(playerid);
		case 1: Ban(playerid);
	}
	return 1;
}

forward CheckCurar();
public CheckCurar()
{
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && rBit1_Get(SiendoCurado, i))
        {
            new Float:VidaPaciente;
            GetPlayerHealth(i, VidaPaciente);
            if(VidaPaciente < 100.0)
            {
                VidaPaciente += 1.0;
                SetPlayerHealthEx(i, VidaPaciente);
            } else {
                SetPlayerHealthEx(i, 100.0);
                rBit1_Set(SiendoCurado, i, false);
            }
        }
    }
    return 1;
}
public cerrarpeajelv1(playerid)
{
RotateDynamicObjectEx(peajelvabierto1, 0.0000, -91.0000, 161.2010,1.00);
RotateDynamicObjectEx(peajelvcerrado2, 0.0000, -13.0000, 162.0000,1.00);
StatePeajeLV[0] = 0;
return 1;
}

public cerrarpeajelv2(playerid)
{	
	RotateDynamicObjectEx(peajelvabierto3, 0.0000, 16.0000, 160.0000,1.00);
	RotateDynamicObjectEx(peajelvcerrado4, 0.0000, 90.0000, 161.0000,1.00);
	StatePeajeLV[1] = 0;
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(!IsPlayerLogged(playerid)) return 0;

 	if(text[0] == '!')
	{
	 //   if(PlayerInfo[playerid][pRadioC] == 0) return 0;
		new string[190];
		new banda = Player.Faction[playerid][@Index];
		new rank = PlayerInfo[playerid][p_FactionRank];
		if(PlayerInfo[playerid][p_FactionMember] == 1 && PlayerInfo[playerid][pDutyPolicia] == 1)
		{
			if(text[1] == '!') format(string, sizeof(string), "[Radio]{FFFFFF} %s - %s: (( %s ))", FactionCrew.Rank[banda][rank][@Name], GetPlayerNameEx(playerid), text[2]);
			else format(string, sizeof(string), "[Radio comunicador] {FFFFFF}%s: %s", PlayerInfoTemp[playerid][pt_Name], text[1]);			
			SendRadioMessagePolice(-1, COLOR_POLICIA, string);
			return 0;
		}
		else if(PlayerInfo[playerid][p_FactionMember] > 1)
		{
			if(text[1] == '!') format(string, sizeof(string), "{%06x}[Radio]{FFFFFF} %s - %s: (( %s ))", RGBAToRGB(DataE.CrewColor[ FactionCrew.Info[ banda ][@Color] ][@Color]), FactionCrew.Rank[banda][rank][@Name], PlayerInfo[playerid][p_Name], text[2]);
			else format(string, sizeof(string), "{%06x}[Radio] {FFFFFF}%s: %s", RGBAToRGB(DataE.CrewColor[ FactionCrew.Info[ banda ][@Color] ][@Color]), PlayerInfo[playerid][p_Name], text[1]);
			SendFactionRadioMessage(PlayerInfo[playerid][p_FactionMember], -1, string);
			return 0;
		}
		/*format(string, sizeof(string), "[Radio comunicador] %s: %s", GetPlayerNameEx(playerid), text[1]);
		ProxDetector(15.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);*/
		
 	}
 	if(OnCall[playerid] == 2 || OnCall[playerid] == 3)
	{
		new string[256],sendername[50];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s (por celular) dice: %s", sendername, text);
		SendClientMessage(MobileSub[playerid], Blanco,string);
		ProxDetector(15.0, playerid, string, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		return 0;
	}
	else if(OnCall[playerid] == 4)
	{
		new string[256];
		format(string, sizeof(string), "Oficial {FFFFFF}%s (por celular) {FFFFFF}dice: %s", GetPlayerNameEx(playerid), text);
		SendClientMessage(MobileSub[playerid], TEAM_BLUE_COLOR, string);
		ProxDetector(15.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);	
		return 0;
	}
 	if(GetPlayerDrunkLevel(playerid) > 4000)
 	{
 	    new string[128];
 	    if(PlayerInfo[playerid][p_Gender] == 1) { format(string, sizeof(string), "%s alcoholizado dice: %s", PlayerName(playerid), text);}
 	    else if(PlayerInfo[playerid][p_Gender] == 2) { format(string, sizeof(string), "%s alcoholizada dice: %s", PlayerName(playerid), text);}
		ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		return 0;
 	}
	new string[128];
	format(string, sizeof(string), "%s dice: %s", PlayerInfoTemp[playerid][pt_Name], text);
	replaceColorChatRoleplay(string);
	ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5, 85);
	format(string, sizeof(string), "%s", text);
	SetPlayerChatBubble(playerid,string,COLOR_WHITE,8.0,5000);
	return 0;
}

stock replaceColorChatRoleplay(string[], const secondaryColor[] = "{B998D7}", const primaryColor[] = "{FFFFFF}", character = '*', length = sizeof(string))
{
 	new bool:usingSecondaryColor = false;
    for(new i; i<length;i++)
    {
        if (string[i]==character)
        {
            // invertir color
            usingSecondaryColor = !usingSecondaryColor;
            
            strins(string, usingSecondaryColor ? secondaryColor : primaryColor, i, length);
            i += 8;
        }
    }
}

stock PlayerName(playerid)
{
	new pName[24];
	GetPlayerName(playerid, pName, 24);
	return pName;
}

function LoadPlayerVehicles(playerid)
{
	if(!map_valid(Player.Temp[playerid][@DataVehicles]))
	{
		Player.Temp[playerid][@DataVehicles] = map_new();	
	}

	new rows, total_vehicles, data[E_PLAYER_VEHICLES_DATA];
	cache_get_row_count(rows);
	if(rows)
	{
		for( new id = 0; id < rows; id++ )
		{
			if(total_vehicles >= 8)
			{
				break;
			}
			new type;
			new dbid, model, Float:x,Float:y,Float:z,Float:a, Float:health,color1, color2, slot, respawntime, vehicleplate[32];
			cache_get_value_name_int(id, "Car_ID", dbid);
			cache_get_value_name_int(id, "modelid", model);
			cache_get_value_name_float(id, "pos_x", x);
			cache_get_value_name_float(id, "pos_y", y);
			cache_get_value_name_float(id, "pos_z", z);
			cache_get_value_name_float(id, "pos_angle", a);
			cache_get_value_name_int(id, "color_1", color1);
			cache_get_value_name_int(id, "color_2", color2);
			cache_get_value_name_int(id, "slot", slot);
			cache_get_value_name_float(id, "health", health);
			cache_get_value_name(id, "plate", vehicleplate, 32);
			cache_get_value_name_int(id, "respawntime", respawntime);

			new idx = INVALID_VEHICLE_ID;
			if(health != 0.0) idx = CreateVehicle(model, x,y,z,a,color1,color2,-1);

			if(idx != INVALID_VEHICLE_ID) 
			{
				VEHICLES_PLAYER[idx][player_vehicle_OWNER] = PlayerInfo[playerid][pID];

				Vehicles_Info[idx][gi_vehicle_VALID] = true;
				VEHICLES_PLAYER[idx][player_vehicle_ID] = dbid;
				Vehicles_Info[idx][gi_vehicle_TYPE] = VEHICLE_TYPE_PLAYER;
				Vehicles_Info[idx][gi_vehicle_POS_X] = x;
				Vehicles_Info[idx][gi_vehicle_POS_Y] = y;
				Vehicles_Info[idx][gi_vehicle_POS_Z] = z;
				Vehicles_Info[idx][gi_vehicle_POS_ANGLE] = a;
				Vehicles_Info[idx][gi_vehicle_MODELID] = model;
				Vehicles_Info[idx][gi_vehicle_COLOR1] = color1;
				Vehicles_Info[idx][gi_vehicle_COLOR2] = color2;
				Vehicles_Info[idx][gi_vehicle_HEALTH] = health;

				cache_get_value_name_int(id, "interior", Vehicles_Info[idx][gi_vehicle_INT]);
				cache_get_value_name_int(id, "vw", Vehicles_Info[idx][gi_vehicle_VW]);
				cache_get_value_name_int(id, "component0", Vehicles_Info[idx][gi_vehicle_COMPONENTS][0]);
				cache_get_value_name_int(id, "component1", Vehicles_Info[idx][gi_vehicle_COMPONENTS][1]);
				cache_get_value_name_int(id, "component2", Vehicles_Info[idx][gi_vehicle_COMPONENTS][2]);
				cache_get_value_name_int(id, "component3", Vehicles_Info[idx][gi_vehicle_COMPONENTS][3]);
				cache_get_value_name_int(id, "component4", Vehicles_Info[idx][gi_vehicle_COMPONENTS][4]);
				cache_get_value_name_int(id, "component5", Vehicles_Info[idx][gi_vehicle_COMPONENTS][5]);
				cache_get_value_name_int(id, "component6", Vehicles_Info[idx][gi_vehicle_COMPONENTS][6]);
				cache_get_value_name_int(id, "component7", Vehicles_Info[idx][gi_vehicle_COMPONENTS][7]);
				cache_get_value_name_int(id, "component8", Vehicles_Info[idx][gi_vehicle_COMPONENTS][8]);
				cache_get_value_name_int(id, "component9", Vehicles_Info[idx][gi_vehicle_COMPONENTS][9]);
				cache_get_value_name_int(id, "component10", Vehicles_Info[idx][gi_vehicle_COMPONENTS][10]);
				cache_get_value_name_int(id, "component11", Vehicles_Info[idx][gi_vehicle_COMPONENTS][11]);
				cache_get_value_name_int(id, "component12", Vehicles_Info[idx][gi_vehicle_COMPONENTS][12]);
				cache_get_value_name_int(id, "component13", Vehicles_Info[idx][gi_vehicle_COMPONENTS][13]);
				cache_get_value_name_int(id, "lock_state", Vehicles_Info[idx][gi_vehicle_DOORS]);
				cache_get_value_name_int(id, "spawn_int", Vehicles_Info[idx][gi_vehicle_SPAWN_INT]);
				cache_get_value_name_int(id, "spawn_vw", Vehicles_Info[idx][gi_vehicle_SPAWN_VW]);
				cache_get_value_name_int(id, "damage_panels", Vehicles_Info[idx][gi_vehicle_DAMAGE_PANELS]);
				cache_get_value_name_int(id, "damage_doors", Vehicles_Info[idx][gi_vehicle_DAMAGE_DOORS]);
				cache_get_value_name_int(id, "damage_lights", Vehicles_Info[idx][gi_vehicle_DAMAGE_LIGHTS]);
				cache_get_value_name_int(id, "damage_tires", Vehicles_Info[idx][gi_vehicle_DAMAGE_TIRES]);
				cache_get_value_name(id, "paintjob", Vehicles_Info[idx][gi_vehicle_PAINTJOB]);
				cache_get_value_name_int(id, "gasoline", Vehicles_Info[idx][gi_vehicle_GAS]);

				cache_get_value_name_int(id, "type", type);
			}

			carsforplayer[playerid]++;

			switch(slot)
			{
				case 10:
				{ 
					Player.Temp[playerid][@RentVehicle] = idx;
					if(idx != INVALID_VEHICLE_ID)
					{
						Vehicles_Info[idx][gi_vehicle_OWNER] = playerid;
						Vehicles_Info[idx][gi_vehicle_TYPE] = VEHICLE_TYPE_RENT;
					}
				}
				case 11:
				{
					Vehicles_Info[idx][gi_vehicle_OWNER] = playerid;
				}
				default:
				{ 
					if(idx != INVALID_VEHICLE_ID)
					{
						Vehicles_Info[idx][gi_vehicle_OWNER] = playerid;
						Vehicles_Info[idx][gi_vehicle_PLATE_NUMBER] = vehicleplate;
						PlayerInfo[playerid][p_VehicleSlot][slot] = idx;
					}
					if(Player_VehiclesDBID[playerid][slot] == 0)
					{
						Player_VehiclesTime[playerid][slot] = respawntime;
						Player_VehiclesDBID[playerid][slot] = dbid;
						data[E_PLAYER_VEHICLES_DATA_Model] = model;
						data[E_PLAYER_VEHICLES_DATA_Plate] = str_acquire(str_new(vehicleplate));
						map_add_arr(Player.Temp[playerid][@DataVehicles], slot, data);
					}
				}
			}
			if(idx != INVALID_VEHICLE_ID)
			{

				Vehicles_Info[idx][gi_vehicle_SPAWNED] = 1;

				if(type == 0)
				{
					VEHICLES_PLAYER[idx][player_vehicle_VALID] = true;
					//
					AssignAreaForVehicles(idx);
					
					mysql_tquery_s(conexion, str_format("SELECT * FROM `lac_vehicle_boot` WHERE `id_vehicle` = %d;", VEHICLES_PLAYER[idx][player_vehicle_ID]), "LoadPlayerVehicleBoot", "d", idx);
					mysql_tquery_s(conexion, str_format("SELECT * FROM `lac_vehicle_sharedkeys` WHERE `id_vehicle` = %d LIMIT 4;", VEHICLES_PLAYER[idx][player_vehicle_ID]), "LoadPlayerVehicleSharedKeys", "d", idx);
				}

				else if(type == 1)
				{
					VEHICLES_WORKG[idx][wgi_vehicle_OWNER] = playerid;
					CamionID[playerid] = idx;
					Vehicles_Info[idx][gi_vehicle_TYPE] = VEHICLE_TYPE_WORK;
					VEHICLES_WORKG[idx][wgi_vehicle_WORK] = PlayerInfo[playerid][p_WorkTravel];

					Vehicles_Info[idx][gi_vehicle_ENGINE] = 1;
					Vehicles_Info[idx][gi_vehicle_LIGHTS] = 1;
					UpdateVehicleParams(idx);
				}
			}

			total_vehicles++;
		}
		printf("Se han cargado %d vehï¿½culos al jugador %s.", carsforplayer[playerid], PlayerName(playerid)/*VehicleInfo[idx][vOwnerName]*/);
	}
	PlayerDataLoaded(playerid);
	return 1;
}

function LoadPlayerVehicleBoot(vehicleid)
{
	new count;
	cache_get_row_count(count);

	for(new i; i < count; i++ )
	{
		new slot;

		cache_get_value_name_int(i, "slot", slot);

		cache_get_value_name_int(i, "item", Vehicle.Boot[vehicleid][slot][@Item]);
		cache_get_value_name_int(i, "amount", Vehicle.Boot[vehicleid][slot][@Amount]);
	}
	SetVehicleToRespawnEx(vehicleid, 1);
	return 1;
}

function LoadPlayerVehicleSharedKeys(vehicleid)
{
	new count;
	cache_get_row_count(count);

	for(new i; i < count; i++ )
	{
		cache_get_value_name_int(i, "id_user", Vehicles_Info[vehicleid][gi_vehicle_KEYS][i]);
	}
	return 1;
}


function CargarDatoVehiculoJugador(playerid, v, slot)
{
	VEHICLES_PLAYER[v][player_vehicle_ID] = cache_insert_id();
	if(slot < 8)
	{
		Player_VehiclesDBID[playerid][slot] = VEHICLES_PLAYER[v][player_vehicle_ID];
	}
	return 1;
}

function LoadDataID(playerid, id, type)
{
	if(type == 2)
	{
		new id_door[10];

		DoorInfo[id][dID] = cache_insert_id();
		format(id_door, 10, "%i", DoorInfo[id][dID]);


		GuardarDatoFilaFloat("lac_doors", "DoorAngleExt", DoorInfo[id][dAnguloExt], 0, "id", id_door);
		GuardarDatoFilaInt("lac_doors", "TypeDoor", DoorInfo[id][dTypeDoor], 0, "id", id_door);
		GuardarDatoFilaInt("lac_doors", "iddoor", DoorInfo[id][diddoor], 0, "id", id_door);
	}
	return 1;
}

stock SavePlayerVehicles(playerid, destroy = 1)
{
	//if(!IsPlayerLogged(playerid)) return 0;
	SavePlayerWorkVehicle(playerid, CamionID[playerid]);
	if(CamionID[playerid] != INVALID_VEHICLE_ID && destroy == 1)
	{
		CancelWorkTravelFarmer(playerid);
		CancelMissionJobLoad(playerid);
	}
	if(Player.Temp[playerid][@RentVehicle] != -1)
	{
		SavePlayerVehicleForID(playerid, Player.Temp[playerid][@RentVehicle], destroy);
	}
	for(new v=0; v<MAX_VEHICLES_PLAYER; v++)
	{
		new i = PlayerInfo[playerid][p_VehicleSlot][v];

		SavePlayerVehicleForID(playerid, i, destroy);

		if(destroy == 1)
		{
			if(Vehicles_Info[i][gi_vehicle_VALID] == true && VEHICLES_PLAYER[i][player_vehicle_OWNER] == PlayerInfo[playerid][pID])
			{
				DestroyVehicleEx(i);
				resetVehicleVariables(i);
			}
		}
	}
	return 1;
}

CMD:namedoor(playerid, params[]){
	if(!sscanf(params, "d", params[0]))
	{
		new string[128];
		format(string, sizeof(string), "El nombre de la puerta es: {5EB5FF}%s", DoorInfo[params[0]][dID]);
		SendClientMessage(playerid, Blanco, string);
	}
	return 1;
}

function CargarDatos(playerid)
{
	new rows;
	cache_get_row_count(rows);
	
	if(rows > 0)
	{
		new content_int;

		cache_get_value_name_int(0, "id", PlayerInfo[playerid][pID]);
		cache_get_value_name(0, "name", PlayerInfo[playerid][p_Name], 25);
		cache_get_value_name(0, "password", PlayerInfo[playerid][pPassword], 65);
		cache_get_value_name(0, "ip", PlayerInfo[playerid][p_IP], 18);
		cache_get_value_name_int(0, "admin", PlayerInfo[playerid][pAdmin]);
		cache_get_value_name(0, "email", PlayerInfo[playerid][pEmail], 128);
		cache_get_value_name_int(0, "gender", PlayerInfo[playerid][p_Gender]);
		cache_get_value_name_int(0, "Job", PlayerInfo[playerid][pJob]);
		cache_get_value_name_int(0, "coins", PlayerInfo[playerid][pLAC]);
		cache_get_value_name_int(0, "faction_id", PlayerInfo[playerid][p_FactionMember]);
		cache_get_value_name_int(0, "fact_rank", PlayerInfo[playerid][p_FactionRank]);
		cache_get_value_name_int(0, "jailtime", PlayerInfo[playerid][pTiempoCarcel]);
		cache_get_value_name_int(0, "Agonizando", PlayerInfo[playerid][pAgonizando]);
		cache_get_value_name_int(0, "wantedlevel", PlayerInfo[playerid][pCargos]);
		cache_get_value_name_int(0, "BankBalance", PlayerInfo[playerid][pBanco]);
		cache_get_value_name(0, "BankNumber", PlayerInfo[playerid][pNumeroBancario], 18);
		cache_get_value_name_int(0, "player_exp", PlayerInfo[playerid][p_EXP]);

		cache_get_value_name_int(0, "MinutesPlayed", PlayerInfo[playerid][pMinutesPlayed]);
		cache_get_value_name_int(0, "SecondsPlayed", PlayerInfo[playerid][pSecondsPlayed]);
		cache_get_value_name_int(0, "HoursPlayed", PlayerInfo[playerid][pHoursPlayed]);

		cache_get_value_name_int(0, "placecarcel", PlayerInfo[playerid][pPlaceCarcel]);
		//cache_get_value_name_int(0, "LastLogged", PlayerInfo[playerid][pLastTimeLogged]);
		cache_get_value_name_int(0, "QuestionTime", QuestionTime[playerid]);

		cache_get_value_name_int(0, "skin", PlayerInfo[playerid][pRopa]);
		cache_get_value_name_float(0, "health", PlayerInfo[playerid][pHealth]);
		cache_get_value_name_float(0, "armour", PlayerInfo[playerid][pChaleco]);
		cache_get_value_name_int(0, "level", PlayerInfo[playerid][p_LEVEL]);
		cache_get_value_name_float(0, "pos_x", PlayerInfo[playerid][p_POS_X]);
		cache_get_value_name_float(0, "pos_y", PlayerInfo[playerid][p_POS_Y]);
		cache_get_value_name_float(0, "pos_z", PlayerInfo[playerid][p_POS_Z]);
		cache_get_value_name_int(0, "money", PlayerInfo[playerid][pDinero]);
		cache_get_value_name_int(0, "thirst", PlayerInfo[playerid][pSed]);
		cache_get_value_name_int(0, "hungry", PlayerInfo[playerid][pHungry]);
		cache_get_value_name_int(0, "interior", PlayerInfo[playerid][pInterior]);
		cache_get_value_name_int(0, "virtualworld", PlayerInfo[playerid][pVirtualWorld]);

		cache_get_value_name_int(0, "WorkTravel", PlayerInfo[playerid][p_WorkTravel]);
		cache_get_value_name_int(0, "JobTravelT", PlayerInfo[playerid][p_JobTravelT]);
		cache_get_value_name_int(0, "JobTravel", PlayerInfo[playerid][p_JobTravel]);
		cache_get_value_name_int(0, "JobTravelNext", PlayerInfo[playerid][p_JobTravelNext]);
		cache_get_value_name_int(0, "JobMissionState", PlayerInfo[playerid][p_JobMissionState]);

		cache_get_value_name_int(0, "JobTimeRem", PlayerInfo[playerid][p_JobTimeMax]);
		cache_get_value_name_int(0, "syncupdate", PlayerInfo[playerid][p_SyncUpdate]);

		cache_get_value_name_int(0, "LastState", PlayerInfo[playerid][p_LastState]);

		cache_get_value_name_int(0, "RentMinutes", PlayerInfo[playerid][p_RentMinutes]);
		cache_get_value_name_int(0, "RentSeconds", PlayerInfo[playerid][p_RentSeconds]);

		cache_get_value_name_int(0, "LimitShopRobbery", PlayerInfo[playerid][p_LimitShopRobbery]);

		cache_get_value_name_int(0, "interior_type", PlayerInfo[playerid][p_INTERIOR_TYPE]);
		cache_get_value_name_int(0, "interior_extra", PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);

		cache_get_value_name_int(0, "configdudeoff", content_int);
		rBit1_Set(eBit1_PlayerInfo[p_ConfigChannelDudeState], playerid, content_int);

	
		PlayerInfoTemp[playerid][pt_USER_REGISTERED] = true;
	}
	TogglePlayerSpectating(playerid, true);
	InterpolateCameraPos(playerid, 1791.130737, -1570.935546, 209.488677, 1791.130737, -1570.935546, 209.488677, 4000);
 	InterpolateCameraLookAt(playerid, 1787.104736, -1567.996215, 209.098770, 1787.104736, -1567.996215, 209.098770, 4000);

	if(PlayerInfoTemp[playerid][pt_USER_REGISTERED] == true)
	{
		new string[120];
		format(string, sizeof(string), "{5EB5FF}%s{FFFFFF}, esta cuenta esta registrada.\n\nIngresa tu contraseï¿½a:", PlayerInfoTemp[playerid][pt_Name]);
		ShowPlayerDialog(playerid, LOGIN, DIALOG_STYLE_PASSWORD, "{5EB5FF}Ingresa tu cuenta", string, "Entrar", "Salir");

		PlaySongLoginEvent(playerid);
		LimpiarChat(playerid, 25, 1);
	}
	else
	{
		//new string[120];
		//format(string, sizeof(string), "{5EB5FF}%s {FFFFFF}no esta registrada.\nIngresa una contraseï¿½a para registrarte:", PlayerInfoTemp[playerid][pt_Name]);
		//ShowPlayerDialog(playerid, REGISTRO, DIALOG_STYLE_PASSWORD, "{5EB5FF}Registra una cuenta nueva", string, "Siguiente", "Salir");
    	Dialog_ReferConfirmCode(playerid);

		PlaySongLoginEvent(playerid);
		LimpiarChat(playerid, 25, 1);
	}
	return 1;
}

GuardarCuenta(playerid, logged = 0)
{
	new query[580];
	GetPlayerPos(playerid, PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z]);
	GetPlayerHealth(playerid, PlayerInfo[playerid][pHealth])/*, GetPlayerArmour(playerid, PlayerInfo[playerid][pChaleco])*/;
	//PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid), PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);

	if(!logged)
	{
		format(query, sizeof(query), "UPDATE `lac_users` SET \
			`Online`=0, `InGameID`='-1' WHERE `id`=%d;", PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, query);
	}

	new timelast = gettime();
	PlayerInfo[playerid][pLastTimeLogged] = timelast;

	mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET \
		`ip`='%q', \
		`last_connection` = CURRENT_TIMESTAMP,\
		`health`=%f, `armour`=%f, `pos_x`=%f, `pos_y`=%f, `pos_z`=%f, \
		`thirst`=%d, `hungry`=%d, `money`=%d, `interior`=%d, `virtualworld`=%d, \
		`skin`=%d, \
		`WorkTravel`=%d, `JobTravelT`=%d, `JobTravel`=%d, `JobTravelNext`=%d, \
		`JobTimeRem`=%d, \
		`Job`=%d, \
		`LastState`=%d, \
		`player_exp`=%d, `level`=%d, \
		`HoursPlayed`=%d, `MinutesPlayed`=%d, `SecondsPlayed`=%d, \
		`RentMinutes`=%d, `RentSeconds`=%d, \
		`interior_type`=%d, `interior_extra`=%d \
		WHERE `id`=%d;",
		PlayerInfo[playerid][p_IP],
		PlayerInfo[playerid][pHealth], PlayerInfo[playerid][pChaleco], PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z],
		PlayerInfo[playerid][pSed], PlayerInfo[playerid][pHungry], PlayerInfo[playerid][pDinero], PlayerInfo[playerid][pInterior], PlayerInfo[playerid][pVirtualWorld],
		PlayerInfo[playerid][pRopa], 
		PlayerInfo[playerid][p_WorkTravel], PlayerInfo[playerid][p_JobTravelT], PlayerInfo[playerid][p_JobTravel], PlayerInfo[playerid][p_JobTravelNext],
		PlayerInfo[playerid][p_JobTimeMax],
		PlayerInfo[playerid][pJob],
		PlayerInfo[playerid][p_LastState],
		PlayerInfo[playerid][p_EXP], PlayerInfo[playerid][p_LEVEL],
		PlayerInfo[playerid][pHoursPlayed], PlayerInfo[playerid][pMinutesPlayed], PlayerInfo[playerid][pSecondsPlayed],
		PlayerInfo[playerid][p_RentMinutes], PlayerInfo[playerid][p_RentSeconds],
		PlayerInfo[playerid][p_INTERIOR_TYPE], PlayerInfo[playerid][p_INTERIOR_EXTRA_ID],
		PlayerInfo[playerid][pID]));

	//printf("%s", query);
	return 1;
}
ColorJugadorDefault(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    SetPlayerColor(playerid,DEFAULT_COLOR);
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
		if(Player.Temp[playerid][@InTabInvTrans] != 0)
		{
			HidePlayerInvChangeBox(playerid);
		}
		if(rBit1_Get(eBit1_PlayerInfo[pShowInventory], playerid))
		{
			HidePlayerInventoryTextdraw(playerid);
			
 			if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	   		{
				HidePlayerPanelGPS(playerid);
			}
		}
		if(rBit4_Get(eBit4_PlayerInfo[pt_IsOpenMenuTransactions], playerid) != 0)
		{
			HidePlayerTextdrawsATM(playerid);
		}
		if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] != 0)
		{
			HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);
			HidePlayerMobilePhone(playerid);
		}
	}
	Inventory_OnPlayerClickTextDraw(playerid, Text:clickedid);
	Textdraw_OnPlayerClickTextDraw(playerid, Text:clickedid);
	if(rBit1_Get(eBit1_PlayerInfo[pShowInventory], playerid))
	{
		if(clickedid == Textdraws[sTextdraw_InventoryBox][0])
		{
			HidePlayerInventoryTextdraw(playerid);
			if(PlayerInfo[playerid][p_mPanelCatActive] == 2)
	   		{
				HidePlayerPanelGPS(playerid);
			}
			CancelSelectTextDraw(playerid);
			return 1;
		}
		else if(clickedid == Textdraws[sTextdraw_InventoryBox][4])
	    {
	    	if(PlayerInfo[playerid][p_FactionMember] == GetPlayerFactionSelectedID(playerid))
	    	{
	    		ShowDialogEx(playerid, DIALOG_FACTION_MENU);
	    	}
	    }
	    else if(clickedid == Textdraws[sTextdraw_InventoryBox][2]) // Atras
	    {
	    	if(Player.Temp[playerid][@SelectedFactionID] != -1)
	    	{
	    		await mysql_aquery_s (conexion, str_format("SELECT COUNT(*) FROM `lac_users` WHERE `faction_id`=%d;", Player.Temp[playerid][@SelectedFactionID]));

	    		new pages;
	    		cache_get_value_index_int(0, 0, pages);

	    		new Float:tpages = floatdiv(floatround(pages), 7);
	    		pages = floatround(tpages, floatround_ceil);

	    		if(Player.Temp[playerid][@FactionPage] <= 1) { Player.Temp[playerid][@FactionPage] = 0; TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]); }
				else { Player.Temp[playerid][@FactionPage]--; }

	    		HideTextdrawTabFactionBox(playerid);
				UpdateListFactionGeneral(playerid, 1, false);
	    	}
	    	else
	    	{
	    		await mysql_aquery_s (conexion, str_format("SELECT COUNT(*) FROM `lac_facciones` WHERE `Points` ORDER BY `Points` DESC LIMIT 100;", PlayerInfo[playerid][p_FactionMember]));

	    		new pages;
	    		cache_get_value_index_int(0, 0, pages);

	    		new Float:tpages = floatdiv(floatround(pages), 7);
	    		pages = floatround(tpages, floatround_ceil);

	    		if(Player.Temp[playerid][@FactionPage] <= 1) { Player.Temp[playerid][@FactionPage] = 0; TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]); }
				else { Player.Temp[playerid][@FactionPage]--; }

	    		HideTextdrawTabFactionBox(playerid);
				UpdateFactionItemList(playerid, 1, false);
	    	}
		}
	    else if(clickedid == Textdraws[sTextdraw_InventoryBox][3]) // Siguiente
	    {
	    	if(Player.Temp[playerid][@SelectedFactionID] != -1)
	    	{
	    		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]);

	    		await mysql_aquery_s (conexion, str_format("SELECT COUNT(*) FROM `lac_users` WHERE `faction_id`=%d;", Player.Temp[playerid][@SelectedFactionID]));

	    		new pages;
	    		cache_get_value_index_int(0, 0, pages);
	    		//cache_get_row_count(pages);
	    		//new Float:tpages = floatdiv(floatround(pages), MAX_FACTION_PANEL_ITEMS);
	    		//pages = floatround(tpages, floatround_ceil);
	    		pages = GetNumbersOfPageFactionList(pages);

				if(Player.Temp[playerid][@FactionPage] != pages - 1)
	    		{ 
	    			Player.Temp[playerid][@FactionPage]++;
	    			HideTextdrawTabFactionBox(playerid);
	    			UpdateListFactionGeneral(playerid, 1, false);

	    			if(Player.Temp[playerid][@FactionPage] >= pages - 2) TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);
	    		}
	    		
	    	}
	    	else
	    	{
	    		TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][2]);

	    		await mysql_aquery_s (conexion, str_format("SELECT COUNT(*) FROM `lac_facciones` WHERE `Points` ORDER BY `Points` DESC LIMIT 100;", PlayerInfo[playerid][p_FactionMember]));

	    		new pages;
	    		cache_get_value_index_int(0, 0, pages);

				pages = GetNumbersOfPageFactionList(pages);

				if(Player.Temp[playerid][@FactionPage] != pages - 1)
	    		{ 
	    			Player.Temp[playerid][@FactionPage]++;
	    			HideTextdrawTabFactionBox(playerid);
	    			UpdateFactionItemList(playerid, 1, false);

	    			if(Player.Temp[playerid][@FactionPage] >= pages - 2) TextDrawHideForPlayer(playerid, Textdraws[sTextdraw_InventoryBox][3]);
	    		}
	    	}
		}
		else if(clickedid == Textdraws[sTextdraw_InventoryButtons][0])
		{
			if(PlayerInfo[playerid][p_mPanelCatActive] == 0) return 1;

			SelectPlayerActiveInventory(playerid, 0);
	    	ShowTextdrawInventory(playerid);
		}
		else if(clickedid == Textdraws[sTextdraw_InventoryButtons][1])
		{
			if(PlayerInfo[playerid][p_mPanelCatActive] == 1) return 1;

			SelectPlayerActiveInventory(playerid, 1);
	    	CreateTextdrawInvFaction(playerid);
		}
		else if(clickedid == Textdraws[sTextdraw_InventoryButtons][2])
		{
			if(PlayerInfo[playerid][p_mPanelCatActive] == 2) return 1;

			SelectPlayerActiveInventory(playerid, 2);
	    	ShowPlayerPanelGPS(playerid);
		}
	}
	else if(Player.Temp[playerid][@InTabInvTrans] != 0)
	{
		if(clickedid == Textdraws[sTextdraw_InventoryBox][10])
		{
			HidePlayerInvChangeBox(playerid);
			CancelSelectTextDraw(playerid);
		}
		for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			if(clickedid == sTextdraw_InvChangeItems[i][0])
			{
				switch(Player.Temp[playerid][@InTabInvTrans]) // Boot
				{		
					case 1:
					{				
						if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] == INVALID_AREAIT_ID) return 1;
						new vehicleid = GetAreaIT_VehicleID(playerid);

						if(Vehicle.Boot[vehicleid][i][@Item] == 0) return 1;
						new free_slot = IsInventoryFull(playerid, Vehicle.Boot[vehicleid][i][@Item]);
						if(free_slot == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 4000);

						PlayerInventory[playerid][free_slot][invItem] = Vehicle.Boot[vehicleid][i][@Item];
						PlayerInventory[playerid][free_slot][invAmount] = Vehicle.Boot[vehicleid][i][@Amount];

						Vehicle.Boot[vehicleid][i][@Item] = 0;
						Vehicle.Boot[vehicleid][i][@Amount] = 0;

						SelectNuleItemInventory(playerid);
						SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][free_slot][invItem]][E_INV_ITEMID], free_slot);
						PlayerInfo[playerid][pInvItemSelected] = free_slot;

						new modelid = Vehicles_Info[vehicleid][gi_vehicle_MODELID]-400;
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
						SetValueProgTransDiagRight(playerid, GetVehicleInventorySizeSpace(vehicleid), Vehicles_Data_Info[modelid][vehicle_data_BOOT_SPACE]);

						Inventory_UpdateItemsTrans(playerid, free_slot, PlayerInventory[playerid][free_slot][invItem], PlayerInventory[playerid][free_slot][invAmount], i, Vehicle.Boot[vehicleid][i][@Item], Vehicle.Boot[vehicleid][i][@Amount]);
					}
					case 2, 3:
					{
						if(!map_valid(ServerGeneral_StorageMap)) return 1;
						else if(!map_has_key(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID])) return 1;
						
						new data[E_SVGENERAL_STORAGE_INFO];
						map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
						
						if(data[E_SVGENERAL_STORAGE_Item][i] == 0) return 1;

						new free_slot = IsInventoryFull(playerid, data[E_SVGENERAL_STORAGE_Item]);
						if(free_slot == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 4000);

						PlayerInventory[playerid][free_slot][invItem] = data[E_SVGENERAL_STORAGE_Item][i];
						PlayerInventory[playerid][free_slot][invAmount] = data[E_SVGENERAL_STORAGE_Amount][i];

						data[E_SVGENERAL_STORAGE_Item][i] = 0;
						data[E_SVGENERAL_STORAGE_Amount][i] = 0;
						map_set_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);

						mysql_tquery_s(conexion, str_format("DELETE FROM `lac_item_misc` WHERE `id`=%d;", data[E_SVGENERAL_STORAGE_ID][i]));

						SelectNuleItemInventory(playerid);
						SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][free_slot][invItem]][E_INV_ITEMID], free_slot);
						PlayerInfo[playerid][pInvItemSelected] = free_slot;
						
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
						SetValueProgTransDiagRight(playerid, GetStorageBackpadInvSizeSpace(Player.Temp[playerid][@InteractID]), Player.Temp[playerid][@InvTransSize]);

						Inventory_UpdateItemsTrans(playerid, free_slot, PlayerInventory[playerid][free_slot][invItem], PlayerInventory[playerid][free_slot][invAmount], i, 0, 0);
						
					}
					case 4:
					{
						if(!map_valid(ServerGeneral_StorageMap) || !map_has_key(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID])) return 1;
						
						new data[E_SVGENERAL_STORAGE_INFO];
						map_get_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);
						
						if(data[E_SVGENERAL_STORAGE_Item][i] == 0) return 1;

						new free_slot = IsInventoryFull(playerid, data[E_SVGENERAL_STORAGE_Item]);
						if(free_slot == -1) return ShowPlayerInfoTextdraw(playerid, "~r~Inventario lleno.", 4000);

						if(Player.Temp[playerid][@InteractType] == TYPE_ITEMINTERACT_SHELF)
						{
							new Pool:pool;
							GetFurnitureTypeProperty(PlayerInfo[playerid][p_INTERIOR_TYPE], PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], pool);
							new info[2];
							Streamer_GetArrayData(STREAMER_TYPE_AREA, Player.Temp[playerid][@PickedUpAreaF], E_STREAMER_EXTRA_ID, info);
						}

						PlayerInventory[playerid][free_slot][invItem] = data[E_SVGENERAL_STORAGE_Item][i];
						PlayerInventory[playerid][free_slot][invAmount] = data[E_SVGENERAL_STORAGE_Amount][i];

						data[E_SVGENERAL_STORAGE_Item][i] = 0;
						data[E_SVGENERAL_STORAGE_Amount][i] = 0;
						DestroyDynamicObject(data[E_SVGENERAL_STORAGE_Object][i]);
						data[E_SVGENERAL_STORAGE_Object][i] = INVALID_STREAMER_ID;

						map_set_arr(ServerGeneral_StorageMap, Player.Temp[playerid][@InteractID], data);

						mysql_tquery_s(conexion, str_format("DELETE FROM `lac_item_misc` WHERE `id`=%d;", data[E_SVGENERAL_STORAGE_ID][i]));

						SelectNuleItemInventory(playerid);
						SelectedItemInventory(playerid, InvObjectData[PlayerInventory[playerid][free_slot][invItem]][E_INV_ITEMID], free_slot);
						PlayerInfo[playerid][pInvItemSelected] = free_slot;
						
						SetValueProgTransDiagLeft(playerid, GetPlayerInventorySizeSpace(playerid), 16);
						SetValueProgTransDiagRight(playerid, GetStorageBackpadInvSizeSpace(Player.Temp[playerid][@InteractID]), Player.Temp[playerid][@InvTransSize]);

						Inventory_UpdateItemsTrans(playerid, free_slot, PlayerInventory[playerid][free_slot][invItem], PlayerInventory[playerid][free_slot][invAmount], i, 0, 0);
						
					}
				}
			}
		}
	}
	if(rBit4_Get(eBit4_PlayerInfo[pt_IsOpenMenuTransactions], playerid) != 0)
	{
		if(clickedid == Textdraws[sTextdraw_ATM_Button][0])
		{
			ShowDialogPlayerEx(playerid, DIALOG_BANCO1);
			return 1;
		}
		else if(clickedid == Textdraws[sTextdraw_ATM_Button][1])
		{
			ShowDialogPlayerEx(playerid, DIALOG_TRANSFER_BANK);
			return 1;
		}
		else if(clickedid == Textdraws[sTextdraw_ATM_Button][2])
		{
			ShowDialogPlayerEx(playerid, DIALOG_BANCO2);
			return 1;
		}

		else if(clickedid == Textdraws[sTextdraw_ATM_Button][3])
		{
			HidePlayerTextdrawsATM(playerid);
			return 1;
		}	
	}
	// Faction
	if(PlayerInfo[playerid][p_mPanelCatActive] == 1)
	{
		if(clickedid == Textdraws[sTextdraw_InventoryBox][6])
		{
			if(PlayerInfo[playerid][p_FactionMember] != 0)
			{
				Dialog_Show(playerid, dLeavePlayerFaction, DIALOG_STYLE_MSGBOX, "{5EB5FF}Abandonar banda", "{FFFFFF}ï¿½Estas seguro de abandonar esta banda?.", "Abandonar", "Cancelar");
			}
		}
		/*else if(clickedid == Textdraws[sTextdraw_InventoryBox][11])
		{
			if(PlayerInfo[playerid][p_FactionMember] == 0)
			{
				SendClientMessage(playerid, -1, "XD");
			}
		}*/
	}
	if(clickedid == Textdraws[sTextdraw_BoxConfirmBuyEx][5])
	{
		if(Player.Temp[playerid][@MenuSelectedType] == 1)
		{
			House_ChangeMaterialForIndex(playerid, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], Player.Temp[playerid][@MenuSelected][0]);
			HideDialogLeftMenuShop(playerid);
			RemoveMoney(playerid, Player.Temp[playerid][@MenuSelected][1], true, true);
		}
		else if(Player.Temp[playerid][@MenuSelectedType] == 2)
		{
			ShowMessageInfoEditFurniture(playerid);
			MenuV_Close(playerid);
			HideDialogLeftMenuShop(playerid);

			RemoveMoney(playerid, Player.Temp[playerid][@MenuSelected][1], true, true);

			SaveNewFurnitureObject(playerid, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], 0);

		}
	}
	else if(clickedid == Textdraws[sTextdraw_BoxConfirmBuyEx][4])
	{
		new material = SetPlayerFurnitureTypeTexture(playerid, Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot], 0);
		SetDynamicObjectMaterial(Player.Temp[playerid][@EditFurnitureObj], 0, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][4], playerid, Texture.Info[ material ][@Name]);
	}
	else if(clickedid == Textdraws[sTextdraw_BoxConfirmBuyEx][7])
	{
		new material = SetPlayerFurnitureTypeTexture(playerid, Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot2], 1);
		SetDynamicObjectMaterial(Player.Temp[playerid][@EditFurnitureObj], 1, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][7], playerid, Texture.Info[ material ][@Name]);
	}
	else if(clickedid == Textdraws[sTextdraw_BoxConfirmBuyEx][9])
	{
		new material = SetPlayerFurnitureTypeTexture(playerid, Furniture.Info[ Player.Temp[playerid][@MenuSelected][0] ][@Slot3], 2);
		SetDynamicObjectMaterial(Player.Temp[playerid][@EditFurnitureObj], 2, Texture.Info[ material ][@ModelID], Texture.Info[ material ][@TXD], Texture.Info[ material ][@Texture], Texture.Info[ material ][@Color]);
		TextDrawSetStringForPlayer(Textdraws[sTextdraw_BoxConfirmBuyEx][9], playerid, Texture.Info[ material ][@Name]);
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{

	if(rBit1_Get(eBit1_PlayerInfo[pShowInventory], playerid))
	{
	    if(playertextid == Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0])
	    {
	    	if(PlayerInfo[playerid][p_mPanelCatActive] == 0) return 1;

	    	DestroyTextdrawInvFactionAll(playerid);
	    	//CreateTextdrawInventory(playerid);
	    	ShowTextdrawInventory(playerid);
	    	for(new i = 0; i < (MAX_PLAYER_INVENTORY_ITEMS+MAX_PLAYER_INV_ITEMS_EQUIPED); i++)
			{	
				PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ItemsInventory][i]);
			}

	    	new active;
	    	active = PlayerInfo[playerid][p_mPanelCatActive];
			PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active], -1);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active]);
			
			PlayerInfo[playerid][p_mPanelCatActive] = 0;

	    	active = PlayerInfo[playerid][p_mPanelCatActive];
			PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active], COLOR_ORANGE1);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active]);
			return 1;
	    }
	   	else if(playertextid == Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1])
	    {
	    	if(PlayerInfo[playerid][p_mPanelCatActive] == 1) return 1;

	    	HidePlayerInvPanel(playerid);
	    	CreateTextdrawInvFaction(playerid);

	    	new active;
	    	active = PlayerInfo[playerid][p_mPanelCatActive];
			PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active], -1);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active]);
			
			PlayerInfo[playerid][p_mPanelCatActive] = 1;

	    	active = PlayerInfo[playerid][p_mPanelCatActive];
			PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active], COLOR_ORANGE1);
			PlayerTextDrawShow(playerid, Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][active]);
	    	return 1;
	    }
		else if(playertextid == Player_Textdraws[playerid][pTextdraw_PanelFactionDesc])
		{
			if(PlayerInfo[playerid][p_mPanelCatActive] != 1) return 1;
			if(PlayerInfo[playerid][p_FactionMember] == GetPlayerFactionSelectedID(playerid))
			{
				if(!FactionCrew.Rank[ Player.Faction[playerid][@Index] ][ PlayerInfo[playerid][p_FactionRank] ][@Permission][FACTION_RANK_CHANGE_NAME]) return 1;
				Dialog_FactionDescModify(playerid);
			}
		}
	}
	if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] != 0)
	{
		if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 2)
		{
		    for(new i = 0; i < 5; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] == playertextid)
				{
					format(Player.Temp[playerid][@CalledPlayer], 9, "%d", PlayerInfoTemp[playerid][pt_PHONE_LIST_ITEMS][i]);
					HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);

					ShowPlayerMobilePhoneMenu(playerid, 9);

				}
			}
		}
		else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 3)
		{
		    for(new i = 0; i < 5; i++)
			{
				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] == playertextid)
				{
					StartCallPhone(playerid, PlayerInfoTemp[playerid][pt_PHONE_LIST_ITEMS][i]);
				}
			}
		}
		else if(PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED] == 4)
		{
		   /* for(new i = 0; i < 4; i++)
			{

				if(Player_Textdraws[playerid][pTextdraw_Mobile_TD][i] == playertextid)
				{
					HidePlayerMobilePhoneMenu(playerid, PlayerInfoTemp[playerid][pt_PHONE_ITEM_SELECTED]);
					ShowPlayerMobilePhoneMenu(playerid, 5);

					inline GetCompleteIDPhoneSMS()
					{
						new rows;
						cache_get_row_count(rows);
						if(rows > 0)
						{
							new by_phone, to_phone, message[59];

							cache_get_value_name(0, "message", message, 51);

							cache_get_value_name_int(0, "by_phone", by_phone);
							cache_get_value_name_int(0, "to_phone", to_phone);

							strcat(message, "__");
						
							SplitTextDrawString(message, 540.0, 0.89, 1);

							TextDrawSetString(Textdraws[sTextdraw_Mobile_TD][11], message);
							TextDrawShowForPlayer(playerid, Textdraws[sTextdraw_Mobile_TD][11]);
						}

					}
					MySQL_TQueryInline(conexion, USING_INLINE__ GetCompleteIDPhoneSMS, "SELECT * FROM `lac_phone_messages` WHERE `id_message`=%d;", PlayerInfoTemp[playerid][pt_PHONE_LIST_ITEMS][i]);
				}
			}*/
		}
	}
    return 0;
}

CrearVehiculoAdmin(playerid, modelid, type, vehicletype)
{
	new Auto, Float:x, Float:y, Float:z, Float:angulo;
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        Auto = GetPlayerVehicleID(playerid);
  		GetVehiclePos(Auto, x, y, z);
        GetVehicleZAngle(Auto, angulo);
        DestroyVehicle(Auto);
    }
    else
    {
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, angulo);
    }
    if(vehicletype == 0)
    {
    	Auto = CreateVehicle(modelid, x, y, z, angulo, -1, -1, -1);
    }
    else
    {
    	Auto = AddStaticVehicleEx(modelid, x,y,z,angulo,-1,-1,-1);
    }
    EnAuto[playerid] = Auto;
    BajandoVehiculo[playerid] = 0;
    LinkVehicleToInterior(Auto, GetPlayerInterior(playerid));
    SetVehicleVirtualWorld(Auto, GetPlayerVirtualWorld(playerid));
    if(type == 0) { ClearAnimations(playerid); PutPlayerInVehicle(playerid, Auto, 0); }
	Vehicles_Info[Auto][gi_vehicle_VALID] = true;   
    Vehicles_Info[Auto][gi_vehicle_MODELID] = modelid;
    Vehicles_Info[Auto][gi_vehicle_SPAWNED] = true;
    Vehicles_Info[Auto][gi_vehicle_HEALTH] = 1000.0;
	Vehicles_Info[Auto][gi_vehicle_GAS] = GetMaxGasolineVehicle(Auto);
    return Auto;
}

public OnPlayerEnterCheckpoint(playerid)
{
	new autoid = GetPlayerVehicleID(playerid);

	if(PlayerToPoint(5.0, playerid, 1182.9551,-1323.5063,13.5781) || PlayerToPoint(5.0,playerid,2025.2396,-1409.6553,16.9922)||PlayerToPoint(5.0,playerid,1613.6582,1720.0032,10.8203)||PlayerToPoint(5.0,playerid,-2655.1831,634.0118,14.4531))
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		foreach (new i : Player)
		{
			if(!ThisInVehicleS(vehicleid, 1)) return 1;
			if(IsPlayerInVehicle(i, vehicleid) && Reanimated[i] == playerid)
			{
				Reanimated[i] = 0;
				TogglePlayerControllable(i, 1);
				DarDinero(playerid, 500);
				RemoveMoney(i, 500);
				RemovePlayerFromVehicle(i);
				PlayerInfo[i][pAgonizando] = 0;
				DarArmas(i);
				SendClientMessage(playerid, -1, "Tu paga por salvar una vida es de {00E500}$500{FFFFFF}.");
				SendClientMessage(i, -1, "Un medico logro salvarte, los gastos por el servicio son {00E500}$500{FFFFFF}.");
				DisablePlayerCheckpoint(playerid);
				return 1;
			}
		}
	}
	/*if(InPointOfDeliveryCarrier(playerid, 7.0))
	{
		if(!ThisInVehicleS(autoid, 10)) return SendClientMessage(playerid, -1, "Necesitas estar en un camiï¿½n DFT-30.");
		StateDFT[playerid] = 1;
		GameTextForPlayer(playerid, "~g~Descargando Camion... ~w~espera.", 5000, 3);
		SetTimerEx("UnloadDFT", 5000, false, "ii", playerid, 1);
		TogglePlayerControllable(playerid, 0);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}*/
	/*if(InPointCarrierCollect(playerid, 7.0))
	{
		if(!ThisInVehicleS(autoid, 10)) return SendClientMessage(playerid, -1, "Necesitas estar en un camiï¿½n DFT-30.");
		
		if(DFTReco[playerid] != INVALID_VEHICLE_ID) return 1;
		GameTextForPlayer(playerid, "~g~Cargando Camion... ~w~espera.", 5000, 3);
		SetTimerEx("LoadDFT", 5000, false, "ii", playerid, 0);
		TogglePlayerControllable(playerid, 0);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}*/
	/*if(PlayerToPoint(7.0, playerid, -1717.8540,-15.1769,3.5547) && RecoCarrier[playerid] == 15)
	{
		if(!ThisInVehicleS(autoid, 10)) return 1;
		FOREACH__ (new i : Player)
		{
			if(DFTReco[playerid] != autoid) return 1;
		}
		DFTReco[playerid] = INVALID_VEHICLE_ID;
		RecoCarrier[playerid] = 0;
		PayJobCarrier(playerid, PlayerInfo[playerid][pNivelTransportista]);
		SetVehicleToRespawn(autoid);
		RemovePlayerCP(playerid, 1);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}*/
	/*if(PlayerInfo[playerid][pMaterials] && PlayerToPoint(7.0, playerid, 2538.2864,-1474.0459,24.0193))
	{
		new string[128];
		new operation;
		operation = PlayerInfo[playerid][pMaterials]/30;
		PlayerInfo[playerid][pPiezas] = operation;
		format(string, sizeof(string), "Te crearon {5EB5FF}%d piezas de arma {FFFFFF}con tus materiales.", operation);
		SendClientMessage(playerid, -1, string);
		PlayerInfo[playerid][pMats1] = 0;
		PlayerInfo[playerid][pMats2] = 0;
		PlayerInfo[playerid][pMats3] = 0;
		PlayerInfo[playerid][pMats4] = 0;
		CheckSpeedHackJob(playerid, 3, 3);
		PlayerInfo[playerid][pMaterials] = 0;
		DisablePlayerCheckpoint(playerid);
		return 1;
	}*/
	if(PlayerInfo[playerid][pDumpP] != 0)
	{
		RecosBasu(playerid, DumpPlace[playerid], DumpTravel[playerid]);
		return 1;
	}
	if(PlayerToPoint(7.0, playerid, -112.0390,-1503.2228,3.2718) && ThisInVehicleS(autoid, 9) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new errormessage = 0, reco = random(2);
		foreach (new i : Player)
		{
			if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleSeat(i) == 1)
			{
				if(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid)/* && GetPlayerState(i) == PLAYER_STATE_PASSENGER*/)
				{
					DumpCompa[playerid]= i;
					DumpCompa[i] = playerid; 
					DumpPlace[playerid] = 1;
					DumpPlace[i] = 2;
					DisablePlayerCheckpoint(playerid);
					switch(reco)
					{
						case 0: 
						{ 
							DumpTravel[playerid] = 1; 
							DumpTravel[i] = 1; 
							SetPlayerCPN(playerid, 5, 1, 5.0); 
							SetPlayerSaveCP(playerid, 5, 1, 2);
						}
						case 1:
						{
							DumpTravel[playerid] = 2;
							DumpTravel[i] = 1;
							SetPlayerCPN(playerid, 7, 1, 5.0);
							SetPlayerSaveCP(playerid, 7, 1, 2);
						}
					}
					PlayerInfo[playerid][pDumpP] = 2;
			/*		PlayerInfo[i][pDumpP] = 1;*/
					return 1;
				}
			} else errormessage = 1;
		}
		if(errormessage == 1)
		{
			SendClientMessage(playerid, -1, "Consigue un compaï¿½ero para comenzar el recorrido.");
		}
		return 1;
	}
	if(IsPlayerPositionInMecaWorkshop(playerid))
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetVehicleModel(vehicleid)==525 && PlayerInfo[playerid][pCranePermit] != INVALID_VEHICLE_ID && GetVehicleTrailer(vehicleid) == PlayerInfo[playerid][pCranePermit])
		{
			DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
			if(PlayerInfo[playerid][pCranePermitID] != playerid) { /*PayMechanicalWork(playerid, 1);*/ }
			if(PlayerInfo[playerid][pDinero] > 500) { RemoveMoney(PlayerInfo[playerid][pCranePermitID], 500); } else{
				PlayerInfo[PlayerInfo[playerid][pCranePermitID]][pBanco] -= 500;
			}
			SendClientMessage(PlayerInfo[playerid][pCranePermitID], -1, "Te han cobrado {E40000}-$500{FFFFFF} por el servicio de grï¿½a.");
			PlayerInfo[playerid][pCranePermit] = INVALID_VEHICLE_ID;
			PlayerInfo[playerid][pCranePermitID] = INVALID_PLAYER_ID;
			DisablePlayerCheckpoint(playerid);
		}
		return 1;
	}
	/*DisablePlayerCheckpoint(playerid);*/
	return 1; // Final Checkpoints
}

public FloodTerminado(playerid){
    PlayerInfo[playerid][pDuda] = 0;
    return 1;
}
forward descongelar(playerid);
public descongelar(playerid)
{
    TogglePlayerControllable(playerid, 1);
    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
}

stock cocheocupado(vehicleid)
{
    for(new i; i<GetMaxPlayers(); i++)
    if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER) return 1;
    return 0;
}

stock ABroadCast(color,string[],level)
{
	FOREACH__ (new i : Player)
	{
		if (PlayerInfo[i][pAdmin] >= level && AdminChat[i] == 0)
		{
			SendClientMessage(i, color, string);
		}
	}
	return 1;
}

function severTimers()
//task severTimers[1000]()
{
	foreach (new i : Player)
	{
		if(IsPlayerLogged(i))
		{	
			if(Curando[i] == 1)
			{
				CurarProgress();
			}
			if(Jail[i] == 1 && !IsPlayerPaused(i))
			{
				PlayerInfo[i][pTiempoCarcel]--;
				if(PlayerInfo[i][pTiempoCarcel] <= 0)
				{
					Jail[i] = 0;
					switch(PlayerInfo[i][pPlaceCarcel])
					{
						case 1: SetPlayerPosEx(i, 256.6023,86.0400,1002.4453,90.9242);
						case 2: SetPlayerPos(i, 216.41, 120.24, 999.02);
						case 3: SetPlayerPosEx(i, 215.5190,180.2542,1003.0313,270.7888, 3, DoorInfo[57][dEnterVW]); 
					}
					SendClientMessage(i,-1,"Has cumplido tu condena, eres libre.");
					PlayerInfo[i][pTiempoCarcel] = 0; PlayerInfo[i][pPlaceCarcel] = 0;
				}
			}
			else if(San[i] == 1 && !IsPlayerPaused(i))
			{
				PlayerInfo[i][pTimeSan]--;
				if(PlayerInfo[i][pTimeSan] <= 0)
				{
					San[i] = 0;
					SetPlayerPos(i, 1493.7906,-1664.9453,14.0469);
					SetPlayerFacingAngle(i, 90.9050);
					SetInterior(i, 0);
					SetVW(i, 0);
					SendClientMessage(i, -1, "Has cumplido el tiempo de sanciï¿½n, procura no incumplir las {5EB5FF}/reglas {FFFFFF}para no volver a ser sancionado.");
					PlayerInfo[i][pTimeSan] = 0;
				}
			}
			if(WaitTime[i][2] < gettime()) // Sed
			{
				if(PlayerInfoTemp[i][pt_IsLoggedIn] == true)
				{
					if(GetPlayerInterior(i) > 0)
					{
						WaitTime[i][2] = gettime()+600;
						PlayerInfo[i][pSed]++;
						PlayerInfo[i][pHungry]++;
					}
					else
					{
						WaitTime[i][2] = gettime()+300;
						PlayerInfo[i][pSed]++;
						PlayerInfo[i][pHungry]++;
					}
					if(PlayerInfo[i][pSed] >= 100)
					{
						PlayerInfo[i][pSed] = 100;
					}
					if(PlayerInfo[i][pHungry] >= 100)
					{
						PlayerInfo[i][pHungry] = 100;						
					}
					if(PlayerInfo[i][pSed] >= 75)
					{
						ShowPlayerMessageInfoNeeds(i);

					}
					else if(PlayerInfo[i][pHungry] >= 75)
					{
						ShowPlayerMessageInfoNeeds(i);
					}
				}
			}

			PlayerInfo[i][pSecondsPlayed] += 1;
			if(PlayerInfo[i][pSecondsPlayed] >= 60) { PlayerInfo[i][pSecondsPlayed] = 0; PlayerInfo[i][pMinutesPlayed] += 1; }
			if(PlayerInfo[i][pMinutesPlayed] >= 60) 
			{ 
				PlayerInfo[i][pMinutesPlayed] = 0; 
				PlayerInfo[i][pHoursPlayed] += 1;
				CheckPlayerNextLevel(i);	

				if(PlayerInfo[i][p_LimitShopRobbery] > 0)
				{
					PlayerInfo[i][p_LimitShopRobbery] = 0;
					mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `LimitShopRobbery`=%d WHERE `id`=%d;", PlayerInfo[i][p_LimitShopRobbery], PlayerInfo[i][pID]));
				}
			}
			if(PlayerInfo[i][pTiempoCarcel] > 0)
			{
				switch(PlayerInfo[i][pPlaceCarcel])
				{
					case 1:
					{
						if(!IsPlayerInAreaZ(i, 262.0419,93.1453,1001.0190-2.0, 270.6859,75.0891,1001.0190+20.0))
						{
							LoadObjects(i);
							SetPlayerJailCell(i);
						}
					}
					case 2:
					{
						if(!IsPlayerInArea(i, 213.2769,116.9910, 229.7151,106.7448))
						{
							LoadObjects(i);
							SetPlayerJailCell(i);
						}
					}
					case 3:
					{
						if(!IsPlayerInAreaZ(i, 187.5609,155.9875,1003.0034-5.0, 200.5949,180.7817,1003.0351+30.0))
						{
							LoadObjects(i);
							SetPlayerJailCell(i);
						}
					}
				}
			}
			if(PlayerInfo[i][pTimeSan] > 0)
			{
				if(!IsPlayerInArea(i, 401.2421,308.6548, 392.2442,305.2241))
				{
					LoadObjects(i);
					Streamer_UpdateEx(i, 399.2183,306.4068,999.8996, -1, 5);
					SetPlayerPos(i, 399.2183,306.4068,999.8996);
					SetPlayerFacingAngle(i, 182.8263);
				}
			}
			if(PlayerInfo[i][pBed] > 0)
			{
				new animlib[32], animname[32];
				GetAnimationName(GetPlayerAnimationIndex(i),animlib,32,animname,32);
				if(strcmp(animlib,"INT_HOUSE",true))
				{
					if(strcmp(animname ,"BED_In_R",true))
					{
						Streamer_Update(i);
						SetPlayerMedicalBed(i, 2);
						ApplyAnimationEx(i,"INT_HOUSE","BED_In_R",4.1,0,0,0,1,0,1);
					}
				}
			}
			if(Player.Temp[i][@RentVehicle] != -1)
			{
				new string[128];
				PlayerInfo[i][p_RentSeconds]++;
				if(PlayerInfo[i][p_RentSeconds] > 59)
				{
					PlayerInfo[i][p_RentSeconds] = 0;
					PlayerInfo[i][p_RentMinutes] += 1;
					RemoveMoney(i, 25);
				}

				format(string, sizeof(string), "~w~Tiempo rentado: ~g~~h~%d %s~n~~w~Costo total: ~g~~h~$%d",((PlayerInfo[i][p_RentMinutes]) ? PlayerInfo[i][p_RentMinutes] : PlayerInfo[i][p_RentSeconds]), ((PlayerInfo[i][p_RentMinutes]) ? "min" : "seg"), (200+25*PlayerInfo[i][p_RentMinutes]));
				funct_UpdateTextDrawNotif(i, VNOTI_TYPE_RENTEDVEHICLE, string);
			}
		}
	}
	new hour, minute;
	gettime(hour, minute);
	if(minute == 1 && FactPayDay == 0)
	{
		PayDay();
		FactPayDay = 1;
	}
	if(minute == 2 && FactPayDay == 1)
	{
		FactPayDay = 0;
	}
	
	if(cronotimestate == 1)
	{
		cronotime += 1;
	}
}

function TimerRestartServer(type)
{
	if(varinreboot > 0)
	{
		varinreboot--;
		new string[128];
		if(varinreboot < varinreboottime*60) 
		{

			varinreboottime--;
			if(varinreboot > 60)
			{
				format(string, sizeof(string), "~n~~n~~n~~n~~w~Reinicio en %d minutos", varinreboot*60);
				GameTextForAll(string, 2000, 3);
			}
			else
			{
				format(string, sizeof(string), "~n~~n~~n~~n~~w~Reinicio en %d segundos", varinreboot);
				GameTextForAll(string, 2000, 3); 
			}
		}
		else if(varinreboot < 60)
		{
			format(string, sizeof(string), "~n~~n~~n~~n~~w~Reinicio en %d segundos", varinreboot);
			GameTextForAll(string, 2000, 3);
			if(varinreboot <= 4) 
			{
				if(type == 0) { SendRconCommand("gmx"); }
  				else if(type == 1) { KickAll(); }
			}
			else if(varinreboot < 2) { SendRconCommand("exit"); }
		}

	}
}

function CheckTimerTenSeconds()
{	
	if(disputed_grafiti_actived == -1)
	{
		for(new i = 0; i < MAX_FACTION_GRAFITIS; i++)
		{
			if(Grafiti.Info[i][@ID] == 0) continue;
			Grafiti.Info[i][@Time] -= 10;
			if(Grafiti.Info[i][@Time] < 1)
			{
				disputed_grafiti_actived = i;

				new MapZone:zone = GetMapZoneAtPoint(Grafiti.Info[i][@X],Grafiti.Info[i][@Y],Grafiti.Info[i][@Z]);
				GetMapZoneName(zone, Grafiti_CrewsZoneName, sizeof(Grafiti_CrewsZoneName));

				foreach (new playerid : Player)
				{
					if(!PlayerInfoTemp[playerid][pt_IsLoggedIn]) continue;

					if(PlayerInfo[playerid][p_FactionMember] != 0)
					{
						new message[50];
						format(message, sizeof(message), "Graffiti en %s", Grafiti_CrewsZoneName);
						SplitTextDrawString(message, 117.0, 0.240, 1);
						new lines = GetTextDrawLineCount(message);

						new box = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_DISPUTEGRAFITI, true, 29.0+(lines*4.0));
						funct_CreateTextdrawTextNotifEx(playerid, box, 0, "hud:radar_spray", 4);
						funct_CreateTextdrawTextNotifEx(playerid, box, 1, message, 1, 14.0);
						funct_CreateTextdrawTextNotifEx(playerid, box, 2, "Ve y comienza a pintarlo.", 1, 15.0, 14.0+(lines*4.0), 0.220, 1.1);
						UpdateNotificationForPlayer(playerid, i);

						SetPlayerDynCP(playerid, 3, Grafiti.Info[i][@PosX],Grafiti.Info[i][@PosY],Grafiti.Info[i][@PosZ],2.0, CHECKPOINT_TYPE_G_GRAFFITI);

					}	
				}
				//SetTimer("CheckPlayerSprayGrafiti", 1500, true);
				break;
			}
		}
	}
	foreach(new i : Player)
	{
		if(PlayerInfo[i][p_AnalgesicEffect] != 0)
		{
			if(PlayerInfo[i][p_AnalgesicEffect] <= 1)
			{
				PlayerInfo[i][p_AnalgesicEffect] = 0;
				funct_HideTextdrawNotif(i, VNOTI_TYPE_ANALGESICEFFECT);
			}
			else
			{
				if(PlayerInfo[i][pHealth] < 90)
				{
					if(PlayerInfo[i][pHealth] > 90) PlayerInfo[i][pHealth] = 90;
					else PlayerInfo[i][pHealth] += 1;

					SetPlayerHealthEx(i, PlayerInfo[i][pHealth]);
				}
				PlayerInfo[i][p_AnalgesicEffect] -= 1;
				UpdatePlayerNotifBar(i, VNOTI_TYPE_ANALGESICEFFECT, PlayerInfo[i][p_AnalgesicEffect]);
				
			}

		}
	}
	return 1;
}

forward ServerClock();
public ServerClock()
{
	new hour, minute;
	gettime(hour, minute);
	SetWorldTime(hour);

	new time_string[10];
	format(time_string, 10, "%02d:%02d", hour, minute);
	TextDrawSetString(Textdraws[sTextdraw_Mobile_TD][1], time_string);
	foreach (new i : Player)
	{	
		if(PlayerInfoTemp[i][pt_IsLoggedIn] == true)
		{
			if(PlayerInfo[i][pSed] == 100 || PlayerInfo[i][pHungry] == 100)
			{
				/*new Float:health;
				GetPlayerHealth(i, health);
				SetPlayerHealth(i, health-10.0);*/
				SetHealth(i, PlayerInfo[i][pHealth]-10.0);
				if(PlayerInfo[i][pHealth] <= 2.0)
				{
					SendDeathToPlayer(i);
				}
			}
			if(PlayerInfo[i][pSed] < 5)
			{
				//PlayerInfo[i][pSed] = 5;
				PlayerInfo[i][pSed] = 5;
				//UpdateBarNeedsPlayer(i);
			}
			else if(PlayerInfo[i][pHungry] < 5)
			{
				PlayerInfo[i][pHungry] = 5;
				//UpdateBarNeedsPlayer(i);
			}
		}
	}
}

/* Fin Sistema Robo al Banco */

stock GetAvailableDoorID()
{
	for(new i = 1; i<MAX_DOORS; i++)
	{
	    if(DoorInfo[i][dID] == 0) return i;
	}
	return -1;
}

stock GetAvailableHouseID()
{
	for(new i = 1; i<MAX_CASAS; i++)
	{
	    if(CasaInfo[i][id_property] == 0) return i;
	}
	return -1;
}

stock GetAvailablePropertyID()
{
	for(new i; i<MAX_PARKING; i++)
	{
	    if(ParkingInfo[i][pgID] == 0) return i;
	}
	return -1;
}

stock GetAvailableBandaID()
{
	for(new i = 1; i<MAX_FACTION; i++)
	{
	    if(BandaInfo[i][bID] == 0) return i;
	}
	return -1;
}

CargarMapeos()
{
object_plane[0] = CreateDynamicObject(14553, 821.37561, 1162.82861, 1955.67188,   356.85840, 0.00000, 3.14159);
object_plane[1] = CreateDynamicObject(14548, 823.32336, 1166.90125, 1955.41406,   356.85840, 0.00000, 3.14159);

/************ Interiores Mapeados ************/

/* Interior Garaje Casas */
new ObjectGaraje;
ObjectGaraje = CreateObject(19378, 297.67313, 305.09167, 997.25513,   0.00000, 0.00000, 0.05737);
SetObjectMaterial(ObjectGaraje, 0, 17515, "ganton01_lae2", "g_256", 0);
CreateDynamicObject(1557, 299.47891, 312.07880, 998.16431,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1966, 302.17700, 299.92670, 999.32758,   0.00000, 0.00000, 0.00000);
/* Puertas Interiores */
CreateDynamicObject(1506, -2171.09814, 639.91821, 1051.37390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1491, 20.89930, 1412.23254, 1083.42261,   0.00000, 0.00000, 269.99481, -1, 5);
CreateDynamicObject(2526, 15.49200, 1411.76978, 1083.43250,   0.00000, 0.00000, 89.78970, -1, 5);
CreateDynamicObject(2514, 18.69850, 1412.98523, 1083.43555,   0.00000, 0.00000, 1.15670, -1, 5);
CreateDynamicObject(2524, 19.64110, 1409.96411, 1083.42688,   0.00000, 0.00000, 177.78191, -1, 5);
CreateDynamicObject(2526, 33.74500, 1340.34839, 1087.87598,   0.00000, 0.00000, 0.00000, -1, 10);
CreateDynamicObject(2524, 35.51650, 1345.34802, 1087.86694,   0.00000, 0.00000, 0.00000, -1, 10);
CreateDynamicObject(2525, 36.02000, 1342.88074, 1087.87524,   0.00000, 0.00000, 269.79181, -1, 10);
CreateDynamicObject(2140, 2315.30078, -1007.62097, 1049.21118,   0.00000, 0.00000, 0.00000, -1, 9); // Refrigerador Interior 13
CreateDynamicObject(2147, 2820.39868, -1166.26648, 1024.56555,   0.00000, 0.00000, 270.26389, -1, 8); // Refrigerador Interior 15
CreateDynamicObject(2140, 2331.35449, -1135.19568, 1049.70886,   0.00000, 0.00000, 88.27760, -1, 12); //Refrigerador Interior 3
/* Puertas Roperos Interiores */
CreateDynamicObject(1567, -2171.68945, 646.21527, 1056.58960,   0.00000, 0.00000, 269.63489, -1, 1);
CreateDynamicObject(1567, 218.21660, 1250.51465, 1081.13220,   0.00000, 0.00000, 90.58190, -1, 2);
CreateDynamicObject(1567, 412.75751, 2537.54907, 8.98040,   0.00000, 0.00000, 269.93121, -1, 10);
CreateDynamicObject(1567, 244.62070, 1042.29297, 1082.99341,   0.00000, 0.00000, 89.39580, -1, 7);
CreateDynamicObject(1567, 1272.79663, -826.42133, 1084.60388,   0.00000, 0.00000, 90.17220, -1, 5);
CreateDynamicObject(1567, 2820.05981, -1168.15186, 1028.16223,   0.00000, 0.00000, 270.00491, -1, 8);
CreateDynamicObject(1567, 2270.64893, -1132.68115, 1049.61731,   0.00000, 0.00000, 270.08279, -1, 10);
CreateDynamicObject(1567, 227.37540, 1286.82336, 1081.12415,   0.00000, 0.00000, 179.93649, -1, 1);
CreateDynamicObject(1567, 245.78860, 1070.45105, 1083.17432,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1567, -70.75950, 1357.09119, 1079.19836,   0.00000, 0.00000, 90.00140, -1, 6);
CreateDynamicObject(1567, 256.28851, 1243.30811, 1083.24573,   0.00000, 0.00000, -0.18000, -1, 9);
CreateDynamicObject(1567, 288.47729, 1477.17749, 1079.24219,   0.00000, 0.00000, 89.79530, -1, 15);
CreateDynamicObject(1567, 15.09240, 1403.00525, 1083.42468,   0.00000, 0.00000, -0.00520, -1, 5);
CreateDynamicObject(1567, 28.94850, 1339.89612, 1087.86206,   0.00000, 0.00000, 0.00130, -1, 10);
CreateDynamicObject(1567, 232.35530, 1211.28552, 1083.36316,   0.00000, 0.00000, 89.91220, -1, 3);
CreateDynamicObject(1567, -276.10040, 1458.63635, 1087.86230,   0.00000, 0.00000, 0.00000, -1, 4);
CreateDynamicObject(1567, -297.16739, 1475.03833, 1087.86365,   0.00000, 0.00000, 0.00000, -1, 15);
CreateDynamicObject(1567, 92.57420, 1332.11780, 1087.35522,   0.00000, 0.00000, 0.00000, -1, 9);
CreateDynamicObject(1567, 2562.41406, -1282.56702, 1059.97583,   0.00000, 0.00000, 90.00000, -1, 2);
/* Mapeo Trabajo Lechero */
/*CreateDynamicObject(19833, -369.26511, -1040.94373, 58.35040,   1.00200, 0.00000, 283.00000);
CreateDynamicObject(19833, -357.03091, -1041.48669, 58.40240,   0.00000, 0.00000, 84.42150);
CreateDynamicObject(19839, -356.04776, -1041.95886, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.81265, -1041.06543, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -356.14252, -1041.20935, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.78607, -1041.85193, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.78217, -1042.27417, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.95972, -1041.49854, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.45880, -1041.69104, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -355.45297, -1042.01941, 58.36280,   0.00000, 0.00000, -0.06000);
CreateDynamicObject(19839, -355.62753, -1041.30212, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -370.28299, -1041.34924, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -370.67700, -1041.25708, 58.36280,   0.00000, 0.00000, -0.06000);
CreateDynamicObject(19839, -370.59299, -1040.88184, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -369.93777, -1041.33923, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -370.64963, -1040.64343, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -370.32013, -1040.62512, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -369.88287, -1040.59155, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -369.87488, -1040.91223, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -370.20676, -1040.99219, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -356.22318, -1041.64172, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -356.19516, -1042.10596, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -356.51105, -1041.82336, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19839, -356.48282, -1041.41992, 58.36280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19833, -590.75140, -1510.31934, 9.57090,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19833, -588.78522, -1515.14807, 9.49900,   0.00000, 0.00000, -62.00000);
CreateDynamicObject(19833, -595.70142, -1511.81628, 10.64230,   -6.00000, 4.00000, -142.00000);
CreateDynamicObject(19833, -43.45251, 96.21442, 2.10700,   0.00000, 0.00000, 253.16730);
CreateDynamicObject(19833, -43.45251, 96.21442, 2.10700,   0.00000, 0.00000, 253.16730);
CreateDynamicObject(19833, -41.14943, 95.40483, 2.10700,   0.00000, 0.00000, 84.00000);
CreateDynamicObject(19833, -38.07900, 94.15560, 2.10100,   0.00000, 0.00000, -98.00000);
CreateDynamicObject(19833, -36.03273, 93.42547, 2.10100,   0.00000, 0.00000, 70.55205);*/
/* Mapeo Trabajo Lechero Decoraciones */
CreateDynamicObject(17055, -1423.33191, -1461.98645, 102.93272,   356.85840, 0.00000, 3.14159);
CreateDynamicObject(1999, -1433.85950, -1543.75684, 100.72870,   0.00000, 0.00000, 359.42661);
CreateDynamicObject(19366, -1437.23328, -1543.64734, 102.34430,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19366, -1437.23193, -1540.44104, 102.34430,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1806, -1433.73816, -1544.85144, 100.77750,   0.00000, 0.00000, 0.00000);
/* Mapeo Exterior LSPD */
CreateDynamicObject(19273, 1582.42737, -1637.81934, 13.86150,   0.00000, 0.00000, 179.28810);
PuertasLSPD[4] = CreateDynamicObject(1495, 1582.61279, -1637.96521, 12.36460,   0.00000, 0.00000, 359.28275);
CreateDynamicObject(19444, 1583.32458, -1637.96545, 16.61180,   0.00000, 0.00000, 269.19751);
PuertasLSPD[0] = CreateDynamicObject(19912, 1596.05969, -1638.04907, 15.04160,   0.00000, 0.00000, 0.64380);
PuertasLSPD[1] = CreateDynamicObject(968, 1544.68994, -1630.81506, 13.21630,   0.00000, 91.00000, 90.00000);
CreateDynamicObject(970, 1544.36194, -1635.00537, 13.08210,   0.00000, 0.00000, 271.09369);
CreateDynamicObject(970, 1544.57837, -1620.50598, 13.06810,   0.00000, 0.00000, 271.09369);
CreateDynamicObject(19273, 1582.43494, -1638.36926, 13.86150,   0.00000, 0.00000, 1.29880);
/* Mapeo Interior LSPD */
CreateDynamicObject(19392, 217.79890, 116.57640, 999.76318,   0.00000, 0.00000, 269.88690);
PuertasLSPD[3] = CreateDynamicObject(1495, 218.5721, 116.5993, 998.0111, 0.00000, 0.00000, 179.89970);
CreateDynamicObject(1569, 275.78781, 121.35100, 1003.61481,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(19303, 226.53700, 112.62590, 999.26630,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19302, 228.27831, 112.59500, 999.26422,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19304, 227.39690, 112.61660, 1001.13757,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1800, 228.50549, 105.99860, 998.00043,   0.00000, 0.00000, 358.69730);
CreateDynamicObject(1800, 224.42140, 106.07260, 998.01031,   0.00000, 0.00000, 358.74881);
CreateDynamicObject(1800, 220.42590, 105.98770, 998.01031,   0.00000, 0.00000, 358.74881);
CreateDynamicObject(19304, 215.57719, 112.60380, 1001.16351,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19302, 224.36740, 112.62960, 999.25623,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19303, 222.60480, 112.62780, 999.26630,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19304, 223.48820, 112.60460, 1001.09351,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19273, 216.52090, 116.67180, 999.39587,   0.00000, 0.00000, 180.77600);
CreateDynamicObject(1216, 213.89830, 115.11960, 998.67932,   0.00000, 0.00000, 89.43438);
CreateDynamicObject(1216, 229.10980, 115.19610, 998.67932,   0.00000, 0.00000, 270.26590);
CreateDynamicObject(1242, 248.97577, 73.03828, 1002.80157,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(334, 250.32590, 72.81880, 1003.71973,   0.00000, -185.00000, 359.00809);
CreateDynamicObject(334, 250.44351, 72.81725, 1003.71973,   0.00000, -185.00000, 359.00809);
CreateDynamicObject(334, 250.53511, 72.84788, 1003.74957,   0.00000, -185.00000, 359.00809);
CreateDynamicObject(1242, 248.64856, 73.01536, 1002.80157,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1242, 248.49750, 73.32140, 1002.80157,   9.00000, 0.00000, 274.00000);
CreateDynamicObject(1242, 248.78200, 73.17710, 1002.80157,   18.00000, 0.00000, 360.00000);
CreateDynamicObject(334, 250.17101, 72.80510, 1003.70770,   0.00000, -185.00000, 359.00809);
CreateDynamicObject(334, 250.27219, 72.83174, 1003.71973,   0.00000, -185.00000, 359.00809);
CreateDynamicObject(19273, 216.50690, 116.39180, 999.39587,   0.00000, 0.00000, 0.69300);
CreateDynamicObject(1800, 216.50970, 105.99940, 998.01031,   0.00000, 0.00000, 358.74881);
CreateDynamicObject(19303, 214.70979, 112.62810, 999.30988,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19302, 216.45430, 112.62950, 999.25958,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19303, 218.62990, 112.61030, 999.29633,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19302, 220.37711, 112.61120, 999.29620,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19304, 219.50301, 112.60100, 1001.16351,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19395, 258.99380, 90.78340, 1003.18530,   0.00000, 0.00000, 0.00000);
PuertasLSPD[5] = CreateDynamicObject(1495, 258.98190, 91.55490, 1001.44067,   0.00000, 0.00000, 269.05939);
CreateDynamicObject(19302, 266.33340, 82.98650, 1001.29218,   0.00000, 0.00000, 269.72141);
CreateDynamicObject(19302, 266.30920, 87.46710, 1001.29218,   0.00000, 0.00000, 91.00000);
PuertasLSPD[6] = CreateDynamicObject(1495, 248.09219, 75.05500, 1002.62927,   0.00000, 0.00000, 90.20370);
CreateDynamicObject(19395, 248.06680, 75.79070, 1004.39313,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 262.61990, 107.33510, 1003.61249,   0.00000, 0.00000, -179.63271);
CreateDynamicObject(11729, 261.97589, 107.33510, 1003.61249,   0.00000, 0.00000, -179.63271);
CreateDynamicObject(11730, 261.31311, 107.32300, 1003.61261,   0.00000, 0.00000, -178.00000);
CreateDynamicObject(1242, 260.63000, 112.21980, 1003.77521,   0.00000, 0.00000, -69.00000);
CreateDynamicObject(1242, 260.64990, 111.96490, 1003.77521,   0.00000, 0.00000, 251.00000);
CreateDynamicObject(1242, 260.60971, 111.70080, 1003.77509,   0.00000, 0.00000, -113.00000);
CreateDynamicObject(11729, 263.25189, 107.33510, 1003.61249,   0.00000, 0.00000, -179.63271);
CreateDynamicObject(334, 268.18961, 109.15130, 1004.73767,   0.00000, 0.00000, 74.21370);
CreateDynamicObject(334, 268.18961, 108.95330, 1004.73767,   0.00000, 0.00000, 74.21370);
CreateDynamicObject(334, 268.18961, 108.75530, 1004.73767,   0.00000, 0.00000, 74.21370);
CreateDynamicObject(334, 268.18961, 108.55730, 1004.73767,   0.00000, 0.00000, 74.21370);
CreateDynamicObject(334, 268.18961, 109.34930, 1004.73767,   0.00000, 0.00000, 74.21370);
CreateDynamicObject(19395, 265.84860, 112.56200, 1005.35858,   0.00000, 0.00000, -90.00000);
PuertasLSPD[7] = CreateDynamicObject(1495, 265.11209, 112.54650, 1003.61682,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1800, 265.87350, 84.92760, 1000.02161,   0.00000, 0.00000, 89.00000);
CreateDynamicObject(1800, 265.87350, 80.50060, 1000.02161,   0.00000, 0.00000, 89.00000);
CreateDynamicObject(1800, 265.90491, 75.98300, 1000.02161,   0.00000, 0.00000, 89.00000);
CreateDynamicObject(11729, 221.62669, 78.46540, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 221.62669, 77.61940, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 221.62669, 76.77340, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 221.62669, 75.92740, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 221.62669, 75.08140, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 221.62669, 74.23540, 1004.03668,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(11729, 219.31531, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 218.51630, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 217.67030, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 216.82430, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 216.02530, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 215.13229, 74.10910, 1004.03668,   0.00000, 0.00000, -180.00000);
CreateDynamicObject(11729, 214.17220, 75.89410, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 76.78710, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 77.68010, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 78.62010, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 79.60710, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 80.54710, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 81.44010, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 214.17220, 82.52110, 1004.03668,   0.00000, 0.00000, -270.00000);
CreateDynamicObject(11729, 215.95160, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 216.75960, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 217.57961, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 218.39960, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 219.26060, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11729, 220.12160, 82.64450, 1004.03668,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1495, 244.86211, 75.09730, 1002.62988,   0.00000, 0.00000, 90.20370);
CreateDynamicObject(19395, 244.82590, 75.83190, 1004.39313,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19305, 244.40359, 76.86260, 1003.76031,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19305, 244.87560, 76.91860, 1003.76031,   0.00000, 0.00000, 90.00000);
//
/* Decoracion Interior Restaurante */
CreateDynamicObject(19455, -796.52869, 494.06619, 1367.81689,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1567, -796.45471, 493.04810, 1366.34692,   0.00000, 0.00000, 269.92441, -1, 1);
CreateDynamicObject(1566, -796.24738, 508.75241, 1372.23035,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1566, -793.07318, 508.76569, 1372.23035,   0.00000, 0.00000, 180.09760, -1, 1);
CreateDynamicObject(2635, -783.72522, 502.50824, 1371.14771,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -785.07532, 502.52020, 1370.73779,   0.00000, 0.00000, 88.74420, -1, 1);
CreateDynamicObject(1720, -782.35480, 502.58261, 1370.73779,   0.00000, 0.00000, 269.72021, -1, 1);
CreateDynamicObject(1720, -787.05334, 502.51984, 1370.73779,   0.00000, 0.00000, 269.72021, -1, 1);
CreateDynamicObject(2635, -788.43140, 502.47998, 1371.14771,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -789.77423, 502.52631, 1370.73779,   0.00000, 0.00000, 88.74420, -1, 1);
CreateDynamicObject(1720, -792.24170, 500.37320, 1370.64197,   0.00000, 0.00000, 86.59140, -1, 1);
CreateDynamicObject(1720, -792.24170, 501.13181, 1370.64197,   0.00000, 0.00000, 86.59140, -1, 1);
CreateDynamicObject(1720, -782.40320, 504.26550, 1370.73779,   0.00000, 0.00000, 269.72021, -1, 1);
CreateDynamicObject(2635, -783.78717, 504.20786, 1371.14771,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -785.12488, 504.23679, 1370.73779,   0.00000, 0.00000, 88.74420, -1, 1);
CreateDynamicObject(1720, -789.83740, 504.26019, 1370.73779,   0.00000, 0.00000, 88.74420, -1, 1);
CreateDynamicObject(2635, -788.49530, 504.23111, 1371.14771,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -787.11768, 504.28851, 1370.73779,   0.00000, 0.00000, 269.72021, -1, 1);
CreateDynamicObject(2635, -790.97821, 509.51480, 1371.14771,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -789.54901, 509.51981, 1370.73779,   0.00000, 0.00000, 269.72021, -1, 1);
CreateDynamicObject(1720, -792.35150, 509.54620, 1370.73779,   0.00000, 0.00000, 89.12630, -1, 1);
CreateDynamicObject(1720, -783.93958, 509.23389, 1370.73779,   0.00000, 0.00000, 0.32270, -1, 1);
CreateDynamicObject(2747, -783.91022, 508.69440, 1371.14941,   0.00000, 0.00000, 270.23050, -1, 1);
CreateDynamicObject(1720, -783.46252, 508.55273, 1370.73779,   0.00000, 0.00000, 269.72141, -1, 1);
CreateDynamicObject(1720, -784.34802, 508.61191, 1370.73779,   0.00000, 0.00000, 89.76960, -1, 1);
CreateDynamicObject(1720, -788.90460, 507.87579, 1370.73779,   0.00000, 0.00000, 89.76960, -1, 1);
CreateDynamicObject(1720, -787.48468, 509.60431, 1370.73779,   0.00000, 0.00000, 0.32274, -1, 1);
CreateDynamicObject(2747, -787.50879, 507.89050, 1371.14941,   0.00000, 0.00000, 270.23050, -1, 1);
CreateDynamicObject(1720, -786.05212, 507.86441, 1370.73779,   0.00000, 0.00000, 269.72141, -1, 1);
CreateDynamicObject(1720, -783.89331, 508.19089, 1370.73779,   0.00000, 0.00000, 180.65710, -1, 1);
CreateDynamicObject(2635, -788.25244, 490.76242, 1375.63977,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -787.20319, 498.37363, 1375.19592,   0.00000, 0.00000, 360.00000, -1, 1);
CreateDynamicObject(1720, -786.89124, 490.77701, 1375.19592,   0.00000, 0.00000, 269.82239, -1, 1);
CreateDynamicObject(1720, -787.15863, 495.49799, 1375.19592,   0.00000, 0.00000, 180.15669, -1, 1);
CreateDynamicObject(1720, -789.72290, 490.91898, 1375.19592,   0.00000, 0.00000, 88.78785, -1, 1);
CreateDynamicObject(2635, -780.69250, 508.32889, 1371.16125,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -780.64709, 509.73810, 1370.73779,   0.00000, 0.00000, 360.00000, -1, 1);
CreateDynamicObject(1720, -782.09222, 508.31079, 1370.73779,   0.00000, 0.00000, 87.23580, -1, 1);
CreateDynamicObject(1720, -780.68988, 506.96600, 1370.73779,   0.00000, 0.00000, 180.15669, -1, 1);
CreateDynamicObject(1720, -779.21869, 508.34720, 1370.73779,   0.00000, 0.00000, 269.82239, -1, 1);
CreateDynamicObject(1720, -788.68469, 496.96689, 1375.19592,   0.00000, 0.00000, 88.78780, -1, 1);
CreateDynamicObject(2635, -787.20203, 496.92841, 1375.63977,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(1720, -785.78119, 496.99619, 1375.19592,   0.00000, 0.00000, 269.82239, -1, 1);
CreateDynamicObject(2100, -782.91852, 487.97729, 1375.19531,   0.00000, 0.00000, 180.41119, -1, 1);
CreateDynamicObject(2222, -788.68182, 502.49640, 1371.63953,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(2222, -788.15131, 502.48840, 1371.63953,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(2683, -790.95435, 509.58810, 1371.69531,   0.00000, 0.00000, 0.00000, -1, 1);
CreateDynamicObject(2353, -787.75031, 507.89566, 1371.61353,   -24.83740, 23.29720, 252.16850, -1, 1);
CreateDynamicObject(2353, -787.74390, 508.38589, 1371.61353,   -24.83740, 23.29720, 252.16850, -1, 1);
/* Mapeo Armero */
CreateDynamicObject(19456, 2539.80835, -1478.06409, 24.62310,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19456, 2511.50562, -1465.06995, 24.62710,   0.00000, 0.00000, 90.99820);
CreateDynamicObject(18663, 2539.90332, -1475.05286, 24.26440,   0.00000, 0.00000, 0.25670);
CreateDynamicObject(19456, 2521.13037, -1464.90173, 24.62710,   0.00000, 0.00000, 90.99820);
CreateDynamicObject(19456, 2530.75562, -1464.73364, 24.62710,   0.00000, 0.00000, 90.99820);
CreateDynamicObject(19456, 2537.65698, -1468.98877, 24.62710,   0.00000, 0.00000, 26.64480);
/* Mapeo Trabajo Piloto Aeropuerto LS*/
CreateDynamicObject(19509, 1948.68579, -2221.37622, 15.27890,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3475, 1956.84863, -2227.11035, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1962.79504, -2227.07568, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1968.73657, -2227.11353, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1974.70105, -2227.18091, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1980.62939, -2227.27563, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1986.61914, -2227.35742, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1992.60278, -2227.32300, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 1998.53723, -2227.36621, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(3475, 2004.53040, -2227.36938, 12.82530,   0.00000, 0.00000, 89.92540);
CreateDynamicObject(19510, 1948.68555, -2221.37134, 15.27930,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3475, 2055.06885, -2222.93945, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.97998, -2217.07056, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.98242, -2211.13501, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.94238, -2205.18213, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.82129, -2199.29224, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.79175, -2193.38477, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.70752, -2187.48779, 12.82530,   0.00000, 0.00000, 0.72136);
CreateDynamicObject(3475, 2054.59375, -2181.64819, 12.82530,   0.00000, 0.00000, 0.72140);
CreateDynamicObject(3475, 2054.94971, -2228.84595, 12.82530,   0.00000, 0.00000, 358.22165);
CreateDynamicObject(19466, 1951.19360, -2218.02881, 14.74820,   0.00000, 0.00000, 270.26260);
CreateDynamicObject(19466, 1945.79871, -2217.96240, 14.74820,   0.00000, 0.00000, 270.26260);
CreateDynamicObject(19378, 1948.47107, -2222.64917, 12.54480,   0.00000, 90.29150, 0.00920);
CreateDynamicObject(1998, 1944.46521, -2225.54785, 12.65299,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1998, 1946.42542, -2224.53979, 12.65300,   0.00000, 0.00000, 270.24939);
CreateDynamicObject(2164, 1946.11475, -2227.07666, 12.75430,   0.00000, 0.00000, 179.94000);
CreateDynamicObject(1714, 1945.09070, -2225.93042, 12.64150,   0.00000, 0.00000, -207.00000);
CreateDynamicObject(1724, 1944.30579, -2219.21655, 12.63150,   0.00000, 0.00000, 42.68290);
CreateDynamicObject(1723, 1952.92273, -2218.68237, 12.59150,   0.00000, 0.00000, 270.17270);
/* Mapeo Casas Commerce */
/*CreateDynamicObject(3443, 1533.16077, -1768.65820, 15.42170,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3443, 1471.32495, -1768.59399, 15.42370,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3443, 1440.39417, -1768.59399, 15.42370,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19533, 1528.86060, -1788.78979, 12.55860,   0.00000, 0.00000, 269.69199);
CreateDynamicObject(19533, 1466.68420, -1788.44580, 12.55960,   0.00000, 0.00000, 269.69199);
CreateDynamicObject(19533, 1430.22131, -1788.26440, 12.57860,   0.00000, 0.00000, 269.69199);
CreateDynamicObject(1283, 1559.48108, -1791.85706, 15.57200,   357.00000, 0.00000, -91.00000);
CreateDynamicObject(1226, 1548.21167, -1783.62805, 16.66440,   3.00000, 0.00000, 93.00000);
CreateDynamicObject(1226, 1517.45093, -1783.53516, 16.66440,   3.00000, 0.00000, 93.00000);
CreateDynamicObject(1226, 1486.45557, -1783.22961, 16.66440,   3.00000, 0.00000, 93.00000);
CreateDynamicObject(1226, 1455.44141, -1783.13635, 16.66440,   3.00000, 0.00000, 93.00000);
CreateDynamicObject(1283, 1399.54749, -1791.02478, 15.57200,   357.00000, 0.00000, 270.12540);
CreateDynamicObject(1280, 1468.98438, -1713.50781, 13.45313,   3.14159, 0.00000, 0.00000);
CreateDynamicObject(3515, 1479.72363, -1813.47900, 14.33610,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(18765, 1480.10889, -1813.54761, 10.94802,   0.00000, 0.00000, 359.87799);
CreateDynamicObject(9833, 1479.25244, -1813.47083, 18.34090,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3607, 1428.75366, -1815.02576, 18.65510,   0.00000, 0.00000, 180.12360);
CreateDynamicObject(3604, 1454.16785, -1821.59802, 15.10030,   0.00000, 0.00000, 91.40604);
CreateDynamicObject(3607, 1529.34521, -1815.03882, 18.52590,   0.00000, 0.00000, 180.23959);
CreateDynamicObject(3604, 1506.04773, -1821.69177, 15.10030,   0.00000, 0.00000, 270.34161);
CreateDynamicObject(1368, 1479.83875, -1803.51941, 13.23280,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1368, 1489.24158, -1813.30017, 13.23280,   0.00000, 0.00000, 270.28229);
CreateDynamicObject(3443, 1502.22778, -1768.45398, 15.42170,   0.00000, 0.00000, 0.00000);*/
/* Mapeo Interior Emisoras */
CreateDynamicObject(14597, 427.44525, 66.57749, 1021.38086,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1566, 440.62469, 65.26960, 1020.77283,   0.00000, 0.00000, 90.29310, -1, 6);
CreateDynamicObject(1566, 440.62360, 68.43860, 1020.77283,   0.00000, 0.00000, 269.48300, -1, 6);
CreateDynamicObject(19358, 429.01691, 69.88880, 1021.05835,   0.00000, 0.00000, 270.15558, -1, 6);
CreateDynamicObject(19358, 438.11801, 63.25800, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 433.16803, 69.91120, 1021.06519,   0.00000, 0.00000, 270.15561, -1, 6);
PuertasEmisoras[2] = CreateDynamicObject(1500, 436.54001, 63.31400, 1019.37592,   0.00000, 0.00000, 180.28070, -1, 6);
CreateDynamicObject(19358, 438.11560, 63.09810, 1021.06763,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 433.15680, 63.04420, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 429.01291, 70.09280, 1021.05829,   0.00000, 0.00000, 270.15561, -1, 6);
PuertasEmisoras[0] = CreateDynamicObject(1500, 425.64691, 69.84430, 1019.37592,   0.00000, 0.00000, 0.09360, -1, 6);
CreateDynamicObject(19358, 424.07239, 69.89820, 1021.05829,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 424.07239, 70.03820, 1021.05829,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(14391, 434.87369, 79.25800, 1020.33728,   0.00000, 0.00000, 269.85281, -1, 6);
CreateDynamicObject(1998, 438.04041, 72.43000, 1019.37799,   0.00000, 0.00000, 89.77440, -1, 6);
/*CreateDynamicObject(19305, 427.57669, 69.81480, 1020.67920,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(19305, 427.63669, 70.16260, 1020.65918,   0.00000, 0.00000, 180.22810, -1, 6);*/
CreateDynamicObject(1723, 431.82239, 71.86320, 1019.37451,   0.00000, 0.00000, 90.30940, -1, 6);
CreateDynamicObject(1714, 434.21539, 76.76650, 1019.37793,   0.00000, 0.00000, 153.75470, -1, 6);
CreateDynamicObject(630, 431.90778, 70.73006, 1020.41229,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1714, 438.31750, 73.33330, 1019.37793,   0.00000, 0.00000, 271.22809, -1, 6);
CreateDynamicObject(14391, 427.25540, 54.37840, 1020.33081,   0.00000, 0.00000, 89.86840, -1, 6);
CreateDynamicObject(1714, 427.96011, 56.77810, 1019.37433,   0.00000, 0.00000, 330.91330, -1, 6);
CreateDynamicObject(1723, 430.34259, 61.50190, 1019.38110,   0.00000, 0.00000, 270.24561, -1, 6);
CreateDynamicObject(630, 430.47925, 62.51296, 1020.41217,   0.00000, 0.00000, 0.00000, -1, 6);
/*CreateDynamicObject(19305, 434.57800, 63.35020, 1020.73383,   0.00000, 0.00000, 180.14931, -1, 6);
CreateDynamicObject(19305, 434.56650, 62.98100, 1020.70178,   0.00000, 0.00000, 359.79031, -1, 6);*/
CreateDynamicObject(1998, 423.99136, 60.11633, 1019.38159,   0.00000, 0.00000, 359.48837, -1, 6);
CreateDynamicObject(1714, 424.90881, 59.89595, 1019.38171,   0.00000, 0.00000, 178.47040, -1, 6);
PuertasEmisoras[1] = CreateDynamicObject(1500, 434.99460, 69.87540, 1019.37592,   0.00000, 0.00000, 0.09360, -1, 6);
CreateDynamicObject(19358, 438.11691, 69.89260, 1021.06519,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 433.15540, 70.06670, 1021.06519,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 438.11691, 70.05260, 1021.06519,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(14391, 427.07599, 79.25710, 1020.32727,   0.00000, 0.00000, 269.85281, -1, 6);
CreateDynamicObject(1714, 425.97449, 76.96990, 1019.37793,   0.00000, 0.00000, 153.75470, -1, 6);
CreateDynamicObject(1723, 424.04971, 71.91740, 1019.37451,   0.00000, 0.00000, 90.30940, -1, 6);
CreateDynamicObject(630, 424.12177, 70.72060, 1020.41229,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1998, 430.18903, 70.93053, 1019.37799,   0.00000, 0.00000, 89.77444, -1, 6);
CreateDynamicObject(1714, 430.45309, 71.81030, 1019.37793,   0.00000, 0.00000, 271.22809, -1, 6);
/*CreateDynamicObject(19305, 436.96371, 69.82730, 1020.64917,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(19305, 436.97070, 70.12520, 1020.64917,   0.00000, 0.00000, 180.77170, -1, 6);*/
CreateDynamicObject(1557, 418.80060, 63.63010, 1019.39282,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1557, 421.83069, 63.63200, 1019.39282,   0.00000, 0.00000, 180.25040, -1, 6);
CreateDynamicObject(1998, 415.79990, 68.94240, 1019.37128,   0.00000, 0.00000, 270.98309, -1, 6);
CreateDynamicObject(1998, 416.84720, 67.00350, 1019.37927,   0.00000, 0.00000, -179.00000, -1, 6);
CreateDynamicObject(2164, 414.33859, 67.30840, 1019.38782,   0.00000, 0.00000, 90.17400, -1, 6);
CreateDynamicObject(1714, 415.51331, 68.23590, 1019.37952,   0.00000, 0.00000, 73.84502, -1, 6);
CreateDynamicObject(1714, 415.92252, 67.21046, 1019.37952,   0.00000, 0.00000, 1.49167, -1, 6);
CreateDynamicObject(19358, 433.15680, 63.28020, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 429.03949, 63.23860, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 429.03949, 63.11860, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
PuertasEmisoras[3] = CreateDynamicObject(1500, 427.19760, 63.34500, 1019.37592,   0.00000, 0.00000, 180.28070, -1, 6);
CreateDynamicObject(19358, 424.07150, 63.27460, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(19358, 424.07150, 63.13060, 1021.06561,   0.00000, 0.00000, 270.15561, -1, 6);
CreateDynamicObject(630, 438.17130, 62.41352, 1020.41217,   0.00000, 0.00000, 0.00000, -1, 6);
CreateDynamicObject(1723, 438.14160, 61.47540, 1019.38110,   0.00000, 0.00000, 270.24561, -1, 6);
CreateDynamicObject(1714, 432.81830, 61.06540, 1019.38171,   0.00000, 0.00000, 178.47040, -1, 6);
CreateDynamicObject(1998, 431.91611, 61.34150, 1019.38159,   0.00000, 0.00000, 358.55151, -1, 6);
CreateDynamicObject(1714, 435.62729, 56.29240, 1019.37433,   0.00000, 0.00000, 330.91330, -1, 6);
CreateDynamicObject(14391, 435.01331, 53.91880, 1020.33081,   0.00000, 0.00000, 89.86840, -1, 6);
/*CreateDynamicObject(19305, 425.23111, 63.34190, 1020.75378,   0.00000, 0.00000, 180.14931, -1, 6);
CreateDynamicObject(19305, 425.21790, 63.07180, 1020.74377,   0.00000, 0.00000, 359.20480, -1, 6);*/
CreateDynamicObject(1806, 418.45230, 66.79445, 1019.38507,   0.00000, 0.00000, 91.00000, -1, 6);
CreateDynamicObject(1806, 418.45300, 68.09300, 1019.38507,   0.00000, 0.00000, 91.00000, -1, 6);
/* Puerta Interior LVPD */
PuertasLSPD[8] = CreateDynamicObject(19302, 209.18120, 178.26781, 1003.27740,   0.00000, 0.00000, -90.00000);
PuertasLSPD[9] = CreateDynamicObject(19302, 209.02820, 159.10330, 1003.25049,   0.00000, 0.00000, 90.00000);
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	new id = /*GetVehiclePlayerID(vehicleid)*/vehicleid;
	if(IsValidVehicleEx(id))
	{
		Vehicles_Info[id][gi_vehicle_COLOR1] = color1;
		Vehicles_Info[id][gi_vehicle_COLOR2] = color2;
	}
	return 1;
}

UnLockPlayerVehicle(carid/*, type*/)
{
	Vehicles_Info[carid][gi_vehicle_DOORS] = 0;
    UpdateVehicleParams(carid);
}

function CargarVehiculosServidor(){
/*new Query[256];
format(Query, sizeof(Query), "SELECT * FROM `lac_vehicles` WHERE `typeload`='0'");
mysql_tquery(conexion, Query, "CargarDatosVehiculos");*/
LoadVehiclesGlobalDB();

TruckerWorkVehicles[0] = CreateVehicleServerWork(456, 2201.55, -2219.12, 13.7241, 225.797, random(100), random(100), -1, 2);
TruckerWorkVehicles[1] = CreateVehicleServerWork(414, 2204.92,-2216.17, 13.6969, 225.16, random(100), random(100), -1, 2);
TruckerWorkVehicles[2] = CreateVehicleServerWork(609, 2197.39, -2223.12, 13.7222, 223.457, random(100), random(100), -1, 2);
TruckerWorkVehicles[3] = CreateVehicleServerWork(499, 2208.23, -2212.48, 13.7106, 224.345, random(100), random(100), -1, 2);
TruckerWorkVehicles[4] = CreateVehicleServerWork(578, 2227.7837, -2253.4685, 14.0131, 44.9212, random(100), random(100), -1, 2);
TruckerWorkVehicles[5] = CreateVehicleServerWork(578, 2220.5752, -2260.5271, 14.0131, 44.9212, random(100), random(100), -1, 2);
TruckerWorkVehicles[6] = CreateVehicleServerWork(578, 2213.3953, -2268.0076, 14.0131, 44.9212, random(100), random(100), -1, 2);

FarmerWorkVehicles[0] = CreateVehicleServerWork(478, -1434.6340, -1488.8156, 101.6422, 92.8886, 1, 1, -1, 4);
FarmerWorkVehicles[1] = CreateVehicleServerWork(478, -1434.4218, -1495.2687, 101.6422, 92.8886, 1, 1, -1, 4);
FarmerWorkVehicles[2] = CreateVehicleServerWork(478, -1433.9707, -1502.0704, 101.6422, 92.8886, 1, 1, -1, 4);

DumpsterVehicles[0]	= CreateVehicleServerWork(408, 2199.1719, -1985.7931, 14.0183, 90.0000, 8, 8, -1, 7);
DumpsterVehicles[1] = CreateVehicleServerWork(408, 2199.1106, -1993.2012, 14.0183, 90.0000, 8, 8, -1, 7);
DumpsterVehicles[2] = CreateVehicleServerWork(408, 2199.1130, -1999.9122, 14.0183, 90.0000, 8, 8, -1, 7);
DumpsterVehicles[3] = CreateVehicleServerWork(408, 2200.0635, -2007.9186, 14.0183, 115.5037, 8, 8, -1, 7);

for(new i = 0; i < sizeof Vehicles_DataRent; i++)
{
	LeasedVehicles[i] = CreateVehicleServerExtra(VehiclesData.Rent[i][@Model], VehiclesData.Rent[i][@X], VehiclesData.Rent[i][@Y], VehiclesData.Rent[i][@Z], VehiclesData.Rent[i][@A], random(100), random(100), -1, VEHICLE_TYPE_RENT);
}
return 1;
}

stock GuardarDatoFilaInt(const Tabla[],  const nombre_dato[], value_dato, type_where, const Where[], const Contenido_Where[])
{
	new query[120];if(type_where == 0) {new where_int = strval(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s=%i WHERE %s=%i", Tabla, nombre_dato, value_dato, Where, where_int);}
	if(type_where == 1) format(query, sizeof(query), "UPDATE %s SET %s=%i WHERE %s='%s'", Tabla, nombre_dato, value_dato, Where, Contenido_Where);
	if(type_where == 2) {new Float:where_float = floatstr(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s=%i WHERE %s=%f", Tabla, nombre_dato, value_dato, Where, where_float);}
	if(type_where == 3) {format(query, sizeof(query), "UPDATE %s SET %s=%i", Tabla, nombre_dato, value_dato);}
	mysql_tquery(conexion, query, "", "");
	return 1;
}

stock GuardarDatoFilaFloat(const Tabla[], const nombre_dato[], Float:value_dato, type_where, const Where[], const Contenido_Where[])
{
	new query[120];
	if(type_where == 0) {new where_int = strval(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s=%f WHERE %s=%i;", Tabla, nombre_dato, value_dato, Where, where_int);}
	if(type_where == 1) format(query, sizeof(query), "UPDATE %s SET %s=%f WHERE %s='%s'", Tabla, nombre_dato, value_dato, Where, Contenido_Where);
	if(type_where == 2) {new Float:where_float = floatstr(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s=%f WHERE %s=%f", Tabla, nombre_dato, value_dato, Where, where_float);}
	if(type_where == 3) {format(query, sizeof(query), "UPDATE %s SET %s=%f", Tabla, nombre_dato, value_dato);}
	mysql_tquery(conexion, query, "", "");
	return 1;
}

stock GuardarDatoFilaString(const Tabla[],  const nombre_dato[], const value_dato[], type_where, const Where[], const Contenido_Where[])
{
	new query[120];
	if(type_where == 0) {new where_int = strval(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s='%s' WHERE %s=%i", Tabla, nombre_dato, value_dato, Where, where_int);}
	if(type_where == 1) format(query, sizeof(query), "UPDATE %s SET %s=%s WHERE %s='%s'", Tabla, nombre_dato, value_dato, Where, Contenido_Where);
	if(type_where == 2) {new Float:where_float = floatstr(Contenido_Where); format(query, sizeof(query), "UPDATE %s SET %s=%s WHERE %s=%f", Tabla, nombre_dato, value_dato, Where, where_float);}
	if(type_where == 3) {format(query, sizeof(query), "UPDATE %s SET %s='%s'", Tabla, nombre_dato, value_dato);}
	mysql_tquery(conexion, query, "", "");
	return 1;
}

/*stock GetPlayerVehicle(playerid, vehicleid)
{
	if(!IsPlayerConnected(playerid)) return -1;
	if(!GetVehicleModel(vehicleid)) return -1;
    for(new v = 1; v < MAX_VEHICLES_PLAYER; v++)
    {
        if(VehicleInfo[v][vICID] == vehicleid)
        {
            return v;
        }
    }
    return -1;
}*/

public OnVehicleSpawn(vehicleid)
{	
	if(Vehicles_Info[vehicleid][gi_vehicle_SPAWNED] == 0)
	{
		switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
		{
			case VEHICLE_TYPE_PLAYER:
			{
				new player = Vehicles_Info[vehicleid][gi_vehicle_OWNER];
				for(new i = 0; i < MAX_VEHICLES_PLAYER; i++)
				{
					if(Player_VehiclesDBID[player][i] == VEHICLES_PLAYER[vehicleid][player_vehicle_ID])
					{
						Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = 0.0;
						SaveVehiclePlayerForID(vehicleid);
						DestroyVehicleEx(vehicleid);
						PlayerInfo[player][p_VehicleSlot][i] = 0;
					}
				}
			}
		}
	}

	Vehicles_Info[vehicleid][gi_vehicle_SPAWNED] = 1;

	ChangeVehicleColor(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_COLOR1], Vehicles_Info[vehicleid][gi_vehicle_COLOR2]);
	ChangeVehiclePaintjob(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_PAINTJOB]);
	SetVehiclePosEx(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_POS_X], Vehicles_Info[vehicleid][gi_vehicle_POS_Y], Vehicles_Info[vehicleid][gi_vehicle_POS_Z]);
	SetVehicleZAngle(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_POS_ANGLE]);
	LinkVehicleToInteriorEx(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_INT]);
	SetVehicleVWEx(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_VW]);
	AddVehicleComponents(vehicleid);

	Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_LIGHTS] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_ALARM] = 0;
	if(!VEHICLES_PLAYER[vehicleid][player_vehicle_VALID]) Vehicles_Info[vehicleid][gi_vehicle_DOORS] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_BONNET] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_BOOT] = 0;
	Vehicles_Info[vehicleid][gi_vehicle_OBJECTIVE] = 0;
	return 1;
}

stock SpawnVehiclesPlayer(playerid)
{
	mysql_tquery_s(conexion, str_format("SELECT * FROM lac_uservehicles WHERE `owner_id` = %d;", PlayerInfo[playerid][pID]), "LoadPlayerVehicles", "i", playerid);
	return 1;
}

UpdateVehiclePark(playerid)
{
	new id[10], vehicleid, interior, vw;
	vehicleid = GetPlayerVehicleID(playerid);
	interior = GetPlayerInterior(playerid);
	vw = GetPlayerVirtualWorld(playerid);
	new i = vehicleid;
	
	if(!VEHICLES_PLAYER[vehicleid][player_vehicle_VALID]) return 1;
	if(VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] != PlayerInfo[playerid][pID]) return 1;

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, Blanco, "Tienes que estar en un Vehï¿½culo.");
	GetVehiclePos(vehicleid, Vehicles_Info[i][gi_vehicle_SPAWN_X], Vehicles_Info[i][gi_vehicle_SPAWN_Y], Vehicles_Info[i][gi_vehicle_SPAWN_Z]);
	GetVehicleZAngle(vehicleid, Vehicles_Info[i][gi_vehicle_SPAWN_ANGLE]);
	Vehicles_Info[i][gi_vehicle_SPAWN_INT] = interior;
	Vehicles_Info[i][gi_vehicle_SPAWN_VW] = vw;
	GuardarDatoFilaFloat("lac_uservehicles", "spawn_x", Vehicles_Info[i][gi_vehicle_SPAWN_X], 0, "Car_ID", id);
	GuardarDatoFilaFloat("lac_uservehicles", "spawn_y", Vehicles_Info[i][gi_vehicle_SPAWN_Y], 0, "Car_ID", id);
	GuardarDatoFilaFloat("lac_uservehicles", "spawn_z", Vehicles_Info[i][gi_vehicle_SPAWN_Z], 0, "Car_ID", id);
	
	SetVehiclePos(vehicleid, Vehicles_Info[i][gi_vehicle_SPAWN_X], Vehicles_Info[i][gi_vehicle_SPAWN_Y], Vehicles_Info[i][gi_vehicle_SPAWN_Z]);
	Vehicles_Info[vehicleid][gi_vehicle_ENGINE] = 0;
	UpdateVehicleParams(vehicleid);

	ShowPlayerInfoTextdraw(playerid, "Vehï¿½culo ~r~~h~estacionado~w~.", 4000);
	return 1;
}

function RegistrarCuenta(playerid, next)
{
	switch(next)
	{
		case 0:
		{
			SetPlayerCameraPos(playerid, 1538.0671, -2228.9077, 36.8128);
			SetPlayerCameraLookAt(playerid, 1538.4604, -2227.9829, 36.4278);
			ShowPlayerInfoTextdraw(playerid, "Espera un momento...");
			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("RegistrarCuenta", 10000, false, "id", playerid, 1);
		}
		case 1:
		{
			SetPlayerCameraPos(playerid, 1448.5768, -1662.0602, 66.0011);
			SetPlayerCameraLookAt(playerid, 1449.5811, -1662.0208, 65.4212);
			ShowPlayerInfoTextdraw(playerid, "~w~Bienvenido a ~b~~h~~h~CityLife Roleplay ~w~esperamos que disfrutes del servidor.");
			KillTimer(PlayerInfoTemp[playerid][pt_Timers][0]);
			PlayerInfoTemp[playerid][pt_Timers][0] = SetTimerEx("RegistrarCuenta", 10000, false, "id", playerid, 2);
		}
		case 2:
		{
			PlayerInfo[playerid][p_POS_X] = 1508.9914; 
			PlayerInfo[playerid][p_POS_Y] = -1750.4041; 
			PlayerInfo[playerid][p_POS_Z] = 13.5469;
			PlayerInfo[playerid][pDinero] = 1000000;
			PlayerInfo[playerid][p_LEVEL] = 1;
			PlayerInfo[playerid][pHealth] = 100.0;
			format(PlayerInfo[playerid][p_Name], 24, "%s", PlayerInfoTemp[playerid][pt_Name]);

			//SendClientMessage(playerid, -1, "{5EB5FF}Tutorial: {FFFFFF}Presiona la tecla {5EB5FF}T{FFFFFF} para escribir o ingresar comandos.");
			new string_bank[19];
			format(string_bank, sizeof(string_bank), "%d-%d-%d", randomEx(10000, 99999), randomEx(10000, 99999), randomEx(100000, 999999));

			await mysql_aquery_s(conexion, str_format("SELECT r.`ref_user` FROM `lac_code_register` r WHERE r.`idcode`=%d;", Player_TempCodeRefer[playerid]));

			new rows;
			cache_get_row_count(rows);

			if(rows)
			{
				new user_ref;
				cache_get_value_name_int(0, "ref_user", user_ref);

				if(user_ref == 0)
				{
					mysql_tquery_s(conexion, str_format("\
						INSERT INTO `lac_users` (\
						`name`, `password`, `age`, `email`, `skin`, `health`, `level`, \
						`pos_x`, `pos_y`, `pos_z`, `money`, `gender`, `type_registry`, \
						`registration_date`, `registration_IP`, `BankNumber`, `Online`)\
						 VALUES (\
						 '%e', '%e', '%d','%e', '%d', '100.0', %d, \
						 '1508.9914', '-1750.4041', '13.5469', '3000', '%d', '0',\
						 current_timestamp, '%e', '%e', 1 \
						);",
						PlayerInfoTemp[playerid][pt_Name], PlayerInfo[playerid][pPassword], PlayerInfo[playerid][pEdad], 
					    PlayerInfo[playerid][pEmail], PlayerInfo[playerid][pRopa], PlayerInfo[playerid][p_LEVEL],
						PlayerInfo[playerid][p_Gender],
						PlayerInfoTemp[playerid][pt_IP], string_bank), "LoadPlayerRegistrationID", "i", playerid);
				} else Kick(playerid);
			} else Kick(playerid);
		}
	}
	return 1;
}

stock DarArmas(playerid)
{
	GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapon], 99999);
    /*GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][0],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][1],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][2],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][3],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][4],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][5],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][6],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][7],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][8],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][9],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][10],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][11],9999999);
    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][12],9999999);
    SetPlayerArmedWeapon(playerid, 0);*/
    /*for(new i = 0; i < 13; i++)
    {
    	if(PlayerInfo[playerid][pWeapons][i] != 0)
    	{
    		if(PlayerInfo[playerid][pWEAPONS_AMMO][i] > 0)
    		{
    			GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][i], PlayerInfo[playerid][pWEAPONS_AMMO][i]);
    		}
    	}
    }*/
	return 1;
}
stock Float:player_get_speed2(playerid)
{
	new Float: Floats[3];
	GetPlayerVelocity(playerid, Floats[0], Floats[1], Floats[2]);
	return floatsqroot(Floats[0] * Floats[0] + Floats[1] * Floats[1] + Floats[2] * Floats[2]) * 180.00;
}
	
function Anticheat()
{
	foreach (new i : Player)
	{
		if(PlayerInfoTemp[i][pt_IsLoggedIn] == true && IsPlayerConnected(i))
		{
			AnticheatSpeedHack(i);
			/*if(GetPlayerMoney(i) > PlayerInfo[i][pDinero])
			{
				ResetPlayerMoney(i);
				GivePlayerMoney(i, PlayerInfo[i][pDinero]);
			}*/
			new Float:armour;
			GetPlayerArmour(i, armour);
 			if(PlayerInfo[i][pChaleco] < armour)
			{
				PlayerInfo[i][pChaleco] = armour;
			}
			else if(armour > PlayerInfo[i][pChaleco])
			{
				BaneoAnticheat(i, "{BD3939}Cheat de Blindaje{FFFFFF}.", 1);
			}
			if(IsPlayerInAnyVehicle(i))
			{
				if(EnAuto[i] != GetPlayerVehicleID(i))
				{
					if(BajandoVehiculo[i] == 1) return 1;
					new pName[24],string[256];
					GetPlayerName(i, pName, 24);
					format(string, sizeof(string), "El Jugador {BD3939}%s[ID:%d] {FFFFFF}fue baneado por el Anticheat. {FFFFFF}Razï¿½n: {BD3939}Cheat de Vehï¿½culos{FFFFFF}.", pName, i);
					SendClientMessageToAll(-1, string);
					KickEx(i, 500);
				}
			}
			CheckPlayerTeleportHack(i);
		/*	if(IsPlayerAirbreak(i))
			{
				Kick(i);
			}*/
		}
	}
	return 1;
}

stock CheckSpeedHackJob(playerid, job, slot)
{
	new string[128], minutes, segundos;
	/*minutes = floatround(WaitTimeJobT[playerid][slot] / 60);
	segundos = floatround(WaitTimeJobT[playerid][slot] - minutes * 60);*/
	if(job == 2)
	{
		if(GetTimerJob(playerid, 2))
		{
			if(WaitTimeJobT[playerid][slot] < 60)
			{
				format(string, sizeof(string), "{BD3939}SpeedHack (2:%d){FFFFFF}.", segundos);
			} else { format(string, sizeof(string), "{BD3939}SpeedHack (2:%d:%d){FFFFFF}.", minutes, segundos);}
			BaneoAnticheat(playerid, string, 1);
		}
		WaitTimeJobT[playerid][slot] = 0;
	}
	if(job == 3)
	{
		if(GetTimerJob(playerid, 3))
		{
			if(WaitTimeJobT[playerid][slot] < 60)
			{
				format(string, sizeof(string), "{BD3939}SpeedHack (3:%d){FFFFFF}.", segundos);
			} else { format(string, sizeof(string), "{BD3939}SpeedHack (3:%d:%d){FFFFFF}.", minutes, segundos);}
			BaneoAnticheat(playerid, string, 1);
		}
		WaitTimeJobT[playerid][slot] = 0;
		DeleteTimerJob(playerid, slot);
	}
	switch(job)
	{
		case 10:
		{
			if(GetTimerJob(playerid, 0))
			{
				convertTime_SecondsMinutes(GetSegTimerJob(playerid, 0), minutes, segundos);
				if(segundos < 60)
				{

					format(string, sizeof(string), "{BD3939}SpeedHack (10:%d){FFFFFF}.", segundos);
				} else { format(string, sizeof(string), "{BD3939}SpeedHack (10:%d:%d){FFFFFF}.", minutes, segundos);}
				BaneoAnticheat(playerid, string, 1);
			}
			WaitTimeJobT[playerid][slot] = 0;
			DeleteTimerJob(playerid, slot);
		}
	}
}

function severTimers2()
{
	//task severTimers2[1000](){
	foreach (new i : Player)
	{
		if(QuestionTime[i] != 0){
			QuestionTime[i]--;
		}
		if(AggressorTime[i] != 0 && AggressorTime[i] != INVALID_PLAYER_ID)
		{
			AggressorTime[i]--;
		}
		else if(AggressorTime[i] <= 0 && AggressorTime[i] != INVALID_PLAYER_ID)
		{
			AggressorTime[i] = 0;
			Aggressor[i] = INVALID_PLAYER_ID;
		}
		if(GetTimerJob(i, 2))
		{
			WaitTimeJobT[i][2]++;
		}
		if(GetTimerJob(i, 3))
		{
			WaitTimeJobT[i][3]++;
		}
		if(GetTimerJob(i, 0))
		{
			WaitTimeJobT[i][0]++;
		}
		if(GetTimerJob(i, 0))
		{
			new timestr[25]; 
			new seconds, minutes;
			convertTime_SecondsMinutes(GetSegTimerJob(i, 0), minutes, seconds);
			format(timestr, sizeof(timestr), "Tiempo restante: ~y~%d:%d", minutes, seconds);
			funct_UpdateTextDrawNotif(i, VNOTI_TYPE_COUNTFARM, timestr);
		}
	}
}

function EMSUpdate()
{
	foreach (new i : Player)
	{
		if(PlayerInfo[i][p_State_Game] == GAME_STATE_CRACK && StatePatient[i] != 2)
		{
			new Float:health;
			health = PlayerInfo[i][pHealth];
			SetHealth(i, health/*PlayerInfo[i][pHealth]*/-1.00); 

			//ApplyAnimation(i, "CRACK", "CRCKIDLE1", 4.1, false, false, false, true, 0, false);
			ApplyAnimationEx(i, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, false, 0, false);	
		}	
		if(PlayerInfo[i][pBed] > 0)
		{
			new Float:health;
			GetPlayerHealth(i, health);
			if(health < 100)
			{
				SetHealth(i, health+2.0);
			}
			else
			{
				new Float:angle;
				GetPlayerFacingAngle(i, angle);
				SetPlayerFacingAngle(i, angle+180);
				if(health > 100) { SetHealth(i, 100); }
				BedVar[PlayerInfo[i][pBed]-1] = 0;
				PlayerInfo[i][pBed] = 0;
				PlayerInfo[i][pBedVW] = 0;
				ApplyAnimation(i,"INT_HOUSE","BED_Out_R",3.00,0,0,0,0,0,1);
				SendClientMessage(i, -1, "Te han dado de alta, ya puedes irte.");
			}
		}
		if(GetPlayerMoney(i) > PlayerInfo[i][pDinero])
		{
			ResetPlayerMoney(i);
			GivePlayerMoney(i, PlayerInfo[i][pDinero]);
		}
		if(Player.Temp[i][@ActorTarget] != GetPlayerTargetActor(i))
		{
			new actorid = GetPlayerTargetActor(i);

			if(actorid != INVALID_ACTOR_ID)
				CallRemoteFunction("OnPlayerTargetActor", "ii", i, actorid);
			
			Player.Temp[i][@ActorTarget] = actorid;
		}
		/*if(GetPlayerTargetActor(i) != INVALID_ACTOR_ID)
		{
			new actorid = GetPlayerTargetActor(i);

			if(Player.Temp[i][@CriminalActType] == CRIMINAL_ACTIVITY_TYPE_ROBACTOR)
			{
				if(!Player.Temp[i][@CriminalActValue]) return 1;
				if(Actor.RobberyStore[ Player.Temp[i][@CriminalActID] ][@Actor] != actorid) return 1;

				Player.Temp[i][@CriminalActValue] = 0;
				RunActorAnimationSequence(i, Player.Temp[i][@CriminalActID], 3);
			}
			else
			{
				
				for(new r; r < MAX_ROBBERY_ACTORS; r++)
				{
					if(Actor.RobberyStore[r][@Actor] == actorid)
					{
						if(InvObjectData[GetInvValueItemSelected(i)][E_INV_TYPE] != INV_TYPE_WEAPON) continue;
						if(GetInvAmountItemSelected(i) == 0) continue;
						else if(Actor.RobberyStore[r][@LastRobbed] > gettime()) return ShowPlayerInfoTextdraw(i, "~r~Este lugar ya fue robado.", 4000);
						else if(Actor.RobberyStore[r][@RobberID] != 0) return ShowPlayerInfoTextdraw(i, "~r~Este negocio ya fue robado.", 4000);
						else if(PlayerInfo[i][p_LimitShopRobbery] >= 5) return ShowPlayerInfoTextdraw(i, "~r~Ya robaste suficiente intï¿½ntalo~n~de nuevo mï¿½s tarde", 4000);

						Player.Temp[i][@CriminalActType] = CRIMINAL_ACTIVITY_TYPE_ROBACTOR;
						Player.Temp[i][@CriminalActID] = r;
						Player.Temp[i][@CriminalActValue] = 0;
						
						PlayerInfo[i][p_LimitShopRobbery]++;

						RunActorAnimationSequence(i, r, 0);

						
					}
				}
			}
		}*/
	}
	return 1;
}

function severTimerFive()
//task severTimerFive[5000]()
{
	foreach (new i : Player)
	{
		if(PlayerInfoTemp[i][pt_IsLoggedIn])
		{
			if(PlayerInfo[i][pAgonizando] == 1 && StatePatient[i] != 2)
			{
				new Float:health;
				GetPlayerHealth(i, health);
				if(health != PlayerInfo[i][pHealth])
				{
					SetPlayerHealth(i, PlayerInfo[i][pHealth]);
				} 
			}
			for(new v = 0; v < MAX_VEHICLES_PLAYER; v++)
			{
				if(Player_VehiclesTime[i][v] != 0 && Player_VehiclesTime[i][v] < gettime())
				{
					SpawnInsuredVehiclePlayer(i, v);
				}
			}
		}
	}
	return 1;
}

stock resetPlayerVariables(playerid)
{
	CurrentDialog[playerid] = -1;  Intentos[playerid] = 0;
	OnCall[playerid] = 0;
	FirstSpawn[playerid] = 0;
	EstadoRadio[playerid] = 1;
	PlayerInfoTemp[playerid][pt_IsLoggedIn] = false;
	EnAuto[playerid] = INVALID_VEHICLE_ID;
	BajandoVehiculo[playerid] = 1;
	Bidon[playerid] = 0;
	OnCall[playerid] = 0;
	Mecanico[playerid] = INVALID_PLAYER_ID;
	SaveNumPhone[playerid] = 0;
	LocalizandoV[playerid] = 0;
	Objeto[playerid] = 0;
	CallTaxi[playerid][0] = 0;
	CallTaxi[playerid][1] = 0;
	TaxiDriver[playerid] = INVALID_PLAYER_ID;
	TaximeterAmount[playerid] = 0;
	CallMedic[playerid][0] = 0;
	CallMedic[playerid][1] = 0;
	DialogSegureA[playerid] = 0;
	carsforplayer[playerid] = 0;
	ListeningR[playerid] = 0;

	Player_VehiclesDBID[playerid][0] = 0;
	Player_VehiclesDBID[playerid][1] = 0;
	Player_VehiclesDBID[playerid][2] = 0;

	//
	rBit1_Set(CallTowing, playerid, 0);

	Descargando[playerid] = 10;

	DumpCompa[playerid] = INVALID_PLAYER_ID;
	resetVarsJobGarbage(playerid);

	PlayerOffer[playerid] = INVALID_PLAYER_ID;
	PriceOffer[playerid] = 0;

	if(map_valid(Player.Temp[playerid][@InvItemsMap]))
	{
		map_delete(Player.Temp[playerid][@InvItemsMap]);
	}
	ResetPlayerDataListQuiz(playerid);
	ResetPlayerVehicleData(playerid);

	new temp_PLAYER_TEMP[pInfo_Temp]; PlayerInfoTemp[playerid] = temp_PLAYER_TEMP;
	new temp_PLAYER_FACTION[E_PLAYER_FACTION_INFO]; Player_Faction[playerid] = temp_PLAYER_FACTION;
	new temp_PLAYER_INFO_TEMP[E_PLAYER_TEMP_INFO]; 
	temp_PLAYER_INFO_TEMP[E_PLAYER_Temp_SelectedFactionID] = -1;
	temp_PLAYER_INFO_TEMP[E_PLAYER_Temp_FactionQuiz] = -1;
	Player_Temp[playerid] = temp_PLAYER_INFO_TEMP;

	new tmp[pInfo]; PlayerInfo[playerid] = tmp;
	PlayerInfo[playerid][pCranePermit] = INVALID_VEHICLE_ID;
	PlayerInfo[playerid][pCranePermitID] = INVALID_PLAYER_ID;
	Player.Temp[playerid][@PickedUpArea] = INVALID_STREAMER_ID;
	rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, false);
	rBit1_Set(eBit1_PlayerInfo[p_TimerCheckEnterArea], playerid, false);
	rBit1_Set(eBit1_PlayerInfo[p_HoldKey], playerid, false);
	rBit1_Set(eBit1_PlayerInfo[p_StartingEngine], playerid, false);
	rBit1_Set(eBit1_PlayerInfo[p_StatePlayerFarmer], playerid, false);

	for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
	{
		PlayerInventory[playerid][i][invItem] = 0;
		PlayerInventory[playerid][i][invAmount] = 0;
	}

	DynamicSGUI_Start(playerid);

	/*PlayerInfo[playerid][pBed] = -1;*/

	KillTimer(TimerNotificationTextDraw[playerid]);

	CleanPlayerNotifications(playerid);

	//reset_DataNotifications(playerid);
	return 1;
}

resetPlayerVariablesConnect(playerid)
{
	MobileSub[playerid] = INVALID_PLAYER_ID;
	PlayerBeingCalled[playerid] = INVALID_PLAYER_ID;
	Velocidad[playerid] = INVALID_PLAYER_BAR_ID;
	Gasolina[playerid] = INVALID_PLAYER_BAR_ID;
	PlayerInfo[playerid][p_PickedUpArea] = INVALID_AREAIT_ID;
	PlayerInfoTemp[playerid][pt_PlayerInAreaY] = INVALID_AREAIT_ID;
	Player.Temp[playerid][@PlayerInAreaAlt] = INVALID_AREAIT_ID;
	PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] = -1;

	Player.Temp[playerid][@InteractingItem] = INVALID_ITEM_ID;
	Player.Temp[playerid][@RentVehicle] = -1;
	Player.Temp[playerid][@SelectedFactionID] = -1;
	Player.Temp[playerid][@PlayerHealing] = INVALID_PLAYER_ID;
	Player.Temp[playerid][@GPSRouteSelected] = -1;
	//Player.Temp[playerid][@CriminalActID] = -1;

	CamionID[playerid] = INVALID_VEHICLE_ID;

	new temp_PLAYER_WORK_SKILLS[E_PLAYER_WORK_SKILLS];
	
	temp_PLAYER_WORK_SKILLS[E_PLAYER_WorkSkill_Level] = 1;
	for(new i = 0; i < 5; i++)
	{
		Player_WorkSkill[playerid][i] = temp_PLAYER_WORK_SKILLS;
	}

//	PlayerInfoTemp[playerid][pt_VEHICLE_NEAR] = INVALID_VEHICLE_ID;

	for(new i = 0; i < MAX_PLAYER_INV_ITEMS_EQUIPED; i++)
	{
		Player.InvEquiped[playerid][i][@Item] = 0;
		Player.InvEquiped[playerid][i][@Amount] = 0;
		Player.InvEquiped[playerid][i][@Slot] = -1;
	}

	reset_DataNotifications(playerid);
	return 1;
}

ResetPlayerCheckpoints(playerid)
{
	for(new i = 0; i < 4; i++)
	{
		if(IsValidDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][i]))
		{
			DestroyDynamicCP(PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][i]);
			PlayerInfoTemp[playerid][pt_PLAYER_CHECKPOINT][i] = INVALID_STREAMER_ID;
		}
	}
	return 1;
}

function DarDinero(playerid,cantidad)
{
	if(cantidad < 0) return 1;
	PlayerInfo[playerid][pDinero] += cantidad;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid,PlayerInfo[playerid][pDinero]);
	return 1;
}

GivePlayerMoneyEx(playerid, money, bool:enablemsg = false, bool:autosave = false, option = 0)
{
	if(money < 0) return 1;
	PlayerInfo[playerid][pDinero] += money;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid,PlayerInfo[playerid][pDinero]);

	if(autosave == true)
	{
		new Query[140];
		if(option) format(Query, sizeof(Query), "UPDATE `lac_users` SET `money`= %d WHERE `id`=%d;", PlayerInfo[playerid][pDinero], PlayerInfo[playerid][pID]);
		else format(Query, sizeof(Query), "UPDATE `lac_users` SET `money`= money + %d WHERE `id`=%d;", money, PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, Query);
	}

	if(enablemsg == true)
	{
		new str[21];
		format(str, sizeof(str), "~g~+$%s", FormatNumber(money));
		GameTextForPlayer(playerid, str, 4000, 1);
	}
	return 1;	
}

stock RemoveMoney(playerid,amount, bool:enablemsg = true, bool:autosave = false, type = 0)
{
	if(amount < 0) return 1;
	PlayerInfo[playerid][pDinero] -= amount;
	GivePlayerMoney(playerid,-amount);
	if(autosave)
	{
		new Query[140];
		if(type) format(Query, sizeof(Query), "UPDATE `lac_users` SET `money`=%d WHERE `id`=%d;", PlayerInfo[playerid][pDinero], PlayerInfo[playerid][pID]);
		else format(Query, sizeof(Query), "UPDATE `lac_users` SET `money`= money - %d WHERE `id`=%d;", amount, PlayerInfo[playerid][pID]);
		mysql_tquery(conexion, Query);
	}
	if(enablemsg) 
	{
		new str[21];
		format(str, sizeof(str), "~r~-$%s", FormatNumber(amount));
		GameTextForPlayer(playerid, str, 4000, 1);  
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(response)
	{
		printf("Pos Attach: %f, %f, %f",fOffsetX-AttachObject[playerid][0],fOffsetY-AttachObject[playerid][1], fOffsetZ-AttachObject[playerid][2]);
		printf("Rot Attach: %f, %f, %f",fRotX-AttachObject[playerid][3],fRotY-AttachObject[playerid][4], fRotZ-AttachObject[playerid][5]);
		printf("Size Attach: %f, %f, %f",fScaleX-AttachObject[playerid][6],fScaleY-AttachObject[playerid][7], fScaleZ-AttachObject[playerid][8]);
	}
	return 1;
}

stock DarRopa(playerid)
{
	if(PlayerInfo[playerid][pDutyPolicia] > 0 || MecanicoServicio[playerid] == 1)
	{
		if(MecanicoServicio[playerid] == 1)
		{
			switch(PlayerInfo[playerid][p_Gender])
			{
				case 1:
				{
					SetPlayerSkin(playerid, 50);
				}
				case 2:
				{
					SetPlayerSkin(playerid, 309);
				}
			}
		}
		if(PlayerInfo[playerid][pDutyPolicia] == 1)
		{
			SetPlayerColor(playerid,COLOR_POLICIA);
			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkinPolicia]);
		}
	}
	else
	{
		SetPlayerSkin(playerid, PlayerInfo[playerid][pRopa]);
	}
}

stock SendFactionRadioMessage(member,color, const string[])
{
	foreach (new i : Player)
	{
		if(Player.Faction[i][@Valid])
		{
			if(PlayerInfo[i][p_FactionMember] == member)
			{
				SendClientMessage(i, color, string);
			}
		}
	}
	
	return 1;
}

stock SendRadioMessage(member,color, const string[],id)
{
	if(member == 1)
	{
		foreach (new i : Player)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][p_FactionMember] == member && PlayerInfo[i][pDutyPolicia] == 1 && EstadoRadio[i] == 1 && i != id)
				{
					SendClientMessage(i, color, string);
				}
			}
		}
	}
	return 1;
}

stock SendRadioMessagePolice(radio,color, const string[], bool:player = true)
{
	foreach (new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			if(player == false) return 1;
			if(PlayerInfo[i][p_FactionMember] == 1)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					if(radio == -1) SendClientMessage(i, color, string);
					else
					{
						SendClientMessage(i, color, string);
					}
				}
			}
		}
	}
	return 1;
}

stock SendRadioMessageP(member,color, const string[],id, policeduty)
{
	if(member == 1)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(policeduty == 0)
				{
					if(PlayerInfo[i][p_FactionMember] == member && EstadoRadio[i] == 1 && i != id)
					{
						SendClientMessage(i, color, string);
					}
				}
			}
		}
	}
	return 1;
}

function TiempoArresto(playerid)
{
	new string[128];
	if(Esposando[playerid] == 0) return 1;
    Esposando[playerid] = 2;
    VariableAbatido[playerid] = 1;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CUFFED);
    TogglePlayerControllable(playerid,0);
    format(string, 128/*sizeof(string)*/, "[Radio] %s informa: {FABF00}%s {FFFFFF}(%d) {3399FF}ha sido esposado, procedo a entregarlo.",GetPlayerNameEx(Oficial[playerid]), GetPlayerNameEx(playerid), playerid);
    SendRadioMessage(1, COLOR_POLICIA, string,playerid);
    format(string, 128/*sizeof(string)*/, "[Radio de Policï¿½a] Oficial %s informa: %s (%d) ha sido esposado, procedo a entregarlo.",PlayerName(Oficial[playerid]),PlayerName(playerid), playerid);
    ProxDetector(15.0, playerid, string, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
    Oficial[playerid] = INVALID_PLAYER_ID;
	foreach (new i : Player)
	{
 		if(PlayerInfo[i][pDutyPolicia] == 1)
  		{
  			SetPlayerMarkerForPlayer(i, playerid, Verde);
  		}
  	}
	return 1;
}

/*ZonasSeguras(playerid, type)
{
	if(IsPlayerInRangeOfPoint(playerid,180.0,1759.6833,-1892.0160,13.5556)) //Unity
	{
		AssignWantedSafeZone(playerid, type, "Unity Station", "Guardia de Seguridad");
	}
	if(IsPlayerInArea(playerid, 1649.4213,-1882.5564, 1604.4608,-1713.6481)) //Comisaria LS
	{
		AssignWantedSafeZone(playerid, type, "Comisaria Los Santos", "Guardia de Seguridad");
	}
	if(IsPlayerInArea(playerid, 1556.1512,-1582.2142, 1410.2119,-1744.6676)) // Enfrente de comisaria LS
	{
		AssignWantedSafeZone(playerid, type, "enfrente de Comisaria Los Santos", "Guardia de Seguridad");
	}
	else if(IsPlayerInArea(playerid, -124.7591,-1483.9321, -167.4628,-1616.4962))
	{
		AssignWantedSafeZone(playerid, type, "basurero", "Guardia de Seguridad");
	}
	else if(IsPlayerInAreaZ(playerid, 1234.4386,-1286.4830,10.0, 1148.4349,-1388.2860,130.8416))
	{
		AssignWantedSafeZone(playerid, type, "hospital central de Los Santos.", "Guardia de seguridad");
	}
	return 1;
}*/

/*public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	SendClientMessage(playerid, -1, "XD");
	if(weaponid == PlayerInfo[playerid][pWeapon])
	{
		new ammo = GetPlayerAmmo(playerid);
		if(ammo <= 0)
		{
		}
		PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount]--;
		PlayerInfo[playerid][pWAmmo]--;
    }
    return 1;
}*/

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	//SendClientMessage(playerid, -1, "XD");
	if(weaponid == PlayerInfo[playerid][pWeapon])
	{
		if(PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] <= 0) { PlayerInfo[playerid][pWAmmo] = 0; PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] = 0; }
		PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount]--;
		PlayerInfo[playerid][pWAmmo]--;
    }
    return 1;
}


public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	Aggressor[playerid] = issuerid;
	AggressorTime[playerid] = 1;
	if(playerid != INVALID_PLAYER_ID) { PutPlayerCombatMode(playerid); }
	if(issuerid != INVALID_PLAYER_ID)
	{
		PutPlayerCombatMode(issuerid);
	}
	if(issuerid != INVALID_PLAYER_ID)
	{
		amount = floatmul(amount, GetWeaponDamageAmount(GetInvValueItemSelected(playerid)));
	  //  printf("Health: %.4f", amount);
	    if(amount > 0)
	    {
	    	new Float:rest_health = amount;
	    
	    	if(rBit1_Get(b1_PlayerTemp[b1pt_InInmune], playerid)) return 1;

	        PlayerInfo[playerid][pHealth] -= rest_health;

	        if(PlayerInfo[playerid][p_State_Game] == GAME_STATE_CRACK)
	        {
	        	if( PlayerInfo[playerid][pHealth] <= 0.0)
	        	{
	        		PlayerInfo[playerid][pHealth] = 0.0;	
	        	}	
	        }
	        else
	        {
	        	if( PlayerInfo[playerid][pHealth] <= 2.0)
	        	{
	        		SendDeathToPlayer(playerid);
	 	
	        		SendDeathPlayerMessage(playerid, issuerid);
	        	}
	        }

	        SetPlayerHealthEx(playerid,  PlayerInfo[playerid][pHealth]);
	     
	    }
	   
	}
	else
	{

	}
    return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	return 1;
}

/*public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	printf("Weapon %d y Object: %d", weaponid, objectid);
	return 1;
}*/
/*public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{

}*/

forward Encerrando(playerid, type);
public Encerrando(playerid, type)
{
	if(PlayerInfoTemp[playerid][pt_IsLoggedIn] != false) return 1;

    if(PlayerInfo[playerid][pCargos] == 1)
    {
		PlayerInfo[playerid][pTiempoCarcel] = 5 * 60;
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 5 minutos de prisiï¿½n.");
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		Jail[playerid] = 1;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		//QuitarArmas(playerid);
  		VariableAbatido[playerid] = 0;
  		RemoveMoney(playerid, 800);
  	}
	else if(PlayerInfo[playerid][pCargos] == 2)
 	{
        PlayerInfo[playerid][pTiempoCarcel] = 10 * 60;
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 10 minutos de prisiï¿½n.");
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		//QuitarArmas(playerid);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 1300);
	}
 	else if(PlayerInfo[playerid][pCargos] == 3)
 	{
		PlayerInfo[playerid][pTiempoCarcel] = 20 * 60;
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 20 minutos de prisiï¿½n.");
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
		//QuitarArmas(playerid);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 1800);
	}
 	else if(PlayerInfo[playerid][pCargos] == 4)
 	{
        PlayerInfo[playerid][pTiempoCarcel] = 25 * 60;
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 25 minutos de prisiï¿½n.");
        TogglePlayerControllable(playerid,1);
        PlayerInfo[playerid][pCargos] = 0;
      //  QuitarArmas(playerid);
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 2300);
	}
 	else if(PlayerInfo[playerid][pCargos] == 5)
 	{
		PlayerInfo[playerid][pTiempoCarcel] = 30 * 60;
      //  QuitarArmas(playerid);
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 30 minutos de prisiï¿½n.");
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 2800);
	}
 	else if(PlayerInfo[playerid][pCargos] == 6)
 	{
		PlayerInfo[playerid][pTiempoCarcel] = 35 * 60;
      //  QuitarArmas(playerid);
        SendClientMessage(playerid, -1, "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a 35 minutos de prisiï¿½n.");
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 3300);
 	}
 	else if(PlayerInfo[playerid][pCargos] >= 7)
 	{
 		new string[128];
		new operation = 35 + PlayerInfo[playerid][pCargos] * 5 * 60;
		PlayerInfo[playerid][pTiempoCarcel] = operation/* 35 + PlayerInfo[playerid][pCargos] * 5 * 60*/;
       // QuitarArmas(playerid);
        format(string, sizeof(string), "{DA2C2C}ï¿½Fuiste detenido!{FFFFFF}, te condenaron a %d minutos de prisiï¿½n.", operation);
        SendClientMessage(playerid, -1, string);
        PlayerInfo[playerid][pCargos] = 0;
        SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerColor(playerid, DEFAULT_COLOR);
		Jail[playerid] = 1;
		RemoveMoney(playerid, 3300);
 	}
 	switch(type)
 	{
 		case 0:
 		{
 			Jail[playerid] = 1;
 			PlayerInfo[playerid][pPlaceCarcel] = 1;
 			SetPlayerJailCell(playerid);
 			SendClientMessage(playerid, -1, "Para ver cuanto tiempo te falta para cumplir la condena usa {5EB5FF}/tiempo{FFFFFF}.");
 			SendClientMessage(playerid, -1, "La policï¿½a te quito tus armas, drogas y cualquier objeto ilegal.");
 		}
 		case 1:
 		{
 			Jail[playerid] = 1;
 			SetPlayerJailCell(playerid);
 			SendClientMessage(playerid, -1, "Para ver cuanto tiempo de condena te queda escribe {5EB5FF}/tiempo");
 		}
  		case 2:
 		{
 			BajandoVehiculo[playerid] = 1;
			SetPlayerHealth(playerid,100.0);
        	/*if(IsPlayerInRangeOfPoint(playerid,10.0,1564.5568,-1694.7732,5.8906))
  			{
  			Jail[playerid] = 1;*/
  			if(PlayerToPoint(10.0, playerid, 1564.5568,-1694.7732,5.8906))
  			{
  				PlayerInfo[playerid][pPlaceCarcel] = 1;
  			}
  			if(PlayerToPoint(10.0, playerid, -1589.5292, 716.2191, -5.6688))
  			{
  				PlayerInfo[playerid][pPlaceCarcel] = 2;
       		}
       		else if(PlayerToPoint(10.0, playerid, 2293.1904,2451.6099,10.3875))
       		{
       			PlayerInfo[playerid][pPlaceCarcel] = 3;
       		}
       		SetPlayerJailCell(playerid);
       		TogglePlayerControllable(playerid, 1);
			/*}*/
			SendClientMessage(playerid, -1, "Para ver cuanto tiempo te falta para cumplir la condena usa {5EB5FF}/tiempo{FFFFFF}.");
 			SendClientMessage(playerid, -1, "La policï¿½a te quito tus armas, drogas y cualquier objeto ilegal.");
		}
	}
 /* }*/
	return 1;
}

stock EnComisaria(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid,10.0,1564.5568,-1694.7732,5.8906)) { return 1; }
	else if(IsPlayerInRangeOfPoint(playerid,5.0,-1589.4796,706.9417,-5.6748)) { return 1; }
	else if(IsPlayerInRangeOfPoint(playerid,5.0,-1589.5292,716.2191,-5.6688)) { return 1; }
	else if(IsPlayerInRangeOfPoint(playerid,7.0,2293.1904,2451.6099,10.3875)) { return 1; }
	else if(IsPlayerInRangeOfPoint(playerid,7.0,-1679.5967,705.8658,30.7528)) { return 1; }
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	AreasIT_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	Actor_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);

	if(newkeys == KEY_CROUCH)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(IsPlayerInAnyVehicle(playerid) && PoliceVehicle(vehicleid))
		{
			if(PlayerToPoint(10, playerid,1589.053344,-1638.123168,14.122960))
			{
				SetTimer("GateClose6", 5000, 0);
				MoveDynamicObject(PuertasLSPD[0],1596.0597, -1638.0491, 9.4914, 3.0);
			}
			if(PlayerToPoint(10.0, playerid, 1544.71, -1630.83, 13.04))
			{
				RotateDynamicObjectEx(PuertasLSPD[1], 0.0000, 4.0000, 90.0000, 1.00);
				SetTimer("CerrarBarreraLSPD", 5000, 0);
			}
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			ckfs_EnterPlayerVehicle(playerid);
			callcmd::peaje(playerid, "");
		}
	}
	if(newkeys == KEY_SECONDARY_ATTACK)
	{
		if(PlayerToPoint(1.2, playerid, 216.5095,117.0300,999.0156))
		{
			if(PlayerInfo[playerid][pDutyPolicia] == 1){
				if(PuertasAbiertasID[0] == 0)
				{
					MoveDynamicObject(PuertasLSPD[3], 219.7621, 116.5993, 998.0111, 1.0);
					PuertasAbiertasID[0] = 1;
					ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
				}
				else
				{
					MoveDynamicObject(PuertasLSPD[3], 218.5721, 116.5993, 998.0111, 1.0);
					PuertasAbiertasID[0] = 0;
					ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
				}
			}
		}
		if(PlayerToPoint(1.4, playerid, 1582.5275,-1637.4672,13.3905))
		{
			if(PuertasAbiertasID[1] == 0)
			{
				MoveDynamicObject(PuertasLSPD[4], 1581.3648, -1637.9652, 12.3646, 1.0);
				PuertasAbiertasID[1] = 1;
				ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
			}
			else
			{
				MoveDynamicObject(PuertasLSPD[4], 1582.6128, -1637.9652, 12.3646, 1.0);
				PuertasAbiertasID[1] = 0;
				ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
			}
		}
	}
	if(SAKEY_RELEASED(KEY_SECONDARY_ATTACK))
	{
		if(Player.Temp[playerid][@EditFurniture] == 1)
		{
			SaveEditFurnitureObject(playerid, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], 0);
			AssignInteractiveFurniture(PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], Player.Temp[playerid][@EditFurnitureIn], PLAYER_INTERIOR_PROPERTY);
			
			HideDialogLeftMenuShop(playerid);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllableEx(playerid, true);
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_INFOEDITFURNITURE);

			Player.Temp[playerid][@EditFurniture] = 0;
			Player.Temp[playerid][@EditFurnitureRot] = 0.0;

			Create_MenuPlayerFurniture(playerid);
		}
		else if(Player.Temp[playerid][@EditFurniture] == 2)
		{			
			TogglePlayerControllableEx(playerid, true);
			funct_HideTextdrawNotif(playerid, VNOTI_TYPE_INFOEDITFURNITURE);
			SetCameraBehindPlayer(playerid);
			
			SaveEditFurnitureObject(playerid, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], 0);
			AssignInteractiveFurniture(PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], Player.Temp[playerid][@EditFurnitureIn], PLAYER_INTERIOR_PROPERTY);

			Player.Temp[playerid][@EditFurniture] = 0;
			Player.Temp[playerid][@EditFurnitureRot] = 0.0;
			Player.Temp[playerid][@EditFurnitureObj] = INVALID_STREAMER_ID;

			Dialog_EditFurnitureObject(playerid, PLAYER_INTERIOR_PROPERTY, PlayerInfo[playerid][p_INTERIOR_EXTRA_ID]);
			return 1;
		}
	}
	if(newkeys & KEY_YES)
	{
		if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] != INVALID_AREAIT_ID)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new Float:curangle = GetPlayerAngleToIT(playerid, PlayerInfoTemp[playerid][pt_PlayerInAreaY]); 
				SetPlayerFacingAngle(playerid, curangle);
				CallLocalFunction("OnPressInteractiveArea", "dd",playerid, PlayerInfoTemp[playerid][pt_PlayerInAreaY]);
			}
			else
			{
				new carid = GetAreaIT_VehicleID(playerid);
				if(carid != INVALID_VEHICLE_ID_EX)
				{
					if(Player.Temp[playerid][@TypeInAreaY] == TYPE_INAREAY_BOOT)
					{
						new vehicleid = PlayerInfoTemp[playerid][pt_PlayerInAreaY];

						switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
						{
							case VEHICLE_TYPE_PLAYER:
							{
								if(PlayerInfoTemp[playerid][pt_PlayerInAreaY] == INVALID_AREAIT_ID) return 1;
								if(IsPlayerHasVehicleKeys(playerid, vehicleid))
								{
									Vehicles_Info[vehicleid][gi_vehicle_BOOT] = 1;
									UpdateVehicleParams(vehicleid);

									Player.Temp[playerid][@InTabInvTrans] = 1;
									Player.Temp[playerid][@InteractType] = TYPE_ITEMINTERACT_BOOT;
									Player.Temp[playerid][@InteractID] = vehicleid;
									ShowPlayerInvChangeBox(playerid, 1);
									return 1;
								}
								else if(Vehicles_Info[vehicleid][gi_vehicle_BOOT])
								{
									Player.Temp[playerid][@InTabInvTrans] = 1;
									Player.Temp[playerid][@InteractType] = TYPE_ITEMINTERACT_BOOT;
									Player.Temp[playerid][@InteractID] = vehicleid;
									ShowPlayerInvChangeBox(playerid, 1);
									return 1;
								}
							}
						}
						new Float:x,Float:y,Float:z;
						//x = Vehicles_Info[vehicleid][gi_vehicle_POS_X];
						//y = Vehicles_Info[vehicleid][gi_vehicle_POS_Y];
						//z = Vehicles_Info[vehicleid][gi_vehicle_POS_Z];
						//GetPosBehindVehicle(vehicleid, x,y,z, -0.7);
						GetVehicleOffset(vehicleid, 0, x,y,z, -0.4);
						new Float:curangle = GetPlayerAngleToPos(playerid, x,y);
						SetPlayerAngleEx(playerid, curangle);
					}

					else if(Player.Temp[playerid][@TypeInAreaY] == TYPE_INAREAY_HOOD)
					{
						new vehicleid = PlayerInfoTemp[playerid][pt_PlayerInAreaY];

						if(GetInvValueItemSelected(playerid) == 197)
						{
							if(Vehicles_Info[vehicleid][gi_vehicle_HEALTH] > 800.0) return ShowPlayerInfoTextdraw(playerid, "~r~Este vehï¿½culo no necesita reparaciï¿½n.", 2000);
							if(Player.Temp[playerid][@VehicleActionPr] != 0) return 1;

							TogglePlayerControllable(playerid, 0);
							ApplyAnimation(playerid, "BAR", "BARCUSTOM_GET", 4.1, false, false, false, true, 0, false);
							
							Player.Temp[playerid][@VehicleActionPr] = 4;
							Vehicles_Info[vehicleid][gi_vehicle_BONNET] = 1;
    						UpdateVehicleParams(vehicleid);
    						SelectNuleItemInventory(playerid);

							KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
							PlayerInfoTemp[playerid][pt_TimersE][15] = SetTimerEx("Timer_PlayerApplyRepairVehicle", 1100, true, "ii", playerid, vehicleid);
						}
					}
				}
				/*else
				{
					new Float:curangle = GetPlayerAngleToIT(playerid, PlayerInfoTemp[playerid][pt_PlayerInAreaY]); 
					SetPlayerFacingAngle(playerid, curangle);
					CallLocalFunction("OnPressInteractiveArea", "dd",playerid, PlayerInfoTemp[playerid][pt_PlayerInAreaY]);
				}*/
			}
		}
		//new vehicleid = GetAreaIT_VehicleID(playerid);
			
		//if(vehicleid != INVALID_VEHICLE_ID_EX)
		//{		
		new vehicleid = GetPlayerClosestVehicle(playerid);
		
		new Float:vx,Float:vy,Float:vz;
							
		GetVehicleOffset(vehicleid, 2, vx,vy,vz);
		if(IsPlayerInRangeOfPoint(playerid, 1.0, vx,vy,vz) && IsPlayerAngleToPoint(playerid, vx,vy,vz))
		{
			if(GetInvValueItemSelected(playerid) == 198)
			{
				if(Player.Temp[playerid][@VehicleActionPr] != 0) return 1;

				TogglePlayerControllableEx(playerid, false);

				new Float:curangle = GetAngleToPoint(PlayerInfo[playerid][p_POS_X],PlayerInfo[playerid][p_POS_Y], vx, vy);
				SetPlayerFacingAngle(playerid, curangle);
				ApplyAnimation(playerid, "PED", "CAR_ALIGN_RHS", 4.1, false, false, false, true, 0, false);

				Player.Temp[playerid][@VehicleActionPr] = 4;
				KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
				PlayerInfoTemp[playerid][pt_TimersE][15] = SetTimerEx("Timer_ApplyPetrolcanVehicle", 1100, true, "ii", playerid, vehicleid);
			}
		}

		vx = Vehicles_Info[vehicleid][gi_vehicle_POS_X];
		vy = Vehicles_Info[vehicleid][gi_vehicle_POS_Y];
		vz = Vehicles_Info[vehicleid][gi_vehicle_POS_Z];
		GetVehicleOffset(vehicleid, 1, vx,vy,vz,-1.0);

		if(IsPlayerInRangeOfPoint(playerid, 2.0, vx,vy,vz) && IsPlayerAngleToPoint(playerid, vx,vy,vz))
		{
			if(GetInvValueItemSelected(playerid) == 197)
			{
				if(Vehicles_Info[vehicleid][gi_vehicle_HEALTH] > 800.0) return ShowPlayerInfoTextdraw(playerid, "~r~Este vehï¿½culo no necesita reparaciï¿½n.", 2000);
				if(Player.Temp[playerid][@VehicleActionPr] != 0) return 1;

				TogglePlayerControllable(playerid, 0);
				ApplyAnimation(playerid, "BAR", "BARCUSTOM_GET", 4.1, false, false, false, true, 0, false);

				Player.Temp[playerid][@VehicleActionPr] = 4;
				Vehicles_Info[vehicleid][gi_vehicle_BONNET] = 1;
				UpdateVehicleParams(vehicleid);
				SelectNuleItemInventory(playerid);

				KillTimer(PlayerInfoTemp[playerid][pt_TimersE][15]);
				PlayerInfoTemp[playerid][pt_TimersE][15] = SetTimerEx("Timer_PlayerApplyRepairVehicle", 1100, true, "ii", playerid, vehicleid);
			}
		}
		
		//}

		if(IsPlayerInvHasFood(GetInvValueItemSelected(playerid)) != 0)
		{
			//new item = PlayerInfo[playerid][pInvItemSelected];
			new itemid = GetInvValueItemSelected(playerid);

			switch(InvObjectData[ GetInvValueItemSelected(playerid) ][E_INV_TYPE])
			{
				case INV_TYPE_FOOD:
				{		
					playerConsumeFood(playerid, InvObjectData[ itemid ][E_INV_DATAEXTRA], 0, 7);
				}
				case INV_TYPE_DRINK:
				{
					playerConsumeFood(playerid, InvObjectData[ itemid ][E_INV_DATAEXTRA], 1, 7);
				}
				case INV_TYPE_ANALGESICS:
				{
					playerConsumeFood(playerid, 3, 4, 4);
				}
				/*case 37, 38:
				{
					playerConsumeFood(playerid, 2, 0);
				}
				case 40:
				{
					playerConsumeFood(playerid, 3, 7);
				}
				case 39:
				{
					playerConsumeFood(playerid, 1, 10);
				}*/
			}
		}

		switch(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_TYPE])
		{
			case INV_TYPE_PHONE:
			{
				ShowPlayerMobilePhone(playerid, GetInvValueItemSelected(playerid));
				return 1;
			}
			case INV_TYPE_BANDAGES:
			{
				if(PlayerInfo[playerid][pHealth] < 100)
				{
					Player_ApplyItemBandages(playerid);
				}
			}
			case INV_TYPE_KITMEDIC:
			{
				
				new i = GetClosestPlayerInRange(playerid, 1.5);
				
				if(i != INVALID_PLAYER_ID)
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(i, x, y, z);

					if(!IsPlayerAnglePos(playerid, x, y)) return 1;

					if(PlayerInfo[i][p_State_Game] != GAME_STATE_CRACK) return 1;
					
					if(Player.Temp[i][@PlayerHealing] == INVALID_PLAYER_ID)
					{
						Player_ApplyItemKitMedic(playerid, i);

					}
				}
				
			}
		}
		if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_Attached] == true)
		{
			new item = PlayerInfo[playerid][pInvItemSelected];
			new itemid = PlayerInventory[playerid][item][invItem];
			new bool:count_results;

			SelectNuleItemInventory(playerid);
			
			for(new i = 0; i < MAX_PLAYER_INV_ITEMS_EQUIPED; i++)
			{ 
				if(InvObjectData[PlayerInventory[playerid][item][invItem]][E_INV_SlotAttach] == Player.InvEquiped[playerid][i][@Slot])
				{
					//printf("%d y %d %d XD.", Player.InvEquiped[playerid][i][@Slot], DataE.InfoTwo[PlayerInventory[playerid][item][invItem]][@SlotAttach], count_results);
					new temp_inv, temp_amount;

					temp_inv = Player.InvEquiped[playerid][i][@Item];
					temp_amount = Player.InvEquiped[playerid][i][@Amount];

					Player.InvEquiped[playerid][i][@Item] = PlayerInventory[playerid][item][invItem];
					Player.InvEquiped[playerid][i][@Amount] = PlayerInventory[playerid][item][invAmount];

					Player.InvEquiped[playerid][i][@Slot] = InvObjectData[PlayerInventory[playerid][item][invItem]][E_INV_SlotAttach];
				
					RemoveItemInvPlayer(playerid, item);

					PlayerInventory[playerid][item][invItem] = temp_inv;
					PlayerInventory[playerid][item][invAmount] = temp_amount;

					count_results = true;
				}
			}
			if(count_results == false)
			{
				new free_slot = GetInvEquipedFreeSlot(playerid);
				Player.InvEquiped[playerid][free_slot][@Item] = PlayerInventory[playerid][item][invItem];
				Player.InvEquiped[playerid][free_slot][@Amount] = PlayerInventory[playerid][item][invAmount];
					
				Player.InvEquiped[playerid][free_slot][@Slot] = InvObjectData[PlayerInventory[playerid][item][invItem]][E_INV_SlotAttach];
				
				RemoveItemInvPlayer(playerid, item);
			}
			//}

			UseItemInventory(playerid, itemid /*Player.InvEquiped[playerid][item][@Slot]*/); 
		}
	}
	if(newkeys & KEY_SECONDARY_ATTACK)
	{
		ckfs_EnterPlayer(playerid);
	}
	if(SAKEY_PRESSED(KEY_NO))
	{
		if(!rBit1_Get(eBit1_PlayerInfo[pShowInventory], playerid))
		{

			if(Player.Temp[playerid][@StateFreeze] == 1) return 1;
			if(Player.Temp[playerid][@FreezeInventory] != 0) return 1;
			new OnGameModeInitCount = GetTickCount();
			ShowPlayerInventoryTextdraw(playerid);
			printf("Excecuted OnGameModeInit, time taken: %d", GetTickCount() - OnGameModeInitCount);
			rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, true);
		}
		/*else
		{
			HidePlayerInventoryTextdraw(playerid);
			rBit1_Set(eBit1_PlayerInfo[pShowInventory], playerid, false);
		}*/
	}
	if(newkeys & KEY_SPRINT)
	{
		if(PlayerInfo[playerid][p_WorkTravel] == WORK_TYPE_FARMER)
		{
			if(PlayerInfo[playerid][p_JobTravelNext] < 5)
			{
				if(!IsPlayerInPosAreaIT(playerid, FarmerCowsPosition[ PlayerInfo[playerid][p_JobTravel] ], 1.0)) return 1;
				if(1 <= PlayerInfo[playerid][p_JobMissionExtra] < 21)
				{
					PlayerInfo[playerid][p_JobMissionExtra]++;
					UpdatePlayerNotifBar(playerid, VNOTI_TYPE_FARMER, PlayerInfo[playerid][p_JobMissionExtra]);
					//ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0, 1, 1, 1, 1, 2000);
				}
				if(PlayerInfo[playerid][p_JobMissionExtra] == 20)
				{
					PlayerInfo[playerid][p_JobMissionExtra] = 0;
					rBit1_Set(eBit1_PlayerInfo[p_StatePlayerFarmer], playerid, false);
					PlayerInfo[playerid][p_JobTravelNext] = 5;
					SetPlayerProgressFarmerNext(playerid);
					ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.1, false, false, false, false, 1000);
					funct_HideTextdrawNotif(playerid, VNOTI_TYPE_FARMER);
				}

			}
		}
		else if(Player.Temp[playerid][@CriminalActType] == CRIMINAL_ACTIVITY_TYPE_THIEF_H)
		{
			new id = Player.Temp[playerid][@CriminalActID];
			if(!PlayerToPoint(1.0, playerid, WorkActivity.Thief[id][@X], WorkActivity.Thief[id][@Y], WorkActivity.Thief[id][@Z])) return 1;

			if(1 <= Player.Temp[playerid][@CriminalActValue] < 41)
			{
				Player.Temp[playerid][@CriminalActValue]++;
				UpdatePlayerNotifBar(playerid, VNOTI_TYPE_WORKTHIEVESFORCE, Player.Temp[playerid][@CriminalActValue]);
					//ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0, 1, 1, 1, 1, 2000);
			}
			if(Player.Temp[playerid][@CriminalActValue] == 40)
			{
				//new random_time = randomEx(10000, 15000);
				//PlayerInfoTemp[playerid][pt_TimersE][5] = DEFER__  DelayExtractCowMilk(playerid, random_time);
				FinishForceDoorHouse(playerid, Player.Temp[playerid][@CriminalActID]);

				//HidePlayerInfoTextdraw(playerid);
				funct_HideTextdrawNotif(playerid, VNOTI_TYPE_WORKTHIEVESFORCE);

				Player.Temp[playerid][@CriminalActID] = 0;
				Player.Temp[playerid][@CriminalActType] = 0;
				Player.Temp[playerid][@CriminalActValue] = 0;

			}
		}
	}
	if(newkeys & KEY_CTRL_BACK)
	{
		ckfs_KeyPressFunc_H(playerid);

		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if(PlayerInfo[playerid][p_INTERIOR_TYPE] == PLAYER_INTERIOR_PROPERTY)
			{
				if(Player.Temp[playerid][@EditFurniture] != 0)
				{
					if(Player.Temp[playerid][@EditFurnitureRot] < 330.0)Player.Temp[playerid][@EditFurnitureRot] += 30.0; else Player.Temp[playerid][@EditFurnitureRot] = 0.0;
					SetDynamicObjectRot(Player.Temp[playerid][@EditFurnitureObj], 0.0, 0.0, Player.Temp[playerid][@EditFurnitureRot]);
					
					//new Float:x, Float:y, Float:z;
					//GetDynamicObjectPos(Player.Temp[playerid][@EditFurnitureObj], x,y,z);
					//GetPointInFrontPos(playerid, x, y, Player.Temp[playerid][@EditFurnitureRot], x, y, 4.0);
					//new Float:dist = GetPlayerDistanceFromPoint(playerid, x, y,z);
					//SetPlayerCameraLookAt(playerid, x, y, z);
				}
				else if(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cOwnerID] == PlayerInfo[playerid][pID])
				{
					Create_MenuPlayerHouse(playerid);
				}
			}

			if(InvObjectData[GetInvValueItemSelected(playerid)][E_INV_TYPE] == INV_TYPE_WEAPON)
			{
				ReloadPlayerWeaponItem(playerid, GetInvValueItemSelected(playerid));

			}
		}
	}
	if(SAKEY_RELEASED(KEY_SPRINT | KEY_YES))
	{
		new pickupID = PlayerInfo[playerid][p_PickedUpPickup];
		
		if(pickupID != INVALID_STREAMER_ID)
		{
			new id = Streamer_GetIntData(STREAMER_TYPE_PICKUP, pickupID, E_STREAMER_EXTRA_ID);
			if(pickupID == CasaInfo[id][cPickUp][0]) 
			{
				if(PlayerToPoint(1.0,playerid,CasaInfo[id][cExteriorX], CasaInfo[id][cExteriorY], CasaInfo[id][cExteriorZ]))
				{
					Player_LockDoorsProperty(playerid, id);
				}
			}
			else if(pickupID == CasaInfo[id][cPickUp][1]) 
			{ 
				new interiorid = CasaInfo[id][cInteriorID];
				if(PlayerToPoint(1.0,playerid,DataE.HouseInterior[interiorid][@X],DataE.HouseInterior[interiorid][@Y], DataE.HouseInterior[interiorid][@Z]))
				{
					Player_LockDoorsProperty(playerid, id);
				}
			}
		}		

		new vehicleid = GetAreaIT_VehicleID(playerid);
		LockPlayerVehicleDoors(playerid, vehicleid);	
	}
	else if(SAKEY_RELEASED(KEY_HANDBRAKE | KEY_YES))
	{
		new vehicleid; 
		if(IsPlayerInAnyVehicle(playerid)) vehicleid = GetPlayerVehicleID(playerid);
		LockPlayerVehicleDoors(playerid, vehicleid);
	}
	if(PlayerInfoTemp[playerid][pt_IsLoggedIn])
	{
		if (SAKEY_PRESSED(KEY_FIRE))
		{
			rBit1_Set(eBit1_PlayerInfo[pt_ShootAnimWeapon], playerid, true);
		}
		else if (SAKEY_RELEASED(KEY_FIRE))
		{
			rBit1_Set(eBit1_PlayerInfo[pt_ShootAnimWeapon], playerid, false);
		}
		else if(SAKEY_PRESSED(KEY_ANALOG_LEFT))
		{
			if(GetInvItemSelected(playerid) > 0) 
			{ 
				if(IsPlayerInAnyVehicle(playerid)) return 1;
				else if(Player.Temp[playerid][@FreezeInventory] != 0) return 1;
				SelectedPlayerItemInventory(playerid, (PlayerInfo[playerid][pInvItemSelected] - 1));
				PlayerInfo[playerid][pInvItemSelected]--;
			}
		}
		else if(SAKEY_PRESSED(KEY_ANALOG_RIGHT))
		{
			if(GetInvItemSelected(playerid) < 11) 
			{ 
				if(IsPlayerInAnyVehicle(playerid)) return 1;
				else if(Player.Temp[playerid][@FreezeInventory] != 0) return 1;
				SelectedPlayerItemInventory(playerid, (PlayerInfo[playerid][pInvItemSelected] + 1));
				PlayerInfo[playerid][pInvItemSelected]++;
			}
		}
		else if(newkeys & KEY_LOOK_BEHIND)
		{
			if(!rBit1_Get(eBit1_PlayerInfo[p_HoldKey], playerid))
			{
				rBit1_Set(eBit1_PlayerInfo[p_HoldKey], playerid, true);
				SetTimerEx("Vehicle_HoldingKeyOptions", 400, false, "i", playerid);
				
			}
		}
	}
	/*new Float:SpeedM = 0.01;
    if(newkeys & KEY_UP) { ModifyAttachToVehicle(playerid, SpeedM, 2); }
    else if(newkeys & KEY_DOWN) { ModifyAttachToVehicle(playerid, -SpeedM, 2); }

    if(newkeys & 8 && newkeys & KEY_UP) { ModifyAttachToVehicle(playerid, SpeedM, 1); }
    else if(newkeys & 8 && newkeys & KEY_DOWN) { ModifyAttachToVehicle(playerid, -SpeedM, 1); }
 
    if(newkeys & KEY_LEFT) { ModifyAttachToVehicle(playerid, SpeedM, 0); }
    else if(newkeys & KEY_RIGHT) { ModifyAttachToVehicle(playerid, -SpeedM, 0); }*/
	return 1;
}

function GateClose6()
{
MoveDynamicObject(PuertasLSPD[0], 1596.0597, -1638.0491, 15.0416, 3.0);
}

function CerrarBarreraLSPD()
{
RotateDynamicObjectEx(PuertasLSPD[1], /*1544.6899, -1630.8151, 13.2163, 3.0,*/ 0.0000, 89.4515, 90.0000, 1.00);
}

/* Tipocargacamion*/
function LoadTruckJobPlayer(playerid, Tipo)
{
	if(Cargando[playerid] < 11)
	{
		Cargando[playerid]++;
		UpdatePlayerProgressBarGeneral(playerid);
	}	
	if(Cargando[playerid] == 11)
	{
		TogglePlayerControllable(playerid, 1);
		PlayerInfo[playerid][p_JobTravelNext]++;
		KillTimer(TimerDescargando[playerid]);
		HidePlayerProgressBarGeneral(playerid);
		OpenDoorTruck(CamionID[playerid], 0);
		SetPlayerNextCheckpointTrucker(playerid);
	}
}

function DescargandoCamion(playerid)
{
    new autoid = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(Cargando[playerid] > 0)
		{
	    	Cargando[playerid]--;
			UpdatePlayerProgressBarGeneral(playerid);
		}
		if(Cargando[playerid] == 0)
		{
			Cargando[playerid] = 10;
			CamionCargado[autoid] = 0;
			HidePlayerProgressBarGeneral(playerid);
			KillTimer(TimerDescargando[playerid]);
			TogglePlayerControllable(playerid, 1);
			new string[50];
			PlayerInfo[playerid][p_JobTravelNext]++;
//			printf("Reco Entrigate.");
			OpenDoorTruck(CamionID[playerid], 0);
			GPS_DestroyPlayerCP(playerid);
			SetPlayerNextCheckpointTrucker(playerid);
			format(string, sizeof(string), "Te estï¿½n esperando en ~b~%s",GetTruckerZoneName(PlayerInfo[playerid][p_JobTravel], PlayerInfo[playerid][p_JobTravelNext]));
			ShowPlayerInfoTextdraw(playerid, string, 4000);
 		}
	}
	return 1;
}

function CargarFunciones()
{
	CreateAreaSphereForVehicles(1004.0070,-939.3102,42.1797, 7.0, "para interactuar.", 0, 0, AREAITV_TYPE_LOAD_GAS, KEY_AREAIT_TYPE_V_YES);
	CreateAreaSphereForVehicles(1942.1719, -1772.8370, 13.6406, 7.0, "para interactuar.", 0, 0, AREAITV_TYPE_LOAD_GAS, KEY_AREAIT_TYPE_V_YES); // Market
	CreateAreaSphereForVehicles(-91.0272,-1169.1047,2.4222, 7.0, "para interactuar.", 0, 0, AREAITV_TYPE_LOAD_GAS, KEY_AREAIT_TYPE_V_YES); // Flint
	CreateAreaSphereForVehicles(1586.4141, -2173.3615, 13.6254, 7.0, "para interactuar.", 0, 0, AREAITV_TYPE_LOAD_GAS, KEY_AREAIT_TYPE_V_YES); // Flint

	for(new i = 1; i < sizeof pos_get_work_var; i++)
	{
		pickup_jobs[i] = CreateDynamicPickup(1239, 23, pos_get_work_var[i][3], pos_get_work_var[i][4], pos_get_work_var[i][2], floatround(pos_get_work_var[i][5]));
	}
	CreateInteractiveArea(pos_get_work_var[WORK_TYPE_TRUCKER][0], pos_get_work_var[WORK_TYPE_TRUCKER][1], pos_get_work_var[WORK_TYPE_TRUCKER][2], "para hablar.", 162, -1, 1.0, AREAIT_TYPE_REQUEST_WORKTRUCKER, 0, false);
	CreateInteractiveArea(pos_get_work_var[WORK_TYPE_FARMER][0], pos_get_work_var[WORK_TYPE_FARMER][1], pos_get_work_var[WORK_TYPE_FARMER][2], "para hablar.", floatround(pos_get_work_var[WORK_TYPE_FARMER][5]), -1, 2.0, AREAIT_TYPE_REQUEST_WORKFARMER, 0, false);
	CreateInteractiveArea(pos_get_work_var[WORK_TYPE_MINER][0], pos_get_work_var[WORK_TYPE_MINER][1], pos_get_work_var[WORK_TYPE_MINER][2], "para hablar.", floatround(pos_get_work_var[WORK_TYPE_MINER][5]), -1, 2.0, AREAIT_TYPE_REQUEST_WORKMINER, 0, false);

	pickup_bars_drink[0] = CreateDynamicPickup(19300, 1, 499.2339,-76.0398,998.7578);
	CreateInteractiveArea(-71.1164,296.8879,1009.7966, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_BMWEAPON1, 0, true, "{5EB5FF}Mercado negro\n{FFFFFF}8 objetos disponibles.", COLOR_WHITET, 5.0, true);
	CreateInteractiveArea(-119.6931, 80.0865, 1001.8571, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_BMWEAPON2, 0, true, "{5EB5FF}Mercado negro\n{FFFFFF}2 objetos disponibles.", COLOR_WHITET, 5.0, true);

	new str_buydrink[] = "{5EB5FF}Bebidas\n{FFFFFF}No hay informaciï¿½n disponible.";
	CreateInteractiveArea(-17.480232, -73.825622, 1003.554199, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_DRINKMARK, 0, true, str_buydrink, COLOR_WHITET, 5.0, false);

	CreateInteractiveArea(375.752288, -118.402633, 1001.499511, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_RESTAURANTS_DRINK, 0, true, str_buydrink, COLOR_WHITET, 5.0, false);

	CreateInteractiveArea(373.798278, -118.407791, 1001.492187, "para comprar.", -1, -1, 1.0, AREAIT_TYPE_BUY_FOODREST, 0, true, "{5EB5FF}Comida\n{FFFFFF}1 producto para comprar.", COLOR_TXT3DIT, 5.0, false);

	CreateInteractiveArea(161.439392, -82.751800, 1001.804687, "para comprar.", 400, -1, 1.0, AREAIT_TYPE_BUY_SKINZIP, 0, true, "{5EB5FF}Zip\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DT, 5.0, false);

	CreateInteractiveArea(-112.6549, 178.8740, 1100.6099, "para comprar.", 163, -1, 1.0, AREAIT_TYPE_BUY_VEHICLES1, 0, true, "{5EB5FF}Verdant Bluffs Car's\n{FFFFFF}varios productos disponibles.", COLOR_TXT3DT, 5.0, false);

	CreateInteractiveArea(1159.5576, -1317.2155, 1334.2060, "para hablar.", 105, -1, 1.0, AREAIT_TYPE_SERVICE_MEDIC, 0, true, "{5EB5FF}Hospital\n{FFFFFF}varios productos y servicios disponibles.", COLOR_TXT3DT, 5.0, false);

	CreateInitAreasServer();

	CreateCheckpointTruckerTravel(0, 2186.4673,-2301.9790,13.5469, 44.8800, 70, 1);
	CreateCheckpointTruckerTravel(0, 1921.7330,-1791.4073,13.3828, 270.3530, 300, 42);
	CreateCheckpointTruckerTravel(0, 1339.2659,-1764.5712,13.5316, 0.8851, 300, 42);
	CreateCheckpointTruckerTravel(0, 1565.3807,-1167.4672,24.0781, 269.5505, 250, 42);
	CreateCheckpointTruckerTravel(0, 1835.6337,-1831.8911,13.5854, 88.8246, 300, 42);

	CreateCheckpointTruckerTravel(1, 2186.4673,-2301.9790,13.5469, 44.8800);
	CreateCheckpointTruckerTravel(1, 2233.5703,-1689.9535,14.1436,90.1093, 250, 98);
	CreateCheckpointTruckerTravel(1, 2117.5110,-1213.3707,23.9657, 182.9000, 250, 88);
	CreateCheckpointTruckerTravel(1, 1447.2361,-1148.3969,24.0608, 219.6555, 250, 93);
	CreateCheckpointTruckerTravel(1, 503.2263,-1363.5062,16.1252, 286.8943, 300, 98);

	CreateCheckpointTruckerTravel(2, 122.8404,-294.4350,1.5781, 91.3483, 290, 101);
	CreateCheckpointTruckerTravel(2, 1010.1658,-908.1224,42.3281,3.4678, 250);
	CreateCheckpointTruckerTravel(2, 1316.0439,-876.5778,39.5781,0.5946, 250);

	CreateRacePlayer(1);
	CreateRacePlayer(2);
	CreateRacePlayer(3);
	CreateRacePlayer(4);
	CreateRacePlayerEx(5, "CPNormal/Basurero/BasureroC_SF");
	CreateRacePlayerEx(6, "CPNormal/Basurero/BasureroR_SF");
	CreateRacePlayerEx(7, "CPNormal/Basurero/BasureroC_LSM1");
	CreateRacePlayerEx(8, "CPNormal/Basurero/BasureroR_LSM1");

	ButtonPress[0] = CreateButtonE(434.5780, 63.3502, 1020.7338, 180.1493, 434.5665, 62.9810, 1020.7018, 359.7903);
	ButtonPress[1] = CreateButtonE(427.5767, 69.8148, 1020.6792, 0.0, 427.6367, 70.1626, 1020.6592, 180.2281);
	ButtonPress[2] = CreateButtonE(436.9637, 69.8273, 1020.6492, 0.0, 436.9707, 70.1252, 1020.6492, 180.0);
	ButtonPress[3] = CreateButtonE(425.2311, 63.3419, 1020.7538, 180.0, 425.2000, 63.0630, 1020.7438, 0.0);
	ButtonPress[4] = CreateButtonE(259.4266, 89.8268, 1002.5001, 180.0, 258.8957, 89.6686, 1002.5001, -91.0);
	ButtonPress[5] = CreateButtonE(248.3900, 74.6653, 1003.7603, 86.0, 247.9080, 74.6653, 1003.7603, 269.0);
	ButtonPress[6] = CreateButtonE(267.0324, 112.6598, 1004.8596, -180.50, 267.0324, 112.4118, 1004.8596, -2.50);
	ButtonPress[7] = CreateButtonE(209.6122, 160.2434, 1003.3737, 359.6571, 208.7530, 160.1933, 1003.3737, -91.0);
	ButtonPress[8] = CreateButtonE(209.6014, 177.1365, 1003.3737, -182.0, 208.7502, 177.1113, 1003.3737, -91.0);


	CombatModeGang = GangZoneCreate(-2989.536, -3328.195, 2989.536, 2989.536);

	Ob_DoorsThief[0] = CreateDynamicObject(1498, 2465.82251, -1995.39099, 13.12090, 0.00000, 0.32700, 0.00000);
	Ob_DoorsThief[1] = CreateDynamicObject(1498, 1885.4021, -1114.4352, 25.2623,   0.00000, 0.00000, 90.00000);
	Ob_DoorsThief[2] = CreateDynamicObject(1498, 2651.99219, -1988.95728, 12.99760,   0.00000, 0.00000, 0.00000);
	Ob_DoorsThief[3] = CreateDynamicObject(1506, -2621.37280, 96.00310, 3.73540,   0.00000, 0.00000, 90.00000);

	MinerGenerateRockMinerals(0, 18);
	MinerGenerateRockMinerals(1, 18);
	MinerGenerateRockMinerals(2, 18);
	MinerGenerateRockMinerals(3, 18);

	LoadServerTextdrawGlobal();
	VeloBox[0] = TextDrawCreate(581.0, 348.0, "__");
	TextDrawAlignment(VeloBox[0], 2);
	TextDrawFont(VeloBox[0], 1);
	TextDrawLetterSize(VeloBox[0], 0.000000, 3.099999);
	TextDrawColor(VeloBox[0], -1);
	TextDrawUseBox(VeloBox[0], 1);
	TextDrawBoxColor(VeloBox[0], 0x4A4A4AAA);
	TextDrawTextSize(VeloBox[0], 1.000000, 90.0);

	VeloBox[1] = TextDrawCreate(581.0, 382.0, "__");
	TextDrawAlignment(VeloBox[1], 2);
	TextDrawFont(VeloBox[1], 1);
	TextDrawLetterSize(VeloBox[1], 0.000000, 3.099999);
	TextDrawColor(VeloBox[1], -1);
	TextDrawUseBox(VeloBox[1], 1);
	TextDrawBoxColor(VeloBox[1], 0x4A4A4AAA);
	TextDrawTextSize(VeloBox[1], 0.000000, 90.0);

	VeloBox[2] = TextDrawCreate(624.0, 351.0, "KM/h");
	TextDrawAlignment(VeloBox[2], 3);
	TextDrawFont(VeloBox[2], 1);
	TextDrawLetterSize(VeloBox[2], 0.2, 0.9);
	TextDrawColor(VeloBox[2], -1);
	TextDrawSetShadow(VeloBox[2], 0);

	for(new v=1;v<MAX_VEHICLES;v++)
	{
		Vehicles_Info[v][gi_vehicle_GAS] = GetMaxGasolineVehicle(v);
	}
}

LoadServerFunctionsInitial()
{
	ServerGeneral.Info[@EventActive] = dini_Int("confsv.ini", "EventActive");
	LAC_EventsActive(ServerGeneral.Info[@EventActive]);

	resetWorkThiefHouses();

	textdraw_desbug = TextDrawCreate(0.0,0.0, "_");
	TextDrawFont(textdraw_desbug, 2);

	if(!map_valid(ServerGeneral_StorageMap)) { ServerGeneral_StorageMap = map_new(); }
}

LoadServerFunctionFirst()
{
	//
	CreateItemsInventoryAll();
	LoadMaterialTexturaAll();
	LoadFurnitureGeneralAll();

	// DB
	LoadDoors();
 	LoadActorsRobbery();
 	CargarMapeos();
 	LoadDataProperties();
	LoadDataParkings();
 	CargarFacciones();
 	LoadBarriers();
 	CargarVehiculosServidor();
 	LoadGlobalGrafitis();
}

function RespawnearVehiculo(autoid, type)
{
	if(type == 0) { SetVehicleToRespawnEx(autoid); }
	else if(type == 1) { DestroyVehicleEx(autoid); }
}

stock VelocidadVehiculo(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
	GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 180.3;
    return floatround(ST[3]);
}

function UpdateFuelVehicle()
{
	foreach (new i : Vehicle)
	{
		foreach (new u : Player)
		{
 			if(PlayerInfoTemp[u][pt_IsLoggedIn] == true)
 			{
    			if(Vehicles_Info[i][gi_vehicle_ENGINE] == 1)
				{
	    			if(Vehicles_Info[i][gi_vehicle_GAS] >= 1)
	    			{
 						if(IsPlayerInVehicle(u,i) && GetPlayerState(u) == PLAYER_STATE_DRIVER && getVehicleSpeed(i) != 0) 
	    				{
	    					
	    					if(gettime() > Vehicle_Time_Gasoline[i] + 35 && !IsABike(i))
	    					{	
	    						Vehicles_Info[i][gi_vehicle_GAS]--;
	    						new string[128];
	    						format(string, 128, "%d/%d", Vehicles_Info[i][gi_vehicle_GAS], GetMaxGasolineVehicle(i));
	    						PlayerTextDrawSetString(u, VeloText[u][1], string);
	    						SetPlayerProgressBarValue(u, Gasolina[u],Vehicles_Info[i][gi_vehicle_GAS]);
	    						ShowPlayerProgressBar(u, Gasolina[u]);
	    						Vehicle_Time_Gasoline[i] = gettime();
	    					}
	    
						}
						else
						{

	    					if(gettime() > Vehicle_Time_Gasoline[i] + 60)
	    					{	
	    						Vehicles_Info[i][gi_vehicle_GAS]--;
	    						Vehicle_Time_Gasoline[i] = gettime();
	    					}
						}

					}
					else if(Vehicles_Info[i][gi_vehicle_GAS] < 1)
					{
						new engine, lights, alarm, doors, bonnet, boot, objective;
            			GetVehicleParamsEx(i,engine, lights, alarm, doors, bonnet, boot, objective);
    					SetVehicleParamsEx(i, 0, lights, alarm, doors, bonnet, boot, objective);
						Vehicles_Info[i][gi_vehicle_ENGINE] = 0;
					}
				}
			}
		}
	}
}

stock AnticheatSpeedHack(i){
	if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
	{
		if(player_get_speed(i) > 800)
		{
			new pName[24],/*string[256],*//*query[200],*/day,month,year;
			getdate(day,month,year);
			GetPlayerName(i, pName, 24);
			/*format(string, sizeof(string), "El Jugador {BD3939}%s[ID:%d] {FFFFFF}fue baneado por el Anticheat. {FFFFFF}Razï¿½n: {BD3939}Speed Hack [%.0f]{FFFFFF}.",pName, i, player_get_speed(i));
			SendClientMessageToAll(-1, string);*/
			KickEx(i, 500);
		}
	}
	else if(GetPlayerState(i) == PLAYER_STATE_ONFOOT && player_get_speed2(i) > 20/*180*/)
	{
    	new animlib[32], animname[32];
        GetAnimationName(GetPlayerAnimationIndex(i),animlib,32,animname,32);
  		if(strcmp(animlib, "PED") == 0 && strcmp(animname, "WALK_player") == 0)
        {
			new string[82];
			format(string, sizeof(string), "{BD3939}Speed Hack s [%.0f]{FFFFFF}.", player_get_speed2(i));
			BaneoAnticheat(i, string, 1);
		}
	}
	return 1;
}

function VehiculoReparado(playerid, clientid, vehicleid, maxv)
{
	if(MecaVar[clientid] == maxv)
	{
		Mecanico[clientid] = INVALID_PLAYER_ID;
		SetVehicleHealth(vehicleid, 1000.0);
		/*RemovePlayerFromVehicle(playerid);*/
		ClearAnimations(playerid);
		ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
		/*ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);*/
		TogglePlayerControllable(playerid,1);
		//PayMechanicalWork(playerid);
		MecaVar[clientid] = 0;
		KillTimer(TimerMeca[clientid]);
		HidePlayerProgressBar(playerid, ProgressGeneral[playerid]);
		HidePlayerProgressBar(clientid, ProgressGeneral[clientid]);
	}
	else
	{
		MecaVar[clientid]++;
		SetPlayerProgressBarValue(playerid, ProgressGeneral[playerid], MecaVar[clientid]);
		SetPlayerProgressBarValue(clientid, ProgressGeneral[clientid], MecaVar[clientid]);
		ShowPlayerProgressBar(playerid, ProgressGeneral[playerid]);
		ShowPlayerProgressBar(clientid, ProgressGeneral[clientid]);
	}
}

function CheckStateVehicle(playerid)
{
	new Float: fExpHealth;
	new iVehicle;
	new arrVehParams[7];
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
		iVehicle = GetPlayerVehicleID(playerid);
		GetVehicleHealth(iVehicle,fExpHealth);
		if(fExpHealth < 351.0 && !IsABike(iVehicle)){
			SetVehicleHealth(iVehicle, 350.0);
			GetVehicleParamsEx(iVehicle, arrVehParams[0], arrVehParams[1], arrVehParams[2], arrVehParams[3], arrVehParams[4], arrVehParams[5], arrVehParams[6]);
			if(arrVehParams[0] == VEHICLE_PARAMS_ON) SetVehicleParamsEx(iVehicle,VEHICLE_PARAMS_OFF, arrVehParams[1], arrVehParams[2], arrVehParams[3], arrVehParams[4], arrVehParams[5], arrVehParams[6]);
			GameTextForPlayer(playerid, "~r~MOTOR AVERIADO", 2000, 3);
			Vehicles_Info[iVehicle][gi_vehicle_ENGINE] = 0;
		}
	}
}

function UpdateTagsPlayer()
{
	foreach (new u : Player)
	{
		if(VariableAbatido[u] == 1)
		{
			foreach (new i : Player)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
					{ SetPlayerMarkerForPlayer(i, u, Verde); }
			}
		}
		else if(PlayerInfo[u][pCargos] == 0)
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c0_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 1)
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c1_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 2)
		{
			foreach (new i : Player)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c2_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 3)
		{
			foreach (new i : Player)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c3_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 4)
		{
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c4_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 5)
		{
			foreach (new i : Player)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c5_color);
				}
			}
		}
		else if(PlayerInfo[u][pCargos] == 6)
		{
			foreach (new i : Player)
			{
				if(PlayerInfo[i][pDutyPolicia] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, c6_color);
				}
			}
		}
		else if(PlayerInfo[u][pAgonizando] == 0)
		{
			foreach (new i : Player)
			{
				if(CallMedic[u][0] == 1)
				{
					SetPlayerMarkerForPlayer(i, u, COLOR_MEDICP);
				}
			}
		}
		if(PlayerInfo[u][pDutyPolicia] == 1)
		{
			SetPlayerColor(u, COLOR_POLICIA);
		}
	}
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	if(enterexit)
	{

	}
	else
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid != INVALID_VEHICLE_ID)
		{
			ChangeVehicleColor(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_COLOR1], Vehicles_Info[vehicleid][gi_vehicle_COLOR2]);
			AddVehicleComponents(vehicleid);
			ChangeVehiclePaintjob(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_PAINTJOB]);
		}
	}
	return 1;
}

getNextVehicleID()
{
	new vehicleid = CreateVehicle(500, 0.0, 0.0, 0.0, 0.0, -1, -1, -1);
	DestroyVehicle(vehicleid);
	return vehicleid;
}

stock ConcesionarioCercano(playerid,modelo,color1,color2)
{
	new Float:Conce1,Float:Conce2,Float:Conce3,Float:Conce4,pName[32],query[200];
	new Float:pos_x, Float:pos_y, Float:pos_z, Float:pos_a;
	GetPlayerName(playerid, pName, 32);
	Conce1 = GetPlayerDistanceFromPoint(playerid, 1621.8475,-1894.2754,13.2682);
	Conce2 = GetPlayerDistanceFromPoint(playerid, 557.6544,-1260.8588,16.8133);
	Conce3 = GetPlayerDistanceFromPoint(playerid, 2127.5342,-1123.4701,24.9874);
	Conce4 = GetPlayerDistanceFromPoint(playerid, -1989.7445,288.3349,33.9223);
	if(Conce1 < Conce2 && Conce1 < Conce3 && Conce1 < Conce4)
	{
		pos_x = 1621.8475; pos_y= -1894.2754; pos_z=13.2682; pos_a=357.1741;
	}
	else if(Conce2 < Conce1 && Conce2 < Conce3 && Conce2 < Conce4 && Conce2)
	{
		pos_x = 557.6544; pos_y= -1260.8588; pos_z=16.8133; pos_a=17.7973;
	}
	else if(Conce3 < Conce1 && Conce3 < Conce2 && Conce3 < Conce4)
	{
		pos_x = 2127.5342; pos_y = -1123.4701; pos_z = 24.9874; pos_a = 3.9086;
	}
	else if(Conce4 < Conce1 && Conce4 < Conce2 && Conce4 < Conce3)
	{
		pos_x = -1989.7445; pos_y = 288.3349; pos_z = 33.9223; pos_a = 90.9973;
	}
}

stock GetPlayerAvailableVehicleID(/*i*/){
	for(new i = 1; i < MAX_VEHICLES_PLAYER; i++){
		if(VehicleInfo[i][vID] == 0/* && VehicleInfo[i][vOwnerID] == 0& VehicleInfo[i][vICID] == INVALID_VEHICLE_ID*/) return i;
	}
	return -1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	/*new id = GetVehiclePlayerID(vehicleid);
	if(IsValidVehicleEx(id))
	{
		VehicleInfo[id][vPaintjob] = paintjobid;
	}*/
	return 1;
}

stock PagoTrabajoLechero(playerid)
{
	if(PlayerInfo[playerid][p_JobTravelT] == 1)
	{
		new paymoney;
		if(Objetos[playerid] != INVALID_STREAMER_ID)
		{
			paymoney += 1000;
		}
		if(Objetos2[playerid] != INVALID_STREAMER_ID)
		{
			paymoney += 400;
		}
		if(Objetos3[playerid] != INVALID_STREAMER_ID)
		{
			paymoney += 400;
		}
		paymoney += (GetPlayerWorkLevel(playerid, WORK_TYPE_FARMER)*50);
		GivePlayerMoneyEx(playerid, paymoney, true);	
	}
	
	GivePlayerWorkSkill(playerid, WORK_TYPE_FARMER, 5);
	return 1;
}

stock GetMaxGasolineVehicle(vehicleid)
{
	new gasoline;
	new v = GetVehicleModel(vehicleid);
	if(v==485||v==571||v==572||v==574||v==583||v==457||v==539||v==486)
	{
		gasoline = 55;
	}
	else if(v == 522||v == 521||v==461||v==462||v==468||v==471||v==523||v==581||v==586||v==463)
	{
		gasoline = 70;
	}
	else if(v==555||v==494||v==502||v==503||v==477||v==429||v==496||v==492||v==410||v==436||v==405||v==545)
	{
		gasoline = 80;
	}
	else if(v==480||v==439||v==603||v==475||v==401||v==419)
	{
		gasoline = 85;
	}
	else if(v==505||v==489||v==579||v==422||v==482||v==582||v==413||v==440||v==459||v==554||v==525||v==599)
	{
		gasoline = 130;
	}
	else if(v == 456||v==573||v==444||v==556||v==557||v==487||v==488||v==497||v==417||v==425||v==447||v==469||v==548||
		v==563||v==520||v==408||v==578||v==428||v==427)
	{
		gasoline = 200;
	}
	else if(v==470||v==490||v==495||v==498||v==609||v==499||v==414||v==508||v==528)
	{
		gasoline = 140;
	}
	else if(v==434||v==445||v==411||v==415||v==542||v==541||v==540||v==533||v==529||v==526||v==527||v==516||v==517||
		v==518||v==507||v==596||v==597||v==598||v==600||v==602||v==585||v==565||v==566||v==559||v==562||v==558||
		v==576||v==551||v==550||v==546||v==547||v==421||v==491||v==467||v==420||v==500||v==400||v==587||v==402||
		v==474||v==426||v==580||v==549||v==404||v==536||v==412||v==442||v==438)
	{
		gasoline = 90;
	}
	else if(v==416||v==451||v==478||v==589||v==506||v==543||v==605||v==604||v==466||v==504||v==560||v==479||v==458||
		v==561||v==418||v==567||v==535||v==534||v==575||v==409)
	{
		gasoline = 100;
	}
	else if(v==423||v==483||v==430||v==446||v==452||v==453||v==454||v==472||v==473||v==484||v==493||v==595)
	{
		gasoline = 110;
	}
	else if(v==524||v==601)
	{
		gasoline = 210;
	}
	else if(v==455||v==532||v==407||v==544||v==433)
	{
		gasoline = 220;
	}
	else if(v==515||v==443||v==431||v==437)
	{
		gasoline = 230;
	}
	else if(v==403||v==514||v==406||v==432)
	{
		gasoline = 250;
	}
	else if(v==460||v==476||v==512||v==513||v==519||v==593||v==511)
	{
		gasoline = 300;
	}
	else if(v==553||v==577||v==592)
	{
		gasoline = 400;
	}
	else
	{
		gasoline = 40;
	}
	return gasoline;
}

stock GetTrunkSpaces(m)
{
	new spaces;
	if(m==448||m==461||m==462||m==463||m==468||m==471||m==481||m==509||m==510||m==521||m==522||m==523||m==581||m==586) spaces = 0; //Bikes
	else if(m==408||m==535||m==422||m==443||m==478||m==524||m==543||m==552||m==605||m==579||m==400||m==500||m==470) spaces = 5;
	else if(m==489||m==505||m==495||m==418||m==458||m==561||m==554||m==528||m==599) spaces = 6; 
	else if(m==573||m==403||m==413||m==440||m==459||m==578||m==601) spaces = 8;
	else if(m==414||m==499||m==514||m==515||m==490) spaces = 9;
	else if(m==455||m==431||m==437||m==433) spaces = 10;
	else spaces = 4;
	return spaces;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	new info[2];
	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, info);
	switch(info[0])
	{
		case AREA_TYPE_TRUCKER_ZONE:
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			else if(CamionID[playerid] != GetPlayerVehicleID(playerid)) return 1;
			ShowPlayerInfoTextdraw(playerid, "Estaciona la parte de atrï¿½s del camiï¿½n cerca del punto ~r~rojo");
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][6]);
			PlayerInfoTemp[playerid][pt_TimersE][6] = SetTimerEx("CheckPositionTruckJob_Timer", 1100, true, "i", playerid);
		}
		case AREA_TYPE_ZONE_DOOR:	
		{
			new OnGameModeInitCount = GetTickCount();
			Player.Temp[playerid][@PickedUpArea] = areaid;

			new id = info[1];
			if(areaid == CasaInfo[id][cAreaHouseID][0]) { funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			else if(areaid == CasaInfo[id][cAreaHouseID][1]) { funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
			else if(areaid == DoorInfo[id][dArea][0]) { funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			else if(areaid == DoorInfo[id][dArea][1]) { funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
			//else if(areaid == ParkingInfo[id][pgPickUp][0]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para entrar."); }
			//else if(areaid == ParkingInfo[id][pgPickUp][1]) { funct_AddTextDrawNotif(playerid, 1, 0, "Presiona ~k~~VEHICLE_ENTER_EXIT~ para salir."); }
			printf("Excecuted OnGameModeInit, time taken: %d", GetTickCount() - OnGameModeInitCount);
		}
		case AREA_TYPE_ZONE_IT_OBJECT:
		{
			new Pool:pool;
			GetFurnitureTypeProperty(PlayerInfo[playerid][p_INTERIOR_TYPE], PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], pool);
			
			switch(PlayerInfo[playerid][p_INTERIOR_TYPE])
			{
				case PLAYER_INTERIOR_PROPERTY:
				{
					if(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cOwnerID] != PlayerInfo[playerid][pID]) return 0;
				}
			}
			Player.Temp[playerid][@PickedUpAreaF] = areaid;

			new data_furniture[E_HOUSE_FURNITURE_DATA];

			if(!pool_valid(pool) || !pool_has(pool, info[1])) return 1;
			pool_get_arr(pool, info[1], data_furniture);

			new furid = data_furniture[E_HOUSE_FURNITURE_DATA_MODEL];
			new message[84];
			format(message, sizeof(message), "Pulsa ~k~~CONVERSATION_YES~ %s", MESSAGE_AREA_TYPE[ Furniture.Info[furid][@Message] ]);
			funct_AddTextDrawNotif(playerid, VNOTI_TYPE_ZONEIT, message, 1);
		}
	}
	
	if(Iter_Count(areag_NearIndex[playerid]) < MAX_AREAS_GE_INRANGE)
	{
		new data[2];
		Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, 2);
		
		if(data[0] == AREA_TYPE_PLAYER_NEAR_VEHICLE)
		{
			if(Iter_Contains(Vehicle, data[1]))
			{
				new cell = Iter_Free(areag_NearIndex[playerid]);

				areag_Near[playerid][cell] = data[1];
				Iter_Add(areag_NearIndex[playerid], cell);
				CallLocalFunction("OnPlayerEnterAreaITV", "ddd", playerid, data[1], 1);
			}
		}
	}
	if(areaid == sphere)
	{
		SendClientMessage(playerid, -1, "Enter Area In Range.");
	}
	if(areaid == spheretest)
	{
		SendClientMessage(playerid, -1, "Enter Area In Range.");
	}
/*	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new id = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
		if(areaid == ParkingInfo[id][pgAreaid][0]) { funct_AddTextDrawNotif(playerid, 1); }
		else if(areaid == ParkingInfo[id][pgAreaid][1]) { funct_AddTextDrawNotif(playerid, 1); }
	}*/
	/*PlayerInfo[playerid][p_PickedUpArea] = areaid;*/

	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	new info[2];
	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, info);
	switch(info[0])
	{
		case AREA_TYPE_TRUCKER_ZONE:
		{
			HidePlayerInfoTextdraw(playerid);
			KillTimer(PlayerInfoTemp[playerid][pt_TimersE][6]);
		}
		case AREA_TYPE_ZONE_DOOR:
		{
			vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 0);
			Player.Temp[playerid][@PickedUpArea] = INVALID_STREAMER_ID;
		}
		case AREA_TYPE_ZONE_IT_OBJECT:
		{
			vNoti_DestroyBoxEmpty(playerid, VNOTI_TYPE_ZONEIT, 1);
			Player.Temp[playerid][@PickedUpAreaF] = INVALID_STREAMER_ID;
		}
	/*	case AREA_TYPE_PLAYER_NEAR_VEHICLE:
		{
			PlayerInfoTemp[playerid][pt_VEHICLE_NEAR] = INVALID_VEHICLE_ID;
			StopTimerEnterAreaCheck(playerid);
		}*/
	}
	callback_LeaveDynamicAreaTwo(playerid, areaid);
	/*if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new id = Streamer_GetIntData(STREAMER_TYPE_AREA,areaid, E_STREAMER_EXTRA_ID);
		if(areaid == ParkingInfo[id][pgAreaid][0]) { funct_HideTextdrawNotif(playerid, 1); }
		else if(areaid == ParkingInfo[id][pgAreaid][1]) { funct_HideTextdrawNotif(playerid, 1); }
	}*/
	/*PlayerInfo[playerid][p_PickedUpArea] = areaid;*/
	/*if(PlayerInfo[playerid][pPickedUpPickup] == areaid)
	{
		funct_HideTextdrawNotif(playerid, 1);
		funct_HideTextdrawNotif(playerid, 2);
		PlayerInfo[playerid][pPickedUpPickup] = -1;
		PlayerInfo[playerid][pPickedPickupT] = 0;
	}*/
	return 1;
}

IsPlayerInArea(playerid, Float:minx, Float:miny, Float:maxx, Float:maxy)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(minx > maxx)
	{
		new Float:temp = maxx;
		maxx = minx;
		minx = temp;
	}
	if(miny > maxy)
	{
		new Float:temp = maxy;
		maxy = miny;
		miny = temp;
	}
	if(X >= minx && X <= maxx && Y >= miny && Y <= maxy) {
		return 1;
	}
	return 0;
}

stock IsPlayerInAreaZ(playerid, Float:minx, Float:miny, Float:minz, Float:maxx, Float:maxy, Float:maxz)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(minx > maxx)
	{
		new Float:temp = maxx;
		maxx = minx;
		minx = temp;
	}
	if(miny > maxy)
	{
		new Float:temp = maxy;
		maxy = miny;
		miny = temp;
	}
	if(minz > maxz)
	{
		new Float:temp = maxz;
		maxz = minz;
		minz = temp;
	}
	if(X >= minx && X <= maxx && Y >= miny && Y <= maxy && Z >= minz && Z <= maxz) {
		return 1;
	}
	return 0;
}

forward GiveGasolineVehicle(playerid, vehicleid, amount, type);
public GiveGasolineVehicle(playerid, vehicleid, amount, type)
{
	if(type == 0)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_GAS] < amount)
		{
			Vehicles_Info[vehicleid][gi_vehicle_GAS] += 1;
			SetPlayerProgressBarValue(playerid, Gasolina[playerid],Vehicles_Info[vehicleid][gi_vehicle_GAS]);
			ShowPlayerProgressBar(playerid, Gasolina[playerid]);
			GameTextForPlayer(playerid, "~y~~<~Cargando Tanque... ~w~Espera~>~", 1000, 5);
		}
		else if(Vehicles_Info[vehicleid][gi_vehicle_GAS] >= amount)
		{
			TogglePlayerControllable(playerid, 1);
			CargandoGasolina[playerid] = 0;
			KillTimer(LlenandoTanque[playerid]);
		}
	}
	else if(type == 1)
	{
		Vehicles_Info[vehicleid][gi_vehicle_GAS] += 1;
		SetPlayerProgressBarValue(playerid, Gasolina[playerid],Vehicles_Info[vehicleid][gi_vehicle_GAS]);
		ShowPlayerProgressBar(playerid, Gasolina[playerid]);
		GameTextForPlayer(playerid, "~y~~<~Cargando Tanque... ~w~Espera~>~", 1000, 5);
		if(Vehicles_Info[vehicleid][gi_vehicle_GAS] >= amount)
		{
			TogglePlayerControllable(playerid, 1);
			CargandoGasolina[playerid] = 0;
			KillTimer(LlenandoTanque[playerid]);
		}
	}
	return 1;	
}

stock EstaEnGasolinera(playerid){
if(PlayerToPoint(10.0, playerid, 1945.1288,-1770.6462,13.3906)) { return 1; }
else if(PlayerToPoint(10.0, playerid, 1004.0070,-939.3102,42.1797)) { return 1; }
else if(PlayerToPoint(10.0, playerid, 1589.7850,-2173.4023,13.5587)) { return 1; }
else if(PlayerToPoint(10.0, playerid, -90.7248,-1169.1958,2.4146)) { return 1; }
else if(PlayerToPoint(10.0, playerid, 2115.1821,920.2598,10.8203)) { return 1; } // LV - LS
else if(PlayerToPoint(10.0, playerid, 2639.6245,1105.8101,10.8203)) { return 1; } // LV 2
else if(PlayerToPoint(10.0, playerid, 1596.3254,2199.6331,10.8203)) { return 1; } // LV - Redsands West
else if(PlayerToPoint(10.0, playerid, 618.8275,1685.1516,6.9922)) { return 1; } // LV - Bone County
else if(PlayerToPoint(10.0, playerid, 608.3655,1699.9158,6.9922)) { return 1; } // LV - Bone County
else if(PlayerToPoint(10.0, playerid, -1472.1344,1863.9142,32.6328)) { return 1; } // LV - Tierra Robada
else if(PlayerToPoint(10.0, playerid, -1327.9078,2677.3601,50.0625)) { return 1; } // LV - Tierra Robada
else if(PlayerToPoint(10.0, playerid, -1675.1521,413.5032,7.1797)) { return 1; } // SF - Easter Basin
else if(PlayerToPoint(10.0, playerid, -2407.4417,976.2361,45.2969)) { return 1; } // SF - Juniper Hollow
else if(PlayerToPoint(10.0, playerid, 2201.7881,2474.7483,10.8203)) { return 1; } // LV - Comisaria LV
return 0;
}

stock ApplyAnimationEx(playerid,const animlib[],const animname[], Float:Speed, loop, lockx, locky, freeze, time, forcesync = 0)
{
	if(PlayerInfo[playerid][pAgonizando] == 1 || VariableAbatido[playerid] == 1 || IsPlayerInAnyVehicle(playerid)) return 1;
	ApplyAnimation(playerid, animlib, animname, Speed, loop, lockx, locky, freeze, time, forcesync);
	PlayerStatus[playerid] = 1;
	return 1;
}

forward PayDay();
public PayDay()
{
	foreach(new i : Player)
	{
		if(PlayerInfoTemp[i][pt_IsLoggedIn] == true)
		{
			SendPaydayForPlayer(i);
		}
	}
}

SendPaydayForPlayer(playerid)
{
	if(GetPlayerOpenNotifID(playerid, VNOTI_TYPE_GIVEPAYDAY) != BOXNOTIF_INVALID_ID) return 1;

	new string[370], string_add[128], string_right[128], string_rightadd[20];

	new i = funct_CreateTextdrawBoxNotif(playerid, VNOTI_TYPE_GIVEPAYDAY, true, 22.0);

	new interests, total, vehiclemoney_count;

	interests = PlayerInfo[playerid][pMinutesPlayed]*20;


	format(string, sizeof string, "");
	strcat(string, "Pago diario");
	funct_CreateTextdrawTextNotifEx(playerid, i, 0, string, 1);
	
	format(string, sizeof string, "");
	for(new slot; slot < MAX_PLAYER_PER_VEHICLES; slot++)
	{
		if(PlayerInfo[playerid][p_VehicleSlot][slot] != 0)
		{
			
			format(string_add, sizeof string_add, "impuestos %s~n~", Vehicles_Info[ PlayerInfo[playerid][p_VehicleSlot][slot] ][gi_vehicle_PLATE_NUMBER]);
			strcat(string, string_add);

			new vehiclemoney = floatround(Vehicles_DataSale[ PlayerInfo[playerid][p_VehicleSlot][slot] ][E_VEHICLEDATA_Sale_PRICE]/500);
			vehiclemoney_count += vehiclemoney;
			format(string_rightadd, sizeof string_rightadd, "~r~~h~-$%d~n~", vehiclemoney);
			strcat(string_right, string_rightadd);
		}
	}

	format(string_add, sizeof string_add, "intereses ganandos~n~");
	strcat(string, string_add);

	format(string_rightadd, sizeof string_rightadd, "~g~~h~+$%d~n~", interests);
	strcat(string_right, string_rightadd);

	// Check Grafitis
	new count_grafitis;
	if(PlayerInfo[playerid][p_FactionMember] != 0)
	{	
		for(new g = 0; g < MAX_FACTION_GRAFITIS; g++)
		{	
			if(Grafiti.Info[g][@ID] == 0) continue; 
			if(Grafiti.Info[g][@Owner] == PlayerInfo[playerid][p_FactionMember])
			{
				count_grafitis++;
			}
		}

		if(count_grafitis)
		{
			format(string_add, sizeof string_add, "graffitis conquistados~n~");
			strcat(string, string_add);

			//total = interests-vehiclemoney_count;
			format(string_rightadd, sizeof string_rightadd, "~g~~h~+$%d~n~", (count_grafitis*110));
			strcat(string_right, string_rightadd);
		}
	}

	total = (count_grafitis*110)+interests-vehiclemoney_count;

	// Total	
	format(string_add, sizeof string_add, "-~n~total");
	strcat(string, string_add);

	if(total < 0) { format(string_rightadd, sizeof string_rightadd, "~n~~r~~h~-$%d", LAC_abs(total)); RemoveMoney(playerid, LAC_abs(total), true, true); }
	else {format(string_rightadd, sizeof string_rightadd, "~n~~g~~h~$%d", total); PlayerInfo[playerid][pBanco] += total; }
	strcat(string_right, string_rightadd);

	funct_CreateTextdrawTextNotifEx(playerid, i, 1, string, 1, 0.0, 18.0, VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2);
	
	new lines = GetTextDrawLineCount(string);

	format(string, sizeof string, "");
	funct_CreateTextdrawTextNotifEx(playerid, i, 2, string_right, 1, 110.0, 18.0, VNOTI_LETTERSIZEX_T_2, VNOTI_LETTERSIZEY_T_2, .align = 3);

	vNoti_SetPlayerBoxSize(playerid, i, (lines*VNOTI_LETTERSIZE_T_2));
	
	vNoti_SetTimeHideBox(playerid, i, 20);

	UpdateNotificationForPlayer(playerid, i);

	return 1;
}

stock CalcularExpNivel(playerid)
{
	switch(PlayerInfo[playerid][p_LEVEL])
	{
	    case 1: { return 3; }
	    case 2: { return 7; }
	    case 3: { return 11; }
	    case 4: { return 15; }
		case 5: { return 19; }
		case 6: { return 28; }
		case 7: { return 41; }
		case 8: { return 50; }
		case 9: { return 54; }
		case 10: { return 70; }
		case 11: { return 74; }
		case 12: { return 80; }
		case 13: { return 84; }
		case 14: { return 85; }
		case 15: { return 95; }
		case 16: { return 115; }
		case 17: { return 140; }
		case 18: { return 180; }
		case 19: { return 200; }
		case 20: { return 204; }
		case 21: { return 229; }
	}
	return 0;
}

stock GetVehicleNearbyID(playerid, modelid, Float:range)
{
	new vehicleid;
	for(new v=0; v < MAX_VEHICLES; v++)
	{
		if(GetVehicleModel(v) == modelid)
		{
			new Float:Pos[3];
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			if(GetVehicleDistanceFromPoint(v, Pos[0], Pos[1], Pos[2]) < range)
			{
				vehicleid = v;
			}
		}
   	}
	return vehicleid;
}

function KillTimeCombat(playerid)
{
	CombatMode[playerid] = 0;
	GangZoneStopFlashForPlayer(playerid, CombatModeGang);
	GangZoneHideForPlayer(playerid, CombatModeGang);
}

function CheckEmailExist(playerid)
{
	new rows, fields;
	cache_get_row_count(rows);
	cache_get_field_count(fields);
	if(rows)
 	{
 	    ShowPlayerDialog(playerid, Email, DIALOG_STYLE_INPUT, "{5EB5FF}Ingresar correo electrï¿½nico", "{FFFFFF}Un correo electrï¿½nico valido te podrï¿½a ayudar a recuperar tu contraseï¿½a\nen caso de olvidarla.\nIngresa un correo electrï¿½nico:", "Siguiente", "Cancelar");
		return 0;
	}
	return 1;
}

stock LoadLabelHouse(i)
{
	new string[255], string3[20];
    switch(CasaInfo[i][cHouseType])
    {
    	case 0: format(string3, 20, "$");
		case 1: format(string3, 20, " LAC");
  	}

	if(CasaInfo[i][cSale] == 0)
	{
		if(CasaInfo[i][cPropertyType] == 0)
	    {
	    	format(string, sizeof(string), "Casa en venta\n{FFFFFF}Costo de la casa: {32BD3E}%s%s\n{FFFFFF}Nivel necesario: {5EB5FF}%d", FormatNumber(CasaInfo[i][cPrecio], "."), string3, CasaInfo[i][cNivel]);
			CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, COLOR_HOUSET, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	    	CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1273, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);
			CasaInfo[i][cAreaHouseID][0] = CreateDynamicSphere(CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ], 0.8);
		}
		else if(CasaInfo[i][cPropertyType] == 1)
		{
	    	format(string, sizeof(string), "Restaurante en venta\n{FFFFFF}Costo de la Propiedad: {32BD3E}%s%s\n{FFFFFF}Nivel necesario: {5EB5FF}%d", FormatNumber(CasaInfo[i][cPrecio], "."), string3, CasaInfo[i][cNivel]);
	    	CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, /*Verde*/COLOR_HOUSET, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1272, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);
		}
		else if(CasaInfo[i][cPropertyType] == 2)
		{
			format(string, sizeof(string), "Oficina en venta\n{FFFFFF}Costo de la propiedad: {32BD3E}%s%s\n{FFFFFF}Nivel necesario: {5EB5FF}%d", FormatNumber(CasaInfo[i][cPrecio], "."), string3, CasaInfo[i][cNivel]);
			CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, COLOR_HOUSET, CasaInfo[i][cExteriorX],CasaInfo[i][cExteriorY],CasaInfo[i][cExteriorZ]+0.5, 15.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0, 0);
			CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1273, 1, CasaInfo[i][cExteriorX],CasaInfo[i][cExteriorY],CasaInfo[i][cExteriorZ]-0.2);
		}
		/*CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, Verde, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.4, 15.0);
		CasaInfo[i][cPickUp] = CreatePickup(1273, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);*/
	}
	else if(CasaInfo[i][cSale] == 1)
	{
		if(CasaInfo[i][cPropertyType] == 0)
		{
  			format(string, sizeof(string), "Casa\n{FFFFFF}Propietario: {5EB5FF}%s\n", CasaInfo[i][cDueno]);
	 		CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, COLOR_HOUSET, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
			CasaInfo[i][cPickUp][0] = CreateDynamicPickup(19198, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.5);
			CasaInfo[i][cAreaHouseID][0] = CreateDynamicSphere(CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ], 0.8);
		}
		else if(CasaInfo[i][cPropertyType] == 1)
 		{
			format(string, sizeof(string), "Restaurante\n{FFFFFF}Propietario: {5EB5FF}%s\n\n{FFFFFF}Presiona {5EB5FF}'~k~~VEHICLE_ENTER_EXIT~' {FFFFFF}para ingresar al lugar", CasaInfo[i][cDueno]);
	 		CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, Verde, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+1.0, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
 			if(CasaInfo[i][cLock] == 0)
			{
				CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1318, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]);
			}
			else
			{
				CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1318, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]);
			}
		}
		else if(CasaInfo[i][cPropertyType] == 2)
		{
			format(string, sizeof(string), "{71AEF5}Oficina\n{FFFFFF}Propietario: {5EB5FF}%s\n\n{FFFFFF}Presiona {5EB5FF}'~k~~VEHICLE_ENTER_EXIT~' {FFFFFF}para ingresar al lugar", CasaInfo[i][cDueno]);
			CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, -1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.4, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
			CasaInfo[i][cPickUp][0] = CreateDynamicPickup(19198, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]);
		}
	}
 
   	//array = i;
    //Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][0], E_STREAMER_EXTRA_ID, array);

    new data[2];
    data[0] = AREA_TYPE_ZONE_DOOR;
    data[1] = i;
    Streamer_SetArrayData(STREAMER_TYPE_AREA, CasaInfo[i][cAreaHouseID][0], E_STREAMER_EXTRA_ID, data);

    Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][0], E_STREAMER_EXTRA_ID, i);

    new interiorid = CasaInfo[i][cInteriorID];

   	CasaInfo[i][cPickUp][1] = CreateDynamicPickup(19902, 1, DataE.HouseInterior[interiorid][@X],DataE.HouseInterior[interiorid][@Y], DataE.HouseInterior[interiorid][@Z]-1.0, CasaInfo[i][cVirtualWorld], 1);
    Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][1], E_STREAMER_EXTRA_ID, i);

    CasaInfo[i][cAreaHouseID][1] = CreateDynamicSphere(DataE.HouseInterior[interiorid][@X], DataE.HouseInterior[interiorid][@Y], DataE.HouseInterior[interiorid][@Z], 0.8, CasaInfo[i][cVirtualWorld]); 
    

    //new data[2];
    data[0] = AREA_TYPE_ZONE_DOOR;
    data[1] = i;
    Streamer_SetArrayData(STREAMER_TYPE_AREA, CasaInfo[i][cAreaHouseID][1], E_STREAMER_EXTRA_ID, data);
   

	
	//array = i;
    //Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][1], E_STREAMER_EXTRA_ID, array);
}

stock UpdateLabelHouse(i)
{
	new string[255], stringprice[20];
    switch(CasaInfo[i][cHouseType])
    {
    	case 0: format(stringprice, 20, "$%s", FormatNumber(CasaInfo[i][cPrecio], "."));
		case 1: format(stringprice, 20, "%s Coins", FormatNumber(CasaInfo[i][cPrecio], "."));
  	}

	if(CasaInfo[i][cSale] == 0)
	{
		if(CasaInfo[i][cPropertyType] == 0)
	    {
	    	format(string, sizeof(string), "Casa en venta\n{FFFFFF}Costo de la casa: {32BD3E}%s\n{FFFFFF}Nivel necesario: {5EB5FF}%d", stringprice, CasaInfo[i][cNivel]);
	    	CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1273, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);
		}
		else if(CasaInfo[i][cPropertyType] == 1)
		{
	    	format(string, sizeof(string), "Restaurante\n{FFFFFF}Costo de la Propiedad: {32BD3E}%d%s\n{FFFFFF}Nivel Necesario: {5EB5FF}%d\n{FFFFFF}Para Comprarla Usa: {5EB5FF}/comprar propiedad\n\n{FFFFFF}Usa {5EB5FF}/entrar {FFFFFF}para Ingresar al Lugar", CasaInfo[i][cPrecio], stringprice, CasaInfo[i][cNivel]);
        	CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1272, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);
		}
		else if(CasaInfo[i][cPropertyType] == 2)
		{
			format(string, sizeof(string), "Oficina\n{FFFFFF}Costo de la propiedad: {32BD3E}%d%s\n{FFFFFF}Nivel necesario: {5EB5FF}%d\n{FFFFFF}Para comprarla usa: {5EB5FF}/comprar propiedad\n\n{FFFFFF}Usa {5EB5FF}/entrar {FFFFFF}para ingresar al lugar", CasaInfo[i][cPrecio], stringprice, CasaInfo[i][cNivel]);
			CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1273, 1, CasaInfo[i][cExteriorX],CasaInfo[i][cExteriorY],CasaInfo[i][cExteriorZ]-0.2);
		}
		UpdateDynamic3DTextLabelText(CasaInfo[i][cTitulo3D], COLOR_HOUSET, string);
		/*CasaInfo[i][cTitulo3D] = CreateDynamic3DTextLabel(string, Verde, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]+0.4, 15.0);
		CasaInfo[i][cPickUp] = CreatePickup(1273, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]-0.2);*/
	}
	else if(CasaInfo[i][cSale] == 1)
	{
		if(CasaInfo[i][cPropertyType] == 0)
		{
  			format(string, sizeof(string), "Casa\n{FFFFFF}Propietario: {5EB5FF}%s\n\n{FFFFFF}Utiliza {5EB5FF}/entrar {FFFFFF}para Ingresar al Lugar", CasaInfo[i][cDueno]);
		}
		else if(CasaInfo[i][cPropertyType] == 1)
 		{
			format(string, sizeof(string), "Restaurante\n{FFFFFF}Propietario: {5EB5FF}%s\n\n{FFFFFF}Utiliza {5EB5FF}/entrar {FFFFFF}para Ingresar al Lugar", CasaInfo[i][cDueno]);
 			if(CasaInfo[i][cLock] == 0)
			{
				DestroyDynamicPickup(CasaInfo[i][cPickUp][0]);
				CasaInfo[i][cPickUp][0] = CreateDynamicPickup(1318, 1, CasaInfo[i][cExteriorX], CasaInfo[i][cExteriorY], CasaInfo[i][cExteriorZ]);
				Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][0], E_STREAMER_EXTRA_ID, i);
			}
		}
		else if(CasaInfo[i][cPropertyType] == 2)
		{
			format(string, sizeof(string), "Oficina\n{FFFFFF}Propietario: {5EB5FF}%s\n\n{FFFFFF}Usa {5EB5FF}/entrar {FFFFFF}para ingresar al lugar", CasaInfo[i][cDueno]);
		}
		UpdateDynamic3DTextLabelText(CasaInfo[i][cTitulo3D], COLOR_HOUSET, string);
	}

	Streamer_SetIntData(STREAMER_TYPE_PICKUP, CasaInfo[i][cPickUp][0], E_STREAMER_EXTRA_ID, i);
	return 1;
}

stock SetInteriorIDHouse(houseid, Float:X, Float:Y, Float:Z, Float:Angle, Interior, InteriorID, type = 0)
{
	if(type == 0)
	{
		CasaInfo[houseid][cInteriorX]=X, CasaInfo[houseid][cInteriorY]=Y, CasaInfo[houseid][cInteriorZ]=Z, CasaInfo[houseid][cAnguloInt] = Angle;
		CasaInfo[houseid][cInterior]=Interior, CasaInfo[houseid][cInteriorID] = InteriorID;
	}
}

stock GetPrueba(InteriorID, ID){
switch(InteriorID)
{
case 3: { SetInteriorIDHouse(ID, 2331.9023,-1135.1901,1050.7031, 0, 0, 0, 2); }
case 4: { SetInteriorIDHouse(ID, 243.4811,1021.4604,1084.0129, 0, 0, 0, 2); }
case 5: { SetInteriorIDHouse(ID, 223.4614,1079.8019,1084.1979, 0, 0, 0, 2); }
case 7: { SetInteriorIDHouse(ID, 240.5434,1195.1024,1080.2578, 0, 0, 0, 2); }
case 9: { SetInteriorIDHouse(ID, 22.3967,1347.2560,1084.3750, 0, 0, 0, 2); }
case 10: { SetInteriorIDHouse(ID, -286.0107,1480.1252,1084.3750, 0, 0, 0, 2); }
case 11: { SetInteriorIDHouse(ID, -266.6377,1451.4073,1084.3745, 0, 0, 0, 2); }
case 12: { SetInteriorIDHouse(ID, 78.2836,1338.3926,1083.8672, 0, 0, 0, 2); }
case 13: { SetInteriorIDHouse(ID, 2315.2537,-1008.1685,1050.2109, 0, 0, 0, 2); }
case 14: { SetInteriorIDHouse(ID, 2498.3120,-1711.3545,1014.7422, 0, 0, 0, 2); }
case 15: { SetInteriorIDHouse(ID, 2819.7197,-1166.2638,1025.5778, 0, 0, 0, 2); }
case 16: { SetInteriorIDHouse(ID, 2184.2002,-1207.2029,1049.0234, 0, 0, 0, 2); }
case 21: { SetInteriorIDHouse(ID, 31.4372,1404.4860,1084.4297, 0, 0, 0, 2); }
case 24: { SetInteriorIDHouse(ID, 302.3780,1482.7330,1080.2578, 0, 0, 0, 2); }
case 30: { SetInteriorIDHouse(ID, 231.7730,1243.9044,1082.1406, 0, 0, 0, 2); }
case 36: { SetInteriorIDHouse(ID, 413.9731,2537.5366,10.0077, 0, 0, 0, 2); }
case 37: { SetInteriorIDHouse(ID, 2314.3542,-1212.2018,1049.0234, 0, 0, 0, 2); }
case 28: { SetInteriorIDHouse(ID, 2373.8435,-1135.3251,1050.8750, 0, 0, 0, 2); }
case 38: { SetInteriorIDHouse(ID, 1275.3621,-822.0449,1085.6328, 0, 0, 0, 2); }
case 39: { SetInteriorIDHouse(ID, -2161.8977,640.5498,1057.5861, 0, 0, 0, 2); }
case 40: { SetInteriorIDHouse(ID, 2556.3147,-1297.4248,1060.9844, 0, 0, 0, 2); }
case 41: { SetInteriorIDHouse(ID, 501.9937,386.5709,934.0424, 0, 0, 0, 2); }
case 42: { SetInteriorIDHouse(ID, -791.3870,508.3225,1367.3672, 0, 0, 0, 2); }
}
return 1;
}

function TimerFiveMinutes()
{
	foreach (new i : Player)
	{
	    if(PlayerInfoTemp[i][pt_IsLoggedIn] == true)
	    {
	        GuardarCuenta(i, true);
	        SavePlayerVehicles(i, 0);
	        SavePlayerInventoryItems(i);
			SavePlayerWorkSkills(i);
			SavePlayerFactionFuncs(i);
	    }

	}
	for(new itemworld = 0; itemworld < MAX_ITEMS_WORLD; itemworld++)
	{
		if(ItemsWorld.Info[itemworld][@VALID])
		{
			if(ItemsWorld.Info[itemworld][@Time] < gettime())
		    {
		    	if(item_Interactor[itemworld] != INVALID_PLAYER_ID) continue;

		    	RemoveItemWorldTypeForDB(ItemsWorld.Info[itemworld][@ItemID], ItemsWorld.Info[itemworld][@ItemAmount]);

		    	RemoveItemFromWorld(itemworld);
				ItemsWorld.Info[itemworld][@X]		= 0.0;
				ItemsWorld.Info[itemworld][@Y]		= 0.0;
				ItemsWorld.Info[itemworld][@Z]		= 0.0;

		    	mysql_aquery_s(conexion, str_format("DELETE FROM `lac_servergral_witems` WHERE `id_index`=%d;", itemworld));
		    }
		}
	}
	foreach(new house : HouseIterator)
	{
		if(!CasaInfo[house][cInteriorLoaded]) continue;
		if(!CasaInfo[house][cPlayersInHouse])
		{
			House_UnloadInterior(house);
		}
	}
}

stock SetPlayerStatsWeapons(playerid)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 1);
	return 1;
}

function TonoLlamada1(playerid)
{
	PlayerPlaySound(playerid, 3401, 0.0, 0.0, 0.0);
	TimerLlamadaT1[playerid] = SetTimerEx("TonoLlamada2", 950, false, "i", playerid);
	return 1;
}
function TonoLlamada2(playerid)
{
	PlayerPlaySound(playerid, 3402, 0.0, 0.0, 0.0);
	TimerLlamadaT2[playerid] = SetTimerEx("TonoLlamada1", 950, false, "i", playerid);
	return 1;
}

#define vc_limit_X_WEST 0.0
#define vc_limit_X_EAST 3000.0
#define vc_limit_Y_NORTH 0.0
#define vc_limit_Y_SOUTH -3000.0

/*stock floatMapa3D(Float:x, Float:y, Float:texturaX, Float:texturaY, Float:textura_tamanoX, Float:textura_tamanoY, &Float:_2Dx, &Float:_2Dy)
{
	if(x > vc_limit_X_EAST) x = vc_limit_X_EAST;
    else if(x < vc_limit_X_WEST) x = vc_limit_X_WEST;
 
    if(y > vc_limit_Y_NORTH) y = vc_limit_Y_NORTH;
    else if(y < vc_limit_Y_SOUTH) y = vc_limit_Y_SOUTH;


	new Float:MapSizeX, Float:MapSizeY;
	MapSizeX = floatdiv(textura_tamanoX, 2);
	MapSizeY = floatdiv(textura_tamanoY, 2);
		
	_2Dx =texturaX + ((MapSizeX/vc_limit_X_EAST)*x + MapSizeX); 
	_2Dy =texturaY + ((-MapSizeY/vc_limit_Y_SOUTH)*y + MapSizeY);
	return 1;
}*/

stock floatMapa3D(Float:x, Float:y, Float:texturaX, Float:texturaY, Float:textura_tamanoX, Float:textura_tamanoY, &Float:_2Dx, &Float:_2Dy)
{
	if(x > vc_limit_X_EAST) x = vc_limit_X_EAST;
    else if(x < vc_limit_X_WEST) x = vc_limit_X_WEST;
 
    if(y > vc_limit_Y_NORTH) y = vc_limit_Y_NORTH;
    else if(y < vc_limit_Y_SOUTH) y = vc_limit_Y_SOUTH;
	
	new Float:map_width = floatsub(vc_limit_X_EAST, vc_limit_X_WEST);
    new Float:prop_X = floatdiv(textura_tamanoX, map_width);
    new Float:mv_X = floatsub(map_width, vc_limit_X_EAST);
 
    new Float:map_height = floatsub(vc_limit_Y_SOUTH, vc_limit_Y_NORTH);
    new Float:prop_Y = floatdiv(textura_tamanoY, map_height);
    new Float:mv_Y = floatsub(map_height, vc_limit_Y_SOUTH);

	x += mv_X;     
    y += mv_Y;

	_2Dx = texturaX + floatmul(prop_X, x) - floatdiv(7.0, 2),
   	_2Dy = texturaY + floatmul(prop_Y, y) - floatdiv(8.0, 2);
	return 1;
}

stock CreateSpriteMapTextdraw(playerid, Float:X, Float:Y, type, spriteid, typet, color, doorid = 1)
{
	new typeicon[54], Float:PosIcon[2];
	floatMapa3D(X, Y, 178.0-5.0, 137.0-3.0, 280.0, 280.0,PosIcon[0], PosIcon[1]);
	
	if(typet == 0)
	{
	switch(type)
	{
		case 30: { format(typeicon, sizeof(typeicon), "hud:radar_police"); }
	    case 41: { format(typeicon, sizeof(typeicon), "hud:radar_waypoint"); }
	    case 52: { format(typeicon, sizeof(typeicon), "hud:radar_cash"); }
	    case 56: { format(typeicon, sizeof(typeicon), "hud:radar_light"); }
	    case 57: { format(typeicon, sizeof(typeicon), "hud:radar_runway"); }
	    case 60: { format(typeicon, sizeof(typeicon), "hud:radar_gangY"); }
	    case 61: { format(typeicon, sizeof(typeicon), "hud:radar_gangN"); }
	}

	new PlayerText:textdraw = CreatePlayerTextDraw(playerid,PosIcon[0], PosIcon[1], typeicon);
	PlayerTextDrawBackgroundColor(playerid,textdraw, 255);
	PlayerTextDrawFont(playerid,textdraw, 4);
	PlayerTextDrawLetterSize(playerid,textdraw, 0.000000, 0.000000);
	PlayerTextDrawColor(playerid,textdraw, -1);
	PlayerTextDrawSetOutline(playerid,textdraw, 0);
	PlayerTextDrawSetProportional(playerid,textdraw, 1);
	PlayerTextDrawSetShadow(playerid,textdraw, 1);
	PlayerTextDrawUseBox(playerid,textdraw, 1);
	PlayerTextDrawBoxColor(playerid,textdraw, 255);
	PlayerTextDrawTextSize(playerid,textdraw, 7.0, 8.0);
	PlayerTextDrawSetSelectable(playerid,textdraw, 1);
	PlayerTextDrawShow(playerid, textdraw);
	
	new data[E_PLAYER_TD_GPS_DATA];
	data[E_PLAYER_TD_GPS_DATA_TD] = textdraw;
	data[E_PLAYER_TD_GPS_DATA_Door] = doorid;
	map_add_arr(Player.Temp[playerid][@ItemsGPS], _:textdraw, data);
	}
	else if(typet == 1)
	{
		IconMap3D[playerid][spriteid] = CreatePlayerTextDraw(playerid,PosIcon[0]+2.0, PosIcon[1]+2.0, "~null~");
		PlayerTextDrawAlignment(playerid,IconMap3D[playerid][spriteid], 2);
		PlayerTextDrawBackgroundColor(playerid,IconMap3D[playerid][spriteid], 255);
		PlayerTextDrawFont(playerid,IconMap3D[playerid][spriteid], 3);
		PlayerTextDrawLetterSize(playerid,IconMap3D[playerid][spriteid], 0.500004, 0.500000);
		PlayerTextDrawColor(playerid,IconMap3D[playerid][spriteid], color/*-16776961*/);
		PlayerTextDrawSetOutline(playerid,IconMap3D[playerid][spriteid], 1);
		PlayerTextDrawSetProportional(playerid,IconMap3D[playerid][spriteid], 1);
		PlayerTextDrawSetSelectable(playerid,IconMap3D[playerid][spriteid], 0);
	}
	
	return 1;
}

stock GetPosSpriteMapTextdraw(Float:X, Float:Y, &Float:tx, &Float:ty)
{
	floatMapa3D(X, Y, 159.0-5.0, 137.0-3.0, 295.0, 280.0,tx,ty);
}


GetIconGPSForID(type)
{
	new typeicon[54];
	switch(type)
	{
		case 17: { format(typeicon, sizeof(typeicon), "hud:radar_diner"); }
		case 19: { format(typeicon, sizeof(typeicon), "hud:radar_enemyAttack"); }
		case 22: { format(typeicon, sizeof(typeicon), "hud:radar_hostpital"); }
		case 27: { format(typeicon, sizeof(typeicon), "hud:radar_modGarage"); }
		case 30: { format(typeicon, sizeof(typeicon), "hud:radar_police"); }
		case 34: { format(typeicon, sizeof(typeicon), "hud:radar_RYDER"); }
	    case 41: { format(typeicon, sizeof(typeicon), "hud:radar_waypoint"); }
	    case 45: { format(typeicon, sizeof(typeicon), "hud:radar_tshirt"); }
	    case 50: { format(typeicon, sizeof(typeicon), "hud:radar_dateFood"); }
	    case 52: { format(typeicon, sizeof(typeicon), "hud:radar_cash"); }
	    case 55: { format(typeicon, sizeof(typeicon), "hud:radar_impound"); }
	    case 56: { format(typeicon, sizeof(typeicon), "hud:radar_light"); }
	    case 57: { format(typeicon, sizeof(typeicon), "hud:radar_runway"); }
	    case 60: { format(typeicon, sizeof(typeicon), "hud:radar_gangY"); }
	    case 61: { format(typeicon, sizeof(typeicon), "hud:radar_gangN"); }
	}
	return typeicon;
}

stock LoadAllPointsGPS()
{
	for(new i = 0; i < MAX_DOORS; i++)
	{
		if(DoorInfo[i][dMapIconID] > 0)
        {
            for(new td = 0; td < 40; td++)
            {
                if(IconMapGPSVar[td] == -1)
                {
                    CreateIconMapGlobalGPS(td, DoorInfo[i][dExitX], DoorInfo[i][dExitY], DoorInfo[i][dMapIconID], i);
                    break;
                }
            }
        }
	}
	return 1;
}

stock GetCapacityRefrigerator(houseid)
{
	new capacidad;
	new intid = CasaInfo[houseid][cInteriorID];
	/*switch(intid)
	{
		case 7,9..15,39: capacidad = 50;
		case 42: capacidad = 250;
	}*/
	if(intid == 42)
	{
		capacidad = 250;
	}
	else if(intid==7||intid>9&&intid<15||intid==39||intid==40)
	{
		capacidad = 50;
	}
	else
	{
		capacidad = 20;
	}
	return capacidad;
}

stock GetCapacityShelf(houseid)
{
	new capacity;
	new intid = CasaInfo[houseid][cInteriorID];

	switch(intid)
	{
		case 3, 4, 5: { capacity = 30; }
		case 38, 40: { capacity = 35; }
		default: { capacity = 25; }
	}
	return capacity;
}

public OnPlayerUpdate(playerid)
{

	if(Player.Temp[playerid][@StateGameo] != GAME_STATE_NORMAL) return 1;

	//new player_state = GetPlayerState(playerid);
	new newweapon = GetPlayerWeapon(playerid);
	if(newweapon) AnticheatWeapon(playerid, newweapon);

	new Float:health_vehicle, vehicleid = GetPlayerVehicleID(playerid);

	if(vehicleid)
	{
		GetVehicleHealth(vehicleid, health_vehicle);
	}

	if(Player.Temp[playerid][@EditFurniture] != 0)
	{

		new Keys,ud,lr;
	    GetPlayerKeys(playerid,Keys,ud,lr);

	 
	    if(ud == KEY_UP) 
	    {
	    	if(Keys & KEY_WALK)
	    	{
	    		PlayerMovePositionFurniture(playerid, 0, 0.080);
	    	}
	    	else if(Keys & KEY_SPRINT)
	    	{
	    		PlayerMovePositionFurniture(playerid, 2, 0.040);
	    	}
	    	else
	    	{
	    		PlayerMovePositionFurniture(playerid, 0, 0.040);
	    	}
	    }
	    else if(ud == KEY_DOWN) 
	    {
	    	if(Keys & KEY_WALK)
	    	{
	    		PlayerMovePositionFurniture(playerid, 0, -0.080);
	    	}
	    	else if(Keys & KEY_SPRINT)
	    	{
	    		PlayerMovePositionFurniture(playerid, 2, -0.040);
	    	}
	    	else
	    	{
	    		PlayerMovePositionFurniture(playerid, 0, -0.040);
	    	}
	    }
	 
	    if(lr == KEY_LEFT) 
	    { 
	    		PlayerMovePositionFurniture(playerid, 1, 0.040);
	    }
	    else if(lr == KEY_RIGHT)
	    {
	    		PlayerMovePositionFurniture(playerid, 1, -0.040);
	    }
	}

	GetPlayerPos(playerid, PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z]);
 	if(vehicleid)
	{
		GetVehiclePos(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_POS_X], Vehicles_Info[vehicleid][gi_vehicle_POS_Y], Vehicles_Info[vehicleid][gi_vehicle_POS_Z]);
		Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = health_vehicle;
	}
    return 1;
}

stock GetPlayerVehicleProperty(playerid, vehicleid)
{
	if(IsValidVehicleEx(vehicleid)/*VehicleCreated[vehicleid] == 1*/)
	{
		if(VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] == PlayerInfo[playerid][pID])
		{
			return 1;
		}
	}
	return /*0*/-1;
}

stock IsValidVehicleEx(vehicleid)
{
	if(Vehicles_Info[vehicleid][gi_vehicle_VALID]) return 1;
	return 0;
}

stock SetPlayerJailCell(playerid)
{
	if(PlayerInfo[playerid][pPlaceCarcel] == 1)
	{
		new celda = random(3);
		switch(celda)
		{
			case 0:	SetPlayerPosEx(playerid, 265.0223,86.8349,1001.0391,270.6857, 6, DoorInfo[2][dEnterVW]);
			case 1: SetPlayerPosEx(playerid, 265.0223,86.8349,1001.0391,270.6857, 6, DoorInfo[2][dEnterVW]);
			case 2: SetPlayerPosEx(playerid, 264.7611,77.7173,1001.0391,268.2025, 6, DoorInfo[2][dEnterVW]);
		}
	}
	else if(PlayerInfo[playerid][pPlaceCarcel] == 2)
	{
		new celda = random(4);
        if(celda == 0)
        {
		SetPlayerPos(playerid, 227.3367,109.3470,999.0156);
		SetInterior(playerid, 10);
		SetVW(playerid, DoorInfo[2][dEnterVW]);
		}
		else if(celda == 1)
        {
		SetPlayerPos(playerid, 223.0108,109.8135,999.0156);
		SetInterior(playerid, 10);
		SetVW(playerid, DoorInfo[2][dEnterVW]);
		}
		else if(celda == 2)
        {
		SetPlayerPos(playerid, 219.0009,110.3388,999.0156);
		SetInterior(playerid, 10);
		SetVW(playerid, DoorInfo[2][dEnterVW]);
		}
  		else if(celda == 3)
        {
		SetPlayerPos(playerid, 215.2188,109.1792,999.0156);
		SetInterior(playerid, 10);
		SetVW(playerid, DoorInfo[2][dEnterVW]);

		}
		/*SetPlayerVirtualWorld(playerid, DoorInfo[2][dEnterVW]);*/
	}
	else if(PlayerInfo[playerid][pPlaceCarcel] == 3)
	{
		new celda = random(6);
		switch(celda)
		{
			case 0: SetPlayerPosEx(playerid, 190.1273,161.6009,1003.0034,182.0954, 3, DoorInfo[57][dEnterVW]);
			case 1: SetPlayerPosEx(playerid, 194.1801,161.4715,1003.0034,180.5288, 3, DoorInfo[57][dEnterVW]);
			case 2: SetPlayerPosEx(playerid, 198.4483,161.6670,1003.0300,178.0455, 3, DoorInfo[57][dEnterVW]);
			case 3: SetPlayerPosEx(playerid, 197.8337,175.6054,1003.0234,358.5505, 3, DoorInfo[57][dEnterVW]);
			case 4: SetPlayerPosEx(playerid, 193.6409,176.0040,1003.0234,358.5739, 3, DoorInfo[57][dEnterVW]);
			case 5: SetPlayerPosEx(playerid, 189.2704,175.9224,1003.0034,0.4773, 3, DoorInfo[57][dEnterVW]);
		}
	}
	return 1;
}

stock CreatePlayerGeneralTextdraw(playerid)
{
	TaximeterTextdraw[playerid][0] = CreatePlayerTextDraw(playerid,441.000000, 371.000000, "Taximetro");
	PlayerTextDrawBackgroundColor(playerid,TaximeterTextdraw[playerid][0], 255);
	PlayerTextDrawFont(playerid,TaximeterTextdraw[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid,TaximeterTextdraw[playerid][0], 0.400000, 1.100000);
	PlayerTextDrawColor(playerid,TaximeterTextdraw[playerid][0], -1);
	PlayerTextDrawSetOutline(playerid,TaximeterTextdraw[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid,TaximeterTextdraw[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid,TaximeterTextdraw[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid,TaximeterTextdraw[playerid][0], 0);

	TaximeterTextdraw[playerid][1] = CreatePlayerTextDraw(playerid,473.000000, 372.000000, "__");
	PlayerTextDrawAlignment(playerid,TaximeterTextdraw[playerid][1], 2);
	PlayerTextDrawBackgroundColor(playerid,TaximeterTextdraw[playerid][1], 255);
	PlayerTextDrawFont(playerid,TaximeterTextdraw[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid,TaximeterTextdraw[playerid][1], 1.500000, 0.999999);
	PlayerTextDrawColor(playerid,TaximeterTextdraw[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid,TaximeterTextdraw[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid,TaximeterTextdraw[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid,TaximeterTextdraw[playerid][1], 1);
	PlayerTextDrawUseBox(playerid,TaximeterTextdraw[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid,TaximeterTextdraw[playerid][1], 83);
	PlayerTextDrawTextSize(playerid,TaximeterTextdraw[playerid][1], 40.000000, 100.000000);
	PlayerTextDrawSetSelectable(playerid,TaximeterTextdraw[playerid][1], 0);

	TaximeterTextdraw[playerid][2] = CreatePlayerTextDraw(playerid,473.000000, 386.000000, "$0");
	PlayerTextDrawAlignment(playerid,TaximeterTextdraw[playerid][2], 2);
	PlayerTextDrawBackgroundColor(playerid,TaximeterTextdraw[playerid][2], 255);
	PlayerTextDrawFont(playerid,TaximeterTextdraw[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid,TaximeterTextdraw[playerid][2], 0.420000, 1.599999);
	PlayerTextDrawColor(playerid,TaximeterTextdraw[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid,TaximeterTextdraw[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid,TaximeterTextdraw[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid,TaximeterTextdraw[playerid][2], 1);
	PlayerTextDrawUseBox(playerid,TaximeterTextdraw[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid,TaximeterTextdraw[playerid][2], 83);
	PlayerTextDrawTextSize(playerid,TaximeterTextdraw[playerid][2], 40.000000, 100.000000);
	PlayerTextDrawSetSelectable(playerid,TaximeterTextdraw[playerid][2], 0);
}

function TaximeterT(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(TAXI(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
	{
		if(PlayerInfo[playerid][pDinero] >= Taximeter[TaxiDriver[playerid]])
		{
			new string[128], pay;
			pay = TaximeterAmount[TaxiDriver[playerid]]+Taximeter[TaxiDriver[playerid]];
			RemoveMoney(playerid, Taximeter[TaxiDriver[playerid]]);
			TaximeterAmount[TaxiDriver[playerid]] = pay;
			format(string, sizeof(string), "$%d", TaximeterAmount[TaxiDriver[playerid]]);
			PlayerTextDrawSetString(playerid, TaximeterTextdraw[playerid][2], string);
			PlayerTextDrawSetString(TaxiDriver[playerid], TaximeterTextdraw[TaxiDriver[playerid]][2], string);
		}
		else
		{
			SendClientMessage(TaxiDriver[playerid], -1, "Tu cliente no tiene el dinero suficiente para poder pagar el servicio.");
			RemovePlayerFromVehicle(playerid);
			KillTimer(TaximeterTimer[playerid]);
		}
	}
	else
	{
		KillTimer(TaximeterTimer[playerid]);
	}
	return 1;
}

GetPlayerJobName(jobid)
{
	new TrabajoN[32];
	switch(jobid)
	{
		case 0: { TrabajoN = "Ninguno"; }
		case 1: { TrabajoN = "Mï¿½dico"; }
		case 2: { TrabajoN = "Camionero"; }
		case 3: { TrabajoN = "Taxista"; }
		case 4: { TrabajoN = "Granjero"; }
		case 5: { TrabajoN = "Minero"; }
		case 6: { TrabajoN = "Mecï¿½nico"; }
		case 7: { TrabajoN = "Basurero"; }
	}	
	return TrabajoN;
}
stock IsPlayerHasJob(playerid, job)
{
	if(PlayerInfo[playerid][pJob] == job /*|| PlayerInfo[playerid][pJob2] == job*/)
	{
		return 1;
	}
	return 0;
}

/*AddTuneosVehicle(vehicleid, vehicled, type)
{
	new query[256];
	format(query, sizeof(query), "SELECT * FROM lac_tuneados WHERE idvehicle = '%d' AND type='%d'", vehicled, type);
	mysql_tquery(conexion, query, "LoadVehicleTuneos", "i", vehicleid);
	return 1;
}

function LoadVehicleTuneos(vehicleid)
{
	new rows,fields;
	cache_get_row_count(rows);
	cache_get_field_count(fields);
	if(rows)
	{
		if(  0 < rows <= MAX_TUNEOS )
		{
		for(new i = 0; i < rows; i++)
		{
				new id = GetAvailableTuneoID();
				new content[35];
				cache_get_value_name(i, "id", content); TuneoInfo[id][tID] = strval(content);
				cache_get_value_name(i, "object", content); TuneoInfo[id][tObject] = strval(content);
				cache_get_value_name(i, "OffsetX", content); TuneoInfo[id][tOffsetX] = floatstr(content);
				cache_get_value_name(i, "OffsetY", content); TuneoInfo[id][tOffsetY] = floatstr(content);
				cache_get_value_name(i, "OffsetZ", content); TuneoInfo[id][tOffsetZ] = floatstr(content);
				cache_get_value_name(i, "RotX", content); TuneoInfo[id][tRotX] = floatstr(content);
				cache_get_value_name(i, "RotY", content); TuneoInfo[id][tRotY] = floatstr(content);
				cache_get_value_name(i, "RotZ", content); TuneoInfo[id][tRotZ] = floatstr(content);
				cache_get_value_name(i, "idvehicle", content); TuneoInfo[id][tVehicleID] = strval(content);
				cache_get_value_name(i, "type", content); TuneoInfo[id][tType] = strval(content);

				TuneoInfo[id][tIcVehicle] = vehicleid;
				new v = GetVehiclePlayerID(vehicleid);
				
				
				
				new Float:pos[3], Float:vpos[3];
				GetVehiclePos(TuneoInfo[id][tIcVehicle], vpos[0],vpos[1],vpos[2]);
				pos[0] = vpos[0] + TuneoInfo[id][tOffsetX];
				pos[1] = vpos[1] + TuneoInfo[id][tOffsetY];
				pos[2] = vpos[2] + TuneoInfo[id][tOffsetZ];

				if(TuneoInfo[id][tType] == 1)
				{
					TuneoInfo[id][tObjectID] = CreateDynamicObject(TuneoInfo[id][tObject], 0.0,0.0,0.0,0.0,0.0,0.0,TuneoInfo[id][tRotX], TuneoInfo[id][tRotY], TuneoInfo[id][tRotZ]);
					AttachDynamicObjectToVehicle(TuneoInfo[id][tObjectID], vehicleid, TuneoInfo[id][tOffsetX], TuneoInfo[id][tOffsetY], TuneoInfo[id][tOffsetZ], TuneoInfo[id][tRotX], TuneoInfo[id][tRotY], TuneoInfo[id][tRotZ]);
				}
			} 	
		}
	}
}*/

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	if(playerobject)
	{
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	return 1;
}

function PlayerReanimated(playerid, patient)
{
	if(Reanimated[patient] > 0) return SendClientMessage(playerid, -1, "Esta persona ya fue atendida.");
	Reanimated[patient] = playerid;
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	SetPlayerHealth(patient, 100.0);
	PlayerInfo[playerid][pAgonizando] = 0;
	StatePatient[playerid] = 0;
	StatePatient[patient] = 2;
	SendClientMessage(playerid, -1, "Tu paciente comienza a perder sangre, llï¿½valo rï¿½pido a un hospital, para subirlo a la ambulancia usa {5EB5FF}/subir paciente");
	return 1;
}

function LoadDFT(playerid)
{
	if(Cargando[playerid] < 11)
	{
		Cargando[playerid]++;
		UpdatePlayerProgressBarGeneral(playerid);
	}
	else
	{
		new reco;

		Cargando[playerid] = 0;
		HidePlayerProgressBarGeneral(playerid);
		KillTimer(TimerDescargando[playerid]);

		reco = PlayerInfo[playerid][p_JobTravel];

		if(reco == 1)
		{
			Objetos[playerid] = CreateDynamicObject(1775, 0.0, 0.0, 0.0,   0.00000, 0.00000, 0.00000);
			Objetos2[playerid] = CreateDynamicObject(2452, 0.0, 0.0, 0.0,   -90.00000, 0.00000, 180.00000);
			Objetos3[playerid] = CreateDynamicObject(1775, 0.0, 0.0, 0.0,   0.00000, 0.00000, 0.00000);

			AttachDynamicObjectToVehicle(Objetos[playerid], CamionID[playerid], 0.03990, -4.31280, 0.82510,   0.00000, 0.00000, 0.00000);
			AttachDynamicObjectToVehicle(Objetos2[playerid], CamionID[playerid], 0.26323, 2.38773, 0.10820,   -90.00000, 0.00000, 180.00000);
			AttachDynamicObjectToVehicle(Objetos3[playerid], CamionID[playerid], 0.14650, -2.60470, 0.82510,   0.00000, 0.00000, 0.00000);
			PlayerInfo[playerid][p_JobTravelNext]++;
			SetPlayerCarrierCheckpoint(playerid);

			ShowPlayerInfoTextdraw(playerid, "Te estan esperando en ~b~BlueBerry", 5000);
		}
		else if(reco == 2)
		{
			Objetos[playerid] = CreateDynamicObject(3502,0,0,-1000,0,0,0);
			AttachDynamicObjectToVehicle(Objetos[playerid], CamionID[playerid], 0.000000,-2.265000,1.444999,0.000000,0.000000,0.000000);
			PlayerInfo[playerid][p_JobTravelNext]++;
			SetPlayerCarrierCheckpoint(playerid);

			ShowPlayerInfoTextdraw(playerid, "Te estan esperando en ~b~Rockshore East", 5000);
		}
		else if(reco == 3)
		{
			Objetos[playerid] = CreateDynamicObject(929,0,0,-1000,0,0,0);
			Objetos2[playerid] = CreateDynamicObject(929,0,0,-1000,0,0,0);
			AttachDynamicObjectToVehicle(Objetos[playerid], GetPlayerVehicleID(playerid), 0.000000,0.000000,0.675000,0.000000,0.000000,0.000000);
			AttachDynamicObjectToVehicle(Objetos2[playerid], GetPlayerVehicleID(playerid), 0.000000,-3.740001,0.675000,0.000000,0.000000,0.000000);
			PlayerInfo[playerid][p_JobTravelNext]++;
			SetPlayerCarrierCheckpoint(playerid);

			ShowPlayerInfoTextdraw(playerid, "Te estan esperando en el ~b~Ferroviario Willowfield.", 5000);
		}
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}

stock AnticheatWeapon(playerid, weaponid)
{
	if(weaponid == -1) return 0; 

	new weapon_id, weapon_ammo;
	GetPlayerWeaponData(playerid, DataE.WeaponsData[ weaponid ][@Slot], weapon_id, weapon_ammo);

	if(gettime() > Player.Anticheat[playerid][CHEAT_TYPE_WEAPON][@Inmunity])
	{	
		if(weapon_id != PlayerInfo[playerid][pWeapon])
		{
			Kick(playerid);
			printf("WeaponID: %d y %d", PlayerInfo[playerid][pWeapon], weapon_id);
		}
	}
	
	if(DataE.WeaponsData[ weapon_id ][@AmmoEnabled])
	{
		if(weapon_ammo < GetInvAmountItemSelected(playerid) < weapon_ammo)
		{
			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapon], PlayerInfo[playerid][pWAmmo]);
		}
		else 
		{
			PlayerInventory[playerid][GetInvItemSelected(playerid)][invAmount] = weapon_ammo;
			PlayerInfo[playerid][pWAmmo] = weapon_ammo;
		}
	}
	


	return 0;
}

BaneoAnticheat(playerid, const reason[], type)
{
	new string[128], day,month,year;
	getdate(day,month,year);
	format(string, sizeof(string), "El jugador %s[ID:%d] {FFFFFF}fue baneado por el anticheat. Razï¿½n: %s",PlayerName(playerid), playerid, reason);
	SendClientMessageToAll(-1, string);
		/*format(string, sizeof(string), "{EB0000}%s {FFFFFF}fue kickeado por el Anticheat, {EB0000}Razï¿½n: {FFFFFF}Cheat de armas [%d]",pName,GetPlayerWeapon(i));
		SendClientMessageToAll(-1, string);*/
	if(type == 1)
	{
		KickEx(playerid, 500);
	}
	return 1;
}

stock PutPlayerCombatMode(playerid)
{
	if(CombatMode[playerid] == 0)
    {
    	CombatMode[playerid] = 1;
        GangZoneShowForPlayer(playerid, CombatModeGang, 0xFFFFFF00);
        GangZoneFlashForPlayer(playerid,CombatModeGang,0xA9000077);
        KillTimer(TimerCombatMode[playerid]);
        TimerCombatMode[playerid] = SetTimerEx("KillTimeCombat", 30000, false, "i", playerid);
    }
}

PayJobHarvester(playerid, type)
{
	new string[128], bonostr[54], paystr[10];
	if(type == 0)
	{
		/*new Bono = random(30);
		switch(Bono)
		{
			case 1..4:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ un medicamento");
				PlayerInfo[playerid][pMedicamentos] += 1;
			}
			case 7..9:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ un gramo de cocaina");
				PlayerInfo[playerid][pCocaina] += 1;
			}
			case 10..15:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ un {00E500}Ramo de Flores");
				DarArmaValida(playerid, 14);
			}
			case 20, 27, 30:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ {00E500}una Cuchillo");
				DarArmaValida(playerid, 4);
			}
		}*/
		new Pago = random(8);
		switch(Pago)
		{
			case 0,1:
			{
				format(paystr, sizeof(paystr), "400");
				DarDinero(playerid, 400);
			}
			case 2,3,4:
			{
				format(paystr, sizeof(paystr), "423");
				DarDinero(playerid, 423);
			}
			case 5,6,7:
			{
				format(paystr, sizeof(paystr), "443");
				DarDinero(playerid, 443);
			}
		}
	}
	else if(type == 1)
	{
		new Pago = random(5);
		switch(Pago)
		{
			case 0,1,2:
			{
				format(paystr, sizeof(paystr), "390");
				DarDinero(playerid, 390);
			}
			case 3:
			{
				format(paystr, sizeof(paystr), "400");
				DarDinero(playerid, 400);
			}
			case 4:
			{
				format(paystr, sizeof(paystr), "415");
				DarDinero(playerid, 415);
			}
		}
		/*new Bono = random(15);
		switch(Bono)
		{
			case 1:
			{
				format(bonostr, sizeof(string), " {FFFFFF}+ un medicamento");
				PlayerInfo[playerid][pMedicamentos] += 1;
			}
			case 2:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ un gramo de cocaina");
				PlayerInfo[playerid][pCocaina] += 1;
			}
			case 3:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ {00E500}un Ramo de Flores");
				DarArmaValida(playerid, 14);
			}
			case 14:
			{
				format(bonostr, sizeof(bonostr), " {FFFFFF}+ {00E500}una Pala");
				DarArmaValida(playerid, 6);
			}
		}*/
	}
	format(string,256,"{00E500}Bien hecho{FFFFFF}, tu paga por la cosecha es de {00E500}$%s%s{FFFFFF}.", paystr, bonostr);
	SendClientMessage(playerid,-1,string);
	return 1;
}
stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1-x2, y1-y2, z1-z2);
}
public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	if(Vehicles_Info[vehicleid][gi_vehicle_VALID])
	{
		new Float:distance = GetVehicleDistanceFromPoint(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
		switch(Vehicles_Info[vehicleid][gi_vehicle_TYPE])
		{
			case VEHICLE_TYPE_WORK:
			{
				if(VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] != INVALID_PLAYER_ID) return 0;
				if(distance > 1.0) 
				{
					SetVehiclePos(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
					SetVehicleZAngle(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_ANGLE]);
				}
			}
			case VEHICLE_TYPE_SALE:
			{
				if(distance > 1.0) 
				{
					SetVehiclePos(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y], Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z]);
					SetVehicleZAngle(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_SPAWN_ANGLE]);
				}
			}
		}
	}
	/*static Float:x, Float:y, Float:z;
	GetVehiclePos(vehicleid, x, y, z);
	if(new_z < 2.0  && VectorSize(x-new_x, y-new_y,z-new_z) > 1.0)
	{
		SetVehiclePos(vehicleid, x, y, z);
		return 0;
	}*/
	return 1;
}
function UnoccupiedVehiclePosition(playerid, vehicleid, type)
{
	/*if(type == 0)
	{
		if(VehicleDriver[vehicleid] == 0)
		{
			SetVehiclePos(vehicleid, VSInfo[vehicleid][vsX], VSInfo[vehicleid][vsY], VSInfo[vehicleid][vsZ]);
			SetVehicleZAngle(vehicleid, VSInfo[vehicleid][vsA]);
		}
	}
	else if(type == 1)
	{
		if(VehicleDriver[vehicleid] == 0)
		{
			SetVehiclePos(vehicleid, VSInfo[vehicleid][vsX], VSInfo[vehicleid][vsY], VSInfo[vehicleid][vsZ]);
			SetVehicleZAngle(vehicleid, VSInfo[vehicleid][vsA]);
		}
	}*/
	return 1;
}

stock GiveThingsSpawn(playerid)
{
	SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
	SetPlayerArmour(playerid, PlayerInfo[playerid][pChaleco]);

	SetPlayerPosEx(playerid, PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z], 0.0, PlayerInfo[playerid][pInterior], PlayerInfo[playerid][pVirtualWorld]);
	SetPlayerScore(playerid, PlayerInfo[playerid][p_LEVEL]);
	GivePlayerMoney(playerid, PlayerInfo[playerid][pDinero]);

	return 1;
}

stock resetVehicleVariables(vehicleid)
{
	VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] = 0;
	return 1;
}

StartCallPhone(playerid, number)
{
	/*if(number == PlayerInfo[playerid][pNTelefono]) return SendClientMessage(playerid, -1, "No puedes llamarte a ti mismo.");*/
	new string[200];
	if(number == 911){
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(playerid, TEAM_BLUE_COLOR, "[Central de Policï¿½a] {FFFFFF}Recepcionista: Hola, habla al 911, por favor espere un momento mientras le transfiero a un oficial.");
		format(string, sizeof(string),"[Central de Policï¿½a] {FFFFFF}Recepcionista: {FABF00}%s{FFFFFF} (%d) esta llamando al 911.",GetPlayerNameEx(playerid), playerid);
		SendRadioMessage(1,TEAM_BLUE_COLOR,string,INVALID_PLAYER_ID);
		format(string, sizeof(string), "Cualquier oficial disponible por favor ({5EB5FF}/atender{FFFFFF}) la llamada.");
		SendRadioMessage(1,-1,string,INVALID_PLAYER_ID);
		OnCall[playerid] = 911;
		return 1;
	}
	else if(number == 800){
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(playerid, COLOR_MECA, "[Central de grï¿½as] {FFFFFF}Recepcionista: Hola, habla al servicio de Grï¿½as S.A, espera que una grï¿½a llegue a su ubicaciï¿½n.");
		/*SendRadioMessage(1,TEAM_BLUE_COLOR,string,INVALID_PLAYER_ID);
		format(string, sizeof(string), "Cualquier oficial disponible por favor ({5EB5FF}/atender{FFFFFF}) la llamada.");
		SendRadioMessage(1,-1,string,INVALID_PLAYER_ID);*/
		foreach (new i : Player)
		{
			if(IsPlayerHasJob(i, 8) && MecanicoServicio[i] == 1)
			{
				SendClientMessage(i, -1, "Hay un cliente llamando al servicio de grï¿½a, su ubicaciï¿½n a sido marcado en el mapa.");
			}
		}
		OnCall[playerid] = 800;
		rBit1_Set(CallTowing, playerid, 1);
		SetTimerEx("CancelServiceTowing", 1000*5*60, false, "i", playerid);
		SetTimerEx("EndCallPhone", 1000, false, "i", playerid);
		return 1;
	}
	else if(number == 115)
	{
		if(GetTimerCMD(playerid, 9))
		{
			new string2[85];
			new minutes, seconds;
			minutes = floatround((GetSegTimerCMD(playerid, 9))/60);
			seconds = GetSegTimerCMD(playerid, 9)-(minutes*60);
			if(GetSegTimerCMD(playerid, 9) > 60) { format(string2, sizeof(string2), "Intenta llamar de nuevo en {00E500}%d minutos {FFFFFF}y {00E500}%d segundos{FFFFFF}.", minutes, seconds); }
			else { format(string2, sizeof(string2), "Intenta llamar de nuevo en {00E500}%d segundos{FFFFFF}.", seconds); }

			SendClientMessage(playerid, -1, string2);
			return 1;
		}
	//	if(RecoCarrier[playerid] != 0) return SendClientMessage(playerid, -1, "No puedes solicitar otro recorrido, termina el que ya tienes.");
		SendClientMessage(playerid, COLOR_WHITE, "{FABF00}RS Haul Transportes(por celular){FFFFFF} dice: Elige la carga que quieres ir a buscar.");
		SetTimerEx("Carrier_OpenLoadDialog", 1000, false, "id", playerid, 0);
		OnCall[playerid] = 115;
		return 1;
	}
	new checkphone = 0;
	foreach (new i : Player)
	{
		if(IsPlayerConnected(i) && i != INVALID_PLAYER_ID)
		{
			/*if(PlayerInfo[i][pNTelefono] == number && number != 0)
			{
				new pName2[50];
				GetPlayerName(i,pName2,50);
				if(OnCall[i] != 0 || MobileSub[i] != INVALID_PLAYER_ID) { checkphone = -1; break; }
				if(PhoneOnline[i] == 1) { checkphone = 0; break; }
				if(Jail[i] > 0 || San[i] == 1) { checkphone = 0; break; }
				checkphone = 1;
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				format(string, sizeof(string), "Te estï¿½n llamando por telï¿½fono desde el numero: {5EB5FF}%d{FFFFFF}, usa {5EB5FF}/atender {FFFFFF}o {5EB5FF}/colgar{FFFFFF}.", PlayerInfo[playerid][pNTelefono]);
				SendClientMessage(i, Blanco, string);
				format(string, sizeof(string), "El telï¿½fono mï¿½vil de %s estï¿½ sonando.", pName2);
				ProxDetector(30.0, i, string, Rol,Rol,Rol,Rol,Rol);
				SendClientMessage(playerid, -1, "Llamando... por favor espera, si deseas para terminar la llamada usa {5EB5FF}/colgar{FFFFFF}.");
				MobileSub[playerid] = i;
				MobileSub[i] = playerid;
				PlayerBeingCalled[i] = playerid;
				OnCall[playerid] = 1;
				break;
			} */
		}
	}
	if(checkphone == 0) return SendClientMessage(playerid, -1, "Tu llamada no se pudo realizar, puede ser que el numero al que intentas llamar este apagado.");
	else if(checkphone == -1) return SendClientMessage(playerid, -1, "El numero al que intentas llamar se encuentra ocupado.");
	return 1;
}

function EndCallPhone(playerid)
{
	new mobil = MobileSub[playerid];
	if(OnCall[playerid] == 1)
	{
		SendClientMessage(playerid, -1, "Cortaste la llamada.");
		SendClientMessage(mobil, -1, "Llamada perdida.");
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		OnCall[playerid] = 0;
		MobileSub[mobil] = INVALID_PLAYER_ID;
		MobileSub[playerid] = INVALID_PLAYER_ID;
		PlayerBeingCalled[mobil] = INVALID_PLAYER_ID;
		StopSoundCalledAll(mobil);
		return 1;
	}
	else if(PlayerBeingCalled[playerid] != INVALID_PLAYER_ID)
	{
		SendClientMessage(playerid, -1, "Cortaste la llamada.");
		SendClientMessage(mobil, -1, "La persona a la que intentas contactar no quiere responder tu llamada en este momento.");
		SetPlayerSpecialAction(mobil, SPECIAL_ACTION_STOPUSECELLPHONE);
		OnCall[mobil] = 0;
		MobileSub[mobil] = INVALID_PLAYER_ID;
		MobileSub[playerid] = INVALID_PLAYER_ID;
		PlayerBeingCalled[playerid] = INVALID_PLAYER_ID;
		EndCallSound(playerid);
		StopSoundCalledAll(playerid);
		return 1;
	}
	else if(/*MobileSub[playerid] != INVALID_PLAYER_ID || */OnCall[playerid] == 2 || OnCall[playerid] == 3)
	{
		SendClientMessage(playerid, -1, "Cortaste la llamada.");
		SendClientMessage(mobil, -1, "Se corto la llamada.");
		SetPlayerSpecialAction(mobil, SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		OnCall[mobil] = 0;
		OnCall[playerid] = 0;
		MobileSub[mobil] = INVALID_PLAYER_ID;
		MobileSub[playerid] = INVALID_PLAYER_ID;
		EndCallSound(mobil);
		return 1;
	}
	else if(OnCall[playerid] == 911 || OnCall[playerid] == 800 || OnCall[playerid] == 115)
	{
		SendClientMessage(playerid, -1, "Cortaste la llamada.");
		OnCall[playerid] = 0;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		return 1;
	}
	else if(OnCall[playerid] == 4)
	{
		SendClientMessage(playerid, -1, "Cortaste la llamada.");
		SendClientMessage(mobil, -1, "Se corto la llamada.");
		SetPlayerSpecialAction(mobil, SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		OnCall[mobil] = 0;
		OnCall[playerid] = 0;
		MobileSub[mobil] = INVALID_PLAYER_ID;
		MobileSub[playerid] = INVALID_PLAYER_ID;
	}
	return 1;
}

stock EndCallSound(playerid)
{
	KillTimer(TimerLlamadaT1[playerid]);
	KillTimer(TimerLlamadaT2[playerid]);
	TimerLlamadaT1[playerid] = 0;
	TimerLlamadaT2[playerid] = 0;
	PlayerPlaySound(playerid, 3402, 0.0, 0.0, 0.0);
	return 1;
}
stock StopSoundCalledAll(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	foreach (new i : Player)
	{

		if(PlayerToPoint(5.0, i, X, Y, Z))
		{
			EndCallSound(i);
				/*SoundPhone[i] = 0;*/
		}
	}
	return 1;
}

PayJobTrucker(playerid, level)
{
//	new reco = PlayerInfo[playerid][p_JobTravel];
	if(level == 1)
	{	
		GivePlayerMoneyEx(playerid, 1000, true);
	}
	else if(level == 2)
	{
		GivePlayerMoneyEx(playerid, 1150, true);
	}
	else if(level == 3)
	{
		GivePlayerMoneyEx(playerid, 1400, true);
	}
	else if(level == 4)
	{
		GivePlayerMoneyEx(playerid, 1500, true);
	}
	else if(level == 5)
	{
		GivePlayerMoneyEx(playerid, 1600, true);
	}
	else if(level == 6)
	{
		GivePlayerMoneyEx(playerid, 1700, true);
	}
	else if(level >= 7)
	{
		GivePlayerMoneyEx(playerid, 1800, true);
	}
	GivePlayerWorkSkill(playerid, WORK_TYPE_TRUCKER, 5);
	return 1;
}

stock CancelTruckerLoad(playerid)
{
	new vehicleid = CamionID[playerid];
	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][0]);
	CreateNewVehicleInSpaceWork(CamionID[playerid], 2);

	CamionID[playerid] = INVALID_VEHICLE_ID;
	DestroyVehicleEx(vehicleid);
	VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = playerid;

	PlayerInfo[playerid][p_WorkTravel] = 0;
	PlayerInfo[playerid][p_JobTravel] = 0;
	PlayerInfo[playerid][p_JobTravelT] = 0;
	PlayerInfo[playerid][p_JobTravelNext] = 0;
	KillTimer(PlayerInfoTemp[playerid][pt_TimersE][7]);
	funct_HideTextdrawNotif(playerid, VNOTI_TYPE_COUNTFARM);
	ForcePlayerEndLastRoute(playerid);
	PlayerInfo[playerid][p_JobTimeMax] = 0;

	//new Query[140];
	//format(Query, sizeof(Query), "DELETE FROM `lac_uservehicles` WHERE OwnerID=%d AND `type`=1", PlayerInfo[playerid][pID]);
	//mysql_tquery(conexion, Query);


	if(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] != INVALID_PLAYER_ID) { DestroyDynamicArea(PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0]); PlayerInfoTemp[playerid][pt_PLAYER_AREAS][0] = INVALID_STREAMER_ID; }
	DestroyPlayerDynCP(playerid, 0);

	if(Objetos[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos[playerid]); Objetos[playerid] = INVALID_STREAMER_ID;
	if(Objetos2[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos2[playerid]); Objetos2[playerid] = INVALID_STREAMER_ID;
	if(Objetos3[playerid] != INVALID_STREAMER_ID) DestroyDynamicObject(Objetos3[playerid]); Objetos3[playerid] = INVALID_STREAMER_ID;
	return 1;
}

/*stock IsPlayerArmed(playerid)
{
	if(PlayerInfo[playerid][pWeapons][0] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][1] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][2] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][3] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][4] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][5] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][6] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][7] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][8] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][9] > 0 && PlayerInfo[playerid][pWeapons][9] != 43) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][10] > 0 && PlayerInfo[playerid][pWeapons][10] != 14) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][11] > 0) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][12] > 0) { return 1; }
	return 0;
}*/

stock IsPlayerWeaponExist(playerid, weaponid)
{
	if(PlayerInfo[playerid][pWeapons][0] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][1] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][2] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][3] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][4] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][5] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][6] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][7] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][8] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][9] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][10] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][11] == weaponid) { return 1; }
	else if(PlayerInfo[playerid][pWeapons][12] == weaponid) { return 1; }
	return 0;
}

stock SalePlayerObject(playerid, giveplayerid, type, offered, price)
{
	if(type == 1)
	{
		/*if(IsPlayerConnected(playerid)) return 0;
		if(IsPlayerConnected(giveplayerid)) return 0;*/
		if(!ProxDetectorS(3.0, playerid, giveplayerid))
		{
			SendClientMessage(playerid, -1, "Tienes que estar cerca de este jugador.");
			return 0;
		}
		if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, -1, "Ese jugador no se encuentra conectado."),0;
		OfferedWeaponPlayer[giveplayerid] = playerid;
		OfferedWeaponPrice[giveplayerid] = price;
		OfferedWeapon[giveplayerid] = offered;
	}
	return 1;
}

stock SalePlayerObjectW(playerid, giveplayerid, type, offered, price)
{
	new string[128];
	if(type == 1)
	{
		/*if(IsPlayerConnected(playerid)) return 0;
		if(IsPlayerConnected(giveplayerid)) return 0;*/
		if(!ProxDetectorS(3.0, playerid, giveplayerid))
		{
			SendClientMessage(playerid, -1, "Tienes que estar cerca de este jugador.");
			return 0;
		}
		if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, -1, "Ese jugador no se encuentra conectado."),0;/*if(PlayerInfo[playerid][pWeapons][2] != 22) return SendClientMessage(playerid, -1, "No puedes vender un arma que no tienes.");*/
/*	if(precio < 0 || precio > 4000) return SendClientMessage(playerid, -1, "Ingresa un precio mayor a {00E500}$0 {FFFFFF}y menor a {00E500}$4.000{FFFFFF}.");*/
		OfferedWeaponPlayer[giveplayerid] = playerid;
		OfferedWeaponPrice[giveplayerid] = price;
		OfferedWeapon[giveplayerid] = offered;
		format(string, sizeof(string), "Le ofreciste a {FABF00}%s {FFFFFF}una %s por {00E500}$%d{FFFFFF}.", GetPlayerNameEx(giveplayerid), NombreArma[offered], price);
		SendClientMessage(playerid, Blanco, string);
		format(string, sizeof(string), "{FABF00}%s{FFFFFF} te ofrece una %s por {00E500}$%d{FFFFFF}. para aceptar usa {5EB5FF}/aceptar arma", GetPlayerNameEx(playerid), NombreArma[offered], price);
		SendClientMessage(giveplayerid, Blanco, string);
	}
	return 1;
}

stock SalePlayerObjectWEx(playerid, giveplayerid, slot, offered, price, maxprice)
{
	new string[128];
		/*if(IsPlayerConnected(playerid)) return 0;
		if(IsPlayerConnected(giveplayerid)) return 0;*/
	if(!ProxDetectorS(3.0, playerid, giveplayerid))
	{
		SendClientMessage(playerid, -1, "Tienes que estar cerca de este jugador.");
		return 0;
	}
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, -1, "Ese jugador no se encuentra conectado."),0;/*if(PlayerInfo[playerid][pWeapons][2] != 22) return SendClientMessage(playerid, -1, "No puedes vender un arma que no tienes.");*/
	if(PlayerInfo[playerid][pWeapons][slot] != offered) return SendClientMessage(playerid, -1, "No puedes vender un arma que no tienes.");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "No puedes ofrecerte un arma a ti mismo."),0;
	if(GetTimerCMD(playerid, 7))
	{
		format(string, sizeof(string), "Tienes que esperar {00E500}%d segundos {FFFFFF}para volver a ofrecer un arma.", GetSegTimerCMD(playerid, 7));
		SendClientMessage(playerid, -1, string);
		return 0;
	}
	if(price < 0 || price > maxprice) 
	{
		format(string, sizeof(string), "Ingresa un precio mayor a {00E500}$0 {FFFFFF}y menor a {00E500}$%s{FFFFFF}.", FormatNumber(maxprice));
		SendClientMessage(playerid, -1, string);
		return 0;
	}
	OfferedWeaponPlayer[giveplayerid] = playerid;
	OfferedWeaponPrice[giveplayerid] = price;
	OfferedWeapon[giveplayerid] = offered;
	format(string, sizeof(string), "Le ofreciste a {FABF00}%s {FFFFFF}una %s por {00E500}$%d{FFFFFF}.", GetPlayerNameEx(giveplayerid), NombreArma[offered], price);
	SendClientMessage(playerid, Blanco, string);
	format(string, sizeof(string), "{FABF00}%s{FFFFFF} te ofrece una %s por {00E500}$%d{FFFFFF}. para aceptar usa {5EB5FF}/aceptar arma", GetPlayerNameEx(playerid), NombreArma[offered], price);
	SendClientMessage(giveplayerid, Blanco, string);
	SetTimerCMD(playerid, 7, 59);
	/*}*/
	return 1;
}


/*stock BuyTuningObject(playerid, price)
{
	new string2[400], vehiculos = 0;
	for(new i = 1; i<MAX_VEHICLES_PLAYER; i++)
	{
		if(GetPlayerVehicleProperty(playerid, i) == 1)
		{
			VehiclesPlayer[playerid][vehiculos] = i;
			vehiculos++;
			format(string2, 400, "%s\nVehï¿½culo: {5EB5FF}%s {FFFFFF}| Matricula: {FABF00}%s {FFFFFF}| Costo: {00E500}$%d\n", string2, GetVehicleName(i), Vehicles_Info[i][gi_vehicle_PLATE_NUMBER], price);
			
		}
	}ShowPlayerDialog(playerid, DIALOG_CONFIRMBUYTUNING, DIALOG_STYLE_LIST, "ï¿½Estas Seguro?", string2, "Comprar", "Cancelar");
	return 1;
}*/

public OnPlayerPressedButton(playerid, buttonid)
{
	if(buttonid == ButtonPress[1])
	{
		if(Radios[playerid][TieneEmisora] != 1) return 1;
		if(EmisoraOcupada[1][0] == 1 && EmisoraOcupada[1][1] != playerid) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasEmisoras[0], 424.2969, 69.8443, 1019.3759, 1.0);
			PuertasAbiertasID[2] = 1;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasEmisoras[0], 425.6469, 69.8443, 1019.3759, 1.0);
			PuertasAbiertasID[2] = 0;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
	}
	if(buttonid == ButtonPress[2])
	{
		if(Radios[playerid][TieneEmisora] != 1) return 1;
		if(EmisoraOcupada[2][0] == 1 && EmisoraOcupada[2][1] != playerid) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasEmisoras[1], 433.7006, 69.8754, 1019.3759, 1.0);
			PuertasAbiertasID[3] = 1;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasEmisoras[1], 434.9946, 69.8754, 1019.3759, 1.0);
			PuertasAbiertasID[3] = 0;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
	}
	if(buttonid == ButtonPress[0])
	{
		if(EmisoraOcupada[3][0] == 1 && EmisoraOcupada[3][1] != playerid) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasEmisoras[2], 438.0660, 63.2840, 1019.3759, 1.0);
			PuertasAbiertasID[4] = 1;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasEmisoras[2], 436.5400, 63.3140, 1019.3759, 1.0);
			PuertasAbiertasID[4] = 0;
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
	}
	if(buttonid == ButtonPress[3])
	{
		if(EmisoraOcupada[4][0] == 1 && EmisoraOcupada[4][1] != playerid) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasEmisoras[3], 428.7236, 63.2610, 1019.3759, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasEmisoras[3], 427.2176, 63.3450, 1019.3759, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 10.0, 0, 1, 1, 0, 0, 1);
		}
	}
	else if(buttonid == ButtonPress[4])
	{
		if(PlayerInfo[playerid][p_FactionMember] != 1) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasLSPD[5], 258.9819, 92.8329, 1001.4407, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasLSPD[5], 258.9819, 91.5549, 1001.4407, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
	}
	else if(buttonid == ButtonPress[5])
	{
		if(PlayerInfo[playerid][p_FactionMember] != 1) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasLSPD[6], 248.0922, 73.7810, 1002.6293, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasLSPD[6], 248.0922, 75.0550, 1002.6293, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
	}
	else if(buttonid == ButtonPress[6])
	{
		if(PlayerInfo[playerid][p_FactionMember] != 1) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasLSPD[7], 263.8101, 112.5465, 1003.6168, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasLSPD[7], 265.1121, 112.5465, 1003.6168, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}

	}
	else if(buttonid == ButtonPress[7])
	{
		if(PlayerInfo[playerid][p_FactionMember] != 1) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasLSPD[9], 209.0282, 159.1033, 1003.2505, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasLSPD[9], 209.0282, 157.6333, 1003.2505, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}

	}
	else if(buttonid == ButtonPress[8])
	{
		if(PlayerInfo[playerid][p_FactionMember] != 1) return 1;
		if(IsButtonEnabled(buttonid))
		{
			MoveDynamicObject(PuertasLSPD[8], 209.1812, 178.2678, 1003.2774, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}
		else
		{
			MoveDynamicObject(PuertasLSPD[8], 209.1812, 179.7378, 1003.2774, 1.0);
			ApplyAnimation(playerid, "HEIST9", "USE_SWIPECARD", 4.1, 0, 1, 1, 0, 0, 1);
		}

	}
	return 0;
}

stock SendMessageQuestions(playerid)
{
	return 1;
}

SendAdminMessage(color, const text[])
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			if((Player.Temp[i][@StateGameo] == GAMEO_STATE_NORMAL || Player.Temp[i][@StateGameo] == GAMEO_STATE_DEAD))
			{
				SendClientMessage(i, color, text);
			}
		}
	}
	return 1;
}

stock GetNameRangeAdmin(playerid)
{
	new namerange[52];
	switch(PlayerInfo[playerid][pAdmin])
	{
		case 1: format(namerange, sizeof(namerange), "Ayudante");
		case 2: format(namerange, sizeof(namerange), "Moderador del canal");
		case 3: format(namerange, sizeof(namerange), "Moderador");
		case 4: format(namerange, sizeof(namerange), "Moderador");
		case 5: format(namerange, sizeof(namerange), "Moderador");
		case 6: format(namerange, sizeof(namerange), "ADMIN");
		case 7: format(namerange, sizeof(namerange), "ADMIN");
	}
	return namerange;
}

stock SetHealth(playerid, Float:health)
{
	PlayerInfo[playerid][pHealth] = health;
	SetPlayerHealth(playerid, health);
	return 1;
}

SetPlayerHealthEx(playerid, Float:health)
{
	PlayerInfo[playerid][pHealth] = health;
	SetPlayerHealth(playerid, health);
	return 1;
}

stock SetArmour(playerid, Float:armour)
{
	PlayerInfo[playerid][pChaleco] = armour;
	SetPlayerArmour(playerid, armour);
	return 1;
}

stock SetInterior(playerid, interior)
{
	PlayerInfo[playerid][pInterior] = interior;
	SetPlayerInterior(playerid, interior);
	return 1;
}

stock SetVW(playerid, virtualworld)
{
	PlayerInfo[playerid][pVirtualWorld] = virtualworld;
	SetPlayerVirtualWorld(playerid, virtualworld);
	return 1;
}

function BajarCargo(playerid)
{
	if(PlayerInfo[playerid][pCargos] == 1)
	{
		PlayerInfo[playerid][pCargos] = 0;
		SetPlayerWantedLevel(playerid, 0);
		CargoAdvertido[playerid] = 0;
		KillTimer(TimerRemoveWanted[playerid]);
	}
	return 1;
}

stock ConvertContentStringToInt(value)
{
	new string[10];
	format(string, 10, "%i",value);
	return string;
}

stock ConvertContentStringToFloat(Float:value)
{
	new string[10];
	format(string, 10, "%f",value);
	return string;
}

stock PutPlayerInVehicleEx(playerid, vehicleid, seat)
{
	Player.Anticheat[playerid][CHEAT_TYPE_TELEPORT][@Inmunity] = gettime()+3;
	EnAuto[playerid] = vehicleid;
	BajandoVehiculo[playerid] = seat;
	PutPlayerInVehicle(playerid, vehicleid, seat);	
	return 1;
}

stock IsPlayerPosRadio(playerid)
{
	if(IsPlayerInArea(playerid, 423.8692-0.4,79.8429+0.4, 430.2896+0.4,70.5434-0.4))
	{
		return 1;
	}
	else if(IsPlayerInArea(playerid, 431.4214,79.9130+0.4, 438.3152+0.4,70.4908-0.4))
	{
		return 2;
	}
	else if(IsPlayerInArea(playerid, 438.7861,52.7870, 431.1711,63.2180))
	{
		return 3;
	}
	else if(IsPlayerInArea(playerid, 430.5381+0.4,53.3267-0.4, 423.8695-0.4,62.6917+0.4))
	{
		return 4;
	}
	return 0;
}

stock RadioStationMessage(radio, text[], type)
{
	foreach (new i : Player)
	{
		if(ListeningR[i] == radio)
		{
			new string[128], announcer;
			announcer = EmisoraOcupada[radio][1]; 
			if(type == 1) { format(string, sizeof(string), "{9D8152}[Locutor de Radio %s]: %s", Radios[announcer][NombreEmisora], text); } 
			else if(type == 2) { format(string, sizeof(string), "{9D8152}[Invitado de Radio %s]: %s", Radios[announcer][NombreEmisora], text); }
			SendClientMessage(i, -1, string);
		}
	}
	return 1;
}

stock SendReportThePlayer(playerid, reportid, const reason[])
{
	new loop = 0, newslot = -1;
	for(new i = 0; i < MAX_REPORTS; i++)
	{
		if(!loop)
		{
			if(ReportsE[i][rSlotUsed] == 0)
			{
				loop = 1;
				newslot = i;
				break;
			}
		}
	}
	if(newslot != -1)
	{
		strmid(ReportsE[newslot][rReason], reason, 0, strlen(reason), 128);
		ReportsE[newslot][rSlotUsed] = 1;
		ReportsE[newslot][rReportFrom] = playerid;
		ReportsE[newslot][rReportID] = reportid;
		foreach (new i : Player)
		{
			if(PlayerInfo[i][pAdmin] >= 3)
			{
				new string[128];
				format(string, sizeof(string), "El jugador %s(ID %i | Nivel %i) reporto a %s(ID %i | Nivel %i)", PlayerName(playerid),playerid,PlayerInfo[playerid][p_LEVEL], PlayerName(reportid),reportid,PlayerInfo[reportid][p_LEVEL]);
				SendClientMessage(i, COLOR_ADMAD, string);
				format(string, sizeof(string), "Razï¿½n: %s", ReportsE[newslot][rReason]);
				SendClientMessage(i, COLOR_ADMAD, string);
			}
		}
	}
	return 1;
}

stock SendPlayerQuestion(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pAdmin] == 0)
	{
		if(QuestionTime[playerid] > 0)
		{
			format(string, sizeof(string), "Tienes que esperar {00E500}%d {FFFFFF}segundos para volver a usar el canal {5EB5FF}/duda{FFFFFF}.");
			SendClientMessage(playerid, -1, string);
			return 1;
		}
	}
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		format(string, sizeof(string), "{77A7AE}[DUDA] {A1BBBF}- [%s - %s](%d): %s", GetNameRangeAdmin(playerid),PlayerName(playerid), playerid, params);
    }
    else
    {
    	format(string, sizeof(string), "{77A7AE}[DUDA] {A1BBBF}- [%s](%d): %s",PlayerName(playerid), playerid, params);
    }
    foreach (new i : Player)
    {
    	if(ChannelQuestions[i] == 0)
    	{
    		if(PlayerInfo[playerid][pAdmin] >= 1)
    		{ 
    			SendClientMessage(i, 0x77A7AEFF,string);
    		}
    		else
    		{
    			SendClientMessage(i, 0x77A7AEFF,string);
    		}
    	}
    }
   /* QuestionTime[playerid] = 50;*/
    SetTimerCMD(playerid, 5, 60);
    return 1;
}

/*stock GetPartsVehicle(vehicleid)
{
	new value;
	new model = GetVehicleModel(vehicleid);
	new d = GetVehiclePlayerID(vehicleid);
	switch(model)
	{
		case 416, 596,597,598,599,601,456,497,609: value = 2;
		case 578: value = 40; 
		default: value = VehicleInfo[d][vPrecio]/2200;
	}
	return value;
}*/

function CancelServiceMeca(playerid)
{
	if(LlamadaMecanico[playerid] == 1)
	{
		SendClientMessage(playerid, -1, "El llamado al servicio mecï¿½nico fue cancelado, si aun lo necesitas usa {5EB5FF}/servicio mecanico");
		LlamadaMecanico[playerid] = 0;
	}
	/*return 1;*/
}
function CancelServiceTaxi(playerid)
{
	if(CallTaxi[playerid][0] == 1)
	{
		SendClientMessage(playerid, -1, "El llamado al servicio de taxi fue cancelado, si aun lo necesitas usa {5EB5FF}/servicio taxi");
		CallTaxi[playerid][0] = 0;
		CallTaxi[playerid][1] = 0;
	}
}
function CancelServiceTowing(playerid)
{
	if(rBit1_Get(CallTowing, playerid))
	{
		SendClientMessage(playerid, -1, "El llamado al servicio de grï¿½a fue cancelado, si aun lo necesitas usa {5EB5FF}/llamar 800");
		rBit1_Set(CallTowing, playerid, 0);
	}
}

stock GetClothesAmountPlayer(playerid)
{
	new value;
	if(PrendaInfo[playerid][0][ppID] != 0)
	{
		value++;
	}
 	if(PrendaInfo[playerid][1][ppID] != 0)
	{
		value++;
	}
	if(PrendaInfo[playerid][2][ppID] != 0)
	{
		value++;
	}
	if(PrendaInfo[playerid][3][ppID] != 0)
	{
		value++;
	}
	return value;
}

stock IsPlayerMoving(playerid)
{
	new Float:Velocity[3];
	GetPlayerVelocity(playerid, Velocity[0], Velocity[1], Velocity[2]);
	if(Velocity[0] == 0 && Velocity[1] == 0 && Velocity[2] == 0) return 1;
	return 0;
}

stock IsPlayerMovingAnim(animidx)
{
	switch(animidx)
	{
		case 320, 471, 1164, 1183, 1186, 1181, 1188, 1189, 1275, 1274:
			return 1;
	}

	return 0;
}

stock ShowMapGPS(playerid)
{
	ShowingGPS[playerid] = 1;
	TextDrawShowForPlayer(playerid, MapaGPS);
	TextDrawShowForPlayer(playerid, MapaGPS2);
	TextDrawShowForPlayer(playerid, MapaGPS4);
	TextDrawShowForPlayer(playerid, MapaGPS5);
   	TimerMapGPS[playerid] = SetTimerEx("UpdatePointMapGPS", 1000, true, "i", playerid);
   	return 1;
}

stock FormatNumber(iNum, const szChar[] = ",")
{
	new szStr[16];
	format(szStr, sizeof(szStr), "%d", iNum);
	
	for(new iLen = strlen(szStr) - 3; iLen > 0; iLen -= 3)
	{
		strins(szStr, szChar, iLen);
	}
	return szStr;
}

stock SetPlayerMedicalBed(playerid, type = 0)
{
	new bed = PlayerInfo[playerid][pBed];
	new vwp = PlayerInfo[playerid][pVirtualWorld];
	if(PlayerInfo[playerid][pVirtualWorld] == 105)
	{
		if(BedVar[0] == 0 || PlayerInfo[playerid][pBed] == 1)
		{
			SetPlayerPosEx(playerid, 1155.1245,-1290.4387,1334.2153,269.0239);
			BedVar[0] = 1;
			PlayerInfo[playerid][pBed] = 1;
		}
		else if(BedVar[1] == 0 || PlayerInfo[playerid][pBed] == 2)
		{
			SetPlayerPosEx(playerid, 1157.7489,-1290.2844,1334.2153,270.0892);
			BedVar[1] = 1;
			PlayerInfo[playerid][pBed] = 2;
		}
		else if(BedVar[2] == 0 || PlayerInfo[playerid][pBed] == 3)
		{
			SetPlayerPosEx(playerid, 1160.3124,-1290.3428,1334.2153,268.4951);
			BedVar[2] = 1;
			PlayerInfo[playerid][pBed] = 3;
		}
		else if(BedVar[3] == 0 || PlayerInfo[playerid][pBed] == 4)
		{
			SetPlayerPosEx(playerid, 1153.8177,-1278.0527,1334.2153,91.0239);
			BedVar[3] = playerid;
			PlayerInfo[playerid][pBed] = 4;
		}
		else if(BedVar[4] == 0 || PlayerInfo[playerid][pBed] == 5)
		{
			SetPlayerPosEx(playerid, 1156.5303,-1278.0332,1334.2153,88.2690);
			BedVar[4] = 1;
			PlayerInfo[playerid][pBed] = 5;
		}
		else if(BedVar[5] == 0 || bed == 6) { AssignVariablesBeds(playerid, 6, 1159.3557,-1278.0299,1334.2153,89.3344); }
		else if(BedVar[6] == 0 || bed == 7) { AssignVariablesBeds(playerid, 7, 1174.9037,-1351.5411,1334.2094,89.7697); }
		else if(BedVar[7] == 0 || bed == 8) { AssignVariablesBeds(playerid, 8, 1178.0225,-1351.4768,1334.2094,90.5660); }
		else if(BedVar[8] == 0 || bed == 9) { AssignVariablesBeds(playerid, 9, 1181.0125,-1351.4893,1334.2094,91.0072); }
		else if(BedVar[9] == 0 || bed == 10) { AssignVariablesBeds(playerid, 10, 1182.0941,-1361.5995,1334.2094,359.1186); }
		else if(BedVar[10] == 0 || bed == 11) { AssignVariablesBeds(playerid, 11, 1179.0167,-1363.6967,1334.2094,270.4260); }
		else if(BedVar[11] == 0 || bed == 12) { AssignVariablesBeds(playerid, 12, 1175.7977,-1363.6542,1334.2094,272.9980); }
		else if(BedVar[12] == 0 || bed == 13) { AssignVariablesBeds(playerid, 13, 1175.7977,-1363.6542,1334.2094,272.9980); }
	}
	else if(PlayerInfo[playerid][pVirtualWorld] == 131)
	{
		if(BedVar[13] == 0 || bed == 14) { AssignVariablesBeds(playerid, 14,-2644.7522,670.6169,1297.1367,2.5582); }
		else if(BedVar[14] == 0 || bed == 15) { AssignVariablesBeds(playerid, 15,-2644.7542,666.8743,1297.1339,0.1584); }
		else if(BedVar[15] == 0 || bed == 16) { AssignVariablesBeds(playerid, 16,-2644.7939,663.1476,1297.1364,3.0854); }
		else if(BedVar[16] == 0 || bed == 17) { AssignVariablesBeds(playerid, 17,-2644.7856,659.2084,1297.1365,2.8163); }
		else if(BedVar[17] == 0 || bed == 18) { AssignVariablesBeds(playerid, 18,-2644.7324,653.2946,1297.1365,1.4820); }
		else if(BedVar[18] == 0 || bed == 19) { AssignVariablesBeds(playerid, 19,-2644.6038,649.3562,1297.1365,359.7925); }
		else if(BedVar[19] == 0 || bed == 20) { AssignVariablesBeds(playerid, 20,-2644.6963,643.4404,1297.1367,1.2991); }
		else if(BedVar[20] == 0 || bed == 21) { AssignVariablesBeds(playerid, 21,-2644.6799,639.4973,1297.1399,2.4505); }
		else if(BedVar[21] == 0 || bed == 22) { AssignVariablesBeds(playerid, 22,-2644.6021,634.0238,1297.1445,1.4712); }
		else if(BedVar[22] == 0 || bed == 23) { AssignVariablesBeds(playerid, 23,-2644.7266,629.8651,1297.1370,2.2675); }
	}
	else if(vwp == 132 || vwp == 133)
	{
		if(BedVar[23] == 0 || bed == 24) { AssignVariablesBeds(playerid, 24,1690.5437,-1209.2065,1235.7903,270.7121); }
		else if(BedVar[24] == 0 || bed == 25) { AssignVariablesBeds(playerid, 25,1693.5778,-1209.1584,1235.7903,269.6468); }
		else if(BedVar[25] == 0 || bed == 26) { AssignVariablesBeds(playerid, 26,1696.6002,-1209.2435,1235.7903,271.7775); }
		else if(BedVar[26] == 0 || bed == 27) { AssignVariablesBeds(playerid, 27,1687.5912,-1185.2014,1235.7903,90.7551); }
		else if(BedVar[27] == 0 || bed == 28) { AssignVariablesBeds(playerid, 28,1690.6151,-1185.1877,1235.7903,90.4861); }
		else if(BedVar[28] == 0 || bed == 29) { AssignVariablesBeds(playerid, 29,1693.9752,-1185.2323,1235.7903,90.2170); }
		else if(BedVar[29] == 0 || bed == 30) { AssignVariablesBeds(playerid, 30,1697.6755,-1185.2629,1235.7903,91.7236); }
		else if(BedVar[30] == 0 || bed == 31) { AssignVariablesBeds(playerid, 31,1701.2048,-1185.3021,1235.7903,90.0341); }
		else if(BedVar[31] == 0 || bed == 32) { AssignVariablesBeds(playerid, 32,1704.3903,-1185.2166,1235.7903,88.3446); }
		else if(BedVar[32] == 0 || bed == 33) { AssignVariablesBeds(playerid, 33,1707.7534,-1185.1561,1235.7903,90.9165); }
		else if(BedVar[33] == 0 || bed == 34) { AssignVariablesBeds(playerid, 34,1706.3899,-1209.0607,1239.3671,268.1187); }
		else if(BedVar[34] == 0 || bed == 35) { AssignVariablesBeds(playerid, 35,1703.3911,-1209.1298,1239.3671,270.2494); }
		else if(BedVar[35] == 0 || bed == 36) { AssignVariablesBeds(playerid, 36,1700.3892,-1209.1239,1239.3671,271.0457); }
		else if(BedVar[36] == 0 || bed == 37) { AssignVariablesBeds(playerid, 37,1696.9907,-1209.1322,1239.3671,269.3563); }
	}
	if(type == 1)
	{
		if(GetPlayerVirtualWorld(playerid) == 105)
		{
			PlayerInfo[playerid][pBedVW] = 105;
		}
		else if(GetPlayerVirtualWorld(playerid) == 131)
		{
			PlayerInfo[playerid][pBedVW] = 131;
		}
		else if(GetPlayerVirtualWorld(playerid) == 132)
		{
			PlayerInfo[playerid][pBedVW] = 132;
		}
		else if(GetPlayerVirtualWorld(playerid) == 133)
		{
			PlayerInfo[playerid][pBedVW] = 133;
		}
	}
	else if(type == 2)
	{
		new vw = PlayerInfo[playerid][pBedVW];
		if(vw == 105)
		{
			SetInterior(playerid, 3);
			SetVW(playerid, 105);
		}
		else if(vw == 131)
		{
			SetInterior(playerid, 20);
			SetVW(playerid, 131);
		}
		else if(vw == 132)
		{
			SetInterior(playerid, 15);
			SetVW(playerid, 132);
		}
		else if(vw == 133)
		{
			SetInterior(playerid, 15);
			SetVW(playerid, 133);
		}
	}
	return 1;
}

stock SetPlayerPosEx(playerid, Float:X, Float:Y, Float:Z, Float:A = 0.0, interior = -1, worldid = -1, bool:preload = true)
{
	PlayerInfo[playerid][p_POS_X] = X;
	PlayerInfo[playerid][p_POS_Y] = Y;
	PlayerInfo[playerid][p_POS_Z] = Z;

	if(interior != -1) { SetInterior(playerid, interior); }
	if(worldid != -1) { SetVW(playerid, worldid); }

	if(preload) Streamer_UpdateEx(playerid, X, Y, Z, worldid, interior);

	SetPlayerPos(playerid, X, Y, Z);
	SetPlayerFacingAngle(playerid, A);
}

stock SetPlayerPosInt(playerid, Float:X, Float:Y, Float:Z, Float:A = 0.0, interior = -1, worldid = -1)
{
	//if(GetPVarInt(playerid, "LoadingObjects")) return 1;

	SetPlayerAngleEx(playerid, A);
	if(interior != -1)  SetInterior(playerid, interior);
	if(worldid != -1)  SetVW(playerid, worldid);

	new Float:newx, Float:newy;
	GetPointInFrontPos(playerid, X, Y, A, newx, newy, 1.5);

	PlayerInfo[playerid][p_POS_X] = newx;
	PlayerInfo[playerid][p_POS_Y] = newy;
	PlayerInfo[playerid][p_POS_Z] = Z;

	Streamer_UpdateEx(playerid, X, Y, Z, worldid, interior, .compensatedtime = 500, .freezeplayer = 1);
	SetPlayerPos(playerid, newx, newy, Z);
	//SetTimerEx("PlayerTimerLoadingInterior", 500, false, "iffffii", playerid, X, Y, Z, A, interior, worldid);

	//SetPVarInt(playerid, "LoadingObjects", 1);
	
}

stock SetPlayerAngleEx(playerid, Float:angle)
{
	return SetPlayerFacingAngle(playerid, angle);
}

stock AssignVariablesBeds(playerid, bedid, Float:X, Float:Y, Float:Z, Float:A)
{
	SetPlayerPosEx(playerid, X,Y,Z,A);
	BedVar[bedid-1] = 1; 
	PlayerInfo[playerid][pBed] = bedid;
	return 1;
}

stock DetectCMDNoTime(/*playerid, */const cmdtext[])
{
	/*strlen(cmdtext);*/
	if(strfind(cmdtext, "/y ", true) != -1 || strfind(cmdtext, "/me ", true) != -1
	||strfind(cmdtext, "/p ", true) != -1 || strfind(cmdtext, "/d ", true) != -1
	||strfind(cmdtext, "/g ", true) != -1 || strfind(cmdtext, "/s ", true) != -1) { return 1; }
	/*if(!strcmp(cmdtext, "/y ", true)) {  return 1; }*/
	return 0;
}

stock ServerLoadLabels()
{
	CreateDynamic3DTextLabel("Presiona {5EB5FF}'~k~~GROUP_CONTROL_BWD~' {FFFFFF}para abrir.",-1,1725.2363,449.2597,30.8024,7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
	CreateDynamic3DTextLabel("Presiona {5EB5FF}'~k~~GROUP_CONTROL_BWD~' {FFFFFF}para abrir.",-1,1699.5015,449.0462,30.9260,7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
}

/*stock IsPlayerLogged(playerid)
{
	if(IsPlayerConnected(playerid) && PlayerInfoTemp[playerid][pt_IsLoggedIn] == true && !IsPlayerNPC(playerid))
	{
		return 1;
	}
	return 0;
}*/

stock ServerLoadPickups()
{
	CreateDynamicPickup(1575, 23, 1547.3971,-1471.7462,13.5492-0.2, -1);
	CreateDynamicPickup(1575, 23, 2729.1001,-2018.2969,13.5547-0.2, -1);
	CreateDynamicPickup(1575, 23, -1778.9154,1310.6115,7.1875-0.2, -1);
	CreateDynamicPickup(1575, 23, -1298.8988,2526.4863,87.5508-0.2, -1);
	//
	CreateDynamicPickup(1239, 23, 2316.2827,-66.0993,26.4844, -1); // Info Mascara de ladrï¿½n
	//
	CreateDynamicPickup(1239, 23, -1858.3964,140.8488,15.3312, -1); // Info - Trabajo de grï¿½a
	//
	CreateDynamicPickup(1275, 1, 217.5330, -97.5454, 1005.2578, -1);
	CreateDynamicPickup(1275, 1, 181.3838, -86.2905, 1002.0234, -1);
	CreateDynamicPickup(1275, 1, 215.8411, -154.5792, 1000.5234, -1);
	CreateDynamicPickup(1275, 1, 214.6265, -39.8521, 1002.0234);

	CreateDynamicPickup(1247, 1, 250.4501, 67.6533, 1003.6409);
}

LoadBarriers()
{
	new query[128];
	format(query, sizeof(query), "SELECT * FROM lac_barriers");
	mysql_tquery(conexion, query, "LoadDataBarriers");
}

function LoadDataBarriers()
{
	new rows, fields;
	cache_get_row_count(rows);
	cache_get_field_count(fields);
	if(rows)
	{
	    /*if(  0 < rows <= MAX_PARKING )
		{*/
		for(new i = 0; i<rows;i++)
		{
			new content[30];
			cache_get_value_name(i, "id", content); BSVInfo[i][bsvID] = strval(content);
			cache_get_value_name(i, "Object", content); BSVInfo[i][bsvObject] = strval(content);
			cache_get_value_name(i, "X", content); BSVInfo[i][bsvX] = floatstr(content);
			cache_get_value_name(i, "Y", content); BSVInfo[i][bsvY] = floatstr(content);
			cache_get_value_name(i, "Z", content); BSVInfo[i][bsvZ] = floatstr(content);
			cache_get_value_name(i, "RX", content); BSVInfo[i][bsvRX] = floatstr(content);
			cache_get_value_name(i, "RY", content); BSVInfo[i][bsvRY] = floatstr(content);
			cache_get_value_name(i, "RZ", content); BSVInfo[i][bsvRZ] = floatstr(content);
			cache_get_value_name(i, "StreamDistance", content); BSVInfo[i][bsvStreamDistance] = floatstr(content);
			cache_get_value_name(i, "DrawDistance", content); BSVInfo[i][bsvDrawDistance] = floatstr(content);
			cache_get_value_name(i, "VW", content); BSVInfo[i][bsvVW] = strval(content);
			cache_get_value_name(i, "Interior", content); BSVInfo[i][bsvInt] = strval(content);
			cache_get_value_name(i, "Type", content); BSVInfo[i][bsvType] = strval(content);
			cache_get_value_name(i, "MaxTime", content); BSVInfo[i][bsvMaxTime] = strval(content);
			cache_get_value_name(i, "PX", content); BSVInfo[i][bsvPX] = floatstr(content);
			cache_get_value_name(i, "PY", content); BSVInfo[i][bsvPY] = floatstr(content);
			cache_get_value_name(i, "PZ", content); BSVInfo[i][bsvPZ] = floatstr(content);
			cache_get_value_name(i, "NewRY", content); BSVInfo[i][bsvNewRY] = floatstr(content);

			BSVInfo[i][bsvObjectID] = CreateDynamicObjectEx(BSVInfo[i][bsvObject],BSVInfo[i][bsvX],BSVInfo[i][bsvY],BSVInfo[i][bsvZ],BSVInfo[i][bsvRX],BSVInfo[i][bsvRY],BSVInfo[i][bsvRZ],BSVInfo[i][bsvStreamDistance],BSVInfo[i][bsvDrawDistance]);
	
			if(BSVInfo[i][bsvPX] != 0)
			{
				CreateDynamic3DTextLabel("{5EB5FF}Peaje:\n{FFFFFF}Costo: {00E500}Gratis\n{FFFFFF} Para abrirlo presiona: {5EB5FF}~k~~GROUP_CONTROL_BWD~", COLOR_WHITET, BSVInfo[i][bsvPX],BSVInfo[i][bsvPY],BSVInfo[i][bsvPZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
			}
		}
		printf("Se cargaron %d Barreras.", rows);
	}
	return 1;
}

stock RotateDynamicObjectEx(objectid, Float:rotX, Float:rotY, Float:rotZ, Float:Speed)
{
	new Float:X, Float:Y, Float:Z;
	new Float:SpeedConverted = floatmul(Speed, 0.01);
	GetDynamicObjectPos(objectid, X, Y, Z);
	SetDynamicObjectPos(objectid, X, Y, floatadd(Z, 0.01));
	MoveDynamicObject(objectid, X, Y, floatsub(Z, 0.01), SpeedConverted, rotX, rotY, rotZ);
	return 1;
}

function CloseBarriers1(i)
{
	RotateDynamicObjectEx(BSVInfo[i][bsvObjectID], BSVInfo[i][bsvRX], /*-90.000*/BSVInfo[i][bsvRY]/*-86.000*/, BSVInfo[i][bsvRZ], 1.00);
	KillTimer(BSVInfo[i][bsvTime]);
	BSVInfo[i][bsvState] = 0;
}

stock SaveBarrierServer(i)
{
	new id[10];
	format(id, 10, "%i", BSVInfo[i][bsvID]);
	GuardarDatoFilaFloat("lac_barriers", "PX", BSVInfo[i][bsvPX], 0, "id", id);
	GuardarDatoFilaFloat("lac_barriers", "PY", BSVInfo[i][bsvPY], 0, "id", id);
	GuardarDatoFilaFloat("lac_barriers", "PZ", BSVInfo[i][bsvPZ], 0, "id", id);
	//GuardarDatoFilaFloat("lac_barriers", "LX", BSVInfo[i][bsvLX], 0, "id", id);
	//GuardarDatoFilaFloat("lac_barriers", "LY", BSVInfo[i][bsvLY], 0, "id", id);
	//GuardarDatoFilaFloat("lac_barriers", "LZ", BSVInfo[i][bsvLZ], 0, "id", id);
	return 1;
}

stock VehicleParams(vehicleid,option,OnOff)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    switch(option)
    {
        case 1:
        {
            SetVehicleParamsEx(vehicleid, OnOff, lights, alarm, doors, bonnet, boot, objective);
        }
        case 2:
        {
            SetVehicleParamsEx(vehicleid, engine, OnOff, alarm, doors, bonnet, boot, objective);
        }
        case 3:
        {
            SetVehicleParamsEx(vehicleid, engine, lights, OnOff, doors, bonnet, boot, objective);
        }
        case 4:
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, OnOff, bonnet, boot, objective);
        }
        case 5:
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, OnOff, boot, objective);
        }
        case 6:
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, OnOff, objective);
        }
        case 7:
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, OnOff);
        }
    }
    return 1;
}

stock SetPlayerPosPlayer(playerid)
{
	new Float:sx, Float:sy, Float:sz;
	GetPlayerPos(playerid, sx, sy, sz);
	SetPlayerPos(playerid, sx, sy, sz);
	return 1;
}

RecosBasu(playerid, place, type)
{
	if(type == 1) { TravelProgressDump(playerid, place, 5, 6); }
	else if(type == 2) { TravelProgressDump(playerid, place, 7, 8); }
	return 1;
}

TravelProgressDump(playerid, place, recod, recoc)
{
	new compa = DumpCompa[playerid];
	if(place == 1)
	{
		if(PlayerToPointRace(playerid, 7.0, recod, PlayerInfo[playerid][pDumpP]-1))
		{
			if(PlayerInfo[playerid][pDumpP] <= GetProgressRacePlayer(recod)+1)
			{
				if(!ThisInVehicleS(GetPlayerVehicleID(playerid), 9) || GetPlayerState(playerid) != 2) return 1;
				PlayerInfo[compa][pDumpP]++;
				SetPlayerCPN(compa, recoc, PlayerInfo[compa][pDumpP], 2.0);		

				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, -1, "Espera que tu compaï¿½ero recolecte la basura.");
				SendClientMessage(compa, -1, "Baja del camiï¿½n y recolecta la basura.");
			}
		}
		if(PlayerToPoint(7.0, playerid, -113.6386,-1546.3568,2.7946))
		{
			if(PlayerInfo[playerid][pDumpP] == GetProgressRacePlayer(recod)+1)
			{
				if(!ThisInVehicleS(GetPlayerVehicleID(playerid), 9) || GetPlayerState(playerid) != 2) return 1;
				new Float:anglev;
				GetVehicleZAngle(GetPlayerVehicleID(playerid), anglev);
				if(anglev > 93 && anglev < 175)
				{
					DisablePlayerCheckpoint(playerid);
					//PayJobGarbage(playerid, PlayerInfo[playerid][p_DumpSkill]);
					//PayJobGarbage(compa, PlayerInfo[compa][p_DumpSkill]);
					resetVarsJobGarbage(playerid);
					resetVarsJobGarbage(compa);
					SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				} else SendClientMessage(playerid, -1, "Estaciona el camiï¿½n con la parte trasera.");
			}
		}
	}
	else if(place == 2)
	{
		if(PlayerToPointRace(playerid, 2.0, recoc, PlayerInfo[playerid][pDumpP]/*-1*/) && !IsPlayerInAnyVehicle(playerid))
		{
		    CollectTrash(playerid, recoc, recod);

		}
	}
	return 1;
}

CollectTrash(playerid,/* compaid,*/ recoid, recoidc)
{
	new velocity;
	/*switch(GetPlayerWorkLevel(playerid, WORK_TYPE_DUMPSTER))
	{
		case 1: velocity = 1000*12;
		case 2: velocity = 1000*11;
		case 3: velocity = 1000*10;
		case 4: velocity = 1000*9;
		case 5: velocity = 1000*8;
		case 6: velocity = 1000*7;
		case 7: velocity = 1000*6;
		case 8: velocity = 1000*5;
		case 9: velocity = 1000*4;
		case 10..100: velocity = 1000*3;
	}*/
	if(PlayerInfo[playerid][pDumpP] <= GetProgressRacePlayer(recoid))
	{
		DisablePlayerCheckpoint(playerid);
	}
	else if(PlayerInfo[playerid][pDumpP] == GetProgressRacePlayer(recoid)+1)
	{
		DisablePlayerCheckpoint(playerid);
	}
	GameTextForPlayer(playerid, "~g~Recolectando basura... ~w~espera", velocity, 3);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, velocity);
	SetTimerEx("CollectTrashT", velocity, false, "iii", playerid, recoidc, recoid);
	return 1;
}

function CollectTrashT(playerid, recoid, recocoll)
{
	new compa = DumpCompa[playerid];
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
	/*ClearAnimations(playerid);*/

	if(PlayerInfo[playerid][pDumpP] < GetProgressRacePlayer(recocoll))
	{
		SetPlayerCPN(compa, recoid, PlayerInfo[compa][pDumpP], 7.0);	
		SetPlayerSaveCP(compa, recoid, PlayerInfo[compa][pDumpP], 2);		
		SendClientMessage(playerid, -1, "Sube al camiï¿½n de basura para continuar el recorrido.");
		PlayerInfo[compa][pDumpP]++;
	}
	else if(PlayerInfo[playerid][pDumpP] == GetProgressRacePlayer(recocoll))
	{
		SetPlayerCheckpoint(compa, -113.6386,-1546.3568,2.7946, 7.0);
		SetPlayerCP(compa, -113.6386,-1546.3568,2.7946, 2);
		SendClientMessage(compa, -1, "Entrega el camiï¿½n en el deposito de basura, para recibir el pago.");
		SendClientMessage(playerid, -1, "Espera que tu compaï¿½ero entregue el camiï¿½n de basura para recibir el pago.");
	}
	/*PlayerInfo[compa][pDumpP]++;*/
	/*return 1;*/
}

resetVarsJobGarbage(playerid)
{
	PlayerInfo[playerid][pDumpP] = 0;
	DumpTravel[playerid] = 0;
	DumpCompa[playerid] = INVALID_PLAYER_ID;
	DumpPlace[playerid] = 0;
	RemovePlayerCP(playerid, 2);
	return 1;
}

BuySkinPlayer(playerid, type)
{

	switch(PlayerInfo[playerid][p_Gender])
	{
		case 0:
		{
			switch(type)
			{
				case 0: 
				{ 
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Binco_MEN; i++) { mSelection_AddItems(playerid, Buy_Skins_Binco_MEN[i],5500);  }
					mSelection_Update(playerid);
				}
				case 1: 
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin,"Comprar ropa"); 
					for(new i = 0; i < sizeof Buy_Skins_Zip_Men; i++) { mSelection_AddItems(playerid, Buy_Skins_Zip_Men[i],9900);  }
					mSelection_Update(playerid);
				}
				case 2:  //Prolaps
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Men_Prolaps; i++) { mSelection_AddItems(playerid, Buy_Skins_Men_Prolaps[i],8400);  }
					mSelection_Update(playerid);
				}
				case 3: // DS
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Men_DS; i++) { mSelection_AddItems(playerid, Buy_Skins_Men_DS[i],10000); }
					mSelection_Update(playerid);
				}
				case 4: 
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Suburban_Men; i++) { mSelection_AddItems(playerid, Buy_Skins_Suburban_Men[i],4400); }	
					mSelection_Update(playerid);
				}
				case 5: 
				{

				}
			}
		}
		case 1:
		{
			switch(type)
			{
				case 0: 
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Binco_WOMEN; i++) { mSelection_AddItems(playerid, Buy_Skins_Binco_WOMEN[i],5500);  }
					mSelection_Update(playerid);
				}
				case 1: 
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin,"Comprar ropa"); 
					for(new i = 0; i < sizeof Buy_Skins_Zip_Women; i++) { mSelection_AddItems(playerid, Buy_Skins_Zip_Women[i],9900);  }
					mSelection_Update(playerid);
				}
				case 2:  //Prolaps
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Women_Prolaps; i++) { mSelection_AddItems(playerid, Buy_Skins_Women_Prolaps[i],8400); }
					mSelection_Update(playerid);
				}
				case 3: // DS
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Women_DS; i++) { mSelection_AddItems(playerid, Buy_Skins_Women_DS[i],10000);  }
					mSelection_Update(playerid);
				}
				case 4:
				{
					ShowModelSelectionMenuEx(playerid, SelectBuySkin, "Comprar ropa");
					for(new i = 0; i < sizeof Buy_Skins_Suburban_Women; i++) { mSelection_AddItems(playerid, Buy_Skins_Suburban_Women[i],4400); }
					mSelection_Update(playerid);
				}
			}
		}
	}
	return 1;
}

/*Float:*/stock getVehicleSpeed(vehicleid, statetype = true)
{
	new Float: Floats[3];
	GetVehicleVelocity(vehicleid, Floats[0], Floats[1], Floats[2]);	
	return SpeedCalculate(Floats[0], Floats[1], Floats[2], 103.0, statetype);
}

stock GetSquareDistance(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
        x1-=x2;
        y1-=y2;
        z1-=z2;
        x1*=x1;
        y1*=y1;
        z1*=z1;
        return floatround(x1+y1+z1);
}
function DetectCheat(playerid)
{
    new Float:xp,Float:yp,Float:zp; //Variables que guardara posiciones
    new pstate; //Variable que verifica en que estado esta, en auto o a pie 
    if(IsPlayerConnected(playerid) && GetPlayerPos(playerid,xp,yp,zp))
    {
        pstate=GetPlayerState(playerid);
     	if(pstate==PLAYER_STATE_DRIVER && getPVSpeed(playerid)<10)
      	{ 
      		
       	    new var=(floatround(floatsqroot(GetSquareDistance(xp,yp,zp,CurrentPosX[playerid],CurrentPosY[playerid],CurrentPosZ[playerid]))*3600)/(GetTickCount()-LastCheck[playerid])); //Detecta la velocidad de posicion a posicion
            /*printf("%d", var);*/
            if(var>=700 && var<=1500) //Si pasa el limite se activa el contador
            {
            	new string[58];
            	format(string, sizeof(string), "{BD3939}SpeedHack [%i]{FFFFFF}.", var);
	           	BaneoAnticheat(playerid, string, 1);
            }
        }
     	if(pstate==PLAYER_STATE_ONFOOT && getPVSpeed(playerid)<10)
      	{
       	    new var=(floatround(floatsqroot(GetSquareDistance(xp,yp,zp,CurrentPosX[playerid],CurrentPosY[playerid],CurrentPosZ[playerid]))*3600)/(GetTickCount()-LastCheck[playerid])); //Detecta la velocidad de posicion a posicion
            if(var>=700 && var<=1500) //Si pasa el limite se activa el contador
            {
            	new string[58];
            	format(string, sizeof(string), "{BD3939}SpeedHack [%i]{FFFFFF}.", var);
	           	BaneoAnticheat(playerid, string, 1);
            }
       	}
       	
		CurrentPosX[playerid] = xp; //Se guarda posiciones anteriores en variables 
        CurrentPosY[playerid] = yp;
        CurrentPosZ[playerid] = zp;
        LastCheck[playerid]= GetTickCount(); //Calcula tiempo en que se hace
    }
    return 1;
}

stock IsVehicleInRangeOfPoint(vehicleid,Float:range,Float:x,Float:y,Float:z) 
{ 
    if(vehicleid == INVALID_VEHICLE_ID) return 0;
    
    new Float:DistantaCar = GetVehicleDistanceFromPoint(vehicleid, x, y, z);
    
    if(DistantaCar <= range) return 1;
    return 0;
}  

getPVSpeed(playerid, statetype = 1)
{
	new Float:x, Float:y, Float:z;
	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid), x,y,z);	
	}
	else
	{
		GetPlayerVelocity(playerid, x,y,z);
	}
	return SpeedCalculate(x,y,z, 103.0, statetype);	
}

stock AttachPlayerObjectUsed(playerid, objectid, itemid = -1)
{
	new bool:carry, bool:objecthand = true;

	switch(objectid)
	{
		case 366: { SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY); Objeto[playerid] = 366; SetPlayerAttachedObject(playerid,9,366,6,0.324000,-0.059000,-0.519000,-12.699998,-150.999984,-4.399999,1.000000,1.000000,1.000000); }
		case 1509: { SetPlayerAttachedObject(playerid,9,1509,6,0.050999,0.056999,0.015999,-2.000000,-12.399998,0.000000,0.831999,1.000000,0.885999); }
		case 1543: { SetPlayerAttachedObject(playerid,9,1543,6,0.060999,0.061000,-0.069999,0.000000,0.000000,0.000000,1.000000,1.000000,0.891999); }
		case 1546: { SetPlayerAttachedObject(playerid,9,1546,6,0.049000,0.051000,0.000000,-11.100009,5.099995,-1.399999,1.000000,1.000000,1.000000); }
		case 1650:{ SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,1650,6,0.151999,0.019999,0.042999,4.799999,-98.600013,-1.499999,1.000000,1.000000,1.000000); } // Bidon
		case 1783: { SetPlayerAttachedObject(playerid,9,1783,6,0.104999,0.055999,-0.227000,-108.300041,-8.299997,-98.100036,1.000000,1.000000,1.000000); Objeto[playerid]=1783; SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY); }
		case 2028: { AttachObjectToSPlayer(playerid, 0, 7, 2028, 6); }
		case 2900:
		{
			Objeto[playerid] = 2900;
			SetPlayerAttachedObject(playerid,9,2900,5,0.192999,-0.073000,0.100999,9.300007,178.500061,-74.300003,0.177000,0.255000,0.201000);
		}
		case 1580:
		{
			Objeto[playerid] = 1580;
			SetPlayerAttachedObject(playerid,9,1580,5,0.319000,-0.094999,-0.063999,-84.499984,11.399999,9.399997,1.000000,1.000000,1.000000);
		}
		case 1271:
		{
			Objeto[playerid] = 1271;
			SetPlayerAttachedObject(playerid,9,1271,5,0.187999,0.000000,0.003000,-79.299873,-79.599952,12.599998,0.161999,0.553000,0.293999);
		}
		case 1210: { Objeto[playerid] = 1210; AttachObjectToSPlayer(playerid, 0, 5, 1210, 6); } // Maletin
		case 2317: { Objeto[playerid] = 2317; AttachObjectToSPlayer(playerid, 0, 3, 2317, 6); }
		case 2318: // Black TV
		{
			SetPlayerAttachedObject(playerid,9,2318,6,-0.027999,0.244000,-0.232999,-105.400032,-25.200004,85.800010,1.000000,1.000000,1.000000);
			Objeto[playerid] = 2318;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
		}
		case 2404: { AttachObjectToSPlayer(playerid, 0, 6, 2404, 6); /*SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);*/ } // Tabla de surf TR
		case 2406: { AttachObjectToSPlayer(playerid, 0, 6, 2406, 6); /*SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);*/ } // Tabla de surf TF
		case 2647: { SetPlayerAttachedObject(playerid,9,2647,6,0.063000,0.037999,0.031000,0.000000,0.000000,0.000000,0.664999,0.718000,0.761999); }
		case 2190: { Objeto[playerid] = 2190; AttachObjectToSPlayer(playerid, 0, 4, 2190, 6); SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);}
		case 2226: { Objeto[playerid] = 2226; AttachObjectToSPlayer(playerid, 0, 1, 2226, 6); }
		case 2814: { SetPlayerAttachObjectEx(playerid,9,2814,6,2814,0, 0.263000,0.075000,-0.098000,-112.899993,-22.899999,-14.199996,1.000000,1.000000,1.000000); }
		case 2702:
		{
			SetPlayerAttachedObject(playerid,9,2702,6,0.073999,0.097000,-0.029999,172.199996,-146.999969,-167.100036,1.000000,0.750000,0.746999);
    		/*ObjectIsFood[playerid] = 2702;*/
		}
		case 2703: { SetPlayerAttachedObject(playerid,9,2703,6,0.031999,0.044999,-0.002000,-22.399999,0.000000,-0.399999,1.000000,1.000000,1.000000); } // Burger
		case 2769: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,2769,6,0.091000,0.061000,0.035999,-145.000061,-76.000045,27.299997,1.000000,1.000000,1.000000); }
		case 3026: // Mochila
		{
			SetPlayerAttachedObject(playerid,9,objectid,6,0.473000,-0.063000,0.061999,-177.899963,-175.200012,-16.000007,1.000000,1.000000,1.000000);
		}
		case 3052: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,3052,6,0.192999,-0.008000,0.000999,0.000000,-97.099998,-0.299997,0.696000,0.683000,0.771000, InvObjectData[itemid][E_INV_COLOR1]); }
		case 3930: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,3930,6,0.086999,0.074000,-0.155999,-14.499999,-0.199999,1.700000,0.468000,0.472000,0.790000, InvObjectData[itemid][E_INV_COLOR1]); } // Rock
		
		// Medic
		case 11736: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,11736,6,0.005999,0.043999,0.004000,92.899971,0.299947,101.999969,0.933000,0.858000,1.000000); }
		case 11738: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,11738,6,0.284999,0.019000,0.023000,0.400000,-95.299972,0.099998,1.000000,1.000000,1.000000);  }
		case 11747: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,11747,6,0.092000,0.048999,-0.004999,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); }
		

		case 18635: // Martillo
		{
			SetPlayerAttachedObject(playerid,9,18635,6,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,0.697999);
		}

		case 19106, 19107:
		{
			SetPlayerAttachedObject(playerid,9,objectid,6,0.162000,0.085000,-0.007000,-10.899997,-3.500000,105.799987,1.000000,1.000000,1.000000);
		}
		case 19468: SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,objectid,6,0.176000,-0.152999,-0.071999,-115.500007,-8.699999,0.299999,1.000000,1.000000,1.000000);
		case 19317: // Guitarra
		{
			SetPlayerAttachedObject(playerid,9,19317,6,0.014999,0.036000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
			Objeto[playerid] = 19317;
		}
		case 19570:
		{
			SetPlayerAttachedObject(playerid,9,19570,6,0.082999,0.065999,-0.133999,0.000000,0.000000,0.000000,0.550999,0.601999,0.807000);
		}
		case 19612: { Objeto[playerid] = 19612; AttachObjectToSPlayer(playerid, 0, 2, 19612, 6); SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY); } // GuitarAmp1
		case 19631: { SetPlayerAttachedObject(playerid, SLOT_ATTACH_HAND, 19631, 6, 0.090999,0.048999,0.017000,2.999997,-101.099983,87.200141,1.000000,1.000000,1.000000); }
		case 19812: { SetPlayerAttachedObject(playerid, SLOT_ATTACH_HAND, objectid,6,0.015999,0.416999,-0.302000,-114.299980,-30.699996,63.100009,0.917999,0.824000,0.918999); }
		case 19894: { SetPlayerAttachedObject(playerid, SLOT_ATTACH_HAND, 19894, 6, -0.025000,0.077999,-0.023000,91.500015,0.199999,-79.500000,1.000000,1.000000,1.000000); }
		case 18941, 18957, 18926: { SetPlayerAttachedObject(playerid, SLOT_ATTACH_HAND,objectid,6,0.136000,0.101999,-0.016000,-16.899997,-12.799999,107.499961,1.000000,1.000000,1.000000); }
		case 19921: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,objectid,6,0.101999,0.056999,0.000000,-85.600006,11.399957,-99.400001,1.000000,1.000000,1.000000); }
		case 19995: { SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,objectid,6,0.099999,0.068999,0.011999,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000); }
	}
	switch(InvObjectData[itemid][E_INV_TYPE])
	{
		case INV_TYPE_CAP, INV_TYPE_HAT2, INV_TYPE_HAT3: SetPlayerAttachedObject(playerid, SLOT_ATTACH_HAND,objectid,6,0.136000,0.101999,-0.016000,-16.899997,-12.799999,107.499961,1.000000,1.000000,1.000000);
		case INV_TYPE_PHONE: SetPlayerAttachedObject(playerid,9,objectid,6,0.129999,0.026999,0.000000,99.200012,-161.600036,-1.399998,1.000000,1.000000,1.000000);
		case INV_TYPE_MASK: SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,objectid,6,0.142999,0.108999,0.033999,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
		case INV_TYPE_GLASSES: SetPlayerAttachedObject(playerid,SLOT_ATTACH_HAND,objectid,6,0.123999,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
	}

	if(carry == true)
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	}
	if(objecthand == true)
	{
		Objeto[playerid] = objectid;
	}
	return 1;
}

stock OpenDoorTruck(vehicleid, open)
{
	new engine, lights, alarm, doors, bonnet, boot, objective;	
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	if(open == 1)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 609)
		{
			SetVehicleParamsCarDoors(vehicleid, 0,0,1,1);
		}
		else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 456)
		{
			SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 1, objective);
		}
		return 1;
	}
	else
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 609)
		{
			SetVehicleParamsCarDoors(vehicleid, 0,0,0,0);
		}
		else if(Vehicles_Info[vehicleid][gi_vehicle_MODELID] == 456)
		{
			SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 0, objective);
		}
	}
	return 1;
}

stock playerConsumeFood(playerid, type, effect, amount)
{
	new item = PlayerInfo[playerid][pInvItemSelected];

	if(PlayerInventory[playerid][item][invAmount] != 0 && !rBit1_Get(eBit1_PlayerInfo[pTimeEatingActive], playerid))
	{
		new time;

		rBit1_Set(eBit1_PlayerInfo[pTimeEatingActive], playerid, true);
		Player.Temp[playerid][@FreezeInventory] = 1;
		switch(type)
		{
			case 0:
			{
				ApplyAnimationEx(playerid, "BAR", "DNK_STNDM_LOOP", 4.1, false, false, false, false, 2000, false);
				time = 2000;
			}
			case 1: 
			{ 
				ApplyAnimationEx(playerid, "FOOD", "EAT_PIZZA", 4.1, false, false, false, false, 5000, false); 
				time = 5000;
			}
			case 2:
			{
				ApplyAnimationEx(playerid, "FOOD", "EAT_BURGER", 4.1, false, false, false, false, 5000, false);
				time = 5000;
			}
			case 3:
			{
				ApplyAnimationEx(playerid, "FOOD", "EAT_CHICKEN", 4.1, false, false, false, false, 5000, false);
				time = 5000;
			}
			
		}
		SetTimerEx("EndPlayerEatingFood", time, false, "idd", playerid, effect, amount);
	}
	return 1;
}

SetVehiclePosEx(vehicleid, Float:x,Float:y,Float:z)
{
	Vehicles_Info[vehicleid][gi_vehicle_POS_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_POS_X] = y;
	Vehicles_Info[vehicleid][gi_vehicle_POS_X] = z;	
	return SetVehiclePos(vehicleid, x, y, z);
}

LinkVehicleToInteriorEx(vehicleid, interior)
{
	Vehicles_Info[vehicleid][gi_vehicle_INT] = interior;
	return LinkVehicleToInterior(vehicleid, interior);
}
SetVehicleVWEx(vehicleid, vw)
{
	Vehicles_Info[vehicleid][gi_vehicle_VW] = vw;
	return SetVehicleVirtualWorld(vehicleid, vw);
}

SetVDriverPassengerPos(vehicleid, /*Float:x,Float:y,Float:z,Float:a,*/ int, vw)
{
	foreach (new i : Player)
    {
        if(IsPlayerConnected(i))
        {
            if(IsPlayerInVehicle(i, vehicleid))
            {
                SetInterior(i, int);
                SetVW(i, vw);
            }
        }
    }
}
public OnVehicleStreamIn(vehicleid, forplayerid) 
{ /*new string[32];
    format(string, sizeof(string) , "Ahora puede ver el vehï¿½culo %d." , vehicleid);
    SendClientMessage(forplayerid, 0xFFFFFFFF, string) ;*/
    return  1 ;
}

public OnVehicleStreamOut(vehicleid, forplayerid) 
{ 
   	/*new string[32];
    format(string, sizeof(string) , "Ahora puede ver el vehï¿½culo %d." , vehicleid);
    SendClientMessage(forplayerid, 0xFFFFFFFF, string) ;*/
    return  1 ;
}

public OnActorStreamIn(actorid, forplayerid)
{
	new Float:x, Float:y, Float:z;
	GetActorPos(actorid, x,y,z);
	SetActorPos(actorid, x,y,z);
	return 1;
}

stock paramsVehicleEx(vehicleid, params, pstate)
{
	new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    switch(params)
    {
    	case 3: SetVehicleParamsEx(vehicleid, engine, lights, pstate, doors, bonnet, boot, objective);
   }
}

stock GetPlayerMoneyEx(playerid)
{
	return PlayerInfo[playerid][pDinero];
}

stock SetPlayerWantedEx(playerid, level, sound = 1)
{
	if(sound == 1) { PlayerPlaySound(playerid, 1058, 0.0,0.0,0.0); }
	PlayerInfo[playerid][pCargos] += level;
	if(level > 6)
	{
		level = 6;
	}
	return SetPlayerWantedLevel(playerid, level);
}

const UNOCCUPIED_SYNC = 209;

IPacket:UNOCCUPIED_SYNC(playerid, BitStream:bs)
{
    new unoccupiedData[PR_UnoccupiedSync];
 
    BS_IgnoreBits(bs, 8);
    BS_ReadUnoccupiedSync(bs, unoccupiedData);
 
    if(floatcmp(floatabs(unoccupiedData[PR_roll][0]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_roll][1]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_roll][2]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_direction][0]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_direction][1]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_direction][2]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_position][0]), 20000.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_position][1]), 20000.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_position][2]), 20000.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_angularVelocity][0]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_angularVelocity][1]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_angularVelocity][2]), 1.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_velocity][0]), 100.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_velocity][1]), 100.00000) == 1
        || floatcmp(floatabs(unoccupiedData[PR_velocity][2]), 100.00000) == 1
    ) {
        return false;
    }

    return true;
}
