//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (isnil {_player getVariable "cmoney"}) then {
	_player setVariable["cmoney",0,true];
};

_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
// _killer addscore 2; // -- Markus : addScore can only be ran on the server... -->
MD_GuerTK = [name _player, name _killer];
diag_log format ["MD-> Client: Player: %1 | Killer: %2", MD_GuerTK select 0, MD_GuerTK select 1];
publicVariableServer "MD_GuerTK";
// <-- Markus
_playerMoney = _player getVariable["cmoney",0];
_currencyLimit = 10 * 1000;

// Close any active dialogs.
closeDialog 0;
PlayerCDeath = [_player, _killer];
publicVariable "PlayerCDeath";
if (isServer) then {
	_id = PlayerCDeath spawn serverPlayerDied; // Markus : This is a clientside script file.... Why is this being called here?
};

if(!local _player) exitwith {};

// Don't know what smack whoever was on when they wrote THIS shit...
if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};


if(!isNull(pvar_PlayerTeamKiller)) then {
	publicVar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "publicVar_teamkillMessage";
};

_pScore = score player;
_isTeamKill = false;
_isIndyKill = false;
if ((_player != _killer) && (playerSide == side (group _killer))) then {
        if (str(playerSide) in ["WEST", "EAST"]) then {
            _isTeamKill = true;
        };
        if (str(playerSide) == "GUER")  then {
            _isIndyKill = true;
            _groupArray = [];
            { _groupArray set [count _groupArray,getPlayerUID _x]; }forEach units _player;
        };
};


_playerUID = getPlayerUID _player;
_playerName = name _player;
_playerSide = playerSide;
_playerPos = getPosATL _player;
_killerUID = "noID";
_killerSide = "noSide";
_distance = 0;
_killerName = name _killer;
_killerSide = side (group _killer);
_killerPos = getPosATL _killer;
_distance = _player distance _killer;
if (_killer isKindOf "CAManBase") then {
    if (isPlayer _killer) then {
        _killerUID = getPlayerUID _killer;
        if (_isIndyKill) then {
            if(_killerUID in _groupArray) then {
                _isTeamKill = true;
            } else {
                _killer addScore 2;
            };
        };
    } else {
        _killerUID = "AI";
    };
    _killerSide = side (group _killer);
    //_killerWeapons = str(weapons _killer);
    _killerWeapon = currentWeapon (vehicle _killer);
};
if (_killer isKindOf "LandVehicle") then {
    _driver = driver _killer;
    _vehType = "VEHICLE";
    if (_killer isKindOf "StaticWeapon") then { _vehType = "STATIC_WEAPON"; };
    if (_killer isKindOf "Motorcycle") then { _vehType = "MOTORCYCLE"; };
    if (_killer isKindOf "Car") then { _vehType = "CAR"; };
    if (_killer isKindOf "Wheeled_APC") then { _vehType = "WHEELED_APC"; };
    if (_killer isKindOf "Tank") then { _vehType = "TANK"; };
    if ((_killer isKindOf "APC") or (_killer isKindOf "Tracked_APC")) then { _vehType = "APC"; };
    if (isPlayer _driver) then {
        _killerName = format["%1 driven by %2",_vehType,name _driver];
        _killerUID = getPlayerUID _driver;
        _killerSide = side (group _driver);
    } else {
        _killerName = format["%1 named %2",_vehType,_killerName];
    };
};
if (_killer isKindOf "Air") then {
    _driver = driver _killer;
    _vehType = "AIR";
    if (_killer isKindOf "Helicopter") then { _vehType = "HELICOPTER"; };
    if (_killer isKindOf "Plane") then { _vehType = "PLANE"; };
    if (isPlayer _driver) then {
        _killerName = format["%1 piloted by %2",_vehType,name _driver];
        _killerUID = getPlayerUID _driver;
        _killerSide = side (group _driver);
    } else {
        _killerName = format["%1 named %2",_vehType,_killerName];
    };
};


//player setVariable ['KB_result',[]];
//_command = format["if isServer then {this setVariable [""KB_result"",[call {[%1,%2,%3,%4,%5,%6,%7,%8] execVM 'server\functions\logPlayerKilled.sqf'}],true]}",str(_playerUID),str(_playerName),str(_playerSide),str(_killerUID),str(_killerName),str(_killerSide),_distance,_isTeamKill];
if (!(_player != _killer)) then {
    _command = format["if isServer then {diag_log ""%1 (%2 %3 %4) has has commited suicide""}",_playerName,_playerUID,_playerSide,_playerPos];
    player setVehicleInit _command;
    processInitCommands;
} else {
    _command = format["if isServer then {diag_log ""%1 (%2 %3 %4) has been killed by %5 (%6 %7 %8) at distance %9m (TK=%10 IK=%11) %12""}",_playerName,_playerUID,_playerSide,_playerPos,_killerName,_killerUID,_killerSide,_killerPos,_distance,_isTeamKill,_isIndyKill,_killerWeapon];
    player setVehicleInit _command;
    processInitCommands;
};

private["_a","_b","_c","_d","_e","_f","_m","_player","_killer", "_to_delete", "_pos", "_droppedBeacon"];

_to_delete = [];
_to_delete_quick = [];

if((_player getVariable "cmoney") > 0) then {
	_m = "EvMoney" createVehicle (position _player);
	_m setVariable["money", (_player getVariable "cmoney"), true];
	_m setVariable ["owner", "world", true];
	_to_delete = _to_delete + [_m];
};

if((_player getVariable "medkits") > 0) then {
	for "_a" from 1 to (_player getVariable "medkits") do {
		_m = "CZ_VestPouch_EP1" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if((_player getVariable "repairkits") > 0) then {
	for "_b" from 1 to (_player getVariable "repairkits") do {
		_m = "Suitcase" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if((_player getVariable "spawnBeacon") > 0) then {
        _pos = getPosATL _player;
        _droppedBeacon = "Satelit" createVehicle (position _player);
        _droppedBeacon setVariable["spawnsRemaining", 100, true];
        _droppedBeacon setVariable["faction","WORLD",true];
        _droppedBeacon setPos _pos;
        _to_delete = _to_delete + [_droppedBeacon];
};

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};
