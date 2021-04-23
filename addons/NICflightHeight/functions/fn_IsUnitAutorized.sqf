/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_IsUnitAutorized
	Version: 		1.0
	Edited Date: 	22.04.2021
	
	Description:
		Checks, if action 'Set Flight Height' is available for the AI unit _unit
	
	Parameters:
		_vehicle:	Object - vehicle
		_unit:		Object - AI unit
		
	Returns:
		bool
*/

params [["_vehicle", objNull], ["_unit", objNull]];
if (isNull _vehicle || isNull _unit) exitWith {};
if !(_vehicle isKindOf 'Air') exitWith {false};
if (driver _vehicle == _unit) exitWith {true};							// check, if unit is pilot
if (unitIsUAV _vehicle && gunner _vehicle == _unit) exitWith {true};	// check, if unit is UAV gunner
private _cfg = configFile >> "CfgVehicles" >> typeOf(_vehicle);
private _turrets = _cfg >> "turrets";
private _return = false;
private ["_turret"];
for "_i" from 0 to (count _turrets - 1) do {
	_turret = _turrets select _i;
	if (getNumber(_turret >> "iscopilot") == 1) exitWith {
		_return = ((_vehicle turretUnit [_i]) == _unit);				// check, if unit is copilot
	};
};
_return
