//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
pvar_beaconListInd = [];
publicVariable "pvar_beaconListInd";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
"processVIP" addPublicVariableEventHandler {[_this] spawn server_VIPEscape};

"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

staticHeliWrecks = [
	"UH1Wreck",
    "UH1Wreck",
    "Mi8Wreck",
    "Mi8Wreck",
    "C130J_wreck_EP1",
    "UH60_wreck_EP1",
    "UH60_wreck_EP1"];
//Civilian Vehicle List - Random Spawns
civilianVehicles = [
			"car_hatchback",
			"car_sedan",
			"hilux1_civil_1_open",
			"SkodaGreen",
			"V3S_Civ",
			"UralCivil",
			"VWGolf",
			"Lada1_TK_CIV_EP1",
			"Old_moto_TK_Civ_EP1",
			"S1203_TK_CIV_EP1",
			"UAZ_Unarmed_TK_CIV_EP1",
			"ATV_US_EP1",
			"BAF_Offroad_W",
			"S1203_ambulance_EP1"
];

//Military Vehicle List - Random Spawns
militaryVehicles = [
			"UAZ_CDF",
			"SUV_PMC",
			"MTVR",
			"BAF_Offroad_W",
			"HMMWV",
			"HMMWV_Ambulance",
			"GAZ_Vodnik_MedEvac"
];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = [
			"ArmoredSUV_PMC",
			"Offroad_DSHKM_Ins",
			"UAZ_MG_TK_EP1",
			"UAZ_SPG9_INS",
			"Ural_ZU23_INS",
			"LandRover_MG_TK_INS_EP1",
			"HMMWV_M2",
			"HMMWV_Armored",
			"HMMWV_MK19",
			"HMMWV_TOW",
			"HMMWV_M1151_M2_DES_EP1",
			"HMMWV_M998A2_SOV_DES_EP1",
			"GAZ_Vodnik"
];

//Item Config
pickupList = [
    "Satelit",
    "EvMoney",
    "Suitcase",
    "Fuel_can"
];

//ObjectList-RandomSpawns.	
objectList=[
	["Land_Barrel_water",				1000,true,true],
	["Land_prebehlavka",				0,false,false],
	["Land_leseni2x",				0,false,false],
	["Fort_Crate_wood",				0,false,false],
	["Land_CamoNet_NATO",				5,false,false],
	["Land_Barrel_water",				1000,true,true],
	["Land_stand_small_EP1",			1000,true,true],
	["Land_stand_small_EP1",			1000,true,true],
	["Base_WarfareBBarrier10xTall",			0,false,false],
	["Base_WarfareBBarrier10x",			0,false,false],
	["Base_WarfareBBarrier5x",			0,false,false],
	["Base_WarfareBBarrier10xTall",			0,false,false],
	["Base_WarfareBBarrier10x",			0,false,false],
	["Base_WarfareBBarrier5x",			0,false,false],
	["Base_WarfareBBarrier10xTall",			0,false,false],
	["Base_WarfareBBarrier10x",			0,false,false],
	["Base_WarfareBBarrier5x",			0,false,false],
	["Fort_Barricade",				0,false,false],
	["Land_prebehlavka",				0,false,false],
	["Concrete_Wall_EP1",				0,false,false],
	["Land_fort_bagfence_long",			0,false,false],
	["Land_fort_bagfence_long",			0,false,false],
	["Land_fort_bagfence_round",			0,false,false],
	["Land_BagFenceLong",				0,false,false],
	["Land_BagFenceLong",				0,false,false],
	["Fort_RazorWire",				5,false,false],
	["Land_fortified_nest_small_EP1",		0,false,false],
	["Land_fort_rampart",				0,false,false],
	["Land_fort_rampart_EP1",			0,false,false],
	["Land_HBarrier_large",				0,false,false],
	["Land_HBarrier_large",				0,false,false],
	["Land_Misc_Scaffolding",			0,false,false],
	["Land_Fort_Watchtower_EP1",			0,false,false],
	["Land_Fort_Watchtower",			0,false,false],
	["Land_fortified_nest_big",			0,false,false],
	["Fort_Nest_M240",				10,false,false],
	["RampConcrete",				0,false,false],
	["WarfareBDepot",				20,false,false],
	["WarfareBCamp",				10,false,false],
	["ZavoraAnim",					10,false,false],
	["Land_ConcreteRamp",				20,false,false],
	["Land_CncBlock_Stripes",			0,false,false],
	["Land_GuardShed",				0,false,false],
	["Land_tent_east",				0,false,false],
	["ZavoraAnim",					0,false,false],
	["Land_ConcreteBlock",				0,false,false]
];	

ammoDamageTypeBallistic = [
	"B_",
	"F_"
];

ammoDamageTypeExplosive = [
	"R_",
	"M_",
	"Sh",
	"Bo",
	"G_"
];

//Object List - Random Spawns.
staticWeaponsList = [
    "M2StaticMG_US_EP1",
    "Fort_Nest_M240",    
    "DSHKM_TK_INS_EP1",
    "ZU23_TK_INS_EP1",    
    "Igla_AA_pod_TK_EP1"
];

//Object List - Random Helis.
staticHeliList = [
    "UH1H_TK_GUE_EP1",
    "UH1H_TK_GUE_EP1",
    "MH60S",
    "MH60S",
    "MV22",
    "CH_47F_EP1",
    "Mi17_TK_EP1",
    "Mi17_medevac_RU",
    "UH60M_MEV_EP1",
    "UH60M_MEV_EP1",
    "AH6X_EP1",
    "MH6J_EP1",
    "MH6J_EP1"
];

