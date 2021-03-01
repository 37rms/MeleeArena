params ["_alivePlayers"];

alivePlayers = _alivePlayers;
publicVariable "alivePlayers";

addMissionEventHandler ["EachFrame", {
	params ["_eventHandler"];
	if(isArenaEmpty) exitWith{removeMissionEventHandler ["EachFrame", _thisEventHandler]; };
	
	{
		drawIcon3D [
			"",
			[1,1,1,1],
			(ASLToAGL getPosASL _x) vectorAdd [0,0,6],
			5,
			5,
			0,
			name _x,
			true,
			0.05,
			"PuristaMedium",
			"center",
			true
		];
	} forEach alivePlayers;
}];