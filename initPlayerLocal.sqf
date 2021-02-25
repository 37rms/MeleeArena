waitUntil {player == player};
waitUntil{!isNull player};
waituntil {!isnull (finddisplay 46)};
sleep 6;
[getPlayerUID player] remoteExec ["MeleeArena_fnc_addPlayerToList", 2];
setHitOrDeflect = {
_unit = _this select 0;
_unitToPlay = _this select 1;
_animation = _this select 2;
_IMS_playerTargetTrigger = createTrigger ["EmptyDetector", getPosATL _unitToPlay, false]; 
_IMS_playerTargetTrigger setTriggerArea [0.9, 1.7, 0, true]; 
_IMS_playerTargetTrigger attachTo [_unitToPlay, [0,0.8,0]];
{ 
if ((alive _x) and !(_x == _unitToPlay) and (alive _unitToPlay) and (simulationEnabled _unitToPlay) and (animationState _unitToPlay == _animation)) then {
_isBehindGeometry = lineIntersects [ eyePos _unitToPlay, eyePos _x, _unitToPlay, _x];
_inTrigger = [_IMS_playerTargetTrigger, _x] call BIS_fnc_inTrigger;
if ((_isBehindGeometry) or !(_inTrigger)) then {
}else{
if (((_unitToPlay worldToModel (_x modelToWorld [0, 0, 0])) select 1) < 0) then 
{}else{
_zmFaces = ["RyanZombieFace1","RyanZombieFace2","RyanZombieFace3","RyanZombieFace4","RyanZombieFace5","RyanZombieFace6","RyanZombieFace1_Glowing","RyanZombieFace2_Glowing","RyanZombieFace3_Glowing","RyanZombieFace4_Glowing","RyanZombieFace5_Glowing","RyanZombieFace6_Glowing"];
if (face _x in _zmFaces) exitWith {
_arr = parseSimpleArray getText (configFile >> "CfgWeapons" >> handgunWeapon _unitToPlay >> "IMS_Melee_Param_SoundsOnHit");  
_rndSnd = selectRandom _arr;  
[_x, _rndSnd, 50, 3] execVM "\WebKnight_StarWars_Mechanic\createSoundGlobal.sqf";  
_x setDamage 1;
};
if ((_x getVariable "actualSwordBlock" == 1)) then {
if (((_x worldToModel (_unitToPlay modelToWorld [0, 0, 0])) select 1) < 0) then {
_arr = parseSimpleArray getText (configFile >> "CfgWeapons" >> handgunWeapon _unitToPlay >> "IMS_Melee_Param_SoundsOnHit");  
_rndSnd = selectRandom _arr;  
[_x, _rndSnd, 50, 3] execVM "\WebKnight_StarWars_Mechanic\createSoundGlobal.sqf";  
[_x, _unitToPlay] remoteExec ["createDeathS", _x, false];  
}else{
if ((animationState _x == "starWars_force_landRoll") or (animationState _x == "starWars_force_landRoll_b") or (animationState _x == "starWars_landRoll") or (animationState _x == "starWars_landRoll_b")) exitWith {};
if (hmd _x in IMS_Sheilds) exitWith {
[_x, _unitToPlay] remoteExec ["concentrationMinus", _x, false];  
_rndSnd = selectRandom ["sword_on_wood_shield01","sword_on_wood_shield02","sword_on_wood_shield03"];  
[_x, _rndSnd, 50, 5] execVM "\WebKnight_StarWars_Mechanic\createSoundGlobal.sqf";  
};
_arr = parseSimpleArray getText (configFile >> "CfgWeapons" >> handgunWeapon _unitToPlay >> "IMS_Melee_Param_SoundsOnBlock");  
_rndSnd = selectRandom _arr;  
[_x, _rndSnd, 50, 5] execVM "\WebKnight_StarWars_Mechanic\createSoundGlobal.sqf";  
[_x, _unitToPlay] remoteExec ["concentrationMinus", _x, false];  
_swordSparksobject = "Land_HelipadEmpty_F" createVehicle position _x;
_swordSparksobject attachTo [_x, [0, 0.6, 0], "head"]; 
_swordSparks = "#particlesource" createVehicle (getPosATL _swordSparksobject);
_swordSparks attachTo [_swordSparksobject, [0,0,0]];
_swordSparks setParticleCircle [0, [0, 0, 0]];
_swordSparks setParticleRandom [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_swordSparks setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 30, 4.9, 0, [0.2, 0.2, 0.1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _swordSparks];
_swordSparks setDropInterval 0.001;
sleep 0.1;
deleteVehicle _swordSparks;
deleteVehicle _swordSparksobject;
};
}else{
_arr = parseSimpleArray getText (configFile >> "CfgWeapons" >> handgunWeapon _unitToPlay >> "IMS_Melee_Param_SoundsOnHit");  
_rndSnd = selectRandom _arr;  
[_x, _rndSnd, 50, 3] execVM "\WebKnight_StarWars_Mechanic\createSoundGlobal.sqf";  
[_x, _unitToPlay] remoteExec ["createDeathS", _x, false];  
};
};
};
};
} forEach nearestObjects [getPosATL  _unitToPlay, ["MAN"], 2.5];
sleep 1;
deleteVehicle _IMS_playerTargetTrigger;
};

playSoundOnUnit = {
	params["_unit", "_sound"];

	private _dummy = "#particlesource" createVehicleLocal ASLToAGL getPosWorld _unit;
	_dummy say3D _sound;
	_dummy spawn {
		sleep 5; // at least the length of your sound
		deleteVehicle _this;
	};
}

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

	private _hitSounds = [
		"playerhit1",
		"playerhit2",
		"playerhit3"
	];
	private _soundToPlay = selectRandom _hitSounds;
	[_unit, _soundToPlay] remoteExec ["playSoundOnUnit"];
}];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	private _deathSounds = [
		"playerdeath1",
		"playerdeath2",
		"playerdeath3"
	];
	private _soundToPlay = selectRandom _deathSounds;
	[_unit, _soundToPlay] remoteExec ["playSoundOnUnit"];
}];

player setVariable ["buttonCheckedLastTime", 0];
player setVariable ["isInArena", false];
player setVariable ["actionRegisterUnregisterId", -1];
player setVariable ["buttonCheckedLastTime", 0];
call MeleeArena_fnc_updatePlayerListDisplay;
[missionNamespace, "arsenalOpened", MeleeArena_fnc_eventOnArsenalOpen] call BIS_fnc_addScriptedEventHandler;
[missionNamespace, "arsenalClosed", MeleeArena_fnc_eventOnArsenalClose] call BIS_fnc_addScriptedEventHandler;