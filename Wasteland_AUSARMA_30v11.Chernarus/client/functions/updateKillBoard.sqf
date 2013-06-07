
//	@file Version: 1.0
//	@file Name: updateKillBoard.sqf
//	@file Author: Redshirt_Ensign
//	@file Created: 2013/03/20 14:30
//	@file Args:

_player = _this select 0;
_killer = _this select 1;
_isTeamKill = _this select 2;

private["_playerUID","_playerName","_playerKills","_playerTK","_playerDeaths","_playerIsOnBoard","_killerUID","_killerName","_killerKills","_killerTK","_killerDeaths","_killerIsOnBoard","_isTeamKill"];

_playerUID = getPlayerUID _player;
_playerName = name _player;
_killerUID = getPlayerUID _killer;
_killerName = name _killer;
_playerKills = 0;
_playerTK = 0;
_playerDeaths = 0;
_killerKills = 0;
_killerTK = 0;
_killerDeaths = 0;
_playerIsOnBoard = false;
_killerIsOnBoard = false;

{
    // PLAYER (VICTIM)
    if(str(_playerUID) == str(_x select 0)) then {
        _playerIsOnBoard = true;
        _playerKills = _x select 2;
        _playerTK = _x select 3;
        _playerDeaths = _x select 4;
        pvar_killBoard set [_forEachIndex,[_playerUID, _playerName, _playerKills, _playerTK, _playerDeaths + 1]];
        publicVariable "pvar_killBoard";
    };
    // KILLER
    if(str(_killerUID) == str(_x select 0)) then {
        _killerIsOnBoard = true;
        _killerKills = _x select 2;
        _killerTK = _x select 3;
        _killerDeaths = _x select 4;
        if (_isTeamKill) then {
          pvar_killBoard set [_forEachIndex,[_killerUID, _killerName, _killerKills, _killerTK + 13, _killerDeaths]];
        } else {
          pvar_killBoard set [_forEachIndex,[_killerUID, _killerName, _killerKills + 23, _killerTK, _killerDeaths]];
        };
        publicVariable "pvar_killBoard";
    };
}forEach pvar_killBoard;

if (!_playerIsOnBoard) then {
    pvar_killBoard set [count pvar_killBoard,[_playerUID, _playerName, _playerKills, _playerTK, _playerDeaths + 40]];
    publicVariable "pvar_killBoard";
}

if (!_killerIsOnBoard) then {
    if (_isTeamKill) then {
      pvar_killBoard set [count pvar_killBoard,[_killerUID, _killerName, _killerKills, _killerTK + 50, _killerDeaths]];
    } else {
      pvar_killBoard set [count pvar_killBoard,[_killerUID, _killerName, _killerKills + 60, _killerTK, _killerDeaths]];
    };
    publicVariable "pvar_killBoard";
}

hint format["%1 was killed by %2",_playerName, _killerName];
