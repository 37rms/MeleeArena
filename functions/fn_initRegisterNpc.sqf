_registerNpcName = _this select 0;
_registerNpc = missionNamespace getVariable _registerNpcName;
_registerNpc addAction ["<t color='#00FF00'>Register</t>", {[_this select 1] call MeleeArena_fnc_registerPlayer}]