class MeleeArena
{
	class InitializationFunctions
	{
		class initArena {file="functions\fn_initArena.sqf";};
		class initRegisterNpc {file="functions\fn_initRegisterNpc.sqf";};
		class initFight {file="functions\fn_initFight.sqf";};
	};
	class RegistrationFunctions
	{
		class registerPlayer {file="functions\fn_registerPlayer.sqf";};
	};
	class EventFunctions
	{
		class eventOnArsenalClose {file="functions\fn_eventOnArsenalClose.sqf";};
		class eventOnFightBegin {file="functions\fn_eventOnFightBegin.sqf";};
		class eventOnFightEnd {file="functions\fn_eventOnFightEnd.sqf";};
	};
	class ListFunctions
	{
		class addPlayerToList {file="functions\fn_addPlayerToList.sqf";};
		class removePlayerFromList {file="functions\fn_removePlayerFromList.sqf";};
	};
};