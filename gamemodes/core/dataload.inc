/*

* Copyright (c) 2018, Blaster Bluestudios.

*/

LoadDataProperties()
{
    new Cache:Consult, count;
    Consult = mysql_query(conexion, "SELECT * FROM `lac_houses` WHERE `id_casa`;");
    cache_set_active(Consult);

    cache_get_row_count(count);
    for(new i = 0; i < count; i++)
    {
        cache_set_active(Consult);
        if(count_houses >= MAX_CASAS)
        {
            break;
        }
        cache_get_value_name_int(i, "id_casa", CasaInfo[count_houses][id_property]);
        cache_get_value_name_int(i, "price", CasaInfo[count_houses][cPrecio]);
        cache_get_value_name_int(i, "level", CasaInfo[count_houses][cNivel]);
        cache_get_value_name_float(i, "pos_x", CasaInfo[count_houses][cExteriorX]);
        cache_get_value_name_float(i, "pos_y", CasaInfo[count_houses][cExteriorY]);
        cache_get_value_name_float(i, "pos_z", CasaInfo[count_houses][cExteriorZ]);
        cache_get_value_name_float(i, "pos_a", CasaInfo[count_houses][cAnguloExt]);
        cache_get_value_name_int(i, "vw", CasaInfo[count_houses][cVirtualWorld]);
        cache_get_value_name_int(i, "interior", CasaInfo[count_houses][cInterior]);
        cache_get_value_name_int(i, "house_lock", CasaInfo[count_houses][cLock]);
        cache_get_value_name_int(i, "interior_id", CasaInfo[count_houses][cInteriorID]);
        cache_get_value_name_int(i, "coins", CasaInfo[count_houses][cHouseType]);
        cache_get_value_name_int(i, "property_type", CasaInfo[count_houses][cPropertyType]);

        new Cache:Consult_Owner, query[180], count_owner;
        format(query, sizeof(query), "SELECT u.`name` ,h.`id_user` FROM `lac_users` u, `lac_property_owner` h WHERE h.`id_property`=%d AND u.`id`=h.`id_user`;", CasaInfo[count_houses][id_property]);
        Consult_Owner = mysql_query(conexion, query);
        cache_set_active(Consult_Owner);
        cache_get_row_count(count_owner);
        if(count_owner)
        {
            CasaInfo[count_houses][cSale] = 1;
            cache_get_value_name(0, "name", CasaInfo[count_houses][cDueno], 24);
            cache_get_value_name_int(0, "id_user", CasaInfo[count_houses][cOwnerID]);
        }
        cache_delete(Consult_Owner);

       
        new Cache:result = mysql_query_s(conexion, str_format("SELECT * FROM `lac_house_interior` WHERE `houseid`=%d;", CasaInfo[count_houses][id_property]));
        

        new rows;
        cache_get_row_count(rows);

        if(!map_valid(CasaInfo[i][hCustomInterior]))
        {
            CasaInfo[i][hCustomInterior] = map_new();
        }
        new data[E_HOUSE_CUSTOMIZE_DATA];

        for(new id = 0; id < rows; id++)
        {
            new slot, material, dbid;
            
            cache_get_value_name_int(id, "interior_id", dbid);
            cache_get_value_name_int(id, "slot", slot);
            cache_get_value_name_int(id, "material", material);

            data[E_HOUSE_CUSTOMIZE_DATA_DBID] = dbid;
            data[E_HOUSE_CUSTOMIZE_DATA_MATERIAL] = material;    

            map_add_arr(CasaInfo[i][hCustomInterior], slot, data);
        }
        map_add_arr(CasaInfo[i][hCustomInterior], 20, data);

        cache_delete(result);

        //SetInsideHouse(count_houses, CasaInfo[count_houses][cInteriorID]);
        LoadLabelHouse(count_houses);

        Iter_Add(HouseIterator, i);
        count_houses++;
    }
    cache_unset_active();
    cache_delete(Consult);

    printf("Se cargaron %d propiedades.", count_houses);
    return 1;
}

