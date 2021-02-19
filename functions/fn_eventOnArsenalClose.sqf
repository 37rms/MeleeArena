private _chosenSecondaryWeapon = handgunWeapon player;
if(_chosenSecondaryWeapon != "") then {
	player setVariable ["chosenWeapon", _chosenSecondaryWeapon];
	player removeWeapon _chosenSecondaryWeapon;
	private _weaponName = getText (configFile >> "CfgWeapons" >> _chosenSecondaryWeapon >> "DisplayName");
	"Your weapon of choice: "+_weaponName remoteExec ["hint", player];
};

private _chosenHmd = hmd player;
player setVariable ["chosenHmd", _chosenHmd];
if(_chosenHmd != "") then {
	player unassignItem _chosenHmd;
	player removeItem _chosenHmd;
};