/*
	Author: 		Nicoman
	Function: 		NIC_SFH_fnc_Init
	Version: 		1.0
	Edited Date: 	22.04.2021
	
	Description:
		Add 'Refresh UAV AI' action to this UAV
		
	Parameters:
		_UAV:		Object - UAV 
		
	Returns:
		None
*/

diag_log formatText ["%1%2%3%4%5", time, "s  (NIC_SFH_fnc_Init) _this:", _this];

NIC_Min_FlightHeight = 20;
NIC_Max_FlightHeight = 10000;
["Air", "init", {_this call NIC_SFH_fnc_AddSetFlightHeightAction}, true] call CBA_fnc_addClassEventHandler; // adds init event to all air vehicles; has to be run preinit!