LoadDoors(/*idx*/)
{
    new dStr[150];
    new rows, idx;
    new Cache:Consult;
    Consult = mysql_query(conexion, "SELECT * FROM `lac_doors` WHERE `id`;");
    cache_set_active(Consult);
    cache_get_row_count(rows);

    for(new i = 0; i < rows; i++)
    {
        cache_set_active(Consult);
        if(count_server_doors >= MAX_DOORS)
        {
            break;
        }

        cache_get_value_name_int(i, "id", DoorInfo[idx][dID]);
        cache_get_value_name(i, "DoorName", DoorInfo[idx][dName], 32);
        cache_get_value_name(i, "description", DoorInfo[idx][dDescription], 128);
        cache_get_value_name_float(i, "EnterX",DoorInfo[idx][dEnterX]); 
        cache_get_value_name_float(i, "EnterY", DoorInfo[idx][dEnterY]);
        cache_get_value_name_float(i, "EnterZ", DoorInfo[idx][dEnterZ]);
        cache_get_value_name_float(i, "ExitX", DoorInfo[idx][dExitX]);
        cache_get_value_name_float(i, "ExitY",DoorInfo[idx][dExitY]);
        cache_get_value_name_float(i, "ExitZ",  DoorInfo[idx][dExitZ]);
        cache_get_value_name_float(i, "door_range",  DoorInfo[idx][dRange]);

        cache_get_value_name_int(i, "DoorInterior",DoorInfo[idx][dInt]);
        cache_get_value_name_int(i, "EnterInt", DoorInfo[idx][dEnterInt]);
        cache_get_value_name_int(i, "EnterVW", DoorInfo[idx][dEnterVW]);
        cache_get_value_name_int(i, "ExitInt", DoorInfo[idx][dExitInt]); 
        cache_get_value_name_int(i, "ExitVW", DoorInfo[idx][dExitVW]);
        cache_get_value_name_int(i, "DoorType", DoorInfo[idx][dType]);
        cache_get_value_name_float(i, "DoorAngleInt", DoorInfo[idx][dAnguloInt]);
        cache_get_value_name_float(i, "DoorAngleExt", DoorInfo[idx][dAnguloExt]);
        cache_get_value_name_int(i, "MapIconID", DoorInfo[idx][dMapIconID]);
        cache_get_value_name_int(i, "Cargos", DoorInfo[idx][dCargos]);
        cache_get_value_name_int(i, "DoorEnabled", DoorInfo[idx][DoorEnabled]);
        cache_get_value_name_int(i, "TypeDoor", DoorInfo[idx][dTypeDoor]);
        cache_get_value_name_int(i, "iddoor", DoorInfo[idx][diddoor]);
        cache_get_value_name_int(i, "Type_Interior", DoorInfo[idx][dType_Interior]);
        cache_get_value_name_int(i, "faction_owner", DoorInfo[idx][dFactionOwner]);

        CreateActorInterior(DoorInfo[idx][dType_Interior], DoorInfo[idx][dEnterVW], DoorInfo[idx][dEnterInt]);
       
        switch(DoorInfo[idx][dType])
        {
            case 1:
            {
                format(dStr, sizeof(dStr), "{75D2FF}%s{FFFFFF}\nPropietario: {32BD3E}Inversionistas S.A{FFFFFF}", DoorInfo[idx][dName]);
                DoorInfo[idx][dLabel_Enter] = CreateDynamic3DTextLabel(dStr, COLOR_DOORT, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]+0.8, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
                DoorInfo[idx][dPickup][0] = CreateDynamicPickup(19902, 1, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]-0.8);
                DoorInfo[idx][dArea][0] = CreateDynamicSphere(DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ], 0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt]);
            }
            case 2:
            {
                if(DoorInfo[idx][dTypeDoor] == 1)
                {
                    format(dStr, sizeof(dStr), "{75D2FF}%s{FFFFFF}\nTipo: {007FC0}Franquicia %d{FFFFFF}",DoorInfo[idx][dName], DoorInfo[idx][diddoor]);
                    DoorInfo[idx][dLabel_Enter] = CreateDynamic3DTextLabel(dStr, COLOR_DOORT, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]+0.8, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
                    DoorInfo[idx][dPickup][0] = CreateDynamicPickup(19902, 23, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]-0.8, 0, 0, -1);
                    DoorInfo[idx][dArea][0] = CreateDynamicSphere(DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ], 0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt]); 
                }
                else
                {
                    format(dStr, sizeof(dStr), "{75D2FF}%s{FFFFFF}\nNo hay informacion disponible.",DoorInfo[idx][dName] /*idx,*/);
                    DoorInfo[idx][dLabel_Enter] = CreateDynamic3DTextLabel(dStr, COLOR_DOORT, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]+0.8, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, DoorInfo[idx][dExitVW], -1, -1, 100.0);
                    DoorInfo[idx][dPickup][0] = CreateDynamicPickup(19902, 1, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]-0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt], -1);
                    DoorInfo[idx][dArea][0] = CreateDynamicSphere(DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ], 0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt]); 
                }
            }
            case 3:
            {
                /*new Cache:Consult_faction;
                Consult_faction = mysql_query_s(conexion, str_format("SELECT `GameSlot`, `Name` FROM `lac_facciones` WHERE `id`=%d;", DoorInfo[idx][dFactionOwner]));
                
                cache_set_active(Consult_faction);
                cache_get_row_count(rows);

                if(rows)
                {
                    new faction_index, FactionName[30];

                    cache_set_active(Consult_faction);

                    cache_get_value_name_int(i, "GameSlot", faction_index);
                    cache_get_value_name(i, "Name", FactionName, 30);      */

                format(dStr, sizeof(dStr), "{75D2FF}%s{FFFFFF}\nConquistado por %s.",DoorInfo[idx][dName]);
                DoorInfo[idx][dLabel_Enter] = CreateDynamic3DTextLabel(dStr, COLOR_DOORT, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]+0.8, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
                DoorInfo[idx][dPickup][0] = CreateDynamicPickup(19902, 1, DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ]-0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt], -1, 50.0);          
                DoorInfo[idx][dArea][0] = CreateDynamicSphere(DoorInfo[idx][dExitX], DoorInfo[idx][dExitY], DoorInfo[idx][dExitZ], 0.8, DoorInfo[idx][dExitVW], DoorInfo[idx][dExitInt]);
               /* }  
            
                cache_unset_active();
                cache_delete(Consult_faction);*/
            }
        }
        if(DoorInfo[idx][dMapIconID] > 0)
        {
            CreateDynamicMapIcon(DoorInfo[idx][dExitX],DoorInfo[idx][dExitY],DoorInfo[idx][dExitZ], DoorInfo[idx][dMapIconID], 0, 0, 0, -1, 400.0);
        }

        Streamer_SetIntData(STREAMER_TYPE_PICKUP, DoorInfo[idx][dPickup][0], E_STREAMER_EXTRA_ID, idx);

        new data[2];
        data[0] = AREA_TYPE_ZONE_DOOR;
        data[1] = idx;
        Streamer_SetArrayData(STREAMER_TYPE_AREA, DoorInfo[idx][dArea][0], E_STREAMER_EXTRA_ID, data);
        
        DoorInfo[idx][dPickup][1] = CreateDynamicPickup(19902, 1, DoorInfo[idx][dEnterX], DoorInfo[idx][dEnterY], DoorInfo[idx][dEnterZ]-0.8, DoorInfo[idx][dEnterVW], DoorInfo[idx][dEnterInt]);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, DoorInfo[idx][dPickup][1], E_STREAMER_EXTRA_ID, idx);

        DoorInfo[idx][dArea][1] = CreateDynamicSphere(DoorInfo[idx][dEnterX], DoorInfo[idx][dEnterY], DoorInfo[idx][dEnterZ], 0.8, DoorInfo[idx][dEnterVW], DoorInfo[idx][dEnterInt]); 
        data[0] = AREA_TYPE_ZONE_DOOR;
        data[1] = idx;
        Streamer_SetArrayData(STREAMER_TYPE_AREA, DoorInfo[idx][dArea][1], E_STREAMER_EXTRA_ID, data);


        count_server_doors++;
        idx = count_server_doors;

    }  
    cache_unset_active();
    cache_delete(Consult);
    printf("Se cargaron %d puertas.", count_server_doors);
    return 1;
}

