if((player getVariable "registerButtonCreated") == true) exitWith{
	false
};
player addAction ["<t color='#00FF00'>Register</t>", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	player removeAction _actionId;
	player setVariable ["registerButtonCreated", false];
 	[player] remoteExec ["MeleeArena_fnc_registerPlayer", 2];
 	[] remoteExecCall ["MeleeArena_fnc_showUnregisterAction", player];
}];
player setVariable ["registerButtonCreated", true];