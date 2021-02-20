if(isNil{player getVariable "chosenWeapon"}) then {
	private _chosenWeapon = "AM_WBK_ChinOfSword";
}
else{
	private _chosenWeapon = player getVariable "chosenWeapon";
	player addWeapon _chosenWeapon;
	//TODO: REMOVE
	_magazines = getArray (configFile >> "CfgWeapons" >> _chosenWeapon >> "magazines");
	for "_i" from 1 to 2 do {player addMagazine (_magazines select 0);};
};
if(isNil{player getVariable "chosenHmd"}) then {
	private _chosenHmd = nil;
}
else{
	private _chosenHmd = player getVariable "chosenHmd";
	player addItem _chosenHmd;
	player assignItem _chosenHmd;
};