LoadActorsRobbery()
{
    new rows;
    
    new Cache:Consult;
    Consult = mysql_query(conexion, "SELECT * FROM `lac_actors_robbery` WHERE `id_actor`;");
    cache_set_active(Consult);
    cache_get_row_count(rows);

    for(new i = 0; i < rows; i++)
    {
        cache_set_active(Consult);
        if(i >= MAX_ROBBERY_ACTORS)
        {
            break;
        }

        new DBID, Float:x, Float:y, Float:z, Float:angle, DoorID, Anim, Money, skinid, Name[24];

        cache_get_value_name_int(i, "id_actor", DBID);
        cache_get_value_name(i, "name", Name, 24);
        cache_get_value_name_int(i, "skin", skinid);
        cache_get_value_name_float(i, "x", x); 
        cache_get_value_name_float(i, "y", y);
        cache_get_value_name_float(i, "z", z);
        cache_get_value_name_float(i, "a", angle);
        cache_get_value_name_int(i, "doorid", DoorID);
        cache_get_value_name_int(i, "anim",  Anim);
        cache_get_value_name_int(i, "money", Money);

        CreateActorRobberyDoor(DBID, DoorID, skinid, x,y,z,angle,DoorInfo[DoorID][dEnterVW], Money, Anim, Name);
    }  
    cache_unset_active();
    cache_delete(Consult);
    //printf("Se cargaron %d puertas.", count_server_doors);
    return 1;
}

