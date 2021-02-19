_meleeArenaSpawn1Marker = _this select 0;
_meleeArenaSpawn2Marker = _this select 1;
_firstSpawnpoint = getMarkerPos _meleeArenaSpawn1Marker;
_secondSpawnpoint = getMarkerPos _meleeArenaSpawn2Marker;

isArenaEmpty = true;
publicVariable "isArenaEmpty";

_allPlayers = call BIS_fnc_listPlayers;
while{count _allPlayers > 0} do {
	if(isArenaEmpty) then {
		if(count registeredPlayers < 2) then {
			["<t valign='top' size='2'>Not enough registered players to start a duel!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
		}
		else {
			[_firstSpawnpoint, _secondSpawnpoint] call MeleeArena_fnc_initFight;
		};
	};
	sleep 40;
};