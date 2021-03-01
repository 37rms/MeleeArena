class MeleeArena
{
	class InitFunctions
	{
		file="functions\init";
		class initArena {};
		class initFight {};
	};
	class RegistrationFunctions
	{
		file="functions\registration";
		class registerPlayer {};
		class unregisterPlayer {};
		class showRegisterAction {};
	};
	class EventFunctions
	{
		file="functions\event";
		class eventOnArsenalOpen {};
		class eventOnArsenalClose {};
		class eventOnFightBegin {};
		class eventOnFightEnd {};
	};
	class ListFunctions
	{
		file="functions\list";
		class addPlayerToList {};
		class removePlayerFromList {};
	};
	class DisplayFunctions
	{
		file="functions\display";
		class updatePlayerListDisplay {};
	};
	class DrawFunctions
	{
		file="functions\draw";
		class drawIconAbovePlayers {};
	};
	class ConfigFunctions
	{
		file="functions\config";
		class getConfigArsenalEntry {};
	};
};