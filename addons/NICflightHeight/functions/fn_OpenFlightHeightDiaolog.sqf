/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_OpenFlightHeightDiaolog
	Version: 		1.0
	Edited Date: 	26.04.2021
	
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
private _maxVehicleHeight = selectMin [round (0.8 * (getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >> "altNoForce"))), NIC_SFH_MaxFlightHeight];
private _txt = format["min: %1 \nmax: %2", NIC_SFH_MinFlightHeight, _maxVehicleHeight];
findDisplay 1001 displayCtrl 1102 ctrlSetTooltip _txt;
waitUntil {!dialog};
if (typeName NIC_FlightHeight == "STRING") exitWith {}; 		// don't do anything, if dialog was closed with the 'esc' key
if (typeName NIC_FlightHeight == "ARRAY") then {NIC_FlightHeight = round ((getPos _vehicle) select 2)};
if (NIC_FlightHeight < NIC_SFH_MinFlightHeight) then {NIC_FlightHeight = NIC_SFH_MinFlightHeight};
if (NIC_FlightHeight > _maxVehicleHeight) then {NIC_FlightHeight = _maxVehicleHeight};
vehicle _vehicle flyInHeight NIC_FlightHeight;
if (unitIsUAV _vehicle) then {systemChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]}
else {vehicle _vehicle groupChat format[localize "STR_HEIGHT_CHANGE_CONFIRMATION_NIC_FLIGHT_HEIGHT", NIC_FlightHeight]};
_vehicle setVariable ["NIC_FlightHeight", NIC_FlightHeight, true];
