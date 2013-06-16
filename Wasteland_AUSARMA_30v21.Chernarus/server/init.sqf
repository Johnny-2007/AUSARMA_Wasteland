//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:
#include "setup.sqf"
if(!X_Server) exitWith {};

setterraingrid 47;

westCenter = createCenter west;
eastCenter = createCenter east;

sideMissions = 1;
serverSpawning = 1;

//Execute Server Side Scripts.
[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompiledScripts = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM "server\functions\serverTimeSync.sqf";
//[] execVM "server\functions\antiCheatServer.sqf";
waitUntil{scriptDone _serverCompiledScripts};

// Markus : PV event handler for when an independent is killed by another independent -->
MD_FindPlayerStr = compile  "{
	_toFind = _this select 0;
	_pObj = objNull;
	{
		if (name _x == _toFind) then
		{
			_pObj = _x;
		}
	} foreach playableUnits;
	_pObj
};";

"MD_GuerTK" addPublicVariableEventHandler {
	private ["_Killer", "_Killed"];
	// -- Get the player and killer objects
	_killer = (_this select 0) call MD_FindPlayerStr;
	_killed = (_this select 1) call MD_FindPlayerStr;
	
	if ((side _killer == Independent) && (side _killed == Independent)) then {
		_killer addScore 2; // -- Add score to the killer, to cover the TK, and increment their score.
	};
 };
// <-- Markus

diag_log format["WASTELAND SERVER - Server Compile Finished"];

#ifdef __DEBUG__
#else

// Markus : call compile preprocessFileLineNumbers "script.sqf" is much faster, and, runs in series, vs parallel like execVM. No need for the waitUntil -->
//Execute Server Spawning.

Compile preprocessFileLineNumbers "client\functions\clientInitEventHandlers.sqf";
if (serverSpawning == 1) then {
    diag_log format["WASTELAND SERVER - Initilizing Server Spawning"];
	call Compile preprocessFileLineNumbers "server\functions\vehicleSpawning.sqf";
	call Compile preprocessFileLineNumbers "server\functions\objectsSpawning.sqf";
	call Compile preprocessFileLineNumbers "server\functions\boxSpawning.sqf";
	call Compile preprocessFileLineNumbers "server\functions\staticGunSpawning.sqf";
	call Compile preprocessFileLineNumbers "server\functions\staticHeliSpawning.sqf";
	call Compile preprocessFileLineNumbers "server\functions\cleanMarkers.sqf";
};

// <-- Markus
#endif
//Execute Server Missions.
if (sideMissions == 1) then {
    diag_log format["WASTELAND SERVER - Initilizing Missions"];
    [] execVM "server\missions\sideMissionController.sqf";
    sleep 5;
    [] execVM "server\missions\mainMissionController.sqf";
    sleep 60;
    [] execVM "server\missions\cqMissionController.sqf";
    //[] execVM "server\missions\worldMissionController.sqf";
};

if (isDedicated) then {
	_id = [] execFSM "server\WastelandServClean.fsm";
};