LoadDataParkings()
{
    new Cache:Consult;
    new rows, id;
    Consult = mysql_query(conexion, "SELECT * FROM `lac_parkings` WHERE `id_parking`;");
    cache_set_active(Consult);
    cache_get_row_count(rows);
    for(new i = 0; i < rows; i++)
    {
        cache_set_active(Consult);
        if(count_server_parkings >= MAX_PARKING)
        {
            break;
        }
        
        cache_get_value_name_int(i, "id_parking", ParkingInfo[id][pgID]);
        cache_get_value_name_int(i, "Precio", ParkingInfo[id][pgPrecio]);
        cache_get_value_name_int(i, "Nivel", ParkingInfo[id][pgNivel]);
        cache_get_value_name_float(i, "ExteriorX", ParkingInfo[id][pgExteriorX]);
        cache_get_value_name_float(i, "ExteriorY", ParkingInfo[id][pgExteriorY]);
        cache_get_value_name_float(i, "ExteriorZ", ParkingInfo[id][pgExteriorZ]);
        cache_get_value_name_float(i, "ExteriorA", ParkingInfo[id][pgExteriorA]);
        cache_get_value_name_int(i, "Vendida", ParkingInfo[id][pgVendida]);
        cache_get_value_name_int(i, "OwnerID", ParkingInfo[id][pgOwnerID]);
        cache_get_value_name_int(i, "InteriorExt", ParkingInfo[id][pgInterior]);
        cache_get_value_name_int(i, "VirtualWorldExt", ParkingInfo[id][pgVirtualWorld]);
        cache_get_value_name_int(i, "InteriorID", ParkingInfo[id][pgInteriorID]);
        cache_get_value_name_int(i, "Moneda", ParkingInfo[id][pgMoneda]);
        cache_get_value_name_int(i, "ParkingType", ParkingInfo[id][pgParkingType]);
        cache_get_value_name_int(i, "InteriorInt", ParkingInfo[id][pgInteriorInt]);
        cache_get_value_name_int(i, "VWInt", ParkingInfo[id][pgVWInt]);
        cache_get_value_name_float(i, "IntX", ParkingInfo[id][pgInteriorX]); 
        cache_get_value_name_float(i, "IntY", ParkingInfo[id][pgInteriorY]); 
        cache_get_value_name_float(i, "IntZ", ParkingInfo[id][pgInteriorZ]);
        cache_get_value_name_float(i, "IntA", ParkingInfo[id][pgInteriorA]);

        new string[110];
        if(ParkingInfo[id][pgMoneda] == 1)
        {
           // format(string, sizeof(string), "{00C0FF}Restaurante\n{FFFFFF}Costo de la propiedad: {32BD3E}%d LAC\n{FFFFFF}Nivel Necesario: {00C0FF}%d\n{FFFFFF}Para Comprarla Usa: {00C0FF}/comprar propiedad\n\n{FFFFFF}Presiona {00C0FF}'~k~~VEHICLE_ENTER_EXIT~' {FFFFFF}para ingresar al lugar", ParkingInfo[id][pgPrecio], ParkingInfo[id][pgNivel]);
        }
        else
        {
            format(string, sizeof(string), "Estacionamiento publico", ParkingInfo[id][pgOwner], FormatNumber(ParkingInfo[id][pgPrecio], "."), ParkingInfo[id][pgNivel]);
        }
        new Float:nx, Float:ny;
        ParkingInfo[id][pgTitulo3D] = CreateDynamic3DTextLabel(string, COLOR_WHITET, ParkingInfo[id][pgExteriorX], ParkingInfo[id][pgExteriorY], ParkingInfo[id][pgExteriorZ]+1.2, 15.0);
        ParkingInfo[id][pgPickUp][0] = CreateDynamicPickup(19902, 1, ParkingInfo[id][pgExteriorX], ParkingInfo[id][pgExteriorY], ParkingInfo[id][pgExteriorZ]-0.8);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, ParkingInfo[id][pgPickUp][0], E_STREAMER_EXTRA_ID, i);

        new data[2];

        nx = ParkingInfo[id][pgExteriorX]; ny = ParkingInfo[id][pgExteriorY];
        GetPointInFrontOfPos(nx, ny, ParkingInfo[id][pgExteriorA], 4.0);         
        ParkingInfo[id][pgAreaid][0] = CreateDynamicSphere(nx,ny, ParkingInfo[id][pgExteriorZ], 4.0, ParkingInfo[id][pgVirtualWorld]);
        data[0] = AREA_TYPE_ZONE_PARK;
        data[1] = id;
        Streamer_SetArrayData(STREAMER_TYPE_AREA, ParkingInfo[id][pgAreaid][0], E_STREAMER_EXTRA_ID, data);

        nx = ParkingInfo[id][pgInteriorX]; ny = ParkingInfo[id][pgInteriorY];
        GetPointInFrontOfPos(nx, ny, ParkingInfo[id][pgInteriorA], 4.0);         
        ParkingInfo[id][pgAreaid][1] = CreateDynamicSphere(nx,ny,ParkingInfo[id][pgInteriorZ], 4.0, ParkingInfo[id][pgVWInt]);
        data[0] = AREA_TYPE_ZONE_PARK;
        data[1] = id;
        Streamer_SetArrayData(STREAMER_TYPE_AREA, ParkingInfo[id][pgAreaid][1], E_STREAMER_EXTRA_ID, data);
       
        ParkingInfo[id][pgPickUp][1] = CreateDynamicPickup(19902, 1, ParkingInfo[id][pgInteriorX],ParkingInfo[id][pgInteriorY],ParkingInfo[id][pgInteriorZ]-0.8, ParkingInfo[id][pgVWInt]);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, ParkingInfo[id][pgPickUp][1], E_STREAMER_EXTRA_ID, i);

        count_server_parkings++;
        id = count_server_parkings;
    }
    cache_delete(Consult);
    printf("Se cargaron %d estacionamientos.", count_server_parkings);
    return 1;
}

