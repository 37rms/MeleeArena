if(!alive player) exitWith{
	false
};

private _wasRecentlyChecked = ((time - (player getVariable "buttonCheckedLastTime")) < 2);
private _isRegisterActionSet = (player getVariable "actionRegisterUnregisterId") > 0;
private _isInArena = ((player getVariable "isInArena") == true);
if(_wasRecentlyChecked || _isRegisterActionSet || _isInArena) exitWith{
	sleep 1;
	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	true;
};
private _actionId = -1;
if(getPlayerUID player in registeredPlayers) then {
	_actionId = player addAction ["<t color='#FF0000'>Unregister</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		player setVariable ["buttonCheckedLastTime", time];
		player removeAction _actionId;
	 	[player] remoteExec ["MeleeArena_fnc_unregisterPlayer"];
	 	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	 	player setVariable ["actionRegisterUnregisterId", -1];
	}];
}else{
	_actionId = player addAction ["<t color='#00FF00'>Register</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		player setVariable ["buttonCheckedLastTime", time];
		player removeAction _actionId;
	 	[player] remoteExec ["MeleeArena_fnc_registerPlayer"];
	 	[] remoteExec ["MeleeArena_fnc_showRegisterAction", player];
	 	player setVariable ["actionRegisterUnregisterId", -1];
	}];
};
player setVariable ["actionRegisterUnregisterId", _actionId];