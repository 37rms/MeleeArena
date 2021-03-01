_meleeArenaSpawn1Marker = _this select 0;
_meleeArenaSpawn2Marker = _this select 1;
_firstSpawnpoint = getMarkerPos _meleeArenaSpawn1Marker;
_secondSpawnpoint = getMarkerPos _meleeArenaSpawn2Marker;

isArenaEmpty = true;
publicVariable "isArenaEmpty";

private _allPlayers = call BIS_fnc_listPlayers;

while{count _allPlayers > 0} do {
	_allPlayers = call BIS_fnc_listPlayers;
	if(isArenaEmpty) then {
		private _aliveRegistered = _allPlayers select { alive _x && getPlayerUID _x in registeredPlayers};
		AliveRegistered = [];
		{
			AliveRegistered pushBack (getPlayerUID _x);
		} forEach _aliveRegistered;
		
		//TODO: REMOVE DEBUG!
		if(count AliveRegistered < 2) then {
			["<t valign='top' size='1'>Not enough of alive registered players to start a duel!</t>", -1, safeZoneY - (safeZoneY * 0.15)] remoteExec ["BIS_fnc_dynamicText"];
		}
		else {
			[_firstSpawnpoint, _secondSpawnpoint] call MeleeArena_fnc_initFight;
		};
	};
	sleep 10;
};