LoadVehiclesGlobalDB()
{
    new id;
    new Cache:Consult = mysql_query(conexion, "SELECT * FROM `lac_vehicles` WHERE `typeload`=0");
    cache_set_active(Consult);
    
    new rows;
    if(cache_get_row_count(rows))
    {
        for(new i = 0; i < rows; i++)
        {
            new sale;
            cache_set_active(Consult);
            id = getNextVehicleID();
            Vehicles_Info[id][gi_vehicle_VALID] = true;

            cache_get_value_name_int(i, "modelo", Vehicles_Info[id][gi_vehicle_MODELID]);
            cache_get_value_name_float(i, "x", Vehicles_Info[id][gi_vehicle_SPAWN_X]);
            cache_get_value_name_float(i, "y", Vehicles_Info[id][gi_vehicle_SPAWN_Y]);
            cache_get_value_name_float(i, "z", Vehicles_Info[id][gi_vehicle_SPAWN_Z]);
            cache_get_value_name_float(i, "a", Vehicles_Info[id][gi_vehicle_SPAWN_ANGLE]);
            cache_get_value_name_int(i, "color1", Vehicles_Info[id][gi_vehicle_COLOR1]);
            cache_get_value_name_int(i, "color2", Vehicles_Info[id][gi_vehicle_COLOR2]);
            cache_get_value_name_int(i, "sale", sale);
           // printf("Sale: %d", sale);
            cache_get_value_name_int(i, "moneda", VEHICLES_SALE[id][e_sale_vehicle_TYPE]);
            cache_get_value_name_int(i, "precio", VEHICLES_SALE[id][e_sale_vehicle_PRICE]);
            /*cache_get_value_name(j, "IDVeh", content); Vehicles_Info[i][vsIDVeh] = strval(content);
            cache_get_value_name(j, "comprable", content); VSInfo[i][vsComprable] = strval(content);
            cache_get_value_name(j, "moneda", content); VSInfo[i][vsMoneda] = strval(content);
            cache_get_value_name(j, "respawndelay", content); VSInfo[i][vsRespawndelay] = strval(content);
            cache_get_value_name(j, "WhereV", content); VSInfo[i][vsWhereV] = strval(content);
            cache_get_value_name(j, "Job", content); VSInfo[i][vsJob] = strval(content);
            cache_get_value_name_int(j, "membership", VSInfo[i][vsMembership]);*/
            resetData_Vehicle(id);
            AddStaticVehicleEx(Vehicles_Info[id][gi_vehicle_MODELID], Vehicles_Info[id][gi_vehicle_SPAWN_X], Vehicles_Info[id][gi_vehicle_SPAWN_Y], Vehicles_Info[id][gi_vehicle_SPAWN_Z], Vehicles_Info[id][gi_vehicle_SPAWN_ANGLE], Vehicles_Info[id][gi_vehicle_COLOR1], Vehicles_Info[id][gi_vehicle_COLOR2], 900);
            new stringinfovehiculo[140];
            if(sale == 1)
            {
                new modelid = Vehicles_Info[id][gi_vehicle_MODELID];
                VEHICLES_SALE[id][e_sale_vehicle_VALID] = true;
                Vehicles_Info[id][gi_vehicle_TYPE] = VEHICLE_TYPE_SALE;
                format(stringinfovehiculo, sizeof(stringinfovehiculo), "{5EB5FF}%s\n{FFFFFF}Velocidad m�xima: {5EB5FF}%d km/h\n{FFFFFF}Precio: {8DCEA0}$%s", Vehicles_Data_Info[modelid-400][vehicle_data_NAME], Vehicles_Data_Info[modelid-400][vehicle_data_MAX_VEL], FormatNumber(VehiclesData.Sale[modelid-400][@PRICE]));
                CreateDynamic3DTextLabel(stringinfovehiculo,COLOR_WHITET,0.0,0.0,0.0,4.0,INVALID_PLAYER_ID,id, 0, 0,0,-1, 100.0);
            }
            else if(sale == 2)
            {
                format(stringinfovehiculo, sizeof(stringinfovehiculo), "{5EB5FF}Veh�culo en renta");
                Vehicles_Info[id][gi_vehicle_LABEL][0] = CreateDynamic3DTextLabel(stringinfovehiculo, COLOR_WHITET, 0.0, 0.0, 0.0, 10.0,INVALID_PLAYER_ID,id, 1, 0,0,-1, 100.0);
                Vehicles_Info[id][gi_vehicle_TYPE] = VEHICLE_TYPE_RENT;
                Vehicles_Info[id][gi_vehicle_OWNER] = INVALID_PLAYER_ID;
                VEHICLES_RENTED[id][vri_vehicle_VALID] = true;

            }
            Vehicles_Info[id][gi_vehicle_GAS] = GetMaxGasolineVehicle(i);
            
        }
    }
    cache_unset_active();
    cache_delete(Consult);
    printf("Se cargaron un total de %d veh�culos.", rows);
}

