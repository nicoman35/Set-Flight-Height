/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_Init
	Version: 		1.0
	Edited Date: 	26.04.2021
	
	Description:
		Add 'Refresh UAV AI' action to this UAV
		
	Parameters:
		_UAV:		Object - UAV 
		
	Returns:
		None
*/

if (isNil{NIC_SFH_MinFlightHeight}) then {NIC_SFH_MinFlightHeight = 20};
if (isNil{NIC_SFH_MaxFlightHeight}) then {NIC_SFH_MaxFlightHeight = 10000};	
["Air", "init", {_this call NIC_SFH_fnc_AddSetFlightHeightAction}, true] call CBA_fnc_addClassEventHandler; // adds init event to all air vehicles; has to be run preinit!
