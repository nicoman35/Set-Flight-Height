/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_DialogSaveFlightHeight
	Version: 		1.0
	Edited Date: 	22.04.2021
	
	Description:
		Handles key press events of set flight height dialog
	
	Parameters:
		_this:		Number - pressed key in ASCII format?
		
	Returns:
		None
*/

// diag_log formatText ["%1%2%3%4%5", time, "s  (NIC_fnc_DialogSaveFlightHeight) this: ", _this, "   array:", typeName _this == "ARRAY"];
params [["_this", 0]];
diag_log formatText ["%1%2%3%4%5", time, "s  (NIC_fnc_DialogSaveFlightHeight) _this: ", _this];

if (typeName _this == "ARRAY") exitWith {
	NIC_FlightHeight = [];
	closeDialog 0
};
// if (_this == "current") exitWith {
	// NIC_FlightHeight = "current";
	// closeDialog 0
// };
if (_this == 1) exitWith {NIC_FlightHeight = "esc"}; 			// 'esc' keypress 
if (_this == 28 || _this == 156) exitWith {closeDialog 0}; 	// close dialog on 'enter' or 'numpad enter' keypress 
private _height = parseNumber (ctrlText 1102);
if (_height < NIC_Min_FlightHeight) then {_height = NIC_Min_FlightHeight};
if (_height > NIC_Max_FlightHeight) then {_height = NIC_Max_FlightHeight};
NIC_FlightHeight = _height;
