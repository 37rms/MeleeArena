params ["_player"];
private _playerUid = objNull;
if(!isServer) exitWith{};

if(typeName _player == "OBJECT") then{
	_playerUid = getPlayerUID _player;
}
else{
	_playerUid = _player;
};

registeredPlayers = registeredPlayers + [_playerUid];
publicVariable "registeredPlayers";

[] remoteExec ["MeleeArena_fnc_updatePlayerListDisplay"];