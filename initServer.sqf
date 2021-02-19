setDate [2279, 2, 25, 11, 13];

registeredPlayers = [];
publicVariable "registeredPlayers";

_registerNpcName = "registerNpc";
_meleeArenaSpawn1Marker = "meleeArenaSpawn1";
_meleeArenaSpawn2Marker = "meleeArenaSpawn2";

[
	_registerNpcName,
	_meleeArenaSpawn1Marker,
	_meleeArenaSpawn2Marker
] call MeleeArena_fnc_initArena;