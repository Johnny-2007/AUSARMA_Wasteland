//	@file Version: 1.0
//	@file Name: boxCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 19/12/2012 23:19
//	@file Args: [string (selected weapon crate), array (position)]

// This file is to address the serious imbalance caused by the default load-out of all weapon crates.

if(!X_Server) exitWith {};

private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_selectedBox = _this select 0;
_selectedBoxPos = _this select 1;

switch(_selectedBox) do {
	case "basicUS": { // Basic US 1 is mainly M16's and standard US Army weaponry
    	_currBox = createVehicle ["USBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M16A4",4];
	_currBox addWeaponCargoGlobal ["M16A4_GL",2];
	_currBox addWeaponCargoGlobal ["M249_EP1",1];
	_currBox addWeaponCargoGlobal ["M16A2",4];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",72];
        _currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",10];
        _currBox addMagazineCargoGlobal ["HandGrenade",15];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",24];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",15];  
    };
    case "basicUS2": { // Basic US 2 is a few M4's and some combat shotguns
    	_currBox = createVehicle ["USBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M4A1",2];
	_currBox addWeaponCargoGlobal ["M4A1_RCO_GL",2];
        _currBox addWeaponCargoGlobal ["M4A3_CCO_EP1",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",72];
        _currBox addMagazineCargoGlobal ["HandGrenade",5];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",10];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",10];
    };
    case "basicRU": { // Basic RU 1 is mainly AK's and better pistols, footsoldier weapons.
    	_currBox = createVehicle ["RUBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_107_kobra",4];
	_currBox addWeaponCargoGlobal ["AK_107_GL_kobra",2];
	_currBox addWeaponCargoGlobal ["AKS_74_U",4];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",48];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_GP25",15];
        _currBox addMagazineCargoGlobal ["1Rnd_SMOKE_GP25",15];
    };
    case "basicRU2": { // More Ak's and some shotguns and other crap
    	_currBox = createVehicle ["RUBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_47_M",2];
	_currBox addWeaponCargoGlobal ["AK_74",4];
	_currBox addWeaponCargoGlobal ["Saiga12K",8];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",48];
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",24];
        _currBox addMagazineCargoGlobal ["HandGrenade",5];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug",50];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets",50];
    };
    case "basicGER": { // G36's everywhere...
    	_currBox = createVehicle ["GERBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["G36_C_SD_eotech",2];
	_currBox addWeaponCargoGlobal ["G36a",2];
        _currBox addWeaponCargoGlobal ["MG36",1];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36",80];
        _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",10];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36SD",30];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
    };
    case "basicPMC": { // Most OP weapons in the game, this will be a saught after crate.
    	_currBox = createVehicle ["Ammobox_PMC", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M8_carbine",4];
	_currBox addWeaponCargoGlobal ["M8_carbineGL",2];
	_currBox addWeaponCargoGlobal ["AA12_PMC",3];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_Pellets",25];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_74Slug",25];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_HE",8];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",10];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",10];
    };
    case "basicSpecial": { // Silent weapons
    	_currBox = createVehicle ["SpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["m8_compact_pmc",2];
	_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_camo",2];
        _currBox addWeaponCargoGlobal ["m8_sharpshooter",4];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",25];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",25];
    };
    case "basicSpecial2": { // BAF weapons
    	_currBox = createVehicle ["SpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["BAF_L86A2_ACOG",3];
	_currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",3];
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",1];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",8];
        _currBox addMagazineCargoGlobal ["BAF_L109A1_HE",10];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",10];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",10];
    };
    case "basicSpecial3": { // Misc weapons, mostly shit
    	_currBox = createVehicle ["TKBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_47_S",3];
	_currBox addWeaponCargoGlobal ["LeeEnfield",4];
	_currBox addWeaponCargoGlobal ["FN_FAL",3];
        _currBox addWeaponCargoGlobal ["VSS_Vintorez",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",72];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",72];
        _currBox addMagazineCargoGlobal ["10x_303",48];
        _currBox addMagazineCargoGlobal ["10Rnd_9x39_SP5_VSS",10];
    };
    case "mission_Mid_BAF": { // Broad selection mid-high tier weapons 
    	_currBox = createVehicle ["BAF_BasicWeapons", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",2];
        _currBox addWeaponCargoGlobal ["SVD_CAMO",2];
	_currBox addWeaponCargoGlobal ["M14_EP1",2];			
	_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",2];
        _currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",2];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",1];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",1];		
	_currBox addWeaponCargoGlobal ["FN_FAL_ANPVS4",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",72];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",8];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",8];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",12];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",6];
        _currBox addMagazineCargoGlobal ["HandGrenade",8];
	_currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",8];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",12];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",12];
	_currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",8]; 		
    };
};
