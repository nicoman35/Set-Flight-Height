[
	"NIC_SFH_MinFlightHeight",																						// internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER",   																									// setting type
	[format[localize "STR_MIN_NIC_FLIGHT_HEIGHT"], format[localize "STR_MIN_NIC_FLIGHT_HEIGHT_TIP"]],				// [setting name, tooltip]
	format[localize "STR_NIC_TITLE_NIC_FLIGHT_HEIGHT"], 															// pretty name of the category where the setting can be found. Can be stringtable entry.
	[20, 200, 20, 0],																								// [_min, _max, _default, _trailingDecimals]
	true																											// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;
[
	"NIC_SFH_MaxFlightHeight",
	"SLIDER",
	[format[localize "STR_MAX_NIC_FLIGHT_HEIGHT"], format[localize "STR_MAX_NIC_FLIGHT_HEIGHT_TIP"]],
	format[localize "STR_NIC_TITLE_NIC_FLIGHT_HEIGHT"],
	[500, 25000, 10000, 0],
	true
] call CBA_fnc_addSetting;