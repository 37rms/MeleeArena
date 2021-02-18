lastDamageTime = 0;

if (hasinterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	
};
enableEnvironment[false, true];

if ((!isServer) && (player != player)) then {waitUntil {player == player};};

setViewDistance 500;