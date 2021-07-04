stock vehicle_getBoot(vehicleid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return boot == 1;
}
stock vehicle_setBoot(vehicleid, boot) {
	new engine, lights, alarm, doors, bonnet, ParamNone, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, ParamNone, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
}
stock veh_getEngine(vehicleid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return engine == 1;
}
stock vehicle_setEngine(vehicleid, engine) {
	new ParamNone, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, ParamNone, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
}
stock vehicle_getBonnet(vehicleid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return bonnet == 1;
}
stock vehicle_setBonnet(vehicleid, bonnet) {
	new engine, lights, alarm, doors, ParamNone, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, ParamNone, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
}
stock vehicle_getLights(vehicleid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return lights == 1;
}
stock vehicle_setLights(vehicleid, lights) {
	new engine, ParamNone, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, ParamNone, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
}
stock vehicle_getDoors(vehicleid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return doors == 1;
}
stock vehicle_setDoors(vehicleid, doors) {
	new engine, lights, alarm, ParamNone, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, ParamNone, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	
	if (veh_isOwnVeh(vehicleid)) {
		
		veh_toggleOption(vehicleid, OPTION_CLOSE_ON_SPAWN, doors);
		
	}
}

SetVehicleToRespawnEx(vehicleid, type = 0)
{
	Vehicles_Info[vehicleid][gi_vehicle_SPAWNED] = type;
	return SetVehicleToRespawn(vehicleid);
}

resetData_Vehicle(vehicleid)
{
	printf("",vehicleid);
	/*Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;*/
}

CreateVehicleServerWork(modelid, Float:x, Float:y, Float:z, Float:a, color1, color2, respawn_delay = -1, work = 0)
{
	new vehicleid = INVALID_VEHICLE_ID;
	vehicleid = CreateVehicle(modelid, x, y, z, a, color1, color2, respawn_delay);

	if(vehicleid == INVALID_VEHICLE_ID) return 0;

	Vehicles_Info[vehicleid][gi_vehicle_VALID] = true;

	Vehicles_Info[vehicleid][gi_vehicle_MODELID] = modelid;
	Vehicles_Info[vehicleid][gi_vehicle_TYPE] = VEHICLE_TYPE_WORK;
	VEHICLES_WORKG[vehicleid][wgi_vehicle_WORK] = work;

	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y] = y;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z] = z;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_ANGLE] = a;
	
	Vehicles_Info[vehicleid][gi_vehicle_POS_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_POS_Y] = y;
	Vehicles_Info[vehicleid][gi_vehicle_POS_Z] = z;
	Vehicles_Info[vehicleid][gi_vehicle_POS_ANGLE] = a;

	Vehicles_Info[vehicleid][gi_vehicle_COLOR1] = color1;
	Vehicles_Info[vehicleid][gi_vehicle_COLOR2] = color2;

	Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = 1000.0;

	Vehicles_Info[vehicleid][gi_vehicle_GAS] = GetMaxGasolineVehicle(vehicleid);

	VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = INVALID_PLAYER_ID;


	SetVehicleToRespawnEx(vehicleid);
	return vehicleid;
}

CreateVehicleServerExtra(modelid, Float:x, Float:y, Float:z, Float:a, color1, color2, respawn_delay = -1, type = VEHICLE_TYPE_NONE)
{
	new vehicleid = INVALID_VEHICLE_ID;
	vehicleid = CreateVehicle(modelid, x, y, z, a, color1, color2, respawn_delay);

	if(vehicleid == INVALID_VEHICLE_ID) return 0;

	Vehicles_Info[vehicleid][gi_vehicle_VALID] = true;

	Vehicles_Info[vehicleid][gi_vehicle_MODELID] = modelid;
	Vehicles_Info[vehicleid][gi_vehicle_TYPE] = type;

	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y] = y;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z] = z;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_ANGLE] = a;

	Vehicles_Info[vehicleid][gi_vehicle_POS_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_POS_Y] = y;
	Vehicles_Info[vehicleid][gi_vehicle_POS_Z] = z;
	Vehicles_Info[vehicleid][gi_vehicle_POS_ANGLE] = a;

	Vehicles_Info[vehicleid][gi_vehicle_COLOR1] = color1;
	Vehicles_Info[vehicleid][gi_vehicle_COLOR2] = color2;

	Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = 1000.0;

	Vehicles_Info[vehicleid][gi_vehicle_GAS] = GetMaxGasolineVehicle(vehicleid);

	VEHICLES_WORKG[vehicleid][wgi_vehicle_OWNER] = INVALID_PLAYER_ID;

	if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_RENT)
	{
		//format(stringinfovehiculo, sizeof(stringinfovehiculo), "{00C0FF}Vehículo en renta");
        Vehicles_Info[vehicleid][gi_vehicle_LABEL][0] = CreateDynamic3DTextLabel("{00C0FF}Vehículo en renta", COLOR_WHITET, 0.0, 0.0, 0.0, 10.0,INVALID_PLAYER_ID,vehicleid, 1, 0,0,-1, 100.0);
        Vehicles_Info[vehicleid][gi_vehicle_TYPE] = VEHICLE_TYPE_RENT;
        VEHICLES_RENTED[vehicleid][vri_vehicle_VALID] = true;
		Vehicles_Info[vehicleid][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
	}

	SetVehicleToRespawnEx(vehicleid);
	return vehicleid;
}


