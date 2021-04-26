/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_DialogSaveFlightHeight
	Version: 		1.0
	Edited Date: 	26.04.2021
	
	Description:
		Handles key press events of set flight height dialog
	
	Parameters:
		_this:		Number - pressed key in ASCII format?
		
	Returns:
		None
*/

if (typeName _this == "ARRAY") exitWith {
	NIC_FlightHeight = [];
	closeDialog 0
};
if (_this == 1) exitWith {NIC_FlightHeight = "esc"}; 			// 'esc' keypress 
if (_this == 28 || _this == 156) exitWith {closeDialog 0}; 	// close dialog on 'enter' or 'numpad enter' keypress 
private _height = parseNumber (ctrlText 1102);
if (_height < NIC_SFH_MinFlightHeight) then {_height = NIC_SFH_MinFlightHeight};
if (_height > NIC_SFH_MaxFlightHeight) then {_height = NIC_SFH_MaxFlightHeight};
NIC_FlightHeight = _height;