//Object List - AirBase Helis.
baseHeliList = [
    "MH60S",
    "MH6J_EP1",
    "MH60S",
    "MH6J_EP1"
];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = [
    "AK_107_GL_kobra",
    "AK_107_kobra",
    "AK_47_M",
    "AK_47_S",
    "AK_74",
    "AK_74_GL",
    "BAF_L110A1_Aim",
    "BAF_L7A2_GPMG",
    "BAF_L85A2_RIS_ACOG",
    "BAF_L85A2_UGL_Holo",
    "BAF_L86A2_ACOG",
    "FN_FAL",
    "G36a",
    "G36_C_SD_eotech",
    "M1014",
    "M16A2",
    "M14_EP1",
    "M16A2GL",
    "m16a4",
    "M249",
    "PK",
    "RPK_74",
    "M4A1_Aim",
    "M4A1_HWS_GL",
    "M4A3_CCO_EP1",
    "M4A3_RCO_GL_EP1",
    "M4A1_RCO_GL",
    "M16A4_ACG_GL",
    "M60A4_EP1",
    "m8_carbine",
    "MG36",
    "Sa58V_EP1",
    "Sa58V_CCO_EP1",
    "Saiga12K",
    "SCAR_H_CQC_CCO",
    "SCAR_L_CQC",
    "VSS_vintorez",
    "SCAR_L_STD_Mk4CQT",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_H_CQC_CCO_SD",
    "m8_SAW",
    "m8_holo_sd",
    "m8_compact_pmc",
    "m8_compact",
    "M4A1_RCO_GL",
    "M4A1_HWS_GL_SD_Camo",
    "M249_m145_EP1",
    "huntingrifle",
    "G36K_camo",
    "G36C_camo",
    "G36A_camo",
    "FN_FAL",
    "AK_107_pso",
    "AA12_PMC"
];

 vehicleWeapons_GL_WEST = [
    "BAF_L85A2_UGL_Holo",
    "M16A2GL",
    "M249",	
    "M4A1_HWS_GL",
    "M4A3_RCO_GL_EP1",
    "M4A1_RCO_GL",
    "M16A4_ACG_GL",
    "SCAR_L_STD_EGLM_RCO",
    "M4A1_RCO_GL",
    "M4A1_HWS_GL_SD_Camo",
    "G36K_camo"	
];
  
vehicleWeapons_GL_EAST = [
    "AK_107_GL_kobra",
    "AK_107_kobra",
    "AK_47_M",
    "AK_47_S",
    "AK_74",
    "AK_74_GL",
    "VSS_vintorez",
    "FN_FAL",
    "PK",
    "RPK_74"	
];
               
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false],
            ["Mission_21",false],
            ["Mission_22",false],
            ["Mission_23",false],
            ["Mission_24",false],
            ["Mission_25",false],
            ["Mission_26",false],
            ["Mission_27",false],
            ["Mission_28",false],
            ["Mission_29",false],
            ["Mission_30",false],
            ["Mission_31",false],
            ["Mission_32",false],
            ["Mission_33",false],
            ["Mission_34",false],
            ["Mission_35",false],
            ["Mission_36",false],
            ["Mission_37",false],
            ["Mission_38",false],
            ["Mission_39",false],
            ["Mission_40",false],
            ["Mission_41",false],
            ["Mission_42",false],
            ["Mission_43",false],
            ["Mission_44",false],
            ["Mission_45",false],
            ["Mission_46",false],
            ["Mission_47",false],
            ["Mission_48",false],
            ["Mission_49",false],
            ["Mission_50",false],
            ["Mission_51",false],
            ["Mission_52",false],
            ["Mission_53",false],
            ["Mission_54",false],
            ["Mission_55",false],
            ["Mission_56",false],
            ["Mission_57",false],
            ["Mission_58",false],
            ["Mission_59",false],
            ["Mission_60",false],
            ["Mission_61",false],
            ["Mission_62",false],
            ["Mission_63",false],
            ["Mission_64",false]
];

CQMissionSpawnMarkers = [
            ["MissionCQ_1",false],
            ["MissionCQ_2",false],
            ["MissionCQ_3",false],
            ["MissionCQ_4",false],
            ["MissionCQ_5",false],
            ["MissionCQ_6",false],
            ["MissionCQ_7",false],
            ["MissionCQ_8",false],
            ["MissionCQ_9",false],
            ["MissionCQ_10",false],
            ["MissionCQ_11",false],
            ["MissionCQ_12",false],
            ["MissionCQ_13",false],
            ["MissionCQ_14",false],
            ["MissionCQ_15",false],
            ["MissionCQ_16",false],
            ["MissionCQ_17",false],
            ["MissionCQ_18",false],
            ["MissionCQ_19",false],
            ["MissionCQ_20",false],
            ["MissionCQ_21",false],
            ["MissionCQ_22",false],
            ["MissionCQ_23",false],
            ["MissionCQ_24",false],
            ["MissionCQ_25",false],
            ["MissionCQ_26",false],
            ["MissionCQ_27",false],
            ["MissionCQ_28",false],
            ["MissionCQ_29",false],
            ["MissionCQ_30",false],
            ["MissionCQ_31",false],
            ["MissionCQ_32",false],
            ["MissionCQ_33",false],
            ["MissionCQ_34",false],
            ["MissionCQ_35",false],
            ["MissionCQ_36",false],
            ["MissionCQ_37",false],
            ["MissionCQ_38",false],
            ["MissionCQ_39",false],
            ["MissionCQ_40",false],
            ["MissionCQ_41",false],
            ["MissionCQ_42",false],
            ["MissionCQ_43",false],
            ["MissionCQ_44",false],
            ["MissionCQ_45",false],
            ["MissionCQ_46",false],
            ["MissionCQ_47",false],
            ["MissionCQ_48",false],
            ["MissionCQ_49",false],
            ["MissionCQ_50",false]

];
