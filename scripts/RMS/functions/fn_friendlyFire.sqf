params ["_player"];


if (isNil "lastDamageTime") then { lastDamageTime = 0; };

_player addEventHandler ["HandleDamage",
    {
    params ["_victim", "_selection", "_damage", "_attacker", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    _currentTime = diag_tickTime;
    if(_currentTime - lastDamageTime > 0.05 && alive _victim && side _victim == side _attacker && name _attacker != name _victim) then {
        lastDamageTime = _currentTime;
        format["%1 shot %2 - BLUE ON BLUE!", name _attacker, name _victim] remoteExec ["systemChat", 0];
        if(isPlayer _attacker) then {
        	[["<t color='#ff0000' size='5'>Střílíš vlastní, debile!</t>", "PLAIN", -1, true, true]] remoteExec ["titleText", (call BIS_fnc_listPlayers) select {getPlayerUID _x isEqualTo getPlayerUID _attacker}];
        };
        };


}];
