if(isNil{player getVariable "chosenWeapon"}) then {
	private _chosenWeapon = "AM_WBK_ChinOfSword";
}
else{
	private _chosenWeapon = player getVariable "chosenWeapon";
	player addWeapon _chosenWeapon;
	//TODO: REMOVE
	private _magazines = getArray (configFile >> "CfgWeapons" >> _chosenWeapon >> "magazines");
	private _magazine = _magazines select 0;
	player addMagazine _magazine;
	player addHandgunItem _magazine;
};
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