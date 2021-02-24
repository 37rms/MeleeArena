player setDamage 0;
private _chosenWeapon = handgunWeapon player;
player removeWeapon _chosenWeapon;
private _chosenHmd = hmd player;
if(_chosenHmd != "") then {
	player unassignItem _chosenHmd;
	player removeItem _chosenHmd;
};
player allowDamage false;
player setVariable ["buttonCheckedLastTime", 0];
player setVariable ["isInArena", false];
player setVariable ["actionRegisterUnregisterId", -1];
player setVariable ["buttonCheckedLastTime", 0];
call MeleeArena_fnc_showRegisterAction;