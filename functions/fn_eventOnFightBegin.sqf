if(isNil{player getVariable "chosenWeapon"}) then {
	private _chosenWeapon = "AM_WBK_ChinOfSword";
}
else{
	private _chosenWeapon = player getVariable "chosenWeapon";
	player addWeapon _chosenWeapon;
};
if(isNil{player getVariable "chosenHmd"}) then {
	private _chosenHmd = nil;
}
else{
	private _chosenHmd = player getVariable "chosenHmd";
	player addItem _chosenHmd;
	player assignItem _chosenHmd;
};