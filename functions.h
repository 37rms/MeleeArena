class MeleeArena
{
	class InitializationFunctions
	{
		class initArena {file="functions\fn_initArena.sqf";};
		class initFight {file="functions\fn_initFight.sqf";};
	};
	class RegistrationFunctions
	{
		class registerPlayer {file="functions\fn_registerPlayer.sqf";};
		class unregisterPlayer {file="functions\fn_unregisterPlayer.sqf";};
		class showRegisterAction {file="functions\fn_showRegisterAction.sqf";};
	};
	class EventFunctions
	{
		class eventOnArsenalOpen {file="functions\fn_eventOnArsenalOpen.sqf";};
		class eventOnArsenalClose {file="functions\fn_eventOnArsenalClose.sqf";};
		class eventOnFightBegin {file="functions\fn_eventOnFightBegin.sqf";};
		class eventOnFightEnd {file="functions\fn_eventOnFightEnd.sqf";};
	};
	class ListFunctions
	{
		class addPlayerToList {file="functions\fn_addPlayerToList.sqf";};
		class removePlayerFromList {file="functions\fn_removePlayerFromList.sqf";};
	};
	class DisplayFunctions
	{
		class updatePlayerListDisplay {file="functions\fn_updatePlayerListDisplay.sqf";};
	};
};