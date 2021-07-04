stock ConvertEncoding(const string[])
{
	new
	szFixed[1024],
	iPos,
	iLen;

	for (iLen = strlen(string); iPos < iLen; iPos ++)
		switch (string[iPos])
	{
		case 'à':   szFixed[iPos] = 151;
		case 'á':   szFixed[iPos] = 152;
		case 'â':   szFixed[iPos] = 153;
		case 'ä':   szFixed[iPos] = 154;
		case 'À':   szFixed[iPos] = 128;
		case 'Á':   szFixed[iPos] = 129;
		case 'Â':   szFixed[iPos] = 130;
		case 'Ä':   szFixed[iPos] = 131;
		case 'è':   szFixed[iPos] = 157;
		case 'é':   szFixed[iPos] = 158;
		case 'ê':   szFixed[iPos] = 159;
		case 'ë':   szFixed[iPos] = 160;
		case 'È':   szFixed[iPos] = 134;
		case 'É':   szFixed[iPos] = 135;
		case 'Ê':   szFixed[iPos] = 136;
		case 'Ë':   szFixed[iPos] = 137;
		case 'ì':   szFixed[iPos] = 161;
		case 'í':   szFixed[iPos] = 162;
		case 'î':   szFixed[iPos] = 163;
		case 'ï':   szFixed[iPos] = 164;
		case 'Ì':   szFixed[iPos] = 138;
		case 'Í':   szFixed[iPos] = 139;
		case 'Î':   szFixed[iPos] = 140;
		case 'Ï':   szFixed[iPos] = 141;
		case 'ò':   szFixed[iPos] = 165;
		case 'ó':   szFixed[iPos] = 166;
		case 'ô':   szFixed[iPos] = 167;
		case 'ö':   szFixed[iPos] = 168;
		case 'Ò':   szFixed[iPos] = 142;
		case 'Ó':   szFixed[iPos] = 143;
		case 'Ô':   szFixed[iPos] = 144;
		case 'Ö':   szFixed[iPos] = 145;
		case 'ù':   szFixed[iPos] = 169;
		case 'ú':   szFixed[iPos] = 170;
		case 'û':   szFixed[iPos] = 171;
		case 'ü':   szFixed[iPos] = 172;
		case 'Ù':   szFixed[iPos] = 146;
		case 'Ú':   szFixed[iPos] = 147;
		case 'Û':   szFixed[iPos] = 148;
		case 'Ü':   szFixed[iPos] = 149;
		case 'ñ':   szFixed[iPos] = 174;
		case 'Ñ':   szFixed[iPos] = 173;
		case '¡':   szFixed[iPos] = 64;
		case '¿':   szFixed[iPos] = 175;
		case '`':   szFixed[iPos] = 177;
		//case '%':   szFixed[iPos] = 37;
		case '&':   szFixed[iPos] = 38;
		default:    szFixed[iPos] = string[iPos];
	}
	return szFixed;
}

stock KickAll()
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			Kick(i);
		}
	}
}

stock checkNameValid(const string[])
{
	new length = strlen(string);
	new string_count;
	new pos = strfind(string, "_");
	if(pos == -1) return 0;
	for(new i = 0; i != length; i++)
	{
		switch(string[i])
		{
			case '_': ++string_count;
		}
		if(!i || i == pos + 1)
		{
			switch(string[i])
			{
				case 'A' .. 'Z': continue;
				default: return 0;
			}
		}
		else if(i && i != pos && i != pos + 1)
		{
			switch(string[i])
			{
				case 'a' .. 'z': continue;
				default: return 0;
			}
		}
	}
	return (string_count == 1 && string[length-1] != '_');
}

/*stock convertCharToSpaces(const str[], length)
{
	new count, bool:ColocarBlanco, new_str[40],
	length_str = strlen(str),
	count_two = (length_str * length);

	while(count < count_two)
	{
		strins(new_str, str, count);
		count += length_str;
	}
	return new_str;
}*/

stock convertCharToSpaces(sSource[], length_text, sz_size = sizeof(sSource))
{
	new
	iInputLength = strlen(sSource), bool:end_line = false,
	length_max = length_text - iInputLength;
	new index;

	//printf("Lenght: %d y other size %d y other length_text %d",iInputLength, sz_size, length_text);

	while(sSource[index])
	{
		if(sSource[index] == '@' && sSource[index+1] != '@')
		{
			if(end_line == false)
			{
				strdel(sSource,index,index+1);

				for(new i; i <= length_max; i++)
				{
					strins(sSource,"_",index, sz_size);
				}

				end_line = true;
			} 
			else 
			{
				//printf("DEL: %s y %s", sSource[index], sSource[index+1]);
				strdel(sSource,index,index+1);
				strins(sSource,"_",index, sz_size);
				end_line = false;
			}

		}
		index++;
	}
}

