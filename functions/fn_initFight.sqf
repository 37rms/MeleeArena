private _firstSpawnpoint = _this select 0;
private _secondSpawnpoint = _this select 1;

isArenaEmpty = false;
publicVariable "isArenaEmpty";

//CLOSE ARSENAL
{
	if(ctrlIDD _x > 555) then{
		_x closeDisplay 2;
	};
} forEach allDisplays;


private _firstPlayer = selectRandom registeredPlayers;
registeredPlayers = registeredPlayers - [_firstPlayer];
private _secondPlayer = selectRandom registeredPlayers;
registeredPlayers = registeredPlayers - [_secondPlayer];
//private _secondPlayer = _firstPlayer; //i am so lonely :c
publicVariable "registeredPlayers";

private _alivePlayers = [_firstPlayer, _secondPlayer];

//Freeze players
{
	//freeze players and give them weapons
	remoteExec ["MeleeArena_fnc_eventOnFightBegin", _x];
	[_x, false] remoteExec ["enableSimulation"];
	true remoteExec ["disableUserInput", _x];
	_x setVariable ["originalPosition", getPos _x];
} forEach _alivePlayers;

//Teleport players
_firstPlayer setPos _firstSpawnpoint;
_firstPlayer setDir (_firstSpawnpoint getDir _secondSpawnpoint);
_secondPlayer setPos _secondSpawnpoint;
_secondPlayer setDir (_secondSpawnpoint getDir _firstSpawnpoint);

//Annoucement about fight
["<t valign='top' size='2'>Duel is starting</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 3;
["<t valign='top' size='2'>"+(name _firstPlayer)+" vs "+(name _secondPlayer)+"</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 3;
["<t valign='top' size='2'>3...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 1;
["<t valign='top' size='2'>2...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 1;
["<t valign='top' size='2'>1...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 1;
["<t valign='top' size='2'>Fight!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];

//Unfreeze players
{
	[_x, true] remoteExec ["enableSimulation"];
	false remoteExec ["disableUserInput", _x];
} forEach _alivePlayers;

while{count _alivePlayers == 2} do {
	{
		if(!alive _x) then {
			_alivePlayers = _alivePlayers - [_x];
		};
	} forEach _alivePlayers;
	sleep 0.5;
};

if(count _alivePlayers == 0) then{
	["<t valign='top' size='2'>Nobody survived!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
}
else{
	private _alivePlayer = _alivePlayers select 0;

	["<t valign='top' size='2'>"+(name _alivePlayer)+" wins!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
	
	//remove weapon
	remoteExec ["MeleeArena_fnc_eventOnFightEnd", _alivePlayer];
	
	sleep 3;
	_alivePlayer setPos (_alivePlayer getVariable "originalPosition");
};

isArenaEmpty = true;
publicVariable "isArenaEmpty";