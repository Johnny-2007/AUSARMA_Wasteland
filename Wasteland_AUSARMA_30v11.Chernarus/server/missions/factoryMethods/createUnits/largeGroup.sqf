//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!isServer) exitWith {};

private ["_side","_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;
_side = _this select 2;

if (_side == civilian) then {
    
	//Anti Air no weapon
	_leader = _group createunit ["Priest", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
	_leader addMagazine "Strela";
	_leader addWeapon "Strela";
	_leader addMagazine "30Rnd_545x39_AK";
	_leader addMagazine "30Rnd_545x39_AK";
	_leader addMagazine "30Rnd_545x39_AK";
	_leader addWeapon "AKS_74_U";
	
	//Support
	_man2 = _group createunit ["Woodlander4", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
	_man2 addMagazine "75Rnd_545x39_RPK";
	_man2 addMagazine "75Rnd_545x39_RPK";
	_man2 addWeapon "RPK_74";
	
	//Rifle_man
	_man3 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
	_man3 addMagazine "30Rnd_762x39_AK47";
	_man3 addMagazine "30Rnd_762x39_AK47";
	_man3 addMagazine "30Rnd_762x39_AK47";
	_man3 addWeapon "AK_47_M";
	
	//Rifle_man
	_man4 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
	_man4 addMagazine "30Rnd_762x39_AK47";
	_man4 addMagazine "30Rnd_762x39_AK47";
	_man4 addMagazine "30Rnd_762x39_AK47";
	_man4 addWeapon "AK_47_M";
	
	//Sniper
	_man5 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
	_man5 addMagazine "10Rnd_762x54_SVD";
	_man5 addMagazine "10Rnd_762x54_SVD";
	_man5 addMagazine "10Rnd_762x54_SVD";
	_man5 addWeapon "SVD";
	
	//Grenadier
	_man6 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
	_man6 addMagazine "30Rnd_545x39_AK";
	_man6 addMagazine "30Rnd_545x39_AK";
	_man6 addMagazine "30Rnd_545x39_AK";
	_man6 addMagazine "1Rnd_HE_GP25";
	_man6 addMagazine "1Rnd_HE_GP25";
	_man6 addMagazine "1Rnd_HE_GP25";
	_man6 addWeapon "AK_74_GL";
	
	//Support
	_man7 = _group createunit ["Woodlander4", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
	_man7 addMagazine "75Rnd_545x39_RPK";
	_man7 addMagazine "75Rnd_545x39_RPK";
	_man7 addWeapon "RPK_74";
	
	//Grenadier
	_man8 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
	_man8 addMagazine "30Rnd_545x39_AK";
	_man8 addMagazine "30Rnd_545x39_AK";
	_man8 addMagazine "30Rnd_545x39_AK";
	_man8 addMagazine "1Rnd_HE_GP25";
	_man8 addMagazine "1Rnd_HE_GP25";
	_man8 addMagazine "1Rnd_HE_GP25";
	_man8 addWeapon "AK_74_GL";
	
	//Sniper
	_man9 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
	_man9 addMagazine "10Rnd_762x54_SVD";
	_man9 addMagazine "10Rnd_762x54_SVD";
	_man9 addMagazine "10Rnd_762x54_SVD";
	_man9 addWeapon "SVD";
	
	//Rifle_man
	_man10 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
	_man10 addMagazine "30Rnd_762x39_AK47";
	_man10 addMagazine "30Rnd_762x39_AK47";
	_man10 addMagazine "30Rnd_762x39_AK47";
	_man10 addWeapon "AK_47_M";

	// Add event handlers for dropping items and money.
	_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man5 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man6 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man7 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man8 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man9 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man10 addEventHandler ["Killed", {[_this] call createLootMoney;}];

	    
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

		// Add event handlers for dropping items and money.
		_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man5 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man6 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man7 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man8 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man9 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man10 addEventHandler ["Killed", {[_this] call createLootMoney;}];

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

		// Add event handlers for dropping items and money.
		_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man5 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man6 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man7 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man8 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man9 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man10 addEventHandler ["Killed", {[_this] call createLootMoney;}];
        
    };
    
};

_leader = leader _group;
[_group, _pos] call defendArea;