stock SetPlayerAttachObjectEx(playerid, index, modelid, bone, modelide, anim, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
{
	switch(anim)
	{
		case 0: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	}
	/*PlayerInfo[playerid][pInvItemSelected] = modelide;*/
	Objeto[playerid] = modelide;
	return SetPlayerAttachedObject(playerid, index,modelid, bone,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ,materialcolor1,materialcolor2);
}

stock AttachObjectToSPlayer(playerid, type, pos, object, bone, index = 9)
{
	new Float:OffsetPos[9];
	switch(type)
	{
		case 0: // Player Objects
		{
			for(new i = 0; i < sizeof(OffsetPos); i++)
			{
				OffsetPos[i] = PlayerObjects_One[pos][i];
			}
			SetPlayerAttachedObject(playerid,9,object,bone,OffsetPos[0],OffsetPos[1],OffsetPos[2],OffsetPos[3],OffsetPos[4],OffsetPos[5],OffsetPos[6],OffsetPos[7],OffsetPos[8]);
		}
		case 1: 
		{
			for(new i = 0; i < sizeof(OffsetPos); i++)
			{
				OffsetPos[i] = PlayerObjectsG_Clothes[pos][i];
			}
			SetPlayerAttachedObject(playerid,index,object,bone,OffsetPos[0],OffsetPos[1],OffsetPos[2],OffsetPos[3],OffsetPos[4],OffsetPos[5],OffsetPos[6],OffsetPos[7],OffsetPos[8]);
		}
	/*	case 1:
		{
			for(new i = 0; i < sizeof(SkinsClothesHelmet); i++)
			{
				if(PlayerInfo[playerid][pRopa] == SkinClothesHelmet[i])
				{
					for(new l = 0; l < sizeof(OffsetPos); l++)
					{
				
						OffsetPos[l] = SkinsClothesHelmet[l][i];
					}
				}
			}
			SetPlayerAttachedObject(playerid,indexslot,object,bone,OffsetPos[0],OffsetPos[1],OffsetPos[2],OffsetPos[3],OffsetPos[4],OffsetPos[5],OffsetPos[6],OffsetPos[7],OffsetPos[8]);
		}*/
	}
}

stock AttachObjectToSkinPlayer(playerid, skin, index, object/*, bone*/)
{
	new Float:OffsetPos[9];
	new idobject = GetTypeClothesObject(object);
	new bone = ObjectClothesPlayersInt[idobject][1];
	switch(ObjectClothesPlayersInt[idobject][2])
	{
		case CLOTHES_TYPE_HELMET: // Clothes Player
		{
			for(new i = 0; i < sizeof(SkinsClothesHelmet); i++)
			{
				if(skin == floatround(SkinsClothesHelmet[i][0]))
				{
					for(new l = 0; l < sizeof(OffsetPos); l++)
					{
						
						OffsetPos[l] = SkinsClothesHelmet[i][l+1];
					}
				}
			}
		}
	}
	printf("%f, %f, %f, %f, %f, %f, %f, %f, %f", OffsetPos[0],OffsetPos[1],OffsetPos[2],OffsetPos[3],OffsetPos[4],OffsetPos[5],OffsetPos[6],OffsetPos[7],OffsetPos[8]);
	SetPlayerAttachedObject(playerid,index,object,bone,OffsetPos[0],OffsetPos[1],OffsetPos[2],OffsetPos[3],OffsetPos[4],OffsetPos[5],OffsetPos[6],OffsetPos[7],OffsetPos[8]);	
	
}

stock GetTypeClothesObject(objectid)
{
	for (new i = 0; i < sizeof(ObjectClothesPlayersInt); i++)
	{
		if ( ObjectClothesPlayersInt[i][0] == objectid )
		{
		    return i;
		}
	}
	return -1;
}

stock PreloadAnimLibAll(playerid) 
{
	PreloadAnimLib(playerid,"BOMBER");
	PreloadAnimLib(playerid,"RAPPING");
	PreloadAnimLib(playerid,"SHOP");
	PreloadAnimLib(playerid,"BEACH");
	PreloadAnimLib(playerid,"SMOKING");
	PreloadAnimLib(playerid,"SWEET");
	PreloadAnimLib(playerid,"ON_LOOKERS");
	PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"CRACK");
	PreloadAnimLib(playerid,"MEDIC");
	PreloadAnimLib(playerid,"CARRY");
	PreloadAnimLib(playerid,"COP_AMBIENT");
	PreloadAnimLib(playerid,"PARK");
	PreloadAnimLib(playerid,"INT_HOUSE");
	PreloadAnimLib(playerid,"FOOD");
	PreloadAnimLib(playerid,"SUNBATHE");
	PreloadAnimLib(playerid,"CAR");
	PreloadAnimLib(playerid,"ROB_BANK");
	PreloadAnimLib(playerid,"SPRAYCAN");
	PreloadAnimLib(playerid,"MD_CHASE");
	PreloadAnimLib(playerid,"HEIST9");
	PreloadAnimLib(playerid, "GRAVEYARD");
	PreloadAnimLib(playerid, "MISC");
	PreloadAnimLib(playerid, "CHAINSAW");
	PreloadAnimLib(playerid, "CASINO");
	PreloadAnimLib(playerid, "BASEBALL");
	PreloadAnimLib(playerid, "PED");
	PreloadAnimLib(playerid, "COLT45");
	PreloadAnimLib(playerid, "UZI");
	PreloadAnimLib(playerid, "TEC");
	PreloadAnimLib(playerid, "RIFLE");
	PreloadAnimLib(playerid, "INT_OFFICE");
}

