player setVariable ["wasPlayerRegistered", (getPlayerUID player) in registeredPlayers];
[player] remoteExec ["MeleeArena_fnc_unregisterPlayer"];