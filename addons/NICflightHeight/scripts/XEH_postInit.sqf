[
	format[localize "STR_NIC_TITLE_NIC_FLIGHT_HEIGHT"],											// name of mod
	"NIC_SFH_lowerSpeed",																		// id of the key action
	[format[localize "STR_LOITER_SPEED_LOWER"], format[localize "STR_LOITER_SPEED_LOWER_TIP"]],	// [name of key bind action, tool tip]
	{[getConnectedUAV player, -1] spawn NIC_SFH_fnc_ChangeLoiterSpeed},							// code executed on key down
	{false},																					// code executed on key up
	[19, [true, false, true]]																	// [key for starting action, [shift, ctrl, alt] (additional key to be pressed)]
] call CBA_fnc_addKeybind;
[
	format[localize "STR_NIC_TITLE_NIC_FLIGHT_HEIGHT"],
	"NIC_SFH_raiseSpeed",
	[format[localize "STR_LOITER_SPEED_RAISE"], format[localize "STR_LOITER_SPEED_RAISE_TIP"]],
	{[getConnectedUAV player, 1] spawn NIC_SFH_fnc_ChangeLoiterSpeed},
	{false},
	[18, [false, true, false]]
] call CBA_fnc_addKeybind;
