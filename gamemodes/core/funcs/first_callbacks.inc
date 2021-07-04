stock Text:CreateInventoryTextdrawEx(id, Float:tx, Float:ty, Float:sizex, Float:sizey)
{
	new Text:textdrawid;

	/*if(modelid == 0) { modelid = 19382; }

	textdrawid = TextDrawCreate(tx,ty, "_");
	
 	TextDrawBackgroundColor(textdrawid, 0xFFFFFF77);
	TextDrawAlignment(textdrawid, 2);	
	TextDrawFont(textdrawid, 5);
	TextDrawLetterSize(textdrawid, 0.500000, 1.000000);
	TextDrawBoxColor(textdrawid, 0xFFFFFF00);	
	TextDrawUseBox(textdrawid, 1);
	TextDrawTextSize(textdrawid, sizex, sizey);
	TextDrawSetPreviewModel(textdrawid, modelid);
	TextDrawSetPreviewRot(textdrawid, -16.000000, 0.000000, -55.000000, 0.8);
	TextDrawSetSelectable(textdrawid, true);*/

	if(id == 1)
	{
		textdrawid = TextDrawCreate(tx,ty, "");

		TextDrawFont(textdrawid, 5);
		TextDrawSetPreviewModel(textdrawid, 19382);
		TextDrawSetPreviewRot(textdrawid, -16.000000, 0.000000, -55.000000, /*0.000000*/0.8);
		TextDrawColor(textdrawid, -1);
		TextDrawBackgroundColor(textdrawid, 0xFFFFFF00);
		TextDrawLetterSize(textdrawid, 0.500000, 1.000000);
		TextDrawTextSize(textdrawid, sizex, sizey);

	}
	else
	{
		textdrawid = TextDrawCreate(tx,ty, "LD_SPAC:WHITE");
		TextDrawFont(textdrawid, 4);
		TextDrawColor(textdrawid, 0xECECECFF);
		TextDrawBackgroundColor(textdrawid, 255);
		TextDrawLetterSize(textdrawid, 0.500000, 1.000000);
		TextDrawTextSize(textdrawid, sizex, sizey);
		TextDrawSetSelectable(textdrawid, 1);
	}

	return textdrawid;
}

Text:CreateMobileTextdrawNumbers(Float:tx, Float:ty, const text[], Float:letterx, Float:lettery, bool:selectable = true)
{
	new Text:textdrawid;

	textdrawid = TextDrawCreate(tx, ty, text);
	TextDrawBackgroundColor(textdrawid, 255);
	TextDrawLetterSize(textdrawid, letterx, lettery);
	TextDrawColor(textdrawid, -1);
	TextDrawSetOutline(textdrawid, 0);
	TextDrawSetProportional(textdrawid, 1);
	TextDrawSetShadow(textdrawid, 0);
	TextDrawTextSize(textdrawid, (tx+10.0), 14.0);
	TextDrawSetSelectable(textdrawid, selectable);

	return textdrawid;
}

stock CreateIconMapGlobalGPS(id, Float:X, Float:Y, type, doorid)
{
	new Float:PosIcon[2];
	floatMapa3D(X, Y, 159.0-5.0, 137.0-3.0, 295.0, 280.0,PosIcon[0], PosIcon[1]);
	
	IconMapGPSVar[id] = doorid;

	/*switch(type)
	{
		case 30: { format(typeicon, sizeof(typeicon), "hud:radar_police"); }
	    case 41: { format(typeicon, sizeof(typeicon), "hud:radar_waypoint"); }
	    case 52: { format(typeicon, sizeof(typeicon), "hud:radar_cash"); }
	    case 56: { format(typeicon, sizeof(typeicon), "hud:radar_light"); }
	    case 57: { format(typeicon, sizeof(typeicon), "hud:radar_runway"); }
	    case 60: { format(typeicon, sizeof(typeicon), "hud:radar_gangY"); }
	    case 61: { format(typeicon, sizeof(typeicon), "hud:radar_gangN"); }
	}*/

	Textdraws[sTextdraw_InvIconsPointsGPS][id] = TextDrawCreate(PosIcon[0], PosIcon[1], GetIconGPSForID(type));
	TextDrawBackgroundColor(Textdraws[sTextdraw_InvIconsPointsGPS][id], 255);
	TextDrawFont(Textdraws[sTextdraw_InvIconsPointsGPS][id], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_InvIconsPointsGPS][id], 0.000000, 0.000000);
	TextDrawColor(Textdraws[sTextdraw_InvIconsPointsGPS][id], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InvIconsPointsGPS][id], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InvIconsPointsGPS][id], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InvIconsPointsGPS][id], 1);
	TextDrawUseBox(Textdraws[sTextdraw_InvIconsPointsGPS][id], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InvIconsPointsGPS][id], 255);
	TextDrawTextSize(Textdraws[sTextdraw_InvIconsPointsGPS][id], 7.0, 8.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InvIconsPointsGPS][id], 1);
	
	return 1;
}

CreatePlayerItemListMobile(playerid, count, const string[])
{
	Player_Textdraws[playerid][pTextdraw_Mobile_TD][count] = CreatePlayerTextDraw(playerid,531.000000, (328.000000+(17.0*count)), string);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0.190000, 1.000000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], -1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0);
	PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 1);
	PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 0x00000088);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 597.0, 10.000000);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count], 1);
	PlayerTextDrawShow(playerid,Player_Textdraws[playerid][pTextdraw_Mobile_TD][count]);
}