AddVehicleComponents(vehicleid)
{
	for(new i = 0; i != 14; i ++)
	{
		RemoveVehicleComponent(vehicleid, i);
		
		if(!Vehicles_Info[vehicleid][gi_vehicle_COMPONENTS][i]) continue;
		AddVehicleComponent(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_COMPONENTS][i]);
	}
	return 1;
}

DestroyVehicleEx(vehicleid)
{
	if(!Vehicles_Info[vehicleid][gi_vehicle_VALID]) return false;
	if(DestroyVehicle(vehicleid))
	{
		if(IsValidDynamicArea(Vehicles_Info[vehicleid][gi_vehicle_AREAID])) { DestroyDynamicArea(Vehicles_Info[vehicleid][gi_vehicle_AREAID]); }
		new temp_Global_Vehicles[Global_Vehicles_Info]; Vehicles_Info[vehicleid] = temp_Global_Vehicles;
		new temp_Player_Vehicles[E_VEHICLE_PLAYER_INFO]; VEHICLES_PLAYER[vehicleid] = temp_Player_Vehicles;
		new temp_Work_Vehicles[E_VEHICLE_WORK_INFO]; VEHICLES_WORKG[vehicleid] = temp_Work_Vehicles;
	
		new temp_Vehicle_Boot[E_VEHICLE_BOOT];
		for(new i = 0; i < MAX_PLAYER_INVENTORY_ITEMS; i++)
		{
			Vehicle_Boot[vehicleid][i] = temp_Vehicle_Boot;
		}
	}
	return false;
}

SetVehicleHealthEx(vehicleid, Float:health)
{
	new vehicle = SetVehicleHealth(vehicleid, health);
	if(vehicle)
	{
		Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = health;
	}	
	return vehicle;
}

