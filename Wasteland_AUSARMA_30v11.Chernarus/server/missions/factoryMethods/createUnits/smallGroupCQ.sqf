//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, Redshirt_Ensign
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!isServer) exitWith {};

private ["_side","_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;
_side = _this select 2;

if (_side == civilian) then {
    
	//Anti Vehicle
	_leader = _group createunit ["Priest", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
	_leader addMagazine "PG7V";
	_leader addMagazine "PG7V";
	_leader addWeapon "RPG7V";
	_leader addMagazine "30Rnd_762x39_SA58";
	_leader addMagazine "30Rnd_762x39_SA58";
	_leader addMagazine "30Rnd_762x39_SA58";
	_leader addWeapon "Sa58V_EP1";
	
	//Support
	_man2 = _group createunit ["CIV_EuroMan02_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
	_man2 addMagazine "100Rnd_762x54_PK";
	_man2 addMagazine "100Rnd_762x54_PK";
	_man2 addWeapon "Pecheneg";
	
	//Rifleman
	_man3 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
	_man3 addMagazine "30Rnd_762x39_SA58";
	_man3 addMagazine "30Rnd_762x39_SA58";
	_man3 addMagazine "30Rnd_762x39_SA58";
	_man3 addWeapon "Sa58V_CCO_EP1";
	
	//Sniper
	_man4 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
	_man4 addMagazine "30Rnd_762x39_SA58";
	_man4 addMagazine "30Rnd_762x39_SA58";
	_man4 addMagazine "30Rnd_762x39_SA58";
	_man4 addWeapon "Sa58V_RCO_EP1";

	// Add event handlers for dropping items and money.
	_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
	_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];


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

		// Add event handlers for dropping items and money.
		_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];


    } else {
        
		//Anti Vehicle
		_leader = _group createunit ["RU_Soldier_AT", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];

		//Support
		_man2 = _group createunit ["RU_Soldier_MG", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];

		//Rifleman
		_man3 = _group createunit ["RU_Soldier", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];

		//Sniper
		_man4 = _group createunit ["RU_Soldier_Sniper", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];

		// Add event handlers for dropping items and money.
		_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
		_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];


    };
    
};

_leader = leader _group;
[_group, _pos] call defendArea;
