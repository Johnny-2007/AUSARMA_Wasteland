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
/*
MD_GetPlayerList = {
	waitUntil {time > 10};
	private ["_iter"];
	MD_NUMBEROFSLOTS = 140; // -- GUER slot count
	MD_PlayerSlots = [];
	_iter = 1;
	while {_iter < (MD_NUMBEROFSLOTS + 1)} do
	{
		private ['_slot'];
		if (!isnull (call compile format ["guer%1", _iter])) then {
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
*/

MD_Playerslots = [GUER1, GUER2, GUER3, GUER4, GUER5, GUER6, GUER7, GUER8, GUER9, GUER10, GUER11, GUER12, GUER13, GUER14, GUER15, GUER16, GUER17, GUER18, GUER19, GUER20, GUER21, GUER22, GUER23, GUER24, GUER25, GUER26, GUER27, GUER28, GUER29, GUER30, GUER31, GUER32, GUER33, GUER34, GUER35, GUER36, GUER37, GUER38, GUER39, GUER40, GUER41, GUER42, GUER43, GUER44, GUER45, GUER46, GUER47, GUER48, GUER49, GUER50, GUER51, GUER52, GUER53, GUER54, GUER55, GUER56, GUER57, GUER58, GUER59, GUER60, GUER61, GUER62, GUER63, GUER64, GUER65, GUER66, GUER67, GUER68, GUER69, GUER70, GUER71, GUER72, GUER73, GUER74, GUER75, GUER76, GUER77, GUER78, GUER79, GUER80, GUER81, GUER82, GUER83, GUER84, GUER85, GUER86, GUER87, GUER88, GUER89, GUER90, GUER91, GUER92, GUER93, GUER94, GUER95, GUER96, GUER97, GUER98, GUER99, GUER100, GUER101, GUER102, GUER103, GUER104, GUER105, GUER106, GUER107, GUER108, GUER109, GUER110, GUER111, GUER112, GUER113, GUER114, GUER115, GUER116, GUER117, GUER118, GUER119, GUER120, GUER121, GUER122, GUER123, GUER124, GUER125, GUER126, GUER127, GUER128, GUER129, GUER130, GUER131, GUER132, GUER133, GUER134, GUER135, GUER136, GUER137, GUER138, GUER139, GUER140];

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
