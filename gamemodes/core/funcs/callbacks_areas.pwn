function OnPressInteractiveArea(playerid, areaid)
{
	if(GetInteractiveAreaTypeG(areaid) < KEY_AREAIT_TYPE_V_YES)
	{
		switch(GetInteractiveAreaType(areaid))
		{
			case AREAIT_TYPE_RESTAURANTS_DRINK:
			{
				DynamicDgui_Start(playerid);
				DynamicDgui_AddVar(playerid, 0);
				Dialog_Show(playerid, DialogBuyDrinkGeneral, DIALOG_STYLE_TABLIST_HEADERS, "Comprar bebidas",
					"Bebida\tPrecio\n\
					Sprunk\t{33AA33}$40\n\
					", "Comprar", "Cancelar");
			}
			case AREAIT_TYPE_BUYSERVICESTORE:
			{
				Dialog_Show(playerid, DialogBuyServiceStore, DIALOG_STYLE_TABLIST, "{5EB5FF}7-Eleven",
					"Bidón\t{33AA33}$20\n\
					", "Comprar", "Cancelar");

				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUYWORKSHOPTOOLS:
			{
				Dialog_Show(playerid, DialogBuyWorkshopTools, DIALOG_STYLE_TABLIST, "{5EB5FF}7-Eleven",
					"Kit de reparación\t{33AA33}$400\n\
					", "Comprar", "Cancelar");

				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_SERVICE_MEDIC:
			{
				ShowPlayerDialog(playerid, DIALOG_SERVICEMEDICH, DIALOG_STYLE_TABLIST, "{5EB5FF}Hospital - Productos",
					"Botiquín\t\t{44AA44}$400\n\
					Analgésico\t\t{44AA44}$100\n\
					Vendas (x4)\t\t{44AA44}$150\n\
					Atención medica\t\t{44AA44}$414",
					"Seleccionar", "Cerrar");

				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_ORDECOW:
			{
				if(PlayerInfo[playerid][p_JobTravelT] != 1) return 1;
				else if(PlayerInfo[playerid][p_JobMissionExtra] > 0) return 1;
				else if(rBit1_Get(eBit1_PlayerInfo[p_StatePlayerFarmer], playerid)) return 1;

				if(FarmerCowsPosition[ PlayerInfo[playerid][p_JobTravel] ] == areaid)
				{
					PlayerInfo[playerid][p_JobTravelNext] = 3;
					SetPlayerProgressFarmerNext(playerid);
				}
			}
			case AREAIT_TYPE_ATM_MONEY:
			{
				ApplyAnimation(playerid, "CASINO", "CARDS_RAISE", 4.1, false, true, true, true, 0, false);
				ShowPlayerTextdrawsATM(playerid, 1);
			}
			case AREAIT_TYPE_BANK_MONEY:
			{
				ApplyAnimation(playerid, "CASINO", "CARDS_RAISE", 4.1, false, true, true, true, 0, false);
				ShowPlayerTextdrawsATM(playerid, 2);
			}
			case AREAIT_TYPE_BUY_PHONES:
			{
				ShowModelSelectionMenuEx(playerid, sBuyPhones,ConvertEncoding("Comprar celulares")); 
				
				for(new i = 0; i < sizeof ItemType_Phones; i++)
				{
					mSelection_AddItems(playerid, InvObjectData[ItemType_Phones[i]][E_INV_EXTRADATA], 90, ItemType_Phones[i]);
				}
				mSelection_Update(playerid);
			}

			case AREAIT_TYPE_BUY_SKINBINCO:
			{
				BuySkinPlayer(playerid, 0);
			}
			case AREAIT_TYPE_BUY_SKINZIP:
			{
				BuySkinPlayer(playerid, 1);
			}
			case AREAIT_TYPE_BUY_SKINPROLAPS:
			{
				BuySkinPlayer(playerid, 2);
			}
			case AREAIT_TYPE_BUY_SKINDS:
			{
				BuySkinPlayer(playerid, 3);
			}
			case AREAIT_TYPE_BUY_SKINSUBURBAN:
			{
				BuySkinPlayer(playerid, 4);
			}
			case AREAIT_TYPE_BUY_VEHICLES1:
			{
				ShowModelSelectionMenuEx(playerid, sBuyVehicle1, "Verdant Bluffs Car's"); 
				mSelection_AddItems(playerid, 466, 9750);
				mSelection_AddItems(playerid, 445, 8700);
				mSelection_AddItems(playerid, 422, 15800);
				mSelection_AddItems(playerid, 543, 7500);
				mSelection_AddItems(playerid, 549, 7500);
				mSelection_AddItems(playerid, 551, 9800);
				mSelection_AddItems(playerid, 600, 11000);
				mSelection_AddItems(playerid, 542, 8000);
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_VEHICLES2:
			{
				ShowModelSelectionMenuEx(playerid, sBuyVehicle1, "BikerShop"); 
				mSelection_AddItems(playerid, 462, Vehicles_DataSale[462-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 463, Vehicles_DataSale[463-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 468, Vehicles_DataSale[468-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 471, Vehicles_DataSale[471-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 521, Vehicles_DataSale[521-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 522, Vehicles_DataSale[522-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 586, Vehicles_DataSale[586-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 581, Vehicles_DataSale[581-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_AddItems(playerid, 461, Vehicles_DataSale[461-400][E_VEHICLEDATA_Sale_PRICE]);
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_VEHICLES4:
			{
				ShowModelSelectionMenuEx(playerid, sBuyVehicle1, "Grotti Car's"); 
				mSelection_AddItems(playerid, 506, 225000);
				mSelection_AddItems(playerid, 587, 145000);
				mSelection_AddItems(playerid, 429, 445000);
				mSelection_AddItems(playerid, 411, 540000);
				mSelection_AddItems(playerid, 451, 850000);
				mSelection_AddItems(playerid, 402, 580000);
				mSelection_AddItems(playerid, 415, 445000);
				mSelection_AddItems(playerid, 541, 810000);
				mSelection_AddItems(playerid, 579, 270000);
				mSelection_AddItems(playerid, 400, 210000);
				mSelection_AddItems(playerid, 554, 204000);
				mSelection_AddItems(playerid, 560, 405000);
				mSelection_AddItems(playerid, 477, 340000);
				mSelection_AddItems(playerid, 603, 284448);
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_G_HATS:
			{
				ShowModelSelectionMenuEx(playerid, BuyHatClothesPlayer,"Sombreros"); 
				switch(ServerGeneral.Info[@EventActive])
				{
					case 1:
					{
						mSelection_AddItems(playerid, 19064,50, 201);
						mSelection_AddItems(playerid, 19065,50, 202);
						mSelection_AddItems(playerid, 19066,50, 203);
					}
				}
				mSelection_AddItems(playerid, 18946,40, 70);
				mSelection_AddItems(playerid, 18947,50, 71);
				mSelection_AddItems(playerid, 18948,50, 72);
				mSelection_AddItems(playerid, 18949,50, 73);
				mSelection_AddItems(playerid, 18950,50, 74);
				mSelection_AddItems(playerid, 18951,50, 75);
				mSelection_AddItems(playerid, 18971,50, 76);
				mSelection_AddItems(playerid, 19097,50, 77);
				mSelection_AddItems(playerid, 19098,50, 78);
				mSelection_AddItems(playerid, 18969,50, 79);
				mSelection_AddItems(playerid, 18970,40, 80);
				mSelection_AddItems(playerid, 18971,40, 81);
				mSelection_AddItems(playerid, 18972,40, 82);
				mSelection_AddItems(playerid, 18973,40, 83);
				mSelection_AddItems(playerid, 19095,40, 84);
				mSelection_AddItems(playerid, 18967,40, 85);
				mSelection_AddItems(playerid, 18968,40, 86);
				mSelection_AddItems(playerid, 18969,40, 87);
				mSelection_AddItems(playerid, 19488,40, 88);
				mSelection_Update(playerid);

			}
			case AREAIT_TYPE_BUY_G_WATCHES:
			{
				ShowModelSelectionMenuEx(playerid, BuyWatchClothesPlayer,"Relojes");
				mSelection_AddItems(playerid, 19039,1800, ItemType_Watches[0]);
				mSelection_AddItems(playerid, 19040,1100, ItemType_Watches[1]);
				mSelection_AddItems(playerid, 19041,800, ItemType_Watches[2]);
				mSelection_AddItems(playerid, 19042,1800, ItemType_Watches[3]);
				mSelection_AddItems(playerid, 19043,1140, ItemType_Watches[4]);
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_G_WATCHES1:
			{
				ShowModelSelectionMenuEx(playerid, BuyWatchClothesPlayer,"Relojes");
				for(new i = 4; i < 14; i++)
				{
					mSelection_AddItems(playerid, InvObjectData[ItemType_Watches[i]][E_INV_OBJECTMID], 90, ItemType_Watches[i]);
				}
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_G_MASK:
			{
				new item = 124;
				ShowModelSelectionMenuEx(playerid, BuyWatchClothesPlayer,"Bandanas");
				for(new i = 18911; i <= 18920; i++)
				{
					mSelection_AddItems(playerid, i, 90, item);
					item++;

				}
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_G_CAP:
			{
				ShowModelSelectionMenuEx(playerid, BuyCapClothesPlayer,"Gorras");

				switch(ServerGeneral.Info[@EventActive])
				{
					case 1:
					{
						mSelection_AddItems(playerid, 19064,50, 201);
						mSelection_AddItems(playerid, 19065,50, 202);
						mSelection_AddItems(playerid, 19066,50, 203);
					}
				}
				mSelection_AddItems(playerid, 18939, 50, 90);
				mSelection_AddItems(playerid, 18940, 50, 89);
				mSelection_AddItems(playerid, 18941, 50, 44);
				mSelection_AddItems(playerid, 18942, 50, 68);
				mSelection_AddItems(playerid, 18943, 50, 69);
				//mSelection_AddItems(playerid, 189, 50, 69);

				mSelection_Update(playerid);

			}
			case AREAIT_TYPE_BUY_G_CAP4:
			{
				ShowModelSelectionMenuEx(playerid, BuyCapClothesPlayer,"Gorras y boinas");

				mSelection_AddItems(playerid, 18921, 40, 156);
				mSelection_AddItems(playerid, 18922, 40, 157);
				mSelection_AddItems(playerid, 18923, 40, 158);
				mSelection_AddItems(playerid, 18924, 40, 159);
				mSelection_AddItems(playerid, 18925, 40, 160);

				mSelection_AddItems(playerid, 18926, 80, 62);
				mSelection_AddItems(playerid, 18927, 80, 64);
				mSelection_AddItems(playerid, 18928, 80, 149);
				mSelection_AddItems(playerid, 18929, 80, 150);
				mSelection_AddItems(playerid, 18930, 80, 151);
				mSelection_AddItems(playerid, 18931, 80, 65);
				mSelection_AddItems(playerid, 18932, 80, 152);
				mSelection_AddItems(playerid, 18933, 80, 153);
				mSelection_AddItems(playerid, 18934, 80, 154);
				mSelection_AddItems(playerid, 18935, 80, 155);

				mSelection_Update(playerid);

			}
			case AREAIT_TYPE_BUY_G_GLASSES:
			{
				//new item = 91;

				ShowModelSelectionMenuEx(playerid, BuyGlassesClothesPlayer,"Lentes");
				for(new i = 0; i < sizeof ItemType_Glasses; i++)
				{
					mSelection_AddItems(playerid, InvObjectData[ItemType_Glasses[i]][E_INV_EXTRADATA], 90, ItemType_Glasses[i]);
				}

				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_G_BACKPAD:
			{
				ShowModelSelectionMenuEx(playerid, BuyBackpadClothingPlayer,"Mochilas");
				mSelection_AddItems(playerid, 3026, 240, 58);
				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_BUY_BMWEAPON1:
			{
				DynamicDgui_Start(playerid);

				Dialog_Show(playerid, DialogBuyWeapon, DIALOG_STYLE_TABLIST_HEADERS, "{5EB5FF}Mercado negro - Armas y munición",
				"Producto\tCantidad\tPrecio\n\
				9mm\t1\t{33AA33}$4,500\n\
				9mm silenciada\t1\t{33AA33}$4,800\n\
				Tec-9\t1\t{33AA33}$7,800\n\
				Micro-Uzi\t1\t{33AA33}$7,400\n\
				Escopeta recortada\t1\t{33AA33}$7,500\n\
				Rifle\t1\t{33AA33}$10,700\n\
				Cargador de pistola\t7\t{33AA33}$500\n\
				Caja de munición de pistola\t40\t{33AA33}$1,800\n\
				Caja de munición subfusil\t80\t{33AA33}$2,000\n\
				Munición de escopeta\t14\t{33AA33}$2,000\n\
				Munición de rifle\t20\t{33AA33}$2,100\
				", "Comprar", "Cancelar");

				DynamicDgui_AddVarEx(playerid, 0, 18);
				DynamicDgui_AddVarEx(playerid, 1, 19);
				DynamicDgui_AddVarEx(playerid, 2, 28);
				DynamicDgui_AddVarEx(playerid, 3, 24);
				DynamicDgui_AddVarEx(playerid, 4, 22);
				DynamicDgui_AddVarEx(playerid, 5, 29);
				DynamicDgui_AddVarEx(playerid, 6, 187);
				DynamicDgui_AddVarEx(playerid, 7, 188);
				DynamicDgui_AddVarEx(playerid, 8, 189);
				DynamicDgui_AddVarEx(playerid, 9, 190);
				DynamicDgui_AddVarEx(playerid, 10, 191);

				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUY_BMWEAPON2:
			{
				DynamicDgui_Start(playerid);

				Dialog_Show(playerid, DialogBuyWeapon2, DIALOG_STYLE_TABLIST, "{5EB5FF}Mercado negro",
				"Bate de béisbol\t{33AA33}$500\n\
				Spray\t{33AA33}$480\n\
				", "Comprar", "Cancelar");

				DynamicDgui_AddVarEx(playerid, 0, 4);
				DynamicDgui_AddVarEx(playerid, 1, 33);

				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUY_DRINKMARK:
			{
				OpenPlayerSpecialDialog(playerid, 0);
			}
			case AREAIT_TYPE_BUY_FOODREST:
			{
				OpenPlayerSpecialDialog(playerid, 2);
			}
			case AREAIT_TYPE_BUY_FOODCB:
			{
				Dialog_Show(playerid, DialogBuyFoodCB, DIALOG_STYLE_TABLIST, "{5EB5FF}Comida",\
				"Taco de pollo\t{2CAE2C}$40\n\
				", "Comprar", "Cancelar");
				DynamicSGUI_Start(playerid);
				DynamicSGUI_Add(playerid, 41, 40);
				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUY_DRINKCB:
			{
				Dialog_Show(playerid, DialogBuyFoodCB, DIALOG_STYLE_TABLIST, "{5EB5FF}Bebidas",\
				"Sprunk\t{2CAE2C}$20\n\
				", "Comprar", "Cancelar");
				DynamicSGUI_Start(playerid);
				DynamicSGUI_Add(playerid, 36, 20);
				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUY_FOODBS:
			{
				Dialog_Show(playerid, DialogBuyFoodCB, DIALOG_STYLE_TABLIST, "{5EB5FF}Comida",\
				"Hamburguesa\t{2CAE2C}$40\n\
				", "Comprar", "Cancelar");
				DynamicSGUI_Start(playerid);
				DynamicSGUI_Add(playerid, 200, 40);
				OpenPlayerDialogShop(playerid);
			}
			case AREAIT_TYPE_BUY_DRINKBS:
			{
				Dialog_Show(playerid, DialogBuyFoodCB, DIALOG_STYLE_TABLIST, "{5EB5FF}Bebidas",\
				"Sprunk\t{2CAE2C}$20\n\
				Vaso de cola\t{2CAE2C}$20\n\
				", "Comprar", "Cancelar");
				DynamicSGUI_Start(playerid);
				DynamicSGUI_Add(playerid, 36, 20);
				DynamicSGUI_Add(playerid, 199, 20);
				OpenPlayerDialogShop(playerid);
			}
			
			case AREAIT_TYPE_BUY_ITEMSMINER:
			{
				Dialog_Show(playerid, DialogBuyItemsMiner, DIALOG_STYLE_TABLIST_HEADERS, "{5EB5FF}Mina Hunter Quarry",
				"Producto\tPrecio\n\
				Pico\t{33AA33}$40\n\
				Casco de seguridad\t{33AA33}$80\n\
				", "Comprar", "Cancelar");
			}
			case AREAIT_TYPE_SECUREVEHICLES:
			{
				new Float:PositionChair[2][4] = {
					{ 1090.5759,-1793.0159,1017.1729,201.2729 },
					{ 1086.3650,-1793.0159,1017.1729,191.2692 }
				};

				new extraid = GetInteractiveExtraData(areaid);

				SetPlayerPosEx(playerid, PositionChair[extraid][0], PositionChair[extraid][1], PositionChair[extraid][2], PositionChair[extraid][3], .preload = false);
				ApplyAnimation(playerid,"ped","SEAT_down",4.1,0,0,0,1,0);
				Dialog_CraneVehicle(playerid);
			}
			case AREAIT_TYPE_SELLVEHICLES:
			{
				new Float:PositionChair[2][4] = {
					{ 1080.9541,-1793.0162,1017.1729,185.3629 },
					{ 1077.2068,-1793.0199,1017.1729,208.5499 }
				};

				new extraid = GetInteractiveExtraData(areaid);

				SetPlayerPosEx(playerid, PositionChair[extraid][0], PositionChair[extraid][1], PositionChair[extraid][2], PositionChair[extraid][3], .preload = false);
				ApplyAnimation(playerid,"ped","SEAT_down",4.1,0,0,0,1,0);
				Dialog_SellVehicle(playerid);
			}
			case AREAIT_TYPE_BUY_THIEVESHOUSE:
			{
				new extra /*= GetInteractiveExtraData(areaid)*/;


				for(new i = 0; i < sizeof(WorkActivity_Thief); i++)
				{	
					if(WorkActivity.Thief[i][@AreaIT] == areaid)
					{
						extra = i;
						break;
					}
				}
				if(WorkActivity.Thief[extra][@TimeClosed] > gettime()) return ShowPlayerInfoTextdraw(playerid, "~r~Esta casa acaba de ser robada.", 4000);
				StartForcingLock(playerid, extra);

				//DestroyInteractiveArea(areaid);
			}
			case AREAIT_TYPE_REQUEST_WORKTRUCKER:
			{
				SetPlayerWorkID(playerid,WORK_TYPE_TRUCKER); ClearAnimations(playerid);
			}
			case AREAIT_TYPE_REQUEST_WORKFARMER:
			{
				SetPlayerWorkID(playerid,WORK_TYPE_FARMER); ClearAnimations(playerid);
			}
			case AREAIT_TYPE_REQUEST_WORKMINER:
			{
				SetPlayerWorkID(playerid,WORK_TYPE_MINER); ClearAnimations(playerid);
			}

			case AREAIT_TYPE_MINERALCHOP_MINER:
			{
				new i = GetInteractiveExtraData(areaid);

				if(!rBit1_Get(StateMineralWorkMiner, i))
				{
					if(GetPlayerWorkLevel(playerid, WORK_TYPE_MINER) < MinerWork_Info[i][E_MINERWORK_Info_RequiredLevel]) return 0;
					
					PlayerInfo[playerid][p_WorkTravel] = WORK_TYPE_MINER;
					PlayerInfo[playerid][p_JobTravel] = i;

					TogglePlayerControllableEx(playerid, false);
					ApplyAnimation(playerid, "BASEBALL", "BAT_4", 4.0, 1, 1, 1, 1, 0);

					TimerPlayerChopMineral(playerid);
					KillTimer(PlayerInfoTemp[playerid][pt_TimersE][13]);
					PlayerInfoTemp[playerid][pt_TimersE][13] =  SetTimerEx("TimerPlayerChopMineral", 1000, true, "i", playerid);
					
					rBit1_Set(StateMineralWorkMiner, i, true);
					
					funct_HideTextdrawNotif(playerid, VNOTI_TYPE_ZONEIT);
				}
			}
			case AREAIT_TYPE_MINER_BUYAPARTAMENT:
			{
				ShowPlayerInfoTextdraw(playerid, "~r~No hay apartamentos en este momento.", 4000);
			}
			case AREAIT_TYPE_BUY_CHANGESKIN:
			{

				ShowModelSelectionMenuEx(playerid, ChangeSkinPlayer,"Cambiar ropa");

				await mysql_aquery_s(conexion, str_format("SELECT * FROM `lac_player_skins` WHERE `id_user`=%d;", PlayerInfo[playerid][pID]));

				new rows;
				cache_get_row_count(rows);
				for(new i = 0; i < rows; i++)
				{
					new skin;
					cache_get_value_name_int(i, "skinid", skin);

					mSelection_AddItems(playerid, skin, 0, 157);
				}

				mSelection_Update(playerid);
			}
			case AREAIT_TYPE_MINER_PROCESS:
			{
				new bool:success;
				for(new i; i < sizeof ItemType_Minerals; i++)
				{
					if(GetInvValueItemSelected(playerid) == ItemType_Minerals[i])
					{
						success = true;
						break;
					} 
				}
				if(success)
				{
					/*SetTimerEx("T"*/
					JobMiner_PayPlayerMineral(playerid, GetInvValueItemSelected(playerid));
					RemoveItemInvPlayer(playerid, GetInvItemSelected(playerid));
					SelectNuleItemInventory(playerid);

					ApplyAnimation(playerid, "CARRY", "putdwn", 5.0, 0, 0, 0, 0, 0);

					SelectInvSlotPlayerForItem(playerid, 166);
					
				} else { ShowPlayerInfoTextdraw(playerid, "~r~No tienes nada para procesar.", 4000); }
			}
			case AREAIT_TYPE_MILKPROCESSMACHINE:
			{
				if(!IsPlayerHasJob(playerid, WORK_TYPE_FARMER)) return 1;
				else if(GetInvValueItemSelected(playerid) != 205) return GameTextForPlayerError(playerid, "~r~No tienes un balde de leche.", 4000, 3);
				RemoveItemInvPlayer(playerid, PlayerInfo[playerid][pInvItemSelected]);
				new objectid = CreateDynamicObject(19468, -365.8679, -1060.5309, 59.0329, 0.0, 0.0, 0.0);
				Streamer_Update(playerid);
				new timemoving = MoveDynamicObject(objectid, -365.8679, -1064.0829, 59.0329, 1.4);
				ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, 0, 0, 0, 0, 0);
				SetTimerEx("DestroyMovingMilkMachine", timemoving, false, "ii", playerid, objectid);
			}
			case AREAIT_TYPE_PICKUPITEMMILK:
			{
				if(AddItemInvPlayer(playerid, 59, 0, true) == -1) return 1;
				new objectid = GetInteractiveExtraData(Player.Temp[playerid][@JobAreaMission]);
				DestroyDynamicObject(objectid);
				DestroyInteractiveArea(Player.Temp[playerid][@JobAreaMission]);
				DestroyDynamicObject(PlayerInfo[playerid][p_JobMissionExtraID]);
				ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", 4.0, 0, 0, 0, 0, 0);
				ShowPlayerNotificationBox(playerid, VNOTI_TYPE_FARMER, "Pulsa ~k~~SNEAK_ABOUT~ cerca de tu~n~vehículo para subir el barril.", 10, 25.0);
				PlayerInfo[playerid][p_JobTravelNext] = 8;
			}

			//////////
			case AREAIT_TYPE_PICKUPITEM:
			{
				new itemid;
				//if(item_Interactor[itemid] != INVALID_PLAYER_ID) return 1;

				itemid = GetInteractiveExtraData(areaid);

				if(item_Interactor[itemid] != INVALID_PLAYER_ID) return 0;

				PlayerPickupItem(playerid, itemid);
			}
		}
	}
	else if(GetInteractiveAreaTypeG(areaid) == KEY_AREAIT_TYPE_V_YES)
	{
		switch(GetInteractiveAreaType(areaid))
		{
			case AREAITV_TYPE_LOAD_WORKSHOP: // Vehicles
			{
				ShowPlayerMenuV(playerid, MainMenuWorkshop, "Taller");
				vMenu_AddItems(playerid, "Colores"); 
		    	vMenu_AddItems(playerid, "Reparación"); 
		    	MenuV_Update(playerid);
			}
			case AREAITV_TYPE_LOAD_GAS:
			{
				if(CargandoGasolina[playerid] == 1) return 1;

				new string[220], Float:gas, value = Vehicles_Info[GetPlayerVehicleID(playerid)][gi_vehicle_GAS];
				gas = GetMaxGasolineVehicle(GetPlayerVehicleID(playerid))-value;
				new Float:tempgas = gas;
				
				/*new value_operation = value/5;
				if(value_operation > 9) { value_operation = 10; }*/
				DynamicDgui_Start(playerid);

				//format(string, sizeof(string), "%d\t\t{00E500}$%d\n", floatround(gas), floatround(gas)*4);
				for(new i; i <= 10; i++)
				{
		
					if(gas >= 1)
					{
			

						new gasround = floatround(gas);

						DynamicDgui_AddVar(playerid, gasround);

						if(gas == tempgas) format(string, sizeof(string), "%s%d (lleno)\t\t{00E500}$%d\n", string, gasround, gasround*4);
						else format(string, sizeof(string), "%s%d\t\t{00E500}$%d\n", string, gasround, gasround*4);

						gas=gas/1.5;
					}
				}
				Dialog_Show(playerid, LoadVehicleGas, DIALOG_STYLE_TABLIST, "{5EB5FF}Gasolinera", string, "Seleccionar", "Cancelar");
			}
		}
	}
	return 1;
}

OnPlayerInteractiveFurniture(playerid, itemid)
{
	new Pool:pool;
	GetFurnitureTypeProperty(PlayerInfo[playerid][p_INTERIOR_TYPE], PlayerInfo[playerid][p_INTERIOR_EXTRA_ID], pool);

	new data[E_HOUSE_FURNITURE_DATA];
	if(!pool_valid(pool) || !pool_has(pool, itemid)) return 0;
	pool_get_arr(pool, itemid, data);

	switch(PlayerInfo[playerid][p_INTERIOR_TYPE])
	{
		case PLAYER_INTERIOR_PROPERTY:
		{
			if(CasaInfo[ PlayerInfo[playerid][p_INTERIOR_EXTRA_ID] ][cOwnerID] != PlayerInfo[playerid][pID]) return 0;
		}
	}
	
	switch(Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Type])
	{
		case FURNITURE_IT_TYPE_SHELF:
		{
			Player.Temp[playerid][@InTabInvTrans] = 4;
			Player.Temp[playerid][@InteractType] = TYPE_ITEMINTERACT_SHELF;
			Player.Temp[playerid][@InteractID] = data[E_HOUSE_FURNITURE_DATA_Extra];
			Player.Temp[playerid][@InvTransSize] = Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Capacity];
			ShowPlayerInvChangeBox(playerid, 4, data[E_HOUSE_FURNITURE_DATA_MODEL]);
		}
		case FURNITURE_IT_TYPE_FRIDGE:
		{
			Player.Temp[playerid][@InTabInvTrans] = 3;
			Player.Temp[playerid][@InteractType] = TYPE_ITEMINTERACT_FRIDGE;
			Player.Temp[playerid][@InteractID] = data[E_HOUSE_FURNITURE_DATA_Extra];
			Player.Temp[playerid][@InvTransSize] = Furniture.Info[ data[E_HOUSE_FURNITURE_DATA_MODEL] ][@Capacity];
			ShowPlayerInvChangeBox(playerid, 3, data[E_HOUSE_FURNITURE_DATA_MODEL]);
		}
	}
	return 1;
}