CreateNewVehicleInSpaceWork(vehicleid, work)
{
	switch(work)
	{
		case WORK_TYPE_TRUCKER:
		{
			new rand_color = random(100);
			if(TruckerWorkVehicles[0] == vehicleid) { TruckerWorkVehicles[0] = CreateVehicleServerWork(456, 2201.55, -2219.12, 13.7241, 225.797, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[1] == vehicleid) { TruckerWorkVehicles[1] = CreateVehicleServerWork(414, 2204.92,-2216.17, 13.6969, 225.16, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[2] == vehicleid) { TruckerWorkVehicles[2] = CreateVehicleServerWork(609, 2197.39, -2223.12, 13.7222, 223.457, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[3] == vehicleid) { TruckerWorkVehicles[3] = CreateVehicleServerWork(499, 2208.23, -2212.48, 13.7106, 224.345, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[4] == vehicleid) { TruckerWorkVehicles[4] = CreateVehicleServerWork(578, 2227.7837, -2253.4685, 14.0131, 44.9212, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[5] == vehicleid) { TruckerWorkVehicles[5] = CreateVehicleServerWork(578, 2220.5752, -2260.5271, 14.0131, 44.9212, rand_color, rand_color, -1, 2); }
			else if(TruckerWorkVehicles[6] == vehicleid) { TruckerWorkVehicles[6] = CreateVehicleServerWork(578, 2213.3953, -2268.0076, 14.0131, 44.9212, rand_color, rand_color, -1, 2); }
		}
		case WORK_TYPE_FARMER:
		{
			if(FarmerWorkVehicles[0] == vehicleid) { FarmerWorkVehicles[0] = CreateVehicleServerWork(478, -1434.6340, -1488.8156, 101.6422, 92.8886, 1, 1, -1, WORK_TYPE_FARMER); }
			else if(FarmerWorkVehicles[1] == vehicleid) { FarmerWorkVehicles[1] = CreateVehicleServerWork(478, -1434.4218, -1495.2687, 101.6422, 92.8886, 1, 1, -1, WORK_TYPE_FARMER); }
			else if(FarmerWorkVehicles[2] == vehicleid) { FarmerWorkVehicles[2] = CreateVehicleServerWork(478, -1433.9707, -1502.0704, 101.6422, 92.8886, 1, 1, -1, WORK_TYPE_FARMER); }

		}
	}
}

CreateNewVehicleInSpaceType(vehicleid, type)
{
	switch(type)
	{
		case VEHICLE_TYPE_RENT:
		{
			for(new i = 0; i < sizeof Vehicles_DataRent; i++)
			{
				if(LeasedVehicles[i] == vehicleid) { LeasedVehicles[i] = CreateVehicleServerExtra(VehiclesData.Rent[i][@Model], VehiclesData.Rent[i][@X], VehiclesData.Rent[i][@Y], VehiclesData.Rent[i][@Z], VehiclesData.Rent[i][@A], random(100), random(100), -1, VEHICLE_TYPE_RENT); break; }
			}
			//LeasedVehicles[0] = CreateVehicleServerExtra(401, 1490.73, -1748.79, 13.3263, 0.079129, 8, 8, -1, VEHICLE_TYPE_RENT);
			//LeasedVehicles[1] = CreateVehicleServerExtra(405, 1485.59, -1748.55, 13.4219, 359.467, 8, 8, -1, VEHICLE_TYPE_RENT);
			//LeasedVehicles[2] = CreateVehicleServerExtra(410, 1480.89, -1748.96, 13.1683, 358.71, 8, 8, -1, VEHICLE_TYPE_RENT);
			//LeasedVehicles[3] = CreateVehicleServerExtra(404, 1475.82, -1748.6, 13.2808, 0.0, 8, 8, -1, VEHICLE_TYPE_RENT);

		}
	}
}

UpdateVehicleParams(vehicleid)
{
	return SetVehicleParamsEx(vehicleid, Vehicles_Info[vehicleid][gi_vehicle_ENGINE], Vehicles_Info[vehicleid][gi_vehicle_LIGHTS], Vehicles_Info[vehicleid][gi_vehicle_ALARM], Vehicles_Info[vehicleid][gi_vehicle_DOORS], Vehicles_Info[vehicleid][gi_vehicle_BONNET], Vehicles_Info[vehicleid][gi_vehicle_BOOT], Vehicles_Info[vehicleid][gi_vehicle_OBJECTIVE]);
}

function GetPlayerVehicleCount(playerid)
{
	if(GetPlayerVehicleSlotFree(playerid) == -1) return GameTextForPlayer(playerid, ConvertEncoding("~n~~n~~n~~n~~r~Ya tienes el maximo de vehículos."), 4000, 3);

	ShowDialogEx(playerid, DIALOG_BUY_PLAYER_VEHICLE);
	return 1;
}

GetPlayerVehicleSlotFree(playerid)
{
	for(new i = 0; i < 3; i++)
	{
		if(PlayerInfo[playerid][p_VehicleSlot][i] == 0) return i;
	}
	return -1;
}

AddPlayerPerVehicle(playerid, modelid, Float:x, Float:y, Float:z, Float:a, color1, color2, slot)
{
	new vehicleid = INVALID_VEHICLE_ID;
	vehicleid = CreateVehicle(modelid, x,y,z,a,color1,color2, -1);

	Vehicles_Info[vehicleid][gi_vehicle_VALID] = true;

	Vehicles_Info[vehicleid][gi_vehicle_MODELID] = modelid;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_X] = x;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Y] = y;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_Z] = z;
	Vehicles_Info[vehicleid][gi_vehicle_SPAWN_ANGLE] = a;
	Vehicles_Info[vehicleid][gi_vehicle_COLOR1] = color1;
	Vehicles_Info[vehicleid][gi_vehicle_COLOR2] = color2;

	Vehicles_Info[vehicleid][gi_vehicle_HEALTH] = 1000.0;
	Vehicles_Info[vehicleid][gi_vehicle_GAS] = 40;

	format(Vehicles_Info[vehicleid][gi_vehicle_PLATE_NUMBER], 32, "%s%s%s%s %d%d%d", LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], LetterList[random(sizeof(LetterList))], random(10), random(10), random(10));

	VEHICLES_PLAYER[vehicleid][player_vehicle_VALID] = true;
	VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] = PlayerInfo[playerid][pID];

	Vehicles_Info[vehicleid][gi_vehicle_TYPE] = VEHICLE_TYPE_PLAYER;
			
	AssignAreaForVehicles(vehicleid);

	if(!map_valid(Player.Temp[playerid][@DataVehicles]))
	{
		Player.Temp[playerid][@DataVehicles] = map_new();	
	}
	new data[E_PLAYER_VEHICLES_DATA];
	data[E_PLAYER_VEHICLES_DATA_Model] = modelid;
	data[E_PLAYER_VEHICLES_DATA_Plate] = str_acquire(str_new(Vehicles_Info[vehicleid][gi_vehicle_PLATE_NUMBER]));
	map_add_arr(Player.Temp[playerid][@DataVehicles], slot, data);

	AddPerPlayerVehicleDB(playerid, vehicleid, slot, true);
	return vehicleid;
}

