#include <a_samp>

#define MAX_POINTS_RACE 50
#define MAX_CHECKPOINTRACE 10

enum RacingDataEnum{
	/*idrace,*/
	numracepoint,
	Float:RaceX[MAX_POINTS_RACE],
	Float:RaceY[MAX_POINTS_RACE],
	Float:RaceZ[MAX_POINTS_RACE]
};
new RacingDataVar[MAX_CHECKPOINTRACE][RacingDataEnum];

stock CreateRacePlayer(idrace)
{	
	
	new filename[50];
	format(filename, sizeof(filename), "Racing/CPRace/race_%d.txt", idrace);
	new File:cFile = fopen(filename, io_read);
	if(cFile)
	{
		new line[128], id;
		while(fread(cFile,line,sizeof(line),false))
		{
			new Float:X, Float:Y, Float:Z;
			sscanf(line, "p<,>fff", X, Y, Z);
			id++;
			RacingDataVar[idrace][RaceX][id] = X;
			RacingDataVar[idrace][RaceY][id] = Y;
			RacingDataVar[idrace][RaceZ][id] = Z;
			RacingDataVar[idrace][numracepoint] = id;
		}
	}
}

stock CreateRacePlayerEx(idrace, const name[])
{	
	
	new filename[50];
	format(filename, sizeof(filename), "Racing/%s_%d.txt", name, idrace);
	new File:cFile = fopen(filename, io_read);
	if(cFile)
	{
		new line[128], id;
		while(fread(cFile,line,sizeof(line),false))
		{
			new Float:X, Float:Y, Float:Z;
			sscanf(line, "p<,>fff", X, Y, Z);
			id++;
			RacingDataVar[idrace][RaceX][id] = X;
			RacingDataVar[idrace][RaceY][id] = Y;
			RacingDataVar[idrace][RaceZ][id] = Z;
			RacingDataVar[idrace][numracepoint] = id;	/*printf("%s_%d", name, idrace);*/
		}

	}
/*	printf("%s", filename);*/
}


stock SetPlayerCPRace(playerid, idrace, type, OldCP, NextCP)
{
	SetPlayerRaceCheckpoint(playerid,type,RacingDataVar[idrace][RaceX][OldCP],RacingDataVar[idrace][RaceY][OldCP],RacingDataVar[idrace][RaceZ][OldCP],RacingDataVar[idrace][RaceX][NextCP],RacingDataVar[idrace][RaceY][NextCP],RacingDataVar[idrace][RaceZ][NextCP],7);
}
stock SetPlayerCPN(playerid, idrace, OldCP, Float:range)
{
	SetPlayerCheckpoint(playerid,RacingDataVar[idrace][RaceX][OldCP],RacingDataVar[idrace][RaceY][OldCP],RacingDataVar[idrace][RaceZ][OldCP],range);
}

stock GetProgressRacePlayer(idrace)
{
	return RacingDataVar[idrace][numracepoint];
}

stock PlayerToPointRace(playerid, Float:range, idrace, CP)
{
	if (IsPlayerInRangeOfPoint(playerid, range, RacingDataVar[idrace][RaceX][CP],RacingDataVar[idrace][RaceY][CP],RacingDataVar[idrace][RaceZ][CP])) 
	{
		return 1;
	}
	return 0;
}

stock SetPlayerSaveCP(playerid, idrace, CP, idcp)
{
	SetPlayerCP(playerid, RacingDataVar[idrace][RaceX][CP],RacingDataVar[idrace][RaceY][CP],RacingDataVar[idrace][RaceZ][CP], idcp);
	return 1;
}