//	@file Version: 0.1
//	@file Name: vehicleLock.sqf
//	@file Author: Redshirt_Ensign
//	@file Created: 27/04/2013 13:19
//	@file Args: object class

if(!isServer) exitWith {};

// Define variables
_vehicle = _this select 0;

_vehicle addEventHandler ["GetIn",
{
    private ["_veh", "_pos", "_unit", "_crewMember", "_groupArray","_aliveCrew"];
    _veh = _this select 0;
    _pos = _this select 1;
    _unit = _this select 2;
    _aliveCrew = ({alive _x} count crew _veh);
    _groupArray = [];
    if ( (str(side _unit) == "GUER") AND ({alive _x} count crew _veh > 0) ) then {
        _crew = crew _veh;
        _crewMember = _crew select 0;
        {
            _groupArray set [count _groupArray,getPlayerUID _x];
        }forEach units _crewMember;

        if !(getPlayerUID _unit in _groupArray) then {
            _unit action ["Eject", vehicle _unit];
            diag_log format["VEHICLELOCK: Player %1 (%2) ejected from %3 (crew alive/total = %4 / %5)", name _unit, getPlayerUID _unit, _veh, _aliveCrew, count crew _veh];
        };
    };
}];

