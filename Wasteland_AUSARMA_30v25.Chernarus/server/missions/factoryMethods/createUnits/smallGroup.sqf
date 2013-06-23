//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_side","_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;
_side = _this select 2;

if (_side == civilian) then {
    
		//Anti Vehicle
		_leader = _group createunit ["RU_Soldier_AT", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
		
		//Support
		_man2 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
		
		//Rifleman
		_man3 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Sniper
		_man4 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
	    
} else {
    
    if (_side == west) then {
        
		//Anti Vehicle
		_leader = _group createunit ["USMC_Soldier_AT", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
		
		//Support
		_man2 = _group createunit ["USMC_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
		
		//Rifleman
		_man3 = _group createunit ["USMC_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Sniper
		_man4 = _group createunit ["USMC_SoldierS_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

    } else {
        
		//Anti Vehicle
		_leader = _group createunit ["RU_Soldier_AT", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
		
		//Support
		_man2 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
		
		//Rifleman
		_man3 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Sniper
		_man4 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
        
    };
    
};


_leader = leader _group;
[_group, _pos] call defendArea;
