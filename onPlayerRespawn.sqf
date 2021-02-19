player setCustomAimCoef 0.1;
player enableFatigue false;
player enableStamina false;
remoteExec ["MeleeArena_fnc_eventOnFightEnd", player];