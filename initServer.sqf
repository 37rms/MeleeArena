setDate [2279, 2, 25, 11, 13];

PlayerList = [] call CBA_fnc_hashCreate;

onPlayerDisconnected {
	private _uid = _this select 1;
	[_uid] call MeleeArena_fnc_removePlayerFromList;
	[_uid] remoteExec ["MeleeArena_fnc_unregisterPlayer"];
};