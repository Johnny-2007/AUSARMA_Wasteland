//	@file Version: 1.0
//	@file Name: cqMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [TOG FF] Redshirt Ensign
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "setup.sqf"
#include "cqMissions\cqMissionDefines.sqf";

private ["_SMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started CQ Mission State"];

//CQ Mission Array
_SMarray = [
            [mission_CQWepCache,"mission_CQWepCache"]
           ];

_lastMission = "nomission";
while {true} do
{
    //Select Mission
    _randomIndex = (random (count _SMarray - 1));
    _mission = _SMarray select _randomIndex select 0;
    _missionType = _SMarray select _randomIndex select 1;

//	//Select new mission if the same
//    if(str(_missionType) == _lastMission) then
//    {
//        _newMissionArray = _SMarray;
//        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
//        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
//        _randomIndex = (random (count _newMissionArray - 1));
//        _missionType = _newMissionArray select _randomIndex select 1;
//        _mission = _newMissionArray select _randomIndex select 0;
//    };

    cancelMissionCQ = false;
    _missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New CQ Mission: %1",_missionType];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Close Quarters Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", cqMissionDelayTime / 60, cqMissionColor, subTextColor];
    [nil,nil,rHINT,_hint] call RE;
    _lastMission = _missionType;
    waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5;
};