AddPerPlayerVehicleDB(playerid, carid, slot, bool:message = false)
{
	new modelid =  Vehicles_Info[carid][gi_vehicle_MODELID];

	mysql_tquery_s(conexion, str_format("INSERT INTO `lac_uservehicles` (`owner_id`, `modelid`, \
		`pos_x`, `pos_y`, `pos_z`, `pos_angle`, \
		`spawn_x`, `spawn_y`, `spawn_z`, `spawn_a`, \
		`color_1`, `color_2`, `price`, `coins`, `plate`, `slot`) \
		VALUES \
		(%d, %d, \
		%f, %f, %f, %f,\
		%f, %f, %f, %f, \
		%d, %d, %d, %d, '%q', %d);",
		PlayerInfo[playerid][pID], modelid,
		Vehicles_Info[carid][gi_vehicle_POS_X], Vehicles_Info[carid][gi_vehicle_POS_Y], Vehicles_Info[carid][gi_vehicle_POS_Z], Vehicles_Info[carid][gi_vehicle_POS_ANGLE],
		Vehicles_Info[carid][gi_vehicle_SPAWN_X], Vehicles_Info[carid][gi_vehicle_SPAWN_Y], Vehicles_Info[carid][gi_vehicle_SPAWN_Z], Vehicles_Info[carid][gi_vehicle_SPAWN_ANGLE],
		Vehicles_Info[carid][gi_vehicle_COLOR1], Vehicles_Info[carid][gi_vehicle_COLOR2], Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE], Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_Currency], Vehicles_Info[carid][gi_vehicle_PLATE_NUMBER], slot),
	"CargarDatoVehiculoJugador", "iii", playerid, carid, slot);

	if(message == true)
	{
		new string[128];
		format(string, 128, "Compraste un %s por $%d.",VehicleName[Vehicles_Info[carid][gi_vehicle_MODELID] - 400], Vehicles_DataSale[modelid-400][E_VEHICLEDATA_Sale_PRICE]);
		CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_BUYVEHICLE, string, 20);
		AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, string);
	}
	return 1;
}

stock GetNearbyPlayerPos(playerid, &Float:pos_x, &Float:pos_y, &Float:pos_z, &Float:pos_a)
{
	new VW_Conce = PlayerInfo[playerid][pVirtualWorld];
	
	switch(VW_Conce)
	{
		case 163:
		{
			pos_x = 1629.8638; pos_y = -2185.9846; pos_z = 13.3058; pos_a = 179.9961;
		}
		case 167:
		{
			new Float:RandomSpawns[][] = 
			{ 
				{ 563.1564,-1271.2679,17.3280,101.9682 },
				{ 564.2531,-1275.7516,17.3252,98.8957 },
				{ 565.0151,-1280.2416,17.3294,94.7657 }
			};
			new rand = random(sizeof(RandomSpawns));
			pos_x = RandomSpawns[rand][0]; pos_y = RandomSpawns[rand][1]; pos_z = RandomSpawns[rand][2]; pos_a = RandomSpawns[rand][3];
		}
		case 171:
		{
			new Float:RandomSpawns[][] = 
			{ 
				{ 613.9959,-1522.7729,14.6649,87.1529 },
				{ 608.9380,-1522.8820,14.6779,90.0659 }
			};
			new rand = random(sizeof(RandomSpawns));
			pos_x = RandomSpawns[rand][0]; pos_y = RandomSpawns[rand][1]; pos_z = RandomSpawns[rand][2]; pos_a = RandomSpawns[rand][3];
		}
	}
}

