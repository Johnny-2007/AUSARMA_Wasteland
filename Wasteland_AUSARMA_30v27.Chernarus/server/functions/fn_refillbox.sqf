//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
if (!isServer) exitWith {};
private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch(_selectedBox) do {
    case "mission_Mid_BAF": { // Broad selection of mid-high tier weapons 
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["SVD_CAMO",1];
	_currBox addWeaponCargoGlobal ["M14_EP1",2];			
	_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",2];
	_currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",2];
	_currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",2];		
	_currBox addWeaponCargoGlobal ["FN_FAL",2];
	_currBox addWeaponCargoGlobal ["RPG7V",2];
        
        // Add ammunition
	_currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",12];
	_currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",20];
	_currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",16];
	_currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",16];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",72];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",12];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",24];
	_currBox addMagazineCargoGlobal ["PG7V",6];
        _currBox addMagazineCargoGlobal ["HandGrenade",8];
    };
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;

	// Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["RPG7V",2];
	_currBox addWeaponCargoGlobal ["SMAW",2];
	_currBox addWeaponCargoGlobal ["M32_EP1",2];
	// Add ammunition
	_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",25];
	_currBox addMagazineCargoGlobal ["6Rnd_HE_M203",12];
	_currBox addMagazineCargoGlobal ["PG7V",10];
	_currBox addMagazineCargoGlobal ["SMAW_HEAA",10];
	_currBox addMagazineCargoGlobal ["HandGrenade",10];
	_currBox addMagazineCargoGlobal ["Mine",4];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_CAMO",2];
	_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_CAMO",2];
	_currBox addWeaponCargoGlobal ["DMR",2];
	_currBox addWeaponCargoGlobal ["M107",1];
	_currBox addWeaponCargoGlobal ["Binocular_Vector",3];

	_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",20];
	_currBox addMagazineCargoGlobal ["HandGrenade",15];
	_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",20];
	_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
	_currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",15];
	_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",5];		
    };
     case "mission_CQC_Weapons": { // Used in the weapon stash CQ mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_NLAW_Launcher",1];
        _currBox addWeaponCargoGlobal ["Stinger",1];
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",1];
        _currBox addWeaponCargoGlobal ["Mk_48",1];
        _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO",2];
        _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD",2];
        _currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO",1];
        _currBox addWeaponCargoGlobal ["Binocular_Vector",2];
        _currBox addWeaponCargoGlobal ["RPG7V",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["NLAW",2];
        _currBox addMagazineCargoGlobal ["Stinger",3];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",6];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",16];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",8];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",30];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR",30];
        _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",10];
        _currBox addMagazineCargoGlobal ["BAF_ied_v2",5];
        _currBox addMagazineCargoGlobal ["PG7VR",4];
    };	
};
