private _controlId = false;
private _display = false;
if(isNil{player getVariable "playerDisplayControlId";}) then {
	_display = findDisplay 46 ctrlCreate ["RscStructuredText", 42069];
	player setVariable ["playerDisplayControlId", ctrlIDC _display];
	_display ctrlSetBackgroundColor [0, 0, 0, 0.1];
	_display ctrlCommit 0;
}else{
	_controlId = player getVariable "playerDisplayControlId";
	_display = findDisplay 46 displayCtrl _controlId;
};
private _displayText = "<t size='2'>Registered players:</t><br/>";
if(count registeredPlayers == 0) then {
	_displayText = _displayText + "<t color='#FF0000'>None</t>";
}else{
	{
		private _player = _x call BIS_fnc_getUnitByUID;
		_displayText = _displayText + (name _player) + "<br/>";
	} forEach registeredPlayers;
};
_display ctrlSetStructuredText parseText _displayText;
_display ctrlSetPosition [safeZoneX, safeZoneY, ctrlTextWidth _display, ctrlTextHeight _display];
_display ctrlCommit 0;