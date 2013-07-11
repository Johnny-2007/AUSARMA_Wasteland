//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, Radioman
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
// -- Get player slot list
private ["_iter"];
MD_PlayerSlots = [];
_iter = 1;
while {call compile format ["!isNil 'guer%1'", _iter]} do
{
	MD_Playerslots set [count MD_Playerslots, call compile format ["guer%1", _iter]];
	_iter = _iter + 1;
};

MD_FindPlayerStr = {
	_toFind = _this;
	_pObj = "ERROR: NO UNIT";
	{
		diag_log format ["Server: Searching for: %1 Found: %2", _tofind, name _x];
		if (name _x == _toFind) then
		{
			_pObj = _x;
			diag_log format ["Server: Found: %1 !!!!!", _tofind];
		};
	} foreach MD_Playerslots;
	_pObj
};

"MD_GuerTK" addPublicVariableEventHandler {
	private ["_player", "_killer"];
	_player = ((_this select 1) select 0);
	_killer = ((_this select 1) select 1);
	diag_log format ["Server %1 was killed by %2", _player, _killer];
//	private ["_iter"];
//	MD_PlayerSlots = [];
//	_iter = 1;
//	while {call compile format ["!isnull guer%1", _iter]} do
//	{
//		MD_Playerslots set [count MD_Playerslots, call compile format ["guer%1", _iter]];
//		_iter = _iter + 1;
//	};
//	_player = (_player call MD_FindPlayerStr);
//	_killer = (_killer call MD_FindPlayerStr);
//	diag_log format ["Server: (MD_FindPlayerStr) %1 was killed by %2", _player, _killer];
//	diag_log format ["Server: %1 was killed by %2", side (group _player), side (group _killer)];
	if (_player != "ERROR: NO UNIT") then {
		
		if (_killer != "ERROR: NO UNIT") then {
			
			// Don't allow score increase if suicide.
			if ((name _player) == (name _killer)) exitWith { 
				diag_log format ["Server %1 has comitted SUICIDE", _player];
//				MD_KillMessage = format["%1 died by S U I C I D E.", _player];					
//				publicVariable "MD_KillMessage";
			};
			
			if ((group _player) == (group _killer)) exitWith {
				diag_log format ["Server %1 was TEAMKILLED by %2", _player, _killer];
//				MD_KillMessage = format["%1 was T E A M K I L L E D by %2.", _player, name _killer];				
//				publicVariable "MD_KillMessage";
			};
			
			//  Add score to the killer, to cover the TK, and increment their score.
			diag_log format ["Server %1 was KILLED by %2", _player, _killer];
//			MD_KillMessage = format["%1 was K I L L E D by %2", _player, name _killer];
//			publicVariable "MD_KillMessage";			
			_killer addScore 2;
		};
//	} else {
//		// Rare event where player name is unknown.
//		diag_log format ["Server %1 has died", _player];
//		MD_KillMessage = format["%1 has died.", _player];
//		publicVariable "MD_KillMessage";
	};
};
// <-- Markus

diag_log format["WASTELAND SERVER - Server Compile Finished"];

#ifdef __DEBUG__
#else

// Markus : call compile preprocessFileLineNumbers "script.sqf" is much faster, and, runs in series, vs parallel like execVM. No need for the waitUntil -->
//Execute Server Spawning.
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
	[900,300] execVM "scripts\clean\cly_removedead.sqf"; //Delete men after 15 minutes, vehicles after 5 minutes. WastelandServClean will handle the rest.
};
