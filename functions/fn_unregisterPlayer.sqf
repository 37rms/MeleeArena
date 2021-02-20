params ["_player"];
private _playerUid = getPlayerUID _player;

registeredPlayers = registeredPlayers - [_playerUid];
publicVariable "registeredPlayers";
[] remoteExec ["MeleeArena_fnc_showRegisterAction", _player];