SavePlayerVehicleForID(playerid, i, destroy)
{
	if(!VEHICLES_PLAYER[i][player_vehicle_VALID]) return 0;
	if(VEHICLES_PLAYER[i][player_vehicle_OWNER] == PlayerInfo[playerid][pID])
	{
		GetVehiclePos(i, Vehicles_Info[i][gi_vehicle_POS_X], Vehicles_Info[i][gi_vehicle_POS_Y], Vehicles_Info[i][gi_vehicle_POS_Z]), GetVehicleZAngle(i, Vehicles_Info[i][gi_vehicle_POS_ANGLE]);
			//Vehicles_Info[i][gi_vehicle_VW] = GetVehicleVirtualWorld(i);
		GetVehicleDamageStatus(i, Vehicles_Info[i][gi_vehicle_DAMAGE_PANELS], Vehicles_Info[i][gi_vehicle_DAMAGE_DOORS], Vehicles_Info[i][gi_vehicle_DAMAGE_LIGHTS], Vehicles_Info[i][gi_vehicle_DAMAGE_TIRES]);
		GetVehicleHealth(i, Vehicles_Info[i][gi_vehicle_HEALTH]);

		mysql_tquery_s(conexion, str_format("UPDATE `lac_uservehicles` SET \
			`pos_x`=%.4f, `pos_y`=%.4f, `pos_z`=%.4f, `pos_angle`=%.4f, \
			`color_1`=%d, `color_2`=%d, \
			`interior`=%d, `vw`=%d, \
			`lock_state`=%d, `health`=%.1f, `gasoline`=%d, \
			`damage_panels`=%d, `damage_doors`=%d, `damage_lights`=%d, `damage_tires`=%d, \
			`paintjob`=%d, \
			`spawn_x`=%f, `spawn_y`=%f, `spawn_z`=%f, \
			`component0`=%d, `component1`=%d, \
			`component2`=%d, `component3`=%d, \
			`component4`=%d, `component5`=%d, \
			`component6`=%d, `component7`=%d, \
			`component8`=%d, `component9`=%d, \
			`component10`=%d, `component11`=%d, \
			`component12`=%d, `component13`=%d \
			WHERE `Car_ID`=%d;",
			Vehicles_Info[i][gi_vehicle_POS_X], Vehicles_Info[i][gi_vehicle_POS_Y], Vehicles_Info[i][gi_vehicle_POS_Z], Vehicles_Info[i][gi_vehicle_POS_ANGLE], 
			Vehicles_Info[i][gi_vehicle_COLOR1], Vehicles_Info[i][gi_vehicle_COLOR2], 
			Vehicles_Info[i][gi_vehicle_INT], Vehicles_Info[i][gi_vehicle_VW],
			Vehicles_Info[i][gi_vehicle_DOORS], Vehicles_Info[i][gi_vehicle_HEALTH], Vehicles_Info[i][gi_vehicle_GAS],
			Vehicles_Info[i][gi_vehicle_DAMAGE_PANELS], Vehicles_Info[i][gi_vehicle_DAMAGE_DOORS], Vehicles_Info[i][gi_vehicle_DAMAGE_LIGHTS], Vehicles_Info[i][gi_vehicle_DAMAGE_TIRES], 
			Vehicles_Info[i][gi_vehicle_PAINTJOB],
			Vehicles_Info[i][gi_vehicle_SPAWN_X], Vehicles_Info[i][gi_vehicle_SPAWN_X],Vehicles_Info[i][gi_vehicle_SPAWN_X],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][0], Vehicles_Info[i][gi_vehicle_COMPONENTS][1], 
			Vehicles_Info[i][gi_vehicle_COMPONENTS][2], Vehicles_Info[i][gi_vehicle_COMPONENTS][3],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][4], Vehicles_Info[i][gi_vehicle_COMPONENTS][5],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][6], Vehicles_Info[i][gi_vehicle_COMPONENTS][7],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][8], Vehicles_Info[i][gi_vehicle_COMPONENTS][9],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][10], Vehicles_Info[i][gi_vehicle_COMPONENTS][11],
			Vehicles_Info[i][gi_vehicle_COMPONENTS][11], Vehicles_Info[i][gi_vehicle_COMPONENTS][12],  
			
			VEHICLES_PLAYER[i][player_vehicle_ID]));

		new query[200];
		format(query, sizeof query, "DELETE FROM `lac_vehicle_boot` WHERE `id_vehicle` = %d;", VEHICLES_PLAYER[i][player_vehicle_ID]);
		mysql_tquery(conexion, query);

		for(new n = 0; n != MAX_PLAYER_INVENTORY_ITEMS; n++)
		{
			query[0] = EOS;
			if(Vehicle.Boot[i][n][@Item] != 0)
			{
				format(query, sizeof query, "INSERT INTO `lac_vehicle_boot` (`id_vehicle`, `slot`, `item`, `amount`) VALUES (%d, %d, %d, %d);", VEHICLES_PLAYER[i][player_vehicle_ID], n, Vehicle.Boot[i][n][@Item], Vehicle.Boot[i][n][@Amount]);
				mysql_tquery(conexion, query);
			}
		}

	}

	if(destroy == 1)
	{
		if(Vehicles_Info[i][gi_vehicle_VALID] == true && VEHICLES_PLAYER[i][player_vehicle_OWNER] == PlayerInfo[playerid][pID])
		{
			DestroyVehicleEx(i);
			resetVehicleVariables(i);
		}
	}
	return 1;
}

