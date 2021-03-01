lastDamageTime = 0;

private _items = "items" call MeleeArena_fnc_getConfigArsenalEntry;
private _weapons = "weapons" call MeleeArena_fnc_getConfigArsenalEntry;

if (hasInterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	remoteExec ["MeleeArena_fnc_eventOnFightEnd", player];
	[arsenal_npc, _items + _weapons] call ace_arsenal_fnc_initBox;
};
enableEnvironment[false, true];
if(isServer) then {
	registeredPlayers = [];
	publicVariable "registeredPlayers";
	
	private _meleeArenaSpawn1Marker = "meleeArenaSpawn1";
	private _meleeArenaSpawn2Marker = "meleeArenaSpawn2";
	[
		_meleeArenaSpawn1Marker,
		_meleeArenaSpawn2Marker
	] call MeleeArena_fnc_initArena;
};


