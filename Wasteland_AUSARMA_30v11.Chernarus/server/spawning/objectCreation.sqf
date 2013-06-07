
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat jk. Bench
//	@file Created: 20/04/2013
//	@file Args:
//	@file Modifcation: UHAX - safe spawning of objects.

if(!X_Server) exitWith {};

private["_listRoads","_objPos","_Objtype","_forceCheck","_skip"];

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));

_objPos = _objPos findEmptyPosition[0, 10, _Objtype select 0];

_forceCheck = false;

_skip = false;

if (isOnRoad _objPos) then {
    _objPos = [_objPos, 0, 10, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    _listRoads = _objPos nearRoads 10;
    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
        _forceCheck = true;
    } else {
        _forceCheck = false;
        _skip = true;
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 11, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 12, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 13, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 14, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 15, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 16, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 17, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 18, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

if ((isOnRoad _objPos) || _forceCheck) then {
    _objPos = [_objPos, 0, 19, 2, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _objPos = _objPos findEmptyPosition[0, 15, _Objtype select 0];
    _forceCheck = false;
} else {
    if !(_skip) then {
	    _listRoads = _objPos nearRoads 10;
	    if (((count _listRoads) > 0) || (isOnRoad _objPos)) then {
	        _forceCheck = true;
	    } else {
	        _forceCheck = false;
	        _skip = true;
	    };
    };
};

_obj = createVehicle [_Objtype select 0,_objPos,[], 50,"None"]; 

if(_Objtype select 0 == "Land_Barrel_water") then {
    _obj setVariable["water",30,true];
};

if(_Objtype select 0 == "Land_stand_small_EP1") then {
    _obj setVariable["food",30,true];
};

// Object Health system init
_obj setVariable["health",if(_Objtype select 1 == 0)then{30}else{_Objtype select 1},true];
_obj setVariable["healthTotal",if(_Objtype select 1 == 0)then{30}else{_Objtype select 1},true];
_obj setVariable["isCritical",false,true];
_obj setVariable["isExplosiveImmune",_Objtype select 2,true];
_obj setVariable["isBallisticImmune",_Objtype select 2,true];
_obj setVariable["spawnpos",_objPos,true];
_obj setVariable["respawn",true,true];
_obj addEventHandler ["HandleDamage",{ [_this select 0,_this select 2,_this select 4] call onObjectHit }];

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