SaveVehiclePlayerForID(i)
{
	if(!VEHICLES_PLAYER[i][player_vehicle_VALID]) return 0;

	GetVehiclePos(i, Vehicles_Info[i][gi_vehicle_POS_X], Vehicles_Info[i][gi_vehicle_POS_Y], Vehicles_Info[i][gi_vehicle_POS_Z]), GetVehicleZAngle(i, Vehicles_Info[i][gi_vehicle_POS_ANGLE]);
	GetVehicleDamageStatus(i, Vehicles_Info[i][gi_vehicle_DAMAGE_PANELS], Vehicles_Info[i][gi_vehicle_DAMAGE_DOORS], Vehicles_Info[i][gi_vehicle_DAMAGE_LIGHTS], Vehicles_Info[i][gi_vehicle_DAMAGE_TIRES]);
	//GetVehicleHealth(i, Vehicles_Info[i][gi_vehicle_HEALTH]);

	mysql_tquery_s(conexion, str_format("UPDATE `lac_uservehicles` SET \
		`pos_x`=%.4f, `pos_y`=%.4f, `pos_z`=%.4f, `pos_angle`=%.4f, \
		`color_1`=%d, `color_2`=%d, \
		`interior`=%d, `vw`=%d, \
		`lock_state`=%d, `health`=%.1f, `gasoline`=%d, \
		`damage_panels`=%d, `damage_doors`=%d, `damage_lights`=%d, `damage_tires`=%d, \
		`paintjob`=%d, \
		`spawn_x`=%f, `spawn_y`=%f, `spawn_z`=%f, \
		`component0`=%d, `component1`=%d, \
		`component2`=%d, `component3`=%d, \
		`component4`=%d, `component5`=%d, \
		`component6`=%d, `component7`=%d, \
		`component8`=%d, `component9`=%d, \
		`component10`=%d, `component11`=%d, \
		`component12`=%d, `component13`=%d \
		WHERE `Car_ID`=%d;",
		Vehicles_Info[i][gi_vehicle_POS_X], Vehicles_Info[i][gi_vehicle_POS_Y], Vehicles_Info[i][gi_vehicle_POS_Z], Vehicles_Info[i][gi_vehicle_POS_ANGLE], 
		Vehicles_Info[i][gi_vehicle_COLOR1], Vehicles_Info[i][gi_vehicle_COLOR2], 
		Vehicles_Info[i][gi_vehicle_INT], Vehicles_Info[i][gi_vehicle_VW],
		Vehicles_Info[i][gi_vehicle_DOORS], Vehicles_Info[i][gi_vehicle_HEALTH], Vehicles_Info[i][gi_vehicle_GAS],
		Vehicles_Info[i][gi_vehicle_DAMAGE_PANELS], Vehicles_Info[i][gi_vehicle_DAMAGE_DOORS], Vehicles_Info[i][gi_vehicle_DAMAGE_LIGHTS], Vehicles_Info[i][gi_vehicle_DAMAGE_TIRES], 
		Vehicles_Info[i][gi_vehicle_PAINTJOB],
		Vehicles_Info[i][gi_vehicle_SPAWN_X], Vehicles_Info[i][gi_vehicle_SPAWN_X],Vehicles_Info[i][gi_vehicle_SPAWN_X],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][0], Vehicles_Info[i][gi_vehicle_COMPONENTS][1], 
		Vehicles_Info[i][gi_vehicle_COMPONENTS][2], Vehicles_Info[i][gi_vehicle_COMPONENTS][3],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][4], Vehicles_Info[i][gi_vehicle_COMPONENTS][5],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][6], Vehicles_Info[i][gi_vehicle_COMPONENTS][7],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][8], Vehicles_Info[i][gi_vehicle_COMPONENTS][9],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][10], Vehicles_Info[i][gi_vehicle_COMPONENTS][11],
		Vehicles_Info[i][gi_vehicle_COMPONENTS][11], Vehicles_Info[i][gi_vehicle_COMPONENTS][12],  

		VEHICLES_PLAYER[i][player_vehicle_ID]));

	mysql_tquery_s(conexion, str_format("DELETE FROM `lac_vehicle_boot` WHERE `id_vehicle` = %d;", VEHICLES_PLAYER[i][player_vehicle_ID]));

	for(new n = 0; n != MAX_PLAYER_INVENTORY_ITEMS; n++)
	{
		if(Vehicle.Boot[i][n][@Item] != 0)
		{
			mysql_tquery_s(conexion, str_format("INSERT INTO `lac_vehicle_boot` (`id_vehicle`, `slot`, `item`, `amount`) VALUES (%d, %d, %d, %d);", VEHICLES_PLAYER[i][player_vehicle_ID], n, Vehicle.Boot[i][n][@Item], Vehicle.Boot[i][n][@Amount]));
		}
	}
	return 1;
}

