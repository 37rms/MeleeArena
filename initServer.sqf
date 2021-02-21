setDate [2279, 2, 25, 11, 13];

PlayerList = [] call CBA_fnc_hashCreate;

onPlayerDisconnected {
	[_uid] call MeleeArena_fnc_removePlayerFromList;
	[_uid] remoteExec ["MeleeArena_fnc_unregisterPlayer"];
};