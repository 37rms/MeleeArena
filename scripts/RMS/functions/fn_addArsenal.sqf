params["_object"];
clearItemCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearBackpackCargoGlobal _object;
_object addaction ["<img image='\rms37pack\icon\37rms_logo.paa' /> <t color='#FFEE55'>Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }];
[_object, true, true] call ace_arsenal_fnc_initBox;
_object addaction ["<img image='\rms37pack\icon\37rms_logo.paa' /> <t color='#FFEE55'>ACE Arsenal</t>", { [player, player, true] call ace_arsenal_fnc_openBox; }];  