//

AssignAreaForVehicles(vehicleid)
{
	new Float:radius;

	new Float:X, Float:Y, Float:Z;
	GetVehicleModelInfo(Vehicles_Info[vehicleid][gi_vehicle_MODELID], VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
	radius = (Y/2.0)+0.8;
	Vehicles_Info[vehicleid][gi_vehicle_AREAID] = CreateDynamicSphere(0,0,0,radius);

	AttachDynamicAreaToVehicle(Vehicles_Info[vehicleid][gi_vehicle_AREAID], vehicleid);
	new info[2];
	info[0] = AREA_TYPE_PLAYER_NEAR_VEHICLE;
	info[1] = vehicleid;

	Streamer_SetArrayData(STREAMER_TYPE_AREA, Vehicles_Info[vehicleid][gi_vehicle_AREAID], E_STREAMER_EXTRA_ID, info);
	return 1;
}

stock GetVehicleAreaSize(vehicleid, &Float:size)
{
	switch(Vehicles_Info[vehicleid][gi_vehicle_MODELID])
	{
		case 578: size = 5.4;
	}
	return 1;
}

stock IsPlayerAtVehicleTrunk(playerid, vehicleid)
{
	if(!(0 <= playerid < MAX_PLAYERS))
		return 0;

	//if(!IsValidVehicle(vehicleid))
	//	return 0;

	if(!IsPlayerInDynamicArea(playerid, Vehicles_Info[vehicleid][gi_vehicle_AREAID]))
		return 0;

	new
		Float:vx,
		Float:vy,
		Float:vz,
		Float:px,
		Float:py,
		Float:pz,
		Float:vr,
		Float:angle;

	GetVehiclePos(vehicleid, vx, vy, vz);
	GetPlayerPos(playerid, px, py, pz);

	GetVehicleZAngle(vehicleid, vr);

	angle = absoluteangle_func(vr - GetAngleToPoint(vx, vy, px, py));

	if(155.0 < angle < 205.0)
	{
		return 1;
	}

	return 0;
}

// Others
LockPlayerVehicleDoors(playerid, vehicleid)
{
	if(vehicleid == INVALID_VEHICLE_ID || vehicleid == INVALID_VEHICLE_ID_EX) return 1;
	if(!VEHICLES_PLAYER[vehicleid][player_vehicle_VALID]) return 1;
	if(IsPlayerHasVehicleKeys(playerid, vehicleid))
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_DOORS] == 1)
		{
			ShowPlayerInfoTextdraw(playerid, "~g~~h~Destrabaste ~w~las puertas.", 4000);
			UnLockPlayerVehicle(vehicleid);
		}
		else
		{
			ShowPlayerInfoTextdraw(playerid, "~r~~h~Trabaste ~w~las puertas.", 4000);
			Vehicles_Info[vehicleid][gi_vehicle_DOORS] = 1;
			UpdateVehicleParams(vehicleid);
		}
		PlayerPlaySound(playerid, 1145, 0,0,0);
	}
	return 1;
}

ResetPlayerVehicleData(playerid)
{
	if(map_valid(Player.Temp[playerid][@DataVehicles]))
	{
		new data[E_PLAYER_VEHICLES_DATA];

		for_map(i : Player.Temp[playerid][@DataVehicles])
	    {
	        if (!iter_sizeof(i)) {
	            continue;
	        }
	        iter_get_arr(i, data);

	        str_delete(data[E_PLAYER_VEHICLES_DATA_Plate]);
	    }
	    map_delete(Player.Temp[playerid][@DataVehicles]);
	}
}

RemovePlayerVehicleData(playerid, slot)
{
	if(map_valid(Player.Temp[playerid][@DataVehicles]))
	{
		new data[E_PLAYER_VEHICLES_DATA];

	    map_get_arr(Player.Temp[playerid][@DataVehicles], slot, data);

	   	str_delete(data[E_PLAYER_VEHICLES_DATA_Plate]);
	
	    map_remove(Player.Temp[playerid][@DataVehicles], slot);
	}
	return 1;
}