stock GetVehicleMaxSpeed(modelid)
{
	if(400 <= modelid <= 611)
	{
		return vSync_VehicleInfo[modelid - 400][vSyncMaxSpeed];
	}
	return 0;
}
stock GetVehicleSpeed(vehicleid)
{
	new Float:v_x;
	new Float:v_y;
	new Float:v_z;

	GetVehicleVelocity(vehicleid, v_x, v_y, v_z);

	return floatround(floatsqroot((v_x * v_x) + (v_y * v_y) + (v_z * v_z)) * 181.5);
}

stock GetWeaponSlot(weaponid)
{
	new slot;
	switch(weaponid)
	{
		case 0,1: slot = 0;
		case 2 .. 9: slot = 1;
		case 10 .. 15: slot = 10;
		case 16 .. 18, 39: slot = 8;
		case 22 .. 24: slot =2;
		case 25 .. 27: slot = 3;
		case 28, 29, 32: slot = 4;
		case 30, 31: slot = 5;
		case 33, 34: slot = 6;
		case 35 .. 38: slot = 7;
		case 40: slot = 12;
		case 41 .. 43: slot = 9;
		case 44 .. 46: slot = 11;
	}
		return slot;
}
/*stock IsTuningIDFromVehicleS_sf(vplayerid, tuneoid, type)
{
	if(VehicleInfo[vplayerid][vTuneo] == tuneoid) { return 1; }
	else if(VehicleInfo[vplayerid][vTuneo2] == tuneoid) { return 1; }
	else if(VehicleInfo[vplayerid][vTuneo3] == tuneoid) { return 1; }
	else if(VehicleInfo[vplayerid][vTuneo4] == tuneoid) { return 1; }
	return 0;
}
*/

IsPlayerInVehicleRent(playerid, vehicleid)
{
	if(Vehicles_Info[vehicleid][gi_vehicle_TYPE] == VEHICLE_TYPE_RENT && Vehicles_Info[vehicleid][gi_vehicle_OWNER] == playerid) return 1;
	return 0;
}

stock GetPosBehindVehicle(vehicleid, &Float:x, &Float:y, &Float:z, Float:offset=0.5)
{
    new Float:vehicleSize[3], Float:vehiclePos[3];
    GetVehiclePos(vehicleid, vehiclePos[0], vehiclePos[1], vehiclePos[2]);
    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, vehicleSize[0], vehicleSize[1], vehicleSize[2]);
    GetXYBehindVehicle(vehicleid, vehiclePos[0], vehiclePos[1], (vehicleSize[1]/2)+offset);
    x = vehiclePos[0];
    y = vehiclePos[1];
    z = vehiclePos[2];
    return 1;
}

GetXYBehindVehicle(vehicleid, &Float:q, &Float:w, Float:distance)
{
    new Float:a;
    GetVehiclePos(vehicleid, q, w, a);
    GetVehicleZAngle(vehicleid, a);
    q += (distance * -floatsin(-a, degrees));
    w += (distance * -floatcos(-a, degrees));
}