PlayerText:CreatePlayerItemListMobileEx(playerid, const string[], Float:tx = 530.0, Float:ty = 328.0, Float:letterx = 0.190000, Float:lettery = 1.0, Float:sizex = 597.0, Float:sizey = 10.0, font = 1, color = 0xFFFFFFFF, bool:usebox = true, boxcolor = 0x00000088, bool:selectable = false)
{
	new PlayerText:playertextid;
	playertextid = CreatePlayerTextDraw(playerid,tx, ty, string);
	PlayerTextDrawFont(playerid,playertextid, font);
	PlayerTextDrawLetterSize(playerid,playertextid, letterx, lettery);
	PlayerTextDrawColor(playerid,playertextid, color);
	PlayerTextDrawSetShadow(playerid,playertextid, 0);
	PlayerTextDrawUseBox(playerid,playertextid, usebox);
	PlayerTextDrawBoxColor(playerid,playertextid, boxcolor);
	PlayerTextDrawTextSize(playerid,playertextid, sizex, sizey);
	PlayerTextDrawSetSelectable(playerid,playertextid, selectable);
	PlayerTextDrawShow(playerid,playertextid);
	return playertextid;
}

CreateTextdrawPlayer(playerid)
{
	for(new i; i < sizeof(Player_Textdraws[]); i++) Player_Textdraws[playerid][Player_Textdraw_enum:i] = INVALID_TEXT_DRAW;

	Player_Textdraws[playerid][pTextdraw_MessageInfo] = CreatePlayerTextDraw(playerid, 329.0, 390.0, "__");
	PlayerTextDrawAlignment(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 2);
	PlayerTextDrawBackgroundColor(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 255);
	PlayerTextDrawFont(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 1);
	PlayerTextDrawLetterSize(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 0.3400, 1.8);
	PlayerTextDrawColor(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], -1);
	PlayerTextDrawSetShadow(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 1);
	//PlayerTextDrawSetOutline(playerid, Player_Textdraws[playerid][pTextdraw_MessageInfo], 1);

	Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0] = CreatePlayerTextDraw(playerid,148.0, 120.0, "Inventario");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 0.410000, 1.500000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], -1);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 0);
	PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 1);
	PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 255);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 228.0, 17.0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][0], 1);

	Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1] = CreatePlayerTextDraw(playerid,248.0, 120.0, "Banda");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 0.410000, 1.500000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], -1);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 0);
	PlayerTextDrawUseBox(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 1);
	PlayerTextDrawBoxColor(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 255);
	PlayerTextDrawTextSize(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 294.0, 17.0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ButtonsBoxInventory][1], 1);
	
	Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0] = CreatePlayerTextDraw(playerid,183.000000, 182.000000, "0000-0000-00000");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 0.319999, 1.200000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], -1);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][0], 0);

	Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1] = CreatePlayerTextDraw(playerid,358.000000, 183.000000, "$100,000,000");
	PlayerTextDrawBackgroundColor(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 255);
	PlayerTextDrawFont(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 1);
	PlayerTextDrawLetterSize(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 0.319999, 1.200000);
	PlayerTextDrawColor(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 0x00E500FF);
	PlayerTextDrawSetOutline(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 0);
	PlayerTextDrawSetProportional(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 1);
	PlayerTextDrawSetShadow(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 0);
	PlayerTextDrawSetSelectable(playerid,Player_Textdraws[playerid][pTextdraw_ATM_Info_Player][1], 0);
	
	VeloText[playerid][0] = CreatePlayerTextDraw(playerid, 604.0, 349.0, "KM/h");
	PlayerTextDrawAlignment(playerid, VeloText[playerid][0], 3);
	//PlayerTextDrawBackgroundColor(playerid, VeloText[playerid][0], 255);
	PlayerTextDrawFont(playerid, VeloText[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, VeloText[playerid][0], 0.429998, 1.100000);
	PlayerTextDrawColor(playerid, VeloText[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, VeloText[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, VeloText[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, VeloText[playerid][0], 0);

	VeloText[playerid][1] = CreatePlayerTextDraw(playerid, 624.0, 384.0, "1000/1000");
	PlayerTextDrawAlignment(playerid, VeloText[playerid][1], 3);
	//PlayerTextDrawBackgroundColor(playerid, VeloText[playerid][1], 255);
	PlayerTextDrawFont(playerid, VeloText[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, VeloText[playerid][1], 0.400000, 1.100000);
	PlayerTextDrawColor(playerid, VeloText[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, VeloText[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, VeloText[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, VeloText[playerid][1], 0);
	return 1;
}

LoadServerTextdrawGlobal()
{
	for(new i; i < sizeof(Textdraws); i++) Textdraws[eServer_Textdraw_Global:i] = INVALID_TEXT_DRAW;

	Textdraws[sTextdraw_InventoryBox][0] = TextDrawCreate(452.000000, 120.0, "X");
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][0], 0.29, 1.20);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][0], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][0], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][0], 10.000000, 11.000000);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][0], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][0], 1);

	Textdraws[sTextdraw_InventoryBox][7] = TextDrawCreate(114.000000, 120.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][7], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][7], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][7], 0.019997, 22.700021);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][7], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][7], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][7], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][7], 1);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][7], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][7], 0x00000088);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][7], 480.0, 87.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][7], 0);

	Textdraws[sTextdraw_InventoryBox][10] = TextDrawCreate(474.0, 120.0, "X");
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][10], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][10], 0.29, 1.20);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][10], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][10], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][10], 10.0, 11.0);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][10], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][10], true);

	Textdraws[sTextdraw_InventoryBox][1] = TextDrawCreate(144.000000, 120.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][1], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][1], 0.019998, 25.00);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][1], 154);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][1], 1);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][1], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][1], /*154*/0x00000088);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][1], /*481.0*/459.0, 200.0);
	TextDrawSetPreviewModel( Textdraws[sTextdraw_InventoryBox][1], 5);
	TextDrawSetPreviewRot(Textdraws[sTextdraw_InventoryBox][1], -16.000000, 0.000000, -55.000000, 1.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][1], 0);

	Textdraws[sTextdraw_InventoryBoxPlayer][0] = TextDrawCreate(270.0, 141.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBoxPlayer][0], 0x00000000);
	TextDrawFont(Textdraws[sTextdraw_InventoryBoxPlayer][0], 5);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBoxPlayer][0], 1);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBoxPlayer][0], 170.0, 170.0);
	TextDrawSetPreviewRot(Textdraws[sTextdraw_InventoryBoxPlayer][0], 0.0, 0.0, 40.0, 1.0);

	Textdraws[sTextdraw_InventoryBoxPlayer][1] = TextDrawCreate(422.0, 159.0, ConvertEncoding("Configuración"));
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBoxPlayer][1], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBoxPlayer][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBoxPlayer][1], 0.270000, 1.4);
	TextDrawColor(Textdraws[sTextdraw_InventoryBoxPlayer][1], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBoxPlayer][1], 2);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBoxPlayer][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBoxPlayer][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBoxPlayer][1], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBoxPlayer][1], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBoxPlayer][1], 0x595959FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBoxPlayer][1], 10.0, 70.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBoxPlayer][1], 1);

	Textdraws[sTextdraw_InventoryBoxPlayer][2] = TextDrawCreate(325.0, 138.0, "LD_SPAC:white");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBoxPlayer][2], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBoxPlayer][2], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBoxPlayer][2], 0.270000, 1.4);
	TextDrawColor(Textdraws[sTextdraw_InventoryBoxPlayer][2], 0x999999FF);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBoxPlayer][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBoxPlayer][2], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBoxPlayer][2], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBoxPlayer][2], 0x000000FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBoxPlayer][2], 1.0, 204.0);

	// Mapa
	MapaGPS = TextDrawCreate(140.0, 138.0, ConvertEncoding("Trabajos ~n~Lugares públicos ~n~Hospitales ~n~24/7 ~n~Restaurantes ~n~Concesionarias ~n~Talleres ~n~Vehículos en renta"));
	TextDrawLetterSize(MapaGPS, 0.200, 1.35);
	TextDrawColor(MapaGPS, 0xFFFFFF00);
	TextDrawAlignment(MapaGPS, 3);
	TextDrawSetShadow(MapaGPS, 0);
	TextDrawTextSize(MapaGPS, 249.000000, 275.000000);
	TextDrawSetSelectable(MapaGPS, 1);

	MapaGPS2 = TextDrawCreate(159.0, 137.0, "samaps:gtasamapbit4");
	TextDrawBackgroundColor(MapaGPS2, 255);
	TextDrawFont(MapaGPS2, 4);
	TextDrawLetterSize(MapaGPS2, 0.200000, -5.000000);
	TextDrawColor(MapaGPS2, -1);
	TextDrawSetOutline(MapaGPS2, 0);
	TextDrawSetProportional(MapaGPS2, 1);
	TextDrawSetShadow(MapaGPS2, 1);
	TextDrawUseBox(MapaGPS2, 1);
	TextDrawBoxColor(MapaGPS2, 255);
	TextDrawTextSize(MapaGPS2, 295.0, 280.0);
	TextDrawSetSelectable(MapaGPS2, 0);

	LoadAllPointsGPS();

	for(new i = 0; i < sizeof IconListLeftGPS; i++)
	{

		Textdraws[sTextdraw_InvIconsGPS][i] = TextDrawCreate(145.0, 140.0+(i*12.0), GetIconGPSForID(IconListLeftGPS[i]));
		TextDrawBackgroundColor(Textdraws[sTextdraw_InvIconsGPS][i], 255);
		TextDrawFont(Textdraws[sTextdraw_InvIconsGPS][i], 4);
		TextDrawLetterSize(Textdraws[sTextdraw_InvIconsGPS][i], 0.000000, 0.000000);
		TextDrawColor(Textdraws[sTextdraw_InvIconsGPS][i], -1);
		TextDrawSetOutline(Textdraws[sTextdraw_InvIconsGPS][i], 0);
		TextDrawSetProportional(Textdraws[sTextdraw_InvIconsGPS][i], 1);
		TextDrawSetShadow(Textdraws[sTextdraw_InvIconsGPS][i], 1);
		TextDrawUseBox(Textdraws[sTextdraw_InvIconsGPS][i], 1);
		TextDrawBoxColor(Textdraws[sTextdraw_InvIconsGPS][i], 255);
		TextDrawTextSize(Textdraws[sTextdraw_InvIconsGPS][i], 8.0, 10.0);
		TextDrawSetSelectable(Textdraws[sTextdraw_InvIconsGPS][i], true);
	}

	Textdraws[sTextdraw_InvInfoGPS][0] = TextDrawCreate(150.0, 0.0, "LD_SPAC:white");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InvInfoGPS][0], 255);
	TextDrawFont(Textdraws[sTextdraw_InvInfoGPS][0], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_InvInfoGPS][0], 0.000000, 0.000000);
	TextDrawColor(Textdraws[sTextdraw_InvInfoGPS][0], 0x000000FF);
	TextDrawUseBox(Textdraws[sTextdraw_InvInfoGPS][0], 1);
	TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][0], 110.0, 70.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InvInfoGPS][0], 0);

	Textdraws[sTextdraw_InvInfoGPS][1] = TextDrawCreate(152.0, 152.0, "Title");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InvInfoGPS][1], 255);
	TextDrawLetterSize(Textdraws[sTextdraw_InvInfoGPS][1], 0.180, 2.0);
	TextDrawColor(Textdraws[sTextdraw_InvInfoGPS][1], 0x00C0FFFF);
	TextDrawSetShadow(Textdraws[sTextdraw_InvInfoGPS][1], 0);
	TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][1], 700.0, 10.0);

	Textdraws[sTextdraw_InvInfoGPS][2] = TextDrawCreate(152.0, 152.0, "Title");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InvInfoGPS][2], 255);
	TextDrawLetterSize(Textdraws[sTextdraw_InvInfoGPS][2], 0.15, 1.20);
	TextDrawColor(Textdraws[sTextdraw_InvInfoGPS][2], 0xFFFFFFFF);
	TextDrawSetShadow(Textdraws[sTextdraw_InvInfoGPS][2], 0);
	TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][2], 480.0, 10.0);

	Textdraws[sTextdraw_InvInfoGPS][3] = TextDrawCreate(200.0, 70.0, "Localizar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InvInfoGPS][3], 255);
	TextDrawLetterSize(Textdraws[sTextdraw_InvInfoGPS][3], 0.18, 1.5);
	TextDrawColor(Textdraws[sTextdraw_InvInfoGPS][3], 0x00C0FFFF);
	TextDrawSetShadow(Textdraws[sTextdraw_InvInfoGPS][3], 0);
	TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][3], 500.0, 10.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InvInfoGPS][3], 1);

	Textdraws[sTextdraw_InvInfoGPS][4] = TextDrawCreate(200.0, 70.0, "X");
	TextDrawFont(Textdraws[sTextdraw_InvInfoGPS][4], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InvInfoGPS][4], 0.29, 1.20);
	TextDrawColor(Textdraws[sTextdraw_InvInfoGPS][4], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InvInfoGPS][4], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InvInfoGPS][4], 10.0, 11.0);
	TextDrawSetShadow(Textdraws[sTextdraw_InvInfoGPS][4], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InvInfoGPS][4], 1);

	//
	
	Textdraws[sTextdraw_InventoryBox][2]  = TextDrawCreate(174.0, 332.0, "<");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][2] , 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][2] , 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][2] , 0.289999, 1.599998);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][2] , -1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][2], 0);
	//TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][2], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][2], 184.0, 10.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][2] , 1);

	Textdraws[sTextdraw_InventoryBox][3]  = TextDrawCreate(217.0, 332.0, ">");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][3] , 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][3] , 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][3] , 0.289999, 1.599998);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][3] , -1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][3], 0);
	//TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][3], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][3], 227.0, 10.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][3], 1);

	Textdraws[sTextdraw_InventoryBox][4] = TextDrawCreate(392.0, 309.0, "Opciones");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][4], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][4], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][4], 0.270000, 1.399999);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][4], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][4], 2);	
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][4], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][4], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][4], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][4], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][4], 0x0055A0FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][4], 10.0, 127.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][4], 1);

	Textdraws[sTextdraw_InventoryBox][5] = TextDrawCreate(392.0, 289.0, "Actividades");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][5], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][5], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][5], 0.270000, 1.399999);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][5], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][5], 2);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][5], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][5], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][5], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][5], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][5], 0x0055A0FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][5], 10.0, 127.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][5], 1);

	for(new i = 0; i < MAX_FACTION_PANEL_ITEMS; i++)
	{
		Textdraws[sTextdraw_BoxPanelFactionList][i] = TextDrawCreate(148.0, (/*182.0*/MAX_FACTION_ITEMS_POS_X + (25.0 * i)), "LD_SPAC:white");
		//TextDrawBackgroundColor(Textdraws[sTextdraw_BoxPanelFactionList][i], 0xA1A1A1FF);
		TextDrawFont(Textdraws[sTextdraw_BoxPanelFactionList][i], 4);
		TextDrawColor(Textdraws[sTextdraw_BoxPanelFactionList][i], 0xA1A1A1FF);
		TextDrawUseBox(Textdraws[sTextdraw_BoxPanelFactionList][i], 1);
		//TextDrawColor(Textdraws[sTextdraw_BoxPanelFactionList][i], 0xA1A1A1FF);
		TextDrawTextSize(Textdraws[sTextdraw_BoxPanelFactionList][i], 174.0, 22.0);
		TextDrawSetSelectable(Textdraws[sTextdraw_BoxPanelFactionList][i], 1);
	}

	Textdraws[sTextdraw_InventoryBox][6] = TextDrawCreate(392.0, 328.0, "Abandonar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][6], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][6], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][6], 0.270000, 1.399999);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][6], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][6], 2);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][6], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][6], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][6], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][6], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][6], 0x0055A0FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][6], 10.0, 127.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][6], 1);

	Textdraws[sTextdraw_InventoryBox][11] = TextDrawCreate(392.0, 328.0, "Unirme");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][11], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][11], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][11], 0.270000, 1.399999);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][11], -1);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][11], 2);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][11], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][11], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][11], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryBox][11], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryBox][11], 0x0055A0FF);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][11], 10.0, 127.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][11], 1);

	// Buttons
	Textdraws[sTextdraw_InventoryButtons][0] = TextDrawCreate(148.0, 120.0, "Inventario");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryButtons][0], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryButtons][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryButtons][0], 0.375, 1.5);
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryButtons][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryButtons][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryButtons][0], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryButtons][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryButtons][0], 0x00000071);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryButtons][0], 214.0, 17.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryButtons][0], 1);

	Textdraws[sTextdraw_InventoryButtons][1] = TextDrawCreate(248.0, 120.0, "Banda");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryButtons][1], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryButtons][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryButtons][1], 0.375, 1.5);
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][1], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryButtons][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryButtons][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryButtons][1], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryButtons][1], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryButtons][1], 0x00000071);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryButtons][1], 285.0, 17.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryButtons][1], 1);

	Textdraws[sTextdraw_InventoryButtons][2] = TextDrawCreate(380.0, 120.0, "GPS");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryButtons][2], 255);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryButtons][2], 0.375, 1.5);
	TextDrawColor(Textdraws[sTextdraw_InventoryButtons][2], -1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryButtons][2], 0);
	TextDrawUseBox(Textdraws[sTextdraw_InventoryButtons][2], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_InventoryButtons][2], 0x00000071);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryButtons][2], 408.0, 17.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryButtons][2], 1);

	//
	Textdraws[sTextdraw_InventoryBox][12] = TextDrawCreate(/*458.0*/450.0, 158.0, "<");
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][12] , 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][12] , 0.289999, 1.599998);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][12] , -1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][12], 0);
	TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][12], 2);
	TextDrawTextSize(Textdraws[sTextdraw_InventoryBox][12], 10.0, 10.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][12], 1);

	Textdraws[sTextdraw_InventoryBox][13] = TextDrawCreate(328.0, 227.0, "Puntos de la banda~n~Miembros~n~Territorios~n~Grafitis pintados");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][13], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][13], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][13], 0.18, 1.4);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][13], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][13], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][13], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][13], 0);

	Textdraws[sTextdraw_InventoryBox][8] = TextDrawCreate(311.0, 138.0, "Maletero");
	//TextDrawAlignment(Textdraws[sTextdraw_InventoryBox][8], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][8], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][8], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][8], 0.40, 2.0);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][8], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][8], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][8], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][8], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][8], 0);

	Textdraws[sTextdraw_InventoryBox][9] = TextDrawCreate(118.000000, 138.0, "Inventario");
	TextDrawBackgroundColor(Textdraws[sTextdraw_InventoryBox][9], 255);
	TextDrawFont(Textdraws[sTextdraw_InventoryBox][9], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_InventoryBox][9], 0.40, 2.0);
	TextDrawColor(Textdraws[sTextdraw_InventoryBox][9], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_InventoryBox][9], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_InventoryBox][9], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_InventoryBox][9], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_InventoryBox][9], 0);

	// Blocks - Change Inventory
	new Float:posy = 159.0;
	for(new i = 0; i < 2; i++)
	{
		sTextdraw_InvChangeItems[0][i] = CreateInventoryTextdrawEx(i, (310.0+(0*41.0)), posy, 41.0, 50.0);	
		sTextdraw_InvChangeItems[1][i] = CreateInventoryTextdrawEx(i, (310.0+(1*42.0)), posy, 41.0, 50.0);	
		sTextdraw_InvChangeItems[2][i] = CreateInventoryTextdrawEx(i, (310.0+(2*42.0)), posy, 41.0, 50.0);	
		sTextdraw_InvChangeItems[3][i] = CreateInventoryTextdrawEx(i, (310.0+(3*42.0)), posy, 41.0, 50.0);	
		sTextdraw_InvChangeItems[4][i] = CreateInventoryTextdrawEx(i, (310.0+(0*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[5][i] = CreateInventoryTextdrawEx(i, (310.0+(1*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[6][i] = CreateInventoryTextdrawEx(i, (310.0+(2*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[7][i] = CreateInventoryTextdrawEx(i, (310.0+(3*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[8][i] = CreateInventoryTextdrawEx(i, (310.0+(0*42.0)), posy+102.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[9][i] = CreateInventoryTextdrawEx(i, (310.0+(1*42.0)), posy+102.0, 41.0, 50.0);	
		sTextdraw_InvChangeItems[10][i] = CreateInventoryTextdrawEx(i, (310.0+(2*42.0)), posy+102.0, 41.0, 50.0);
		sTextdraw_InvChangeItems[11][i] = CreateInventoryTextdrawEx(i, (310.0+(3*42.0)), posy+102.0, 41.0, 50.0);

		sTextdraw_pItemsInventoryTrade[0][i] = CreateInventoryTextdrawEx(i, (117.0+(0*41.0)), posy, 41.0, 50.0);
		sTextdraw_pItemsInventoryTrade[1][i] = CreateInventoryTextdrawEx(i, (117.0+(1*42.0)), posy, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[2][i] = CreateInventoryTextdrawEx(i, (117.0+(2*42.0)), posy, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[3][i] = CreateInventoryTextdrawEx(i, (117.0+(3*42.0)), posy, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[4][i] = CreateInventoryTextdrawEx(i, (117.0+(0*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[5][i] = CreateInventoryTextdrawEx(i, (117.0+(1*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[6][i] = CreateInventoryTextdrawEx(i, (117.0+(2*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[7][i] = CreateInventoryTextdrawEx(i, (117.0+(3*42.0)), posy+51.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[8][i] = CreateInventoryTextdrawEx(i, (117.0+(0*42.0)), posy+102.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[9][i] = CreateInventoryTextdrawEx(i, (117.0+(1*42.0)), posy+102.0, 41.0, 50.0);	
		sTextdraw_pItemsInventoryTrade[10][i] = CreateInventoryTextdrawEx(i, (117.0+(2*42.0)), posy+102.0, 41.0, 50.0);
		sTextdraw_pItemsInventoryTrade[11][i] = CreateInventoryTextdrawEx(i, (117.0+(3*42.0)), posy+102.0, 41.0, 50.0);

	}
	//

	Textdraws[sTextdraw_BarProgressGeneral] = TextDrawCreate(404.0+1.2, 414.0+1.45, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BarProgressGeneral], 255);
	TextDrawFont(Textdraws[sTextdraw_BarProgressGeneral], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BarProgressGeneral], 0.709999, 0.299998);
	TextDrawColor(Textdraws[sTextdraw_BarProgressGeneral], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BarProgressGeneral], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BarProgressGeneral], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BarProgressGeneral], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BarProgressGeneral], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BarProgressGeneral], 0x0BAB0AFF);
	TextDrawTextSize(Textdraws[sTextdraw_BarProgressGeneral], 255.000000+1.2, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BarProgressGeneral], 0);

	//Cajero - Textdraw
	Textdraws[sTextdraw_ATM_General][0] = TextDrawCreate(181.000000, 130.000000, "__");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_General][0], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_General][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_General][0], 0.500000, 15.79999);
	TextDrawColor(Textdraws[sTextdraw_ATM_General][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_General][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_General][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_General][0], 1);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_General][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_General][0], 0x2944EAFF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_General][0], 440.000000, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_General][0], 0);

	Textdraws[sTextdraw_ATM_General][1] = TextDrawCreate(225.000000, 165.000000, "ID                       Fondos");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_General][1], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_General][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_General][1], 0.350000, 1.599999);
	TextDrawColor(Textdraws[sTextdraw_ATM_General][1], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_General][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_General][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_General][1], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_General][1], 0);

	Textdraws[sTextdraw_ATM_General][2] = TextDrawCreate(311.000000, 130.000000, "Cajero");
	TextDrawAlignment(Textdraws[sTextdraw_ATM_General][2], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_General][2], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_General][2], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_General][2], 0.500000, 2.699999);
	TextDrawColor(Textdraws[sTextdraw_ATM_General][2], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_General][2], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_General][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_General][2], 0);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_General][2], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_General][2], 0x001EB2FF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_General][2], -10.000000, 260.000000);


	Textdraws[sTextdraw_ATM_Button][0] = TextDrawCreate(187.000000, 249.000000, "     Retirar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_Button][0], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_Button][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_Button][0], 0.299999, 1.999999);
	TextDrawColor(Textdraws[sTextdraw_ATM_Button][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_Button][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_Button][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_Button][0], 0);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_Button][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_Button][0], 0x207EE1FF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_Button][0], 303.000000, 15.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_Button][0], 1);

	Textdraws[sTextdraw_ATM_Button][1] = TextDrawCreate(187.000000, 223.000000, "     Transferir");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_Button][1], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_Button][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_Button][1], 0.299998, 1.999999);
	TextDrawColor(Textdraws[sTextdraw_ATM_Button][1], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_Button][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_Button][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_Button][1], 0);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_Button][1], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_Button][1], 0x207EE1FF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_Button][1], 303.000000, 15.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_Button][1], 1);

	Textdraws[sTextdraw_ATM_Button][2] = TextDrawCreate(317.000000, 224.000000, "     Depositar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_Button][2], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_Button][2], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_Button][2], 0.299998, 1.999999);
	TextDrawColor(Textdraws[sTextdraw_ATM_Button][2], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_Button][2], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_Button][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_Button][2], 0);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_Button][2], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_Button][2], 0x207EE1FF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_Button][2], 434.000000, 15.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_Button][2], 1);

	Textdraws[sTextdraw_ATM_Button][3] = TextDrawCreate(317.000000, 249.000000, "        Salir");
	TextDrawBackgroundColor(Textdraws[sTextdraw_ATM_Button][3], 255);
	TextDrawFont(Textdraws[sTextdraw_ATM_Button][3], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_ATM_Button][3], 0.299999, 1.999999);
	TextDrawColor(Textdraws[sTextdraw_ATM_Button][3], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_ATM_Button][3], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_ATM_Button][3], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_ATM_Button][3], 0);
	TextDrawUseBox(Textdraws[sTextdraw_ATM_Button][3], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_ATM_Button][3], 0xCD2525FF);
	TextDrawTextSize(Textdraws[sTextdraw_ATM_Button][3], 434.000000, 15.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_ATM_Button][3], 1);

	// Telefono - Interactivo
	Textdraws[sTextdraw_Mobile_TD][0] = TextDrawCreate(525.0, 284.000000, "ld_poke:cd1d");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][0], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][0], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][0], 0.500000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][0], 255);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][0], 1);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][0], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][0], 79.000000, 160.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][0], 0);

	Textdraws[sTextdraw_Mobile_TD][1] = TextDrawCreate(578.0, 298.0, "12:00");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][1], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][1], 0.180000, 1.0);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][1], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][1], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][1], 0);

	Textdraws[sTextdraw_Mobile_TD][2] = TextDrawCreate(527.0, 298.000000, "LD_SPAC:white");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][2], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][2], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][2], 0.500000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][2], 0x175CA5FF);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][2], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][2], 1);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][2], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][2], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][2], 75.000000, 135.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][2], 0);

	Textdraws[sTextdraw_Mobile_TD][3] = TextDrawCreate(570.0, 328.0, "hud:radar_gangN");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][3], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][3], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][3], 0.500000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][3], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][3], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][3], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][3], 1);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][3], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][3], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][3], 19.000000, 23.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][3], 1);

	Textdraws[sTextdraw_Mobile_TD][4] = TextDrawCreate(540.0, 328.0, "LD_CHAT:goodcha");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][4], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][4], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][4], 0.500000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][4], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][4], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][4], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][4], 1);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][4], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][4], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][4], 19.000000, 23.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][4], 1);

	Textdraws[sTextdraw_Mobile_TD][5] = TextDrawCreate(584.0, 411.000000, "hud:radar_modGarage");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][5], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][5], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][5], 0.240000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][5], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][5], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][5], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][5], 1);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][5], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][5], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][5], 14.000000, 19.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][5], 1);

	Textdraws[sTextdraw_Mobile_TD][6] = TextDrawCreate(559.0, 407.0, "T");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][6], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][6], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][6], 0.519999, 2.800001);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][6], 16711935);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][6], 1);
	//TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][6], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][6], (568.0+10.0), 14.0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][6], 1);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][6], 1);

	Textdraws[sTextdraw_Mobile_TD][7] = TextDrawCreate(532.000000, 417.000000, "<");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][7], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][7], 0.240000, 1.700000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][7], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][7], 0);
	//TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][7], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][7], (532.0+8.0), 10.0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][7], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][7], 1);

	Textdraws[sTextdraw_Mobile_TD][8] = TextDrawCreate(590.0, 417.000000, ">");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][8], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][8], 0.240000, 1.700000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][8], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][8], 0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][8], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][8], 1);

	Textdraws[sTextdraw_Mobile_TD][9] = TextDrawCreate(580.0, 417.000000, "<");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][9], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][9], 0.240000, 1.700000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][9], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][9], 0);
	//TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][9], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][9], (581.0+8.0), 10.0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][9], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][9], 1);

	Textdraws[sTextdraw_Mobile_TD][10] = TextDrawCreate(558.0, 417.000000, "+");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][10], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][10], 0.299998, 1.8);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][10], 0x00E500FF);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][10], 0);
	TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][10], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][10], 10.0, 10.0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][10], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][10], 1);

	Textdraws[sTextdraw_Mobile_TD][11] = TextDrawCreate(530.000000, 320.000000, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][11], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][11], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][11], 0.200000, 0.899999);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][11], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][11], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][11], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][11], 0);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][11], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][11], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][11], 596.000000, -117.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][11], 1);

	Textdraws[sTextdraw_Mobile_TD][12] = TextDrawCreate(529.000000, 328.000000, "Estado ~r~OFF");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][12], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][12], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][12], 0.230000, 1.399999);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][12], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][12], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][12], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][12], 0);
	//TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][12], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][12], 575.0, 15.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][12], 1);

	Textdraws[sTextdraw_Mobile_TD][13] = TextDrawCreate(529.000000, 348.000000, "");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][13], 255);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][13], 0.210000, 1.400000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][13], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][13], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][13], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][13], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][13], false);

	Textdraws[sTextdraw_Mobile_TD][14] = TextDrawCreate(530.0, 408.0, "G");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][14], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][14], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][14], 0.519999, 2.800001);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][14], 0xFFFFFFFF);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][14], 1);
	//TextDrawAlignment(Textdraws[sTextdraw_Mobile_TD][14], 2);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][14], (529.0+10.0), 15.0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][14], 1);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][14], 1);

	Textdraws[sTextdraw_Mobile_TD][15] = TextDrawCreate(530.0, 312.000000, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_TD][15], 255);
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][15], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][15], 0.270000, 1.50);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][15], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_Mobile_TD][15], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_Mobile_TD][15], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][15], 0);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][15], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_Mobile_TD][15], 255);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][15], 598.000000, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_TD][15], 0);

	Textdraws[sTextdraw_Mobile_TD][16] = TextDrawCreate(527.000000, 418.000000, "LD_SPAC:white");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][16], 4);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][16], 0.409999, 2.299999);
	TextDrawUseBox(Textdraws[sTextdraw_Mobile_TD][16], 1);
	TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][16], 75.000000, 1.000000);

	// Numbers
	Textdraws[sTextdraw_Mobile_Numbers][1] = CreateMobileTextdrawNumbers(530.0, 329.0, "1", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][2] = CreateMobileTextdrawNumbers(530.0+(28.0), 329.0, "2", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][3] = CreateMobileTextdrawNumbers(530.0+(57.0), 329.0, "3", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][4] = CreateMobileTextdrawNumbers(530.0, 329.0+(22.0), "4", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][5] = CreateMobileTextdrawNumbers(530.0+(28.0), 329.0+(22.0), "5", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][6] = CreateMobileTextdrawNumbers(530.0+(57.0), 329.0+(22.0), "6", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][7] = CreateMobileTextdrawNumbers(530.0, 329.0+(44.0), "7", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][8] = CreateMobileTextdrawNumbers(530.0+(28.0), 329.0+(44.0), "8", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][9] = CreateMobileTextdrawNumbers(530.0+(57.0), 329.0+(44.0), "9", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_Numbers][0] = CreateMobileTextdrawNumbers(530.0+(28.0), 329.0+(63.0), "0", 0.450, 2.099);

	Textdraws[sTextdraw_Mobile_TD][17] = CreateMobileTextdrawNumbers(530.0, 329.0+(62.0), "~r~X", 0.450, 2.099);
	Textdraws[sTextdraw_Mobile_TD][18] = CreateMobileTextdrawNumbers(530.0+(57.0), 329.0+(62.0), "~g~N", 0.450, 2.099);

	Textdraws[sTextdraw_Mobile_TD][19] = TextDrawCreate(530.0, 305.0, "Title");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TD][19], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TD][19], 0.29, 1.7);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TD][19], 0xFFFFFFFF);
	//TextDrawTextSize(Textdraws[sTextdraw_Mobile_TD][19], (578.0+8.0), 10.0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TD][19], 0);

	for(new i = 0; i < 3; i++)
	{
		Textdraws[sTextdraw_Mobile_Text][i] = TextDrawCreate(529.0, 388.0+(i*10.0), "");
		TextDrawBackgroundColor(Textdraws[sTextdraw_Mobile_Text][i], 255);
		TextDrawFont(Textdraws[sTextdraw_Mobile_Text][i], 1);
		TextDrawLetterSize(Textdraws[sTextdraw_Mobile_Text][i], 0.240000, 1.000000);
		TextDrawColor(Textdraws[sTextdraw_Mobile_Text][i], -1);
		TextDrawTextSize(Textdraws[sTextdraw_Mobile_Text][i], 529.0*(4.0), 8.0);
		TextDrawSetProportional(Textdraws[sTextdraw_Mobile_Text][i], 1);
		TextDrawSetShadow(Textdraws[sTextdraw_Mobile_Text][i], 0);
		TextDrawSetSelectable(Textdraws[sTextdraw_Mobile_Text][i], true);
	}
	TextDrawSetString(Textdraws[sTextdraw_Mobile_Text][0], "Mensajes");
	TextDrawSetString(Textdraws[sTextdraw_Mobile_Text][1], "Llamar");	
	TextDrawSetString(Textdraws[sTextdraw_Mobile_Text][2], "Borrar");

	Textdraws[sTextdraw_Mobile_TextAbove][0] = TextDrawCreate(530.000000, 298.000000, "");
	TextDrawFont(Textdraws[sTextdraw_Mobile_TextAbove][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_Mobile_TextAbove][0], 0.180000, 1.000000);
	TextDrawColor(Textdraws[sTextdraw_Mobile_TextAbove][0], 0xFFFFFFFF);
	//TextDrawTextSize(Textdraws[sTextdraw_Mobile_TextAbove][0], (578.0+8.0), 10.0);
	TextDrawSetShadow(Textdraws[sTextdraw_Mobile_TextAbove][0], 0);

	// Fin

	Textdraws[sTextdraw_TransScreen][0] = TextDrawCreate(0.000000, 0.000000, "__");
	TextDrawBackgroundColor(Textdraws[sTextdraw_TransScreen][0], 255);
	TextDrawFont(Textdraws[sTextdraw_TransScreen][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_TransScreen][0], 0.500000, 49.999984);
	TextDrawColor(Textdraws[sTextdraw_TransScreen][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_TransScreen][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_TransScreen][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_TransScreen][0], 1);
	TextDrawUseBox(Textdraws[sTextdraw_TransScreen][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_TransScreen][0], 255);
	TextDrawTextSize(Textdraws[sTextdraw_TransScreen][0], 640.000000, 21.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_TransScreen][0], 0);

	Textdraws[sTextdraw_TransScreen][1] = TextDrawCreate(320.000000, 328.000000, ConvertEncoding("Un tiempo después..."));
	TextDrawAlignment(Textdraws[sTextdraw_TransScreen][1], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_TransScreen][1], -1);
	TextDrawFont(Textdraws[sTextdraw_TransScreen][1], 3);
	TextDrawLetterSize(Textdraws[sTextdraw_TransScreen][1], 0.520000, 2.600000);
	TextDrawColor(Textdraws[sTextdraw_TransScreen][1], 9363455);
	TextDrawSetOutline(Textdraws[sTextdraw_TransScreen][1], 1);
	TextDrawSetProportional(Textdraws[sTextdraw_TransScreen][1], 1);
	TextDrawSetSelectable(Textdraws[sTextdraw_TransScreen][1], 0);

	//ConfirmBuy

	Textdraws[sTextdraw_BoxConfirmBuy][0] = TextDrawCreate(250.0, 356.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuy][0], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuy][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuy][0], 0.500000, 6.000000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuy][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuy][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuy][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuy][0], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuy][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuy][0], 0x00000088);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuy][0], 424.000000, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuy][0], 0);

	Textdraws[sTextdraw_BoxConfirmBuy][1] = TextDrawCreate(338.000000, 356.000000, "xdddddddddddddddddd");
	TextDrawAlignment(Textdraws[sTextdraw_BoxConfirmBuy][1], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuy][1], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuy][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuy][1], 0.340000, 2.000000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuy][1], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuy][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuy][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuy][1], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuy][1], 0);

	Textdraws[sTextdraw_BoxConfirmBuy][2] = TextDrawCreate(382.000000, 393.000000, "Comprar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuy][2], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuy][2], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuy][2], 0.259999, 1.299999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuy][2], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuy][2], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuy][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuy][2], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuy][2], 1);

	Textdraws[sTextdraw_BoxConfirmBuy][3] = TextDrawCreate(252.000000, 378.000000, "~g~$1,000,000");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuy][3], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuy][3], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuy][3], 0.320000, 1.799999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuy][3], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuy][3], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuy][3], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuy][3], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuy][3], 0);

	// Type 2
	Textdraws[sTextdraw_BoxConfirmBuyEx][0] = TextDrawCreate(253.000000, 343.000000, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 0.500000, 10.000000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][0], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 0x000000CC);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 416.000000, 2.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][0], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][1] = TextDrawCreate(253.000000, 340.000000, "Hola mueble~n~~g~$1,000");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 0.310000, 1.999999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 0x5EB5FFFF);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][1], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][2] = TextDrawCreate(253.000000, 376.000000, "Madera~n~Madera~n~Madera");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 0.190000, 1.100000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][2], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][2], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][3] = TextDrawCreate(258.0, 424.000000, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 0.500000, 0.899999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][3], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 255);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 295.000000, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][3], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][4] = TextDrawCreate(277.0, 422.000000, "Por defecto");
	TextDrawAlignment(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 0.170000, 1.200000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][4], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 1);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 10.0, 50.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][4], 1);

	Textdraws[sTextdraw_BoxConfirmBuyEx][5] = TextDrawCreate(385.000000, 421.000000, "Comprar");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 0.220000, 1.200000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][5], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 0);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 255);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 415.000000, 58.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][5], 1);

	Textdraws[sTextdraw_BoxConfirmBuyEx][6] = TextDrawCreate(258.0, 410.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 0.500000, 0.899999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][6], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 255);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 295.000000, 0.000000);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][6], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][7] = TextDrawCreate(277.0, 408.000000, "Por defecto");
	TextDrawAlignment(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 0.170000, 1.200000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][7], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 1);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 10.0, 50.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][7], 1);

	Textdraws[sTextdraw_BoxConfirmBuyEx][8] = TextDrawCreate(307.0, 424.0, "_");
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 0.470000, 0.899999);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][8], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 1);
	TextDrawUseBox(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 1);
	TextDrawBoxColor(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 255);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 343.000000, 0.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][8], 0);

	Textdraws[sTextdraw_BoxConfirmBuyEx][9] = TextDrawCreate(325.0, 422.000000, "Por defecto");
	TextDrawAlignment(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 2);
	TextDrawBackgroundColor(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 255);
	TextDrawFont(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 1);
	TextDrawLetterSize(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 0.170000, 1.200000);
	TextDrawColor(Textdraws[sTextdraw_BoxConfirmBuyEx][9], -1);
	TextDrawSetOutline(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 0);
	TextDrawSetProportional(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 1);
	TextDrawSetShadow(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 1);
	TextDrawTextSize(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 10.0, 50.0);
	TextDrawSetSelectable(Textdraws[sTextdraw_BoxConfirmBuyEx][9], 1);

	//

	CreateTextdrawInventoryGlobal();
	return 1;
}

stock Float:GetWeaponDamageAmount (itemid)
{
	new
	    Float: extra_damage = 1.0;
	switch (InvObjectData[itemid][E_INV_EXTRADATA])
	{
	    case 3:
	        extra_damage = 2.6;

	    case 5:
	        extra_damage = 3.6;

	    case 22:
	        extra_damage = 1.45;

		case 23:
		    extra_damage = 1.136;

		case 24:
		    extra_damage = 1.108;

		case 25:
		    extra_damage = 1.3;

		case 28:
		    extra_damage = 1.9; // 1.75

		case 29:
		    extra_damage = 1.33;

		case 30:
		    extra_damage = 1.9;

		case 31:
		    extra_damage = 1.7;

		case 32:
		    extra_damage = 2.0;

		case 33:
		    extra_damage = 2.0;

	}
	return extra_damage;
}