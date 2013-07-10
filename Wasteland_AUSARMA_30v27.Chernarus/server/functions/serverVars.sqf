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
if(!X_Server) exitWith {};

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
cancelMissionMain = false;
cancelMissionSide = false;
cancelMissionCQ = false;

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
	"C130J_wreck_EP1",
	"UH1Wreck",
	"Mi8Wreck",
	"Mi8Wreck",
	"UH1Wreck",
	"UH1Wreck",
	"UH60_wreck_EP1",
	"UH60_wreck_EP1"];
//Civilian Vehicle List - Random Spawns
civilianVehicles = [
			"ATV_US_EP1",
			"car_hatchback",
			"car_sedan",
			"hilux1_civil_1_open",
			"Lada1_TK_CIV_EP1",
			"Old_moto_TK_Civ_EP1",
			"S1203_ambulance_EP1",
			"S1203_TK_CIV_EP1",
			"SkodaGreen",
			"SUV_TK_EP1",
			"UAZ_Unarmed_TK_CIV_EP1",
			"UralCivil",
			"V3S_Civ",
			"VWGolf"
];

//Military Vehicle List - Random Spawns
militaryVehicles = [
			"LandRover_CZ_EP1",
			"GAZ_Vodnik_MedEvac",
			"HMMWV",
			"HMMWV_Ambulance",
			"MTVR",
			"UAZ_CDF",
			"UralOpen_CDF"
];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = [
			"BRDM2_HQ_Gue",
			"BTR40_MG_TK_GUE_EP1",
			"GAZ_Vodnik",
			"HMMWV_Armored",
			"HMMWV_M1151_M2_DES_EP1",
			"HMMWV_M2",
			"HMMWV_M998A2_SOV_DES_EP1",
			"HMMWV_MK19",
			"HMMWV_TOW",
			"LandRover_MG_TK_EP1",
			"Offroad_DSHKM_Ins",
			"UAZ_AGS30_RU",
			"UAZ_MG_CDF",
			"UAZ_SPG9_INS",
			"Ural_ZU23_INS"
];

//Item Config
pickupList = [
    "EvMoney",
    "Fuel_can",
    "Satelit",
    "Suitcase"
];

//ObjectList-RandomSpawns.	
objectList=[
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBBarrier5x",
	"Fort_Barricade",
	"Land_Barrel_water",
	"Land_Barrel_water",
	"Land_CncBlock_Stripes",
	"Land_ConcreteBlock",
	"Land_ConcreteBlock",	
	"Land_ConcreteRamp",
	"Land_ConcreteRamp",
	"Land_fortified_nest_big",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_round",
	"Land_fort_rampart",
	"Land_Fort_Watchtower",
	"Land_HBarrier_large",
	"Land_HBarrier_large",
	"Land_leseni2x",
	"Land_prebehlavka",
	"Land_prebehlavka",
	"Land_stand_small_EP1",
	"Land_stand_small_EP1",
	"RampConcrete",
	"WarfareBDepot"
];	

//Object List - Random Spawns.
staticWeaponsList = [
	"BAF_L2A1_Tripod_D",
	"DSHKM_TK_INS_EP1",
	"Fort_Nest_M240",    
	"Igla_AA_pod_TK_EP1",
	"M2HD_mini_TriPod_US_EP1",
	"M2StaticMG_US_EP1",
	"SPG9_TK_INS_EP1",
	"ZU23_TK_EP1"
];

//Object List - Random Helis.
staticHeliList = [
    "BAF_Merlin_HC3_D",
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

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = [
	"AA12_PMC",
	"AK_107_GL_kobra",
	"AK_107_kobra",
	"AK_107_pso",
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
	"FN_FAL",
	"G36a",
	"G36A_camo",
	"G36C_camo",
	"G36K_camo",
	"G36_C_SD_eotech",
	"huntingrifle",
	"LeeEnfield",
	"M1014",
	"M14_EP1",
	"M16A2",
	"M16A2GL",
	"m16a4",
	"M16A4_ACG_GL",
	"M249",
	"M249_m145_EP1",
	"M4A1_Aim",
	"M4A1_HWS_GL",
	"M4A1_HWS_GL_SD_Camo",
	"M4A1_RCO_GL",
	"M4A1_RCO_GL",
	"M4A3_CCO_EP1",
	"M4A3_RCO_GL_EP1",
	"M60A4_EP1",
	"m8_carbine",
	"m8_compact",
	"m8_compact_pmc",
	"m8_holo_sd",
	"m8_SAW",
	"MG36",
	"PK",
	"RPK_74",
	"Sa58V_CCO_EP1",
	"Sa58V_EP1",
	"Saiga12K",
	"SCAR_H_CQC_CCO",
	"SCAR_H_CQC_CCO_SD",
	"SCAR_L_CQC",
	"SCAR_L_STD_EGLM_RCO",
	"SCAR_L_STD_Mk4CQT",
	"VSS_vintorez"
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
