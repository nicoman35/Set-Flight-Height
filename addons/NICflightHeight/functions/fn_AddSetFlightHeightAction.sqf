/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_AddSetFlightHeightAction
	Version: 		1.0
	Edited Date: 	26.04.2021
	
	Description:
		Add 'Set Flight Height' action to this air vehicle
		
	Parameters:
		_vehicle:		Object - air vehicle
		
	Returns:
		None
*/

params [["_vehicle", objNull]];
if (isNull _vehicle) exitWith {};
if (_vehicle isKindOf "ParachuteBase") exitWith {};									// exclude parachutes from action

if !(isNil{_vehicle getVariable "NIC_SFH_ActionID_SetFlightHeight"}) exitWith {};	// add Set Flight Height action to vehicle
private _actionID_FH = _vehicle addAction [											// Add 'Set Flight Height' action to pilot, copilot and UAV gunner
	localize "STR_TITLE_NIC_FLIGHT_HEIGHT",											// Title
	{_this call NIC_SFH_fnc_OpenFlightHeightDiaolog},								// Script
	nil,																			// Arguments
	0,																				// Priority
	false,																			// showWindow
	true,																			// hideOnUse
	"",																				// Shortcut
	"[_target, _this] call NIC_SFH_fnc_IsUnitAutorized"								// Condition
];
_vehicle setVariable ["NIC_SFH_ActionID_SetFlightHeight", _actionID_FH, true];
