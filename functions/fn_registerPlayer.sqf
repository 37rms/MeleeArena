params ["_player"];
private _playerUid = getPlayerUID _player;

if(_playerUid in registeredPlayers) exitWith{
	["<t valign='top' size='2' color='#FF0000'>You are already registered!</t>", -1, -0.3] remoteExec ["BIS_fnc_dynamicText", _player];
};

registeredPlayers = registeredPlayers + [_playerUid];
publicVariable "registeredPlayers";

[] remoteExec ["MeleeArena_fnc_updatePlayerListDisplay"];