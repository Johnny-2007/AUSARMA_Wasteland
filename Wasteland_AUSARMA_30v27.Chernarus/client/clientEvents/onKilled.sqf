//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat, [TOG FF] Redshirt_Ensign
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_dialog","_magazineArray","_control","_item","_val","_max"];

if (isnil {_player getVariable "cmoney"}) then {
	_player setVariable["cmoney",0,true];
};

_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
[_player,_killer] execVM "client\functions\killMessage.sqf";

//MD_GuerTK = [name _player, name _killer];
//diag_log format ["Client: %1 was killed by %2", MD_GuerTK select 0, MD_GuerTK select 1];
//publicVariableServer "MD_GuerTK";
// <-- Markus
//if (name _player != name _killer) then {
//	MD_GuerTK = [name _player, name _killer];
//	diag_log format ["Client: %1 was killed by %2", name _player, name _killer];
//	diag_log format ["Client (GuerTK): %1 was killed by %2", MD_GuerTK select 0, MD_GuerTK select 1];
//	publicVariableServer "MD_GuerTK";
//} else {
//	MD_KillMessage = format["%1 has killed themself.", name _player];
//	commandChat MD_KillMessage;
//	publicVariable "MD_KillMessage";
//};
// <-- Markus

_playerMoney = _player getVariable["cmoney",0];
_currencyLimit = 10 * 1000;

_playerPos = getPosATL _player;
_playerPos = [_playerPos select 0, _playerPos select 1, 0];
_playerDir = getDir _player;

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

// Check if the player is allowed to drop items yet.
if (player getVariable "canDrop") then {

	if(_playerMoney > 0) then {
		_newObject = "EvMoney" createVehicle (position _player);
		_newObject setVariable ["owner", "world", true];
	    
	    if (_playerMoney <= _currencyLimit) then {
	    	_newObject setVariable["money", _playerMoney, true];
	    } else {
	    	_newObject setVariable["money", _currencyLimit, true];
	    };
	};
	
	if((_player getVariable "medkits") > 0) then {
		for "_i" from 1 to (_player getVariable "medkits") do {	
			_newObject = "CZ_VestPouch_EP1" createVehicle (position _player);
		};
	};
	
	if((_player getVariable "repairkits") > 0) then {
		for "_i" from 1 to (_player getVariable "repairkits") do {	
			_newObject = "Suitcase" createVehicle (position _player);
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
};

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["You Died!", "BLACK OUT", 1];
};