LoadGlobalGrafitis()
{
    new Cache:Consult, count;
    //Consult = mysql_query(conexion, "SELECT f.`Name`, f.`GameSlot`, `lac_faction_grafitis`.* FROM `lac_faction_grafitis`, `lac_facciones` f WHERE `lac_faction_grafitis`.`id_grafiti` AND f.`id`=`lac_faction_grafitis`.`id_faction`;");
    Consult = mysql_query(conexion, "SELECT COALESCE(f.`Name`, '') Name, COALESCE(f.`Color`, 0) Color, g.* FROM `lac_faction_grafitis` g left join `lac_facciones` f ON f.`id`=g.`id_faction` WHERE g.`id_grafiti`;");
    cache_set_active(Consult);

    cache_get_row_count(count);
    for(new i = 0; i < count; i++)
    {
        cache_set_active(Consult);
        if(count >= MAX_FACTION_GRAFITIS)
        {
            break;
        }
        new name[24], color;

        cache_get_value_name(i, "Name", name, 24);
        cache_get_value_name_int(i, "Color", color);

        cache_get_value_name_int(i, "id_grafiti", Grafiti.Info[count_server_grafitis][@ID]);
        cache_get_value_name_int(i, "id_faction", Grafiti.Info[count_server_grafitis][@Owner]);
        cache_get_value_name_int(i, "time", Grafiti.Info[count_server_grafitis][@Time]);
        cache_get_value_name_float(i, "X", Grafiti.Info[count_server_grafitis][@X]);
        cache_get_value_name_float(i, "Y", Grafiti.Info[count_server_grafitis][@Y]);
        cache_get_value_name_float(i, "Z", Grafiti.Info[count_server_grafitis][@Z]);
        cache_get_value_name_float(i, "RZ", Grafiti.Info[count_server_grafitis][@RZ]);
        cache_get_value_name_float(i, "posx", Grafiti.Info[count_server_grafitis][@PosX]);
        cache_get_value_name_float(i, "posy", Grafiti.Info[count_server_grafitis][@PosY]);
        cache_get_value_name_float(i, "posz", Grafiti.Info[count_server_grafitis][@PosZ]);
       
        Grafiti.Info[count_server_grafitis][@ObjectID] = CreateDynamicObject(19482, Grafiti.Info[count_server_grafitis][@X],Grafiti.Info[count_server_grafitis][@Y], Grafiti.Info[count_server_grafitis][@Z], 0.0, 0.0, Grafiti.Info[count_server_grafitis][@RZ] ); //Creating the object
        SetDynamicObjectMaterialText(Grafiti.Info[count_server_grafitis][@ObjectID], 0, name, 110, "Comic Sans MS", 59, 0, RGBAToARGB(DataE.CrewColor[ color ][@Color]), 0, 1);

        count_server_grafitis++;
    }
    cache_unset_active();
    cache_delete(Consult);

    printf("Se cargaron %d grafitis.", count_server_grafitis);
}