stock GetVehicleOffset(vehicleid, type, &Float:x, &Float:y, &Float:z, Float:offset = 0.5)
{

	new Float:X, Float:Y, Float:Z, Float:A;
	GetVehiclePos(vehicleid, x, y, z);
	GetVehicleZAngle(vehicleid, A);

	switch (type)
	{
        case 0: // Boot
        {
        	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
           // x = x - (floatsqroot(Y + offset) * floatsin(-A, degrees));
            //y = y - (floatsqroot(Y + offset) * floatcos(-A, degrees));
            x += ( (Y / 2.0 + offset) * floatsin( -A + 180, degrees ) );
            y += ( (Y / 2.0 + offset) * floatcos( -A + 180, degrees ) );
            //z = z;
        }
        case 1: // Hood
        {
           	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);

            x += ( (Y / 2.0 + offset) * floatsin( -A, degrees ) );
            y += ( (Y / 2.0 + offset) * floatcos( -A, degrees ) );                         // z = fPos[2];
        }
        case 2:
        {
        	GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_PETROLCAP, X, Y, Z);
                    
			//z += Z;

			x += (Y * floatsin(-A, degrees));
			y += (Y * floatcos(-A, degrees));

			A += 270.0;
			x += (X * floatsin(-A, degrees));
			y += (X * floatcos(-A, degrees));
			A -= 270.0;
        }
    }
    return 1;
}

stock wrap_text(text[], width, length, const break_string[]="~n~")
{
	new count = 1;
	for(new i = 0; i < 3; i++)
	{
		if(strlen(text) >= (width*count))
		{

			strins(text, break_string, (width*count), length);
			//strins(text, break_string, (30), length);
			//strins(text, break_string, (45), length);
			count++;
		}
	}
}

PlayerPlaySoundEx(playerid, soundid, Float:x,Float:y,Float:z)
{
	PlayerPlaySound(playerid, soundid, x,y,z);
}

TogglePlayerControllableEx(playerid, bool:toggle)
{
	new tog;
	if((tog = TogglePlayerControllable(playerid, toggle)))
		Player.Temp[playerid][@StateFreeze] = !toggle;
	return tog;
}

SendClientMessageEx(playerid, color, const form[], {Float, _}: ...) 
{
    #pragma unused form

    static
        tmp[145]
    ;
    new
        t1 = playerid,
        t2 = color
    ;
    const
        n4 = -4,
        n16 = -16,
        size = sizeof tmp
    ;
    #emit stack 28
    #emit push.c size
    #emit push.c tmp
    #emit stack n4
    #emit sysreq.c format
    #emit stack n16

    return (t1 == -1 ? (SendClientMessageToAll(t2, tmp)) : (SendClientMessage(t1, t2, tmp)) );
}

GetPlayerSkinPointsSkin(playerid)
{
	return SkinPosPointsSkin[GetPlayerSkin(playerid)][1];
}

stock Float:frandom(Float:max, Float:min, dp)
{
	new
		Float:mul = floatpower(10.0, dp),
		imin = floatround(min * mul),
		imax = floatround(max * mul);
	return float(random(imax - imin) + imin) / mul;
}

// Time

