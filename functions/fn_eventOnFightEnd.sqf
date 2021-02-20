[objNull, player] call ace_medical_treatment_fnc_fullHeal;
private _chosenWeapon = handgunWeapon player;
player removeWeapon _chosenWeapon;
private _chosenHmd = hmd player;
if(_chosenHmd != "") then {
	player unassignItem _chosenHmd;
	player removeItem _chosenHmd;
};
player allowDamage false;