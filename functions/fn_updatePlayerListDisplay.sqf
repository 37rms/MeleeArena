private _controlId = false;
private _display = false;
if(isNil{player getVariable "playerDisplayControlId";}) then {
	_display = findDisplay 46 ctrlCreate ["RscStructuredText", (random 100) + 1000];
	player setVariable ["playerDisplayControlId", ctrlIDC _display];
	_display ctrlSetBackgroundColor [0, 0, 0, 0.1];
	_display ctrlCommit 0;
	systemChat str "created a new display!";
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
		private _playerText = "";
		if(_x == getPlayerUID player) then{
			_playerText = "<t font='RobotoCondensedBold'>"+(name _player)+"</t>";
		}else{
			_playerText = (name _player);
		};
		_displayText = _displayText + _playerText + "<br/>";
	} forEach registeredPlayers;
};
systemChat str "updated display";
_display ctrlSetStructuredText parseText _displayText;
_display ctrlSetPosition [safeZoneX, safeZoneY, ctrlTextWidth _display, ctrlTextHeight _display];
_display ctrlCommit 0;