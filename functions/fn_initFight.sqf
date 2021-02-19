params [_firstSpawnpoint, _secondSpawnpoint];

isArenaEmpty = false;

_firstPlayer = selectRandom registeredPlayers;
registeredPlayers = registeredPlayers - [_firstPlayer];
_secondPlayer = selectRandom registeredPlayers;
registeredPlayers = registeredPlayers - [_secondPlayer];
//_secondPlayer = _firstPlayer; //i am so lonely :c

_firstPlayerStartPosition = getPos _firstPlayer;
_secondPlayerStartPosition = getPos _secondPlayer;

_firstPlayer setPos _firstSpawnpoint;
_firstPlayer setDir (_firstSpawnpoint getDir _secondSpawnpoint);
_secondPlayer setPos _secondSpawnpoint;
_secondPlayer setDir (_secondSpawnpoint getDir _firstSpawnpoint);

true remoteExec ["disableUserInput", [_firstPlayer, _secondPlayer]];

["<t valign='top' size='2'>Duel is starting</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
sleep 3;
["<t valign='top' size='2'>"+(name _firstPlayer)+" vs "+(name _secondPlayer)+"</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
sleep 3;
["<t valign='top' size='2'>3...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
sleep 1;
["<t valign='top' size='2'>2...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
sleep 1;
["<t valign='top' size='2'>1...</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];
sleep 1;
["<t valign='top' size='2'>Fight!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];

false remoteExec ["disableUserInput", [_firstPlayer, _secondPlayer]];

waitUntil{!alive _firstPlayer || !alive _secondPlayer};

if(alive _firstPlayer) then {
	_alivePlayer = _firstPlayer;
	_teleportTo = _firstPlayerStartPosition;
}
else {
	_alivePlayer = _secondPlayer;
	_teleportTo = _secondPlayerStartPosition;
};

["<t valign='top' size='2'>"+(name _alivePlayer)+" wins!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", -2];

sleep 4;

isArenaEmpty = true;
_alivePlayer setPos _teleportTo;