#include "ui\defines.hpp"
#include "ui\dialogs.hpp"
class CfgPatches {
	class NICflightHeight {
		units[]				= {};
		weapons[]			= {};
		requiredVersion		= 1;
		requiredAddons[]	= {};
	};
};
class CfgFunctions {
	class NIC_SFH {
		class Functions {
			file="\NICflightHeight\functions";
			class InitFlightHeight {
				preInit = 1;
				file="\NICflightHeight\functions\fn_InitFlightHeight.sqf";
			};
			class AddSetFlightHeightAction {};
			class ChangeLoiterSpeed {};
			class DialogSaveFlightHeight {};
			class IsUnitAutorized {};
			class OpenFlightHeightDiaolog {};
		};
	};
};
class Extended_PreInit_EventHandlers {
	class NIC_SFH {
		init = "call compile preprocessFileLineNumbers '\NICflightHeight\scripts\XEH_preInit.sqf'"; // CBA options integration
	};
};
class Extended_PostInit_EventHandlers {
	class NIC_SFH 	{
		init="call compile preprocessFileLineNumbers '\NICflightHeight\scripts\XEH_postInit.sqf'"; // CBA key binding integration
	};
};