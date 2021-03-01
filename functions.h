class MeleeArena
{
	class InitializationFunctions
	{
		file="functions";
		class initArena {};
		class initFight {};
	};
	class RegistrationFunctions
	{
		file="functions";
		class registerPlayer {};
		class unregisterPlayer {};
		class showRegisterAction {};
	};
	class EventFunctions
	{
		file="functions";
		class eventOnArsenalOpen {};
		class eventOnArsenalClose {};
		class eventOnFightBegin {};
		class eventOnFightEnd {};
	};
	class ListFunctions
	{
		file="functions";
		class addPlayerToList {};
		class removePlayerFromList {};
	};
	class DisplayFunctions
	{
		file="functions";
		class updatePlayerListDisplay {};
	};
	class DrawFunctions
	{
		file="functions";
		class drawIconAbovePlayers {};
	};
};