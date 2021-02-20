if (getPlayerUID player in registeredPlayers) then {
	ActionId = player addAction ["<t color='#FF0000'>Unregister</t>", {
		if (time - LastTime < 5) 
			exitWith{ 
				call MeleeArena_fnc_showRegisterAction;
				true; 
				};
			LastTime = time; 
			player removeAction ActionId;
		 	[player] remoteExec ["MeleeArena_fnc_unregisterPlayer", 2];
		 }];
} else {
		ActionId = player addAction ["<t color='#00FF00'>Register</t>", {
		if (time - LastTime < 5) 
			exitWith{ 
				call MeleeArena_fnc_showRegisterAction;
				true; 
				};
			LastTime = time; 
			player removeAction ActionId;
		 	[player] remoteExec ["MeleeArena_fnc_registerPlayer", 2];
		 }];
};