lastDamageTime = 0;
if (hasinterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	ForbiddenItems = 
	[
		"HLC_wp_M134Painless",
		"HLC_pistol_dl44"
	];

	removeForbiddenItems = {
		{
			player removeItem _x;
			player removeWeapon _x;
		} forEach ForbiddenItems;
	};


	["ace_arsenal_displayClosed", removeForbiddenItems] call CBA_fnc_addEventHandler;

	[missionNamespace, "arsenalClosed", removeForbiddenItems] call BIS_fnc_addScriptedEventHandler;
	
};
enableEnvironment[false, true];

if ((!isServer) && (player != player)) then {waitUntil {player == player};};

setViewDistance 500;