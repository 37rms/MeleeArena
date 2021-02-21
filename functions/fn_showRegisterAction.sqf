if(isNil{player getVariable "isActionButtonRendered"}) then{
	player setVariable ["isActionButtonRendered", false];
};

if((time - LastTime) < 2 || (player getVariable "isActionButtonRendered") == true) exitWith{
	sleep 1;
	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	true;
};
if(getPlayerUID player in registeredPlayers) then {
	player addAction ["<t color='#FF0000'>Unregister</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		LastTime = time;
		player removeAction _actionId;
	 	[player] remoteExec ["MeleeArena_fnc_unregisterPlayer"];
	 	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	 	player setVariable ["isActionButtonRendered", false];
	}];
}else{
	player addAction ["<t color='#00FF00'>Register</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		LastTime = time;
		player removeAction _actionId;
	 	[player] remoteExec ["MeleeArena_fnc_registerPlayer"];
	 	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	 	player setVariable ["isActionButtonRendered", false];
	}];
};
player setVariable ["isActionButtonRendered", true];