// Server

LoadGlobalServerItemsWorld()
{
    new Cache:Consult, count;
    Consult = mysql_query(conexion, "SELECT * FROM `lac_servergral_witems` WHERE 1;");
    cache_set_active(Consult);

    cache_get_row_count(count);
    for(new i = 0; i < count; i++)
    {
        cache_set_active(Consult);
        if(count >= MAX_ITEMS_WORLD)
        {
            break;
        }
        new index;

        cache_get_value_name_int(i, "id_index", index);
        cache_get_value_name_int(i, "itemid", ItemsWorld.Info[index][@ItemID]);
        cache_get_value_name_int(i, "item_amount", ItemsWorld.Info[index][@ItemAmount]);
        cache_get_value_name_float(i, "x", ItemsWorld.Info[index][@X]);
        cache_get_value_name_float(i, "y", ItemsWorld.Info[index][@Y]);
        cache_get_value_name_float(i, "z", ItemsWorld.Info[index][@Z]);
        cache_get_value_name_float(i, "angle", ItemsWorld.Info[index][@A]);
        cache_get_value_name_int(i, "time", ItemsWorld.Info[index][@Time]);

        CreateItemInvWorldEx(index, ItemsWorld.Info[index][@ItemID], 0.0, 0.0, 0, 0, 1);
        //RemoveItemTypeForDB(itemid, amount);

    }
    cache_unset_active();
    cache_delete(Consult);

    printf("Se cargaron %d items globales.", count);
}

function GetPlayerCountVehicles(playerid)
{
    new count;
    cache_get_row_count(count);
    if(count) cache_get_value_int(0, "OwnerID", count);

    if(PlayerInfo[playerid][p_LEVEL] >= 5 && count >= MAX_PLAYER_PER_VEHICLES) return SendClientMessage(playerid, -1, "Ya tienes el m�ximo de veh�culos.");
    if(PlayerInfo[playerid][p_LEVEL] < 5)
    {
        if(count >= 2)
        {
            SendClientMessage(playerid, -1, "Sube de nivel para comprar mas veh�culos.");
            return 1;
        }
    }
    ShowDialogEx(playerid, DIALOG_BUY_PLAYER_VEHICLE);
    return 1;
}

