private _chosenWeapon = objNull;
if(isNil{player getVariable "chosenWeapon"}) then {
	private _weapons = "weapons" call MeleeArena_fnc_getConfigArsenalEntry;
	_chosenWeapon = selectRandom _weapons;
}
else{
	_chosenWeapon = player getVariable "chosenWeapon";
};
player addWeapon _chosenWeapon;
if(isNil{player getVariable "chosenHmd"}) then {
	private _chosenHmd = nil;
}
else{
	private _chosenHmd = player getVariable "chosenHmd";
	player addItem _chosenHmd;
	player assignItem _chosenHmd;
};
player allowDamage true;
player removeAction (player getVariable "actionRegisterUnregisterId");
player setVariable ["isInArena", true];