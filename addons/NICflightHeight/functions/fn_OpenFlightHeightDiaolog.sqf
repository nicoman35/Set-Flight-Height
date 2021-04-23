/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_OpenFlightHeightDiaolog
	Version: 		1.0
	Edited Date: 	22.04.2021
	
	Description:
		Sets flight height of the vehicle _vehicle
	
	Parameters:
		_vehicle:		Object - air vehicle 
		
	Returns:
		None
*/

params [["_vehicle", objNull]];
if (isNull _vehicle) exitWith {};

private _ok = createDialog "NIC_SetFlightHeight_Dialog";
if !(isNil{_vehicle getVariable "NIC_FlightHeight"}) then {ctrlSetText [1102, str(_vehicle getVariable "NIC_FlightHeight")]};
waitUntil {!dialog};
if (typeName NIC_FlightHeight == "STRING") exitWith {}; 		// don't do anything, if dialog was closed with the 'esc' key
// if (typeName NIC_FlightHeight == "ARRAY") then {
// if (NIC_FlightHeight == "esc") exitWith {}; 		// don't do anything, if dialog was closed with the 'esc' key
// if (NIC_FlightHeight == "current") then {
if (typeName NIC_FlightHeight == "ARRAY") then {
	NIC_FlightHeight = round ((getPos _vehicle) select 2);
	if (NIC_FlightHeight < NIC_Min_FlightHeight) then {NIC_FlightHeight = NIC_Min_FlightHeight};
	if (NIC_FlightHeight > NIC_Max_FlightHeight) then {NIC_FlightHeight = NIC_Max_FlightHeight};
}; 
vehicle _vehicle flyInHeight NIC_FlightHeight;
if (unitIsUAV _vehicle) then {systemChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]}
else {vehicle _vehicle groupChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]};
_vehicle setVariable ["NIC_FlightHeight", NIC_FlightHeight, true];
