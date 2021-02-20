//private _firstSpawnpoint = _this select 0;
//private _secondSpawnpoint = _this select 1;
params ["_firstSpawnpoint", "_secondSpawnpoint"];

isArenaEmpty = false;
publicVariable "isArenaEmpty";

//CLOSE ARSENAL
{
	if(ctrlIDD _x > 555) then{
		_x closeDisplay 2;
	};
} forEach allDisplays;

private _uids = [];
private _weights = [];


[PlayerList, {
	if (_key in registeredPlayers) then {
		_uids set [count _uids, _key];
		_weights set [count _weights, _value];
	};
}] call CBA_fnc_hashEachPair;


private _firstPlayer = _uids selectRandomWeighted _weights;
private _index = _uids find _firstPlayer;
_uids deleteAt _index;
_weights deleteAt _index;

private _players = call BIS_fnc_listPlayers;
private _firstPlayerObject = ((_players select {getPlayerUID _x isEqualTo _firstPlayer}) select 0);

registeredPlayers = registeredPlayers - [_firstPlayer];

private _secondPlayer = _uids selectRandomWeighted _weights;

private _secondPlayerObject = ((_players select {getPlayerUID _x isEqualTo _secondPlayer}) select 0);

registeredPlayers = registeredPlayers - [_secondPlayer];

private _firstPlayerWeight = [PlayerList, _firstPlayer] call CBA_fnc_hashGet;
if (_firstPlayerWeight > 0.1) then {
	[PlayerList, _firstPlayer, (_firstPlayerWeight - 0.1)] call CBA_fnc_hashSet;
};

private _secondPlayerWeight = [PlayerList, _secondPlayer] call CBA_fnc_hashGet;
if (_secondPlayerWeight > 0.1) then {
	[PlayerList, _secondPlayer, (_secondPlayerWeight - 0.1)] call CBA_fnc_hashSet;
};

[PlayerList, {
	if (_value < 1 && _key != _firstPlayer && _key != _secondPlayer) then {
		[PlayerList, _key, (_value + 0.1)] call CBA_fnc_hashSet;
	};
}] call CBA_fnc_hashEachPair;




//private _secondPlayer = _firstPlayer; //i am so lonely :c
publicVariable "registeredPlayers";

private _alivePlayers = [_firstPlayerObject, _secondPlayerObject];

//Freeze players
{
	//freeze players and give them weapons
	remoteExec ["MeleeArena_fnc_eventOnFightBegin", _x];
	[_x, false] remoteExec ["enableSimulation"];
	true remoteExec ["disableUserInput", _x];
	_x setVariable ["originalPosition", getPosASL _x];
} forEach _alivePlayers;

//Teleport players
private _angle = (_firstPlayerObject getDir _secondPlayerObject);
_firstPlayerObject setPos _firstSpawnpoint;
_firstPlayerObject setDir _angle;
_secondPlayerObject setPos _secondSpawnpoint;
_secondPlayerObject setDir -_angle;

//Annoucement about fight
["<t valign='top' size='2'>Duel is starting</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
sleep 3;
["<t valign='top' size='2'>"+(name _firstPlayerObject)+" vs "+(name _secondPlayerObject)+"</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText"];
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
	
	sleep 3;
	_alivePlayer setPosASL (_alivePlayer getVariable "originalPosition");
	
	//remove weapon
	remoteExec ["MeleeArena_fnc_eventOnFightEnd", _alivePlayer];
};

isArenaEmpty = true;
publicVariable "isArenaEmpty";