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
	class NIC {
		class base {
			class InitFlightHeight {
				preInit = 1;
				file="\NICflightHeight\scripts\init.sqf";
			};
		};
	};
};