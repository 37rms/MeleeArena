setDate [2279, 2, 25, 11, 13];

PlayerList = [] call CBA_fnc_hashCreate;

onPlayerDisconnected {
	params["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	[_uid] call MeleeArena_fnc_removePlayerFromList;
	[_uid] remoteExec ["MeleeArena_fnc_unregisterPlayer"];
};