static stock bool:ConvertTime_IsLeapYear(year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

stock ParseTimestamp(timestamp, &year = 0, &month = 0, &day = 0, &hour = 0, &minute = 0, &second = 0, hourGMT = 0, minuteGMT = 0) {
    static const
		SECONDS_PER_MINUTE = 60,
		SECONDS_PER_HOUR = 3600,
		SECONDS_PER_DAY = 86400;

	new days = 0, seconds = 0;

	for (year = CONVERTIME_EPOCHYEAR; ; year++) {
	    days = (ConvertTime_IsLeapYear(year) == true) ? 365 : 366;
		seconds = days * SECONDS_PER_DAY;

		if (seconds > timestamp)
			break;

		timestamp -= seconds;
	}

	for (month = 1; ; month++) {
		days = CONVERTTIME_MONTHDAYS[month - 1];
		seconds = days * SECONDS_PER_DAY;

		if (seconds > timestamp)
			break;

		timestamp -= seconds;
	}

	for (day = 1; timestamp >= SECONDS_PER_DAY; day++)
		timestamp -= SECONDS_PER_DAY;

	for (hour = hourGMT; timestamp >= SECONDS_PER_HOUR; hour++)
		timestamp -= SECONDS_PER_HOUR;

	for (minute = minuteGMT; timestamp >= SECONDS_PER_MINUTE; minute++)
		timestamp -= SECONDS_PER_MINUTE;

	second = timestamp;
}

stock ConverTime_TimeElapsed(time, string[], leng = sizeof(string))
{
	//new format_time[14];
	new seconds;
	seconds = gettime() - time;
	
    new minutes = floatround(seconds / 60 );
    new hour = floatround(seconds / 3600);
   	new days = floatround(seconds / 86400 );
    new month = floatround(seconds / 2600640 );
    new year = floatround(seconds / 31207680 );	

	if(seconds < 60) format(string, leng, "Hace un momento");
	else if(minutes < 60)  format(string, leng, "Hace %d min", minutes);
	else if(hour == 1)  format(string, leng, "Hace %d hora", hour); 
	else if(hour <= 24)  format(string, leng, "Hace %d horas", hour); 
	else if(days == 1)  format(string, leng, "Hace %d día", days); 
	else if(days <= 30)  format(string, leng, "Hace %d días", days); 
	else if(month == 1)  format(string, leng, "Hace %d mes", month); 
	else if(month <= 12)  format(string, leng, "Hace %d meses", month); 
	else if(year == 1)  format(string, leng, "Hace %d año", year); 
	else if(year > 1)  format(string, leng, "Hace %d años", year); 

}

stock ConverTime_TimeElapsedEx(time, string[], leng = sizeof(string), type = 0)
{
	//new format_time[14];
	new seconds;
	if(!type) seconds = time - gettime();
	else seconds = time;

    new minutes = floatround(seconds / 60 );
    new hour = floatround(seconds / 3600);
   	new days = floatround(seconds / 86400 );
    new month = floatround(seconds / 2600640 );
    new year = floatround(seconds / 31207680 );	

	if(seconds < 60) format(string, leng, "%d segundos", seconds);
	else if(minutes < 60)  format(string, leng, "%d min", minutes);
	else if(hour == 1)  format(string, leng, "%d hora", hour); 
	else if(hour <= 24)  format(string, leng, "%d horas", hour); 
	else if(days == 1)  format(string, leng, "%d día", days); 
	else if(days <= 30)  format(string, leng, "%d días", days); 
	else if(month == 1)  format(string, leng, "%d mes", month); 
	else if(month <= 12)  format(string, leng, "%d meses", month); 
	else if(year == 1)  format(string, leng, "%d año", year); 
	else if(year > 1)  format(string, leng, "%d años", year); 

}

// Player

GetClosestPlayerInRange(playerid, Float:range)
{
    new Float:x, Float:y, Float:z, Float:dist, Float:closedist = 0x7F800000, closeid = INVALID_PLAYER_ID;
    GetPlayerPos(playerid, x, y, z);

    foreach(new i : Player)
    {
        if(!IsPlayerConnected(i) ||
            IsPlayerNPC(i) ||
            i == playerid)
            continue;
        else
        {
            dist = GetPlayerDistanceFromPoint(i, x, y, z);
            if(dist <= range)
            {
                if(dist < closedist)
                {
                    closedist = dist;
                    closeid = i;
                }
            }
        }
    }
    return closeid;
}

stock GetPlayerClosestVehicle(playerid, Float: range = 1.0)
{
    new Float: PosX, Float: PosY, Float: PosZ, Float: CloseDist = range, Float: Dist, FetchVeh, PlayerVeh;
    PlayerVeh = GetPlayerVehicleID(playerid);

    //for(new i = GetVehiclePoolSize(); i != 0; i--)
    foreach(new i : Vehicle)
    {
        if(i == PlayerVeh) continue;

        GetVehiclePos(i, PosX, PosY, PosZ);
        Dist = GetPlayerDistanceFromPoint(playerid, PosX, PosY, PosZ);
        
        new Float:SizeX, Float:SizeY, Float:SizeZ;
		GetVehicleModelInfo(Vehicles_Info[i][gi_vehicle_MODELID], VEHICLE_MODEL_INFO_SIZE, SizeX, SizeY, SizeZ);
		CloseDist = (SizeY/2.0)+0.5;

        if(Dist <= CloseDist)
        {
            FetchVeh = i;
            CloseDist = Dist;
        }
    }
    return FetchVeh;
} 

stock IsPlayerAnglePos(playerid, Float:tx, Float:ty, Float:anglesize = 70.0)
{
	new Float:curangle, Float:angle, Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	curangle = GetAngleToPoint(x,y, tx, ty);

	if((curangle-anglesize) <= angle <= (curangle+anglesize)) return 1;
			
	return 0;
}

stock GetPointInFrontPos(playerid, Float:x, Float:y, Float:angle, &Float:newx, &Float:newy, Float:distance) //Credit to Sacky/Simon/Y_Less for this, I haven't actually found out whos the original was
{
    if (IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
	}
    
    x += (distance * floatsin(-angle, degrees));
    y += (distance * floatcos(-angle, degrees));

    newx = x;
    newy = y;
}