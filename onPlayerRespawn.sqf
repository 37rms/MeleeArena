waitUntil{alive player};
player setCustomAimCoef 0.1;
player enableFatigue false;
player enableStamina false;
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
call MeleeArena_fnc_eventOnFightEnd;