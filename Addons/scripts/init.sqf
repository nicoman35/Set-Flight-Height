NIC_fn_ACTION_FH_ON = {
	params ["_vehicle"];
	private _actionID_FH = _vehicle addAction [										// Add 'Set Flight Height' action to pilot, copilot and UAV gunner
		localize "STR_TITLE_NIC_FLIGHT_HEIGHT",										// Title
		{_this call NIC_fn_Open_Flight_Height_Diaolog;},							// Script
		nil,																		// Arguments
		0,																			// Priority
		false,																		// showWindow
		true,																		// hideOnUse
		"",																			// Shortcut
		"[_target, _this] call NIC_fn_Is_Unit_Autorized"							// Condition
	];
	_vehicle setVariable ["NIC_actionID_FH", _actionID_FH, false];
};

NIC_fn_Open_Flight_Height_Diaolog = {
	params ["_vehicle"];
	private _ok = createDialog "NIC_SetFlightHeight_Dialog";
	if !(isNil{_vehicle getVariable "NIC_FlightHeight"}) then {ctrlSetText [1102, str(_vehicle getVariable "NIC_FlightHeight")]};
	waitUntil {!dialog};
	if (typeName NIC_FlightHeight == "STRING") exitWith {}; 		// don't do anything, if dialog was closed with the 'esc' key
	if (typeName NIC_FlightHeight == "ARRAY") then {
		NIC_FlightHeight = round ((getPos _vehicle) select 2);
		if (NIC_FlightHeight < NIC_Min_FlightHeight) then {NIC_FlightHeight = NIC_Min_FlightHeight};
		if (NIC_FlightHeight > NIC_Max_FlightHeight) then {NIC_FlightHeight = NIC_Max_FlightHeight};
	}; 
	vehicle _vehicle flyInHeight NIC_FlightHeight;
	if (unitIsUAV _vehicle) then {systemChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]}
	else {vehicle _vehicle groupChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]};
	_vehicle setVariable ["NIC_FlightHeight", NIC_FlightHeight, false];
};

NIC_fn_Dialog_Save_Flight_Height = {
	// diag_log formatText ["%1%2%3%4%5", time, "s  (NIC_fn_Dialog_Save_Flight_Height) this: ", _this, "   array:", typeName _this == "ARRAY"];
	if (typeName _this == "ARRAY") exitWith {
		NIC_FlightHeight = [];
		closeDialog 0
	};
	if (_this == 1) exitWith {NIC_FlightHeight = "x"}; 			// 'esc' keypress 
	if (_this == 28 || _this == 156) exitWith {closeDialog 0}; 	// close dialog on 'enter' or 'numpad enter' keypress 
	private _height = parseNumber (ctrlText 1102);
	if (_height < NIC_Min_FlightHeight) then {_height = NIC_Min_FlightHeight};
	if (_height > NIC_Max_FlightHeight) then {_height = NIC_Max_FlightHeight};
	NIC_FlightHeight = _height;
};

NIC_fn_Is_Unit_Autorized = {
	params ["_vehicle", "_unit"];
	if !(_vehicle isKindOf 'Air') exitWith {false};
	if (driver _vehicle == _unit) exitWith {true};							// check, if unit is pilot
	if (unitIsUAV _vehicle && gunner _vehicle == _unit) exitWith {true};	// check, if unit is UAV gunner
	private _cfg = configFile >> "CfgVehicles" >> typeOf(_vehicle);
	private _trts = _cfg >> "turrets";
	private _return = false;
	for "_i" from 0 to (count _trts - 1) do {
		private _trt = _trts select _i;
		if (getNumber(_trt >> "iscopilot") == 1) exitWith {
			_return = ((_vehicle turretUnit [_i]) == _unit);				// check, if unit is copilot
		};
	};
	_return
};

NIC_Min_FlightHeight = 20;
NIC_Max_FlightHeight = 5000;
["Air", "init", {_this call NIC_fn_ACTION_FH_ON}, true] call CBA_fnc_addClassEventHandler; // adds init event to all air vehicles; has to be run preinit!