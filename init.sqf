lastDamageTime = 0;

if (hasInterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	remoteExec ["MeleeArena_fnc_eventOnFightEnd", player];
	
	//Because WebKnight said so (melee system inits after a second so we need a delay)
	sleep 2;
	IMS_ISBluntWeaponKiils = true;
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