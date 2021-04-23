/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_ChangeLoiterSpeed
	Version: 		1.0
	Edited Date: 	23.04.2021
	
	Description:
		Changes the waypoint speed of current loiter waypoint
	
	Parameters:
		_vehicle:		Object - vehicle
		_changeSpeed:	Number - -1 for lower or 1 for raise speed
		
	Returns:
		none
*/

params [["_vehicle", objNull], ["_changeSpeed", 0]];
diag_log formatText ["%1%2%3%4", "			_vehicle: ", _vehicle, ", _changeSpeed: ", _changeSpeed];
if (isNull _vehicle || _changeSpeed == 0) exitWith {};									// leave, if no vehicle given or no change string given
private _group = group _vehicle;														// get AI group of vehicle
private _index = currentWaypoint _group;												// get index of current group's waypoint
if ((waypointLoiterRadius [_group, _index]) < 0) exitWith {};							// leave, if current waypoint is no loiter waypoint
private _loiterSpeeds = ["LIMITED", "NORMAL", "FULL"];									// posssible group speeds
private _currentSpeed = waypointSpeed [_group, _index];									// get speed of current waypoint
private _currentSpeedIndex = _loiterSpeeds find _currentSpeed;							// find index of current speed in group speeds array
diag_log formatText ["%1%2", "			_currentSpeedIndex: ", _currentSpeedIndex];
if (_currentSpeedIndex < 0) then {_currentSpeedIndex = 1};								// if we do not find groups current speed mode, then it is "UNCHANGED", which, in case of loiter waypoints, is "NORMAL"
if (_currentSpeedIndex == 0 && _changeSpeed == -1) exitWith {};							// leave, if speed is to be lowered, but group is already at lowest speed
if (_currentSpeedIndex == (count _loiterSpeeds) - 1 && _changeSpeed == 1) exitWith {};	// leave, if speed is to be raised, but group is already at highest speed
private _newSpeed = _loiterSpeeds select (_currentSpeedIndex + _changeSpeed);			// change index to new speed
diag_log formatText ["%1%2", "			_newSpeed: ", _newSpeed];
_group setCurrentWaypoint [_group, 0];													// reset current waypoint to basic waypoit; if not, speed changes of loiter waypoint will not be performed!
[_group, _index] setWaypointSpeed _newSpeed;											// change loiter waypoint's speed
_group setCurrentWaypoint [_group, _index];												// reset group's current waypoint to loiter waypoint
systemChat format[localize "STR_LOITER_SPEED_SET", _newSpeed];