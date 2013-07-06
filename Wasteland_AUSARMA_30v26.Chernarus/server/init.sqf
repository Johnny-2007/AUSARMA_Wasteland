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
// -- Get player slot list
MD_GetPlayerList = {
	waitUntil {time > 10};
	private ["_iter"];
	MD_NUMBEROFSLOTS = 140; // -- GUER slot count
	MD_PlayerSlots = [];
	_iter = 1;
	while {_iter < (MD_NUMBEROFSLOTS + 1)} do
	{
		private ['_slot'];
		if (!isnil (str(format ["guer%1", _iter]))) then {
			MD_Playerslots set [count MD_Playerslots, call compile format ["guer%1", _iter]];
		};
		_iter = _iter + 1;
	};
	diag_log format ["MD-> Server: %1 Player slots: %2", count MD_Playerslots, MD_Playerslots];
	if (count MD_Playerslots == 0) then {
		diag_log "MD-> Server: No players detected. Retrying in 3 seconds";
		sleep 3;
		[] spawn MD_GetPlayerList;
	};
};
onPlayerConnected "[] spawn MD_GetPlayerList";

MD_FindPlayerStr = {
	_toFind = _this;
	_pObj = objNull;
	{
		if (!isnil (str _x)) then {
		diag_log format ["MD-> Server: Searching for: %1 Found: %2", _tofind, name _x];
			if (name _x == _toFind) then
			{
				_pObj = _x;
				diag_log format ["MD-> Server: Found: %1 !!!!!", _tofind];
			};
		};
	} foreach MD_Playerslots;
	_pObj
};

"MD_GuerTK" addPublicVariableEventHandler {
	private ["_Killer", "_Killed"];
	// -- Get the player and killer objects
	_killed = ((_this select 1) select 0);
	_killer = ((_this select 1) select 1);
	//diag_log format ["MD-> Server: Killed: %1 by Killer: %2", _killed, _killer];
	/* -- Refresh the player slot objects.
	private ["_iter"];
	MD_PlayerSlots = [];
	_iter = 1;
	while {call compile format ["!isnull guer%1", _iter]} do
	{
		MD_Playerslots set [count MD_Playerslots, call compile format ["guer%1", _iter]];
		_iter = _iter + 1;
	};
	diag_log format ["MD-> Server: Player slots: %1", MD_Playerslots];
	*/
	//
	_killed = (_killed call MD_FindPlayerStr);
	_killer = (_killer call MD_FindPlayerStr);
	_killerWep = currentWeapon _killer;
	_killerWep = (configFile >> "cfgWeapons" >> _killerWep);
	_killerWep = format["%1",getText(_killerWep >> "displayName")];
	_killerName = name _killer;	
	if (side (group _killer) == resistance) then
	{
		if (side (group _killed) == resistance) then
		{
			// Killed by already dead player
			if (_killerName == "ERROR: NO UNIT") exitWith {
				MD_KillMessage = format["%1 has died.", _killed];
				publicVariable "MD_KillMessage";
			};
			
			// -- Don't allow score increase if suicide.
			if ((name _killer) == (name _killed)) exitWith {};
			
			// -- Don't allow score increase if in same group.
			if ((group _killed) == (group _killer)) exitWith {
				MD_KillMessage = format["%1 was T E A M K I L L E D by %2.", _killed, name _killer];
				publicVariable "MD_KillMessage";
			};
			// -- Otherwise add score to the killer, to cover the TK, and increment their score.			
			_killer addScore 2;
			MD_KillMessage = format["%1 was killed by %2 with %3", _killed, name _killer, _killerWep];
			publicVariable "MD_KillMessage";
		};
	};
	
	// Kill another player just after you died and in civilian limbo. Example = "Error: No Unit". May not work.
	if (side (group _killer) == civilian) then
	{
		_killer addScore 2;
		MD_KillMessage = format["%1 was also killed.", _killed];
		publicVariable "MD_KillMessage";
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
	[600,900] execVM "scripts\clean\cly_removedead.sqf"; //Delete men after 10 minutes, ignore vehicles. WastelandServClean will handle that.
};
