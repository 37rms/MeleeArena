lastDamageTime = 0;

if (hasInterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	
};
enableEnvironment[false, true];

systemChat "INIT";

if(isServer) then {
	systemChat "INIT SERVER";

	registeredPlayers = [];
	publicVariable "registeredPlayers";
	
	_meleeArenaSpawn1Marker = "meleeArenaSpawn1";
	_meleeArenaSpawn2Marker = "meleeArenaSpawn2";
	
	[
		_meleeArenaSpawn1Marker,
		_meleeArenaSpawn2Marker
	] call MeleeArena_fnc_initArena;
};