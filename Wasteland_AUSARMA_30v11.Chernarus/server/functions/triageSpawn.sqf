//	@file Version: 0.1
//	@file Name: triageSpawn.sqf
//	@file Author: Redshirt_Ensign
//	@file Created: 27/04/2013 13:19
//	@file Args: object class

if(!isServer) exitWith {};

// Declare variables
private ["_objectClass","_bestNum","_bestPos","_bestObjCount","_bestObjDist","_markerPos","_nearObj","_nearObjCount","_closestObjDist"];
_objectClass = _this select 0;
_bestNum = 1;
_bestPos = [0,0,0];
_bestObjCount = 999;
_bestObjDist = 0;
_bestCounter = 0;

// Make sure we got a valid object class to search for
if (isNil "_objectClass") then {
    _objectClass = "Car";
    diag_log "triageSpawn: WARNING - object class not specified";
};

for "_i" from 1 to 770 do
{
    _markerPos = getMarkerPos format ["Spawn_%1", _i];
    if ((_markerPos select 0) < 1) then  {
        diag_log format["triageSpawn: WARNING - Spawn_%1 has invalid coords %2", _i, _markerPos];
    } else {
        _nearObj = nearestobjects [_markerPos, [_objectClass], 500];
        _nearObjCount = count _nearObj;
        _closestObjDist = _markerPos distance nearestobject [_markerPos, _objectClass];
        if (_nearObjCount < _bestObjCount OR (_nearObjCount == _bestObjCount AND _closestObjDist > _bestObjDist)) then {
            _bestNum = _i;
            _bestPos = _markerPos;
            _bestObjCount = _nearObjCount;
            _bestObjDist = _closestObjDist;
            _bestCounter = _bestCounter + 1;
            diag_log format["triageSpawn: DEBUG Spawn_%1 %2 is candidate, _bestObjCount=%3 _bestObjDist=%4 _bestCounter=%5 _objectClass=%6", _bestNum, _bestPos, _bestObjCount, _bestObjDist, _bestCounter, _objectClass];
        };
    };
};

diag_log format["triageSpawn: Spawn_%1 %2 selected, _bestObjCount=%3 _bestObjDist=%4 _bestCounter=%5 _objectClass=%6", _bestNum, _bestPos, _bestObjCount, _bestObjDist, _bestCounter, _objectClass];

// Return best coords for new object spawn
_bestPos