SpawnInsuredVehiclePlayer(playerid, slot)
{
	Player_VehiclesTime[playerid][slot] = 0;

	new data[E_PLAYER_VEHICLES_DATA];
	map_get_arr(Player.Temp[playerid][@DataVehicles], slot, data);

	if(!VEHICLES_PLAYER[ PlayerInfo[playerid][p_VehicleSlot][slot] ][player_vehicle_VALID] || PlayerInfo[playerid][p_VehicleSlot][slot] == INVALID_VEHICLE_ID)
	{
		mysql_tquery_s(conexion, str_format("UPDATE `lac_uservehicles` SET `health`=1000.0, `pos_x` = %f, `pos_y` = 47.6699, `pos_z` = 1100.1149, `pos_angle`=0.0, `interior` = 1, `vw`=174, `respawntime` = 0 WHERE `Car_ID`=%d;", -206.6460 + (4.0 * randomEx(1, 20)), Player_VehiclesDBID[playerid][slot]));
	
		mysql_tquery_s(conexion, str_format("SELECT * FROM lac_uservehicles WHERE `Car_ID` = %d;", Player_VehiclesDBID[playerid][slot]), "LoadPlayerVehicles", "i", playerid);
	}
	else
	{
		new vehicleid = PlayerInfo[playerid][p_VehicleSlot][slot];
		SetVehiclePosEx(vehicleid, -206.6460 + (4.0 * randomEx(1, 20)), 47.6699, 1100.1149);
		SetVehicleZAngle(vehicleid, 0.0);
		LinkVehicleToInteriorEx(vehicleid, 1);
		SetVehicleVWEx(vehicleid, 174);
		SetVehicleHealthEx(vehicleid, 1000.0);
		
		mysql_tquery_s(conexion, str_format("UPDATE `lac_uservehicles` SET `health`=1000.0, `pos_x` = %f, `pos_y` = %f, `pos_z` = %f, `pos_angle`=0.0, `interior` = 1, `vw`=174, `respawntime` = 0 WHERE `Car_ID`=%d;", Vehicles_Info[vehicleid][gi_vehicle_POS_X], Vehicles_Info[vehicleid][gi_vehicle_POS_Y], Vehicles_Info[vehicleid][gi_vehicle_POS_Z], Player_VehiclesDBID[playerid][slot]));
	}
	new message[128];
	format(message, sizeof(message), "Tu %s llego al estacionamiento de Seguros Los Santos.", GetVehicleName(data[E_PLAYER_VEHICLES_DATA_Model]));
	CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_CRANEVEHICLEINFO2, message, 14);
	AddPlayerMessageNotification(playerid, PlayerInfo[playerid][pID], 0, message);
	return 1;
}

IsPlayerHasVehicleKeys(playerid, vehicleid)
{
	new bool:valid;
	for(new i = 0; i < 4; i++)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_KEYS][i] == PlayerInfo[playerid][pID])
		{
			valid = true;
			break;
		}
	}
	if(VEHICLES_PLAYER[vehicleid][player_vehicle_OWNER] == PlayerInfo[playerid][pID] || valid)
	{
		return 1;	
	}
	return 0;
}

CountVehicleSharedKeys(vehicleid)
{
	new count;
	for(new i = 0; i < 4; i++)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_KEYS][i] != 0)
		{
			count++;
		}
	}
	return count;
}

GetVehicleSharedKeysFree(vehicleid, newid)
{
	new value = -1;
	for(new i = 0; i < 4; i++)
	{
		if(Vehicles_Info[vehicleid][gi_vehicle_KEYS][i] == newid)
		{
			value = -1;
			break;
		}
		else if(Vehicles_Info[vehicleid][gi_vehicle_KEYS][i] == 0)
		{
			value = i;
			break;
		}
	}
	return value;
}

VehicleWorkSecure(vehicleid)
{
	new Float:ry, Float:z_angle;
   	GetVehicleRotationY(vehicleid, ry);
   	GetVehicleZAngle(vehicleid, z_angle);
	if(ry > 140.0 || ry < -140.0)
	{
		if(z_angle  < 90.0)
		{
			SetVehicleAngularVelocity(vehicleid, VEHICLE_FORCE_ROTATION, -VEHICLE_FORCE_ROTATION, 0.0);
		}	
		else if(z_angle < 180.0)
		{
			SetVehicleAngularVelocity(vehicleid, -VEHICLE_FORCE_ROTATION, -VEHICLE_FORCE_ROTATION, 0.0);
		}
		else if(z_angle < 270.0)
		{
			SetVehicleAngularVelocity(vehicleid, 0.0, VEHICLE_FORCE_ROTATION, 0.0);
		}
		else if(z_angle < 360.0)
		{
			SetVehicleAngularVelocity(vehicleid, -VEHICLE_FORCE_ROTATION, -VEHICLE_FORCE_ROTATION, 0.0);
		}
	}
}

// Taller

stock HavePaintjobVehicleModel(modelid)
{
	switch(modelid)
	{
	    case 558..565: return 1; // Wheel arch angels
	    case 412, 534, 535, 536, 566, 567, 576: return 2; //Loco Low Co
	}
	return 0;
}