function LoadPlayerRegistrationID(playerid)
{
    PlayerInfo[playerid][pID] = cache_insert_id();
    mysql_tquery_s(conexion, str_format("UPDATE `lac_code_register` SET `ref_user` = %d WHERE `idcode`= %d;",  PlayerInfo[playerid][pID], Player_TempCodeRefer[playerid]));
    Player_TempCodeRefer[playerid] = 0;

    PlayerInfoTemp[playerid][pt_IsLoggedIn] = true;

    HidePlayerInfoTextdraw(playerid);
    SetPlayerHealthEx(playerid, 100);
    SetPlayerScore(playerid, 1);
    GivePlayerMoney(playerid, PlayerInfo[playerid][pDinero]);
    SetSpawnInfo(playerid, NO_TEAM, PlayerInfo[playerid][pRopa], PlayerInfo[playerid][p_POS_X], PlayerInfo[playerid][p_POS_Y], PlayerInfo[playerid][p_POS_Z], 2.1715, 0,0,0,0,0,0);
    TogglePlayerSpectating(playerid, false);

    PlayerProgressTutorial(playerid);
    CreatePlayerNotificationSimple(playerid, VNOTI_TYPE_TUTORIAL2, "Renta un veh�culo para transporte con mayor facilidad.", 20);
    
    StopAudioStreamForPlayer(playerid);
    return 1;
}

function OnPlayerPasswordHashed(playerid)
{
    new hash[70];
    bcrypt_get_hash(hash);

    format(PlayerInfo[playerid][pPassword], 65, "%s", hash);
    ShowPlayerDialog(playerid, SEXO, DIALOG_STYLE_LIST, "{00C0FF}Selecciona genero", "{FFFFFF}Hombre\n{FFFFFF}Mujer", "Seleccionar", "Cancelar");
    return 1;
}

function PlayerChangePasswordHash(playerid)
{
    new hash[70];
    bcrypt_get_hash(hash);

    format(PlayerInfo[playerid][pPassword], 65, "%s", hash);
    mysql_tquery_s(conexion, str_format("UPDATE `lac_users` SET `password`='%e' WHERE `id`=%d;", PlayerInfo[playerid][pPassword], PlayerInfo[playerid][pID]));
    
    ShowPlayerInfoTextdraw(playerid, "~g~Cambiaste tu contrase�a con exito.", 4000);
    return 1;
}

function OnPlayerPasswordChecked(playerid, bool:success)
{
   // new Query[228];
    //new bool:success = bcrypt_is_equal();
    if(success)
    {
        //format(Query, sizeof(Query), "SELECT * FROM `lac_users` WHERE `name` = '%s' AND `Password`='%s'", PlayerInfoTemp[playerid][pt_Name], PlayerInfo[playerid][pPassword]);
        //mysql_tquery(conexion, Query, "CargarDatos", "ii", playerid, 1);

        PlayerFirstDataLoaded(playerid);


        new DB_Query[550];
        format(DB_Query, sizeof DB_Query, "SELECT NOW() AS `NOW`, `lac_banned`.*, `lac_bad_history`.* FROM `lac_banned`, `lac_bad_history` WHERE (`lac_banned`.`id_user_ban` = '%d') AND `lac_bad_history`.`id` = `lac_banned`.`id_history`;", PlayerInfo[playerid][pID]);
        mysql_tquery(conexion, DB_Query, "PlayerBannedCheck", "ii", playerid, 1);

    }
    else
    {
        Intentos[playerid] ++;
        if(Intentos[playerid] > 4) { Kick(playerid);}

        new string[120], caption[40];
        format(caption, sizeof(caption), "{5EB5FF}Ingresa a tu cuenta - (%d/4)", Intentos[playerid]);
        format(string, sizeof(string), "{5EB5FF}%s{FFFFFF}, esta cuenta esta registrada.\n\nIngresa tu contrase�a:", PlayerInfoTemp[playerid][pt_Name]);
        ShowPlayerDialog(playerid, LOGIN, DIALOG_STYLE_PASSWORD, caption, string, "Entrar", "Salir");
        //LimpiarChat(playerid, 25, 1);
        //ShowPlayerDialog(playerid, LOGIN, DIALOG_STYLE_INPUT, "Ingresa a tu cuenta","{FFFFFF}Contrase�a incorrecta - Intenta de nuevo","Entrar","Salir");
    }
    return 1;
}