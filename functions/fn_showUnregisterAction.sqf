player addAction ["<t color='#FF0000'>Unregister</t>", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	player removeAction _actionId;
 	[player] remoteExec ["MeleeArena_fnc_unregisterPlayer", 2];
 	[] remoteExecCall ["MeleeArena_fnc_showRegisterAction", player];
}];