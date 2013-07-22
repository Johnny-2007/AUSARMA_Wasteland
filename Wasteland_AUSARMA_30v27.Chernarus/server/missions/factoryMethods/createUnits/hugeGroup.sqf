//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_side","_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;
_side = _this select 2;

if (_side == civilian) then {
    
		//Anti Air no weapon
		_leader = _group createunit ["RU_Soldier_AA", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];

		//Support
		_man2 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];

		//Rifle_man
		_man3 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Rifle_man
		_man4 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];

		//Sniper
		_man5 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

		//Grenadier
		_man6 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];

		//Support
		_man7 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];

		//Grenadier
		_man8 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];

		//Sniper
		_man9 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];

		//Anti Vehicle
		_man10 = _group createunit ["RU_Soldier_AT", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Rifle_man
		_man11 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Rifle_man
		_man12 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Anti Air no weapon
		_man13 = _group createunit ["RU_Soldier_AA", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
		
		//Sniper
		_man14 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
		
		//Grenadier
		_man15 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
		
		//Anti Vehicle
		_man16 = _group createunit ["RU_Soldier_AT", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
	    
} else {
    
    if (_side == west) then {
        
		//Anti Air no weapon
		_leader = _group createunit ["USMC_Soldier_AA", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];

		//Support
		_man2 = _group createunit ["USMC_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];

		//Rifle_man
		_man3 = _group createunit ["USMC_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Rifle_man
		_man4 = _group createunit ["USMC_Soldier", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];

		//Sniper
		_man5 = _group createunit ["USMC_SoldierS_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

		//Grenadier
		_man6 = _group createunit ["USMC_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];

		//Support
		_man7 = _group createunit ["USMC_Soldier_MG", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];

		//Grenadier
		_man8 = _group createunit ["USMC_Soldier_GL", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];

		//Sniper
		_man9 = _group createunit ["USMC_SoldierS_Sniper", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];

		//Anti Vehicle
		_man10 = _group createunit ["USMC_Soldier_AT", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Rifle_man
		_man11 = _group createunit ["USMC_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Rifle_man
		_man12 = _group createunit ["USMC_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Anti Air no weapon
		_man13 = _group createunit ["USMC_Soldier_AA", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
		
		//Sniper
		_man14 = _group createunit ["USMC_SoldierS_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
		
		//Grenadier
		_man15 = _group createunit ["USMC_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
		
		//Anti Vehicle
		_man16 = _group createunit ["USMC_Soldier_AT", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

    } else {
        
		//Anti Air no weapon
		_leader = _group createunit ["RU_Soldier_AA", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];

		//Support
		_man2 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];

		//Rifle_man
		_man3 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Rifle_man
		_man4 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];

		//Sniper
		_man5 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

		//Grenadier
		_man6 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];

		//Support
		_man7 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];

		//Grenadier
		_man8 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];

		//Sniper
		_man9 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];

		//Anti Vehicle
		_man10 = _group createunit ["RU_Soldier_AT", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
		
		//Rifle_man
		_man11 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];

		//Anti Air no weapon
		_man12 = _group createunit ["RU_Soldier_AA", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

		//Grenadier
		_man13 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];

		//Support
		_man14 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];

		//Grenadier
		_man15 = _group createunit ["RU_Soldier_GL", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];

		//Sniper
		_man16 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
        
    };
    
};

_leader = leader _group;
[_group, _pos] call defendArea;