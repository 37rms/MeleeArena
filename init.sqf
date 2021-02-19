lastDamageTime = 0;

if (hasinterface) then {
	waitUntil {!isnull player};
	player setCustomAimCoef 0.1;
	player enableFatigue false;
	player enableStamina false;
	
};
enableEnvironment[false, true];


//["<t color='#ff0000' size='5'>Střílíš vlastní, debile!</t>", "PLAIN", -1, true, true] remoteExec ["titleText", 0];

if ((!isServer) && (player != player)) then {waitUntil {player == player};};

setViewDistance 500;