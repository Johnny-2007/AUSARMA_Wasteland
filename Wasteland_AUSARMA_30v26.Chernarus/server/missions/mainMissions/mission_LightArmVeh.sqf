//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:
#include "setup.sqf"
#include "mainMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_side","_faction","_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive","_waitDelayTime"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "Light_Vehicle";
_missionType = "Light Armored Vehicle";
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif


diag_log format["WASTELAND SERVER - Main Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1",_missionType];
_waitDelayTime = mainMissionDelayTime / 2 ;
[_waitDelayTime] call createWaitCondition;
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", _waitDelayTime / 60, mainMissionColor, subTextColor];
[nil,nil,rHINT,_hint] call RE;
[_waitDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1",_missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

_vehicleClass = ["BRDM2_TK_GUE_EP1","GAZ_Vodnik_HMG","HMMWV_Avenger","ArmoredSUV_PMC"] call BIS_fnc_selectRandom;

//Vehicle Class, Posistion, Fuel, Ammo, Damage
_vehicle = [_vehicleClass,_randomPos,0.1,1,0.75,"NONE"] call createMissionVehicle;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been spoted in the area marked</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
[nil,nil,rHINT,_hint] call RE;

_faction = faction _vehicle;

_side = civilian;

_side =
switch (_faction) do 
{ 
  case "USMC": {west}; 
  case "CDF": {west}; 
  case "BIS_US": {west}; 
  case "BIS_CZ": {west}; 
  case "BIS_GER": {west}; 
  case "BIS_BAF": {west}; 
  case "PMC_BAF": {west}; 
  
  case "RU": {east}; 
  case "INS": {east}; 
  case "BIS_TK": {east}; 
  case "BIS_TK_INS": {east}; 
  case "BIS_TK_GUE": {east}; 
  case "BIS_UN": {east}; 
  case "BIS_TK_CIV": {east}; 
  case "BIS_CIV_special": {east}; 
  case "GUE": {east}; 
  case "CIV": {east}; 
  case "CIV_RU": {east}; 
  
};

EnemyGrpM = createGroup _side;
[EnemyGrpM,_randomPos,_side] spawn createMidGroup;

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1",_missionType];
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif
private ["_playerPresent"];
waitUntil
{
    sleep 1; 
	_playerPresent = false;
	#ifdef __A2NET__
	_currTime = floor(netTime);
	#else
	 _currTime = floor(time);
	#endif
   
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units EnemyGrpM);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _vehicle) == 1) OR (cancelMissionMain)
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units EnemyGrpM;
    deleteGroup EnemyGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteGroup EnemyGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The light armored vehicle has been captured</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;