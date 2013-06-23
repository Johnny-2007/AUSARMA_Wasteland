/**
 * English and French comments
 * Commentaires anglais et français
 * 
 * This file contains the configuration variables of the logistics system.
 * Fichier contenant les variables de configuration du système de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes dérivant de celles utilisées dans les variables de configuration seront aussi valables.
 */

/*
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 * 
 * Deux moyens existent pour gérer de nouveaux objets avec le système logistique. Le premier consiste à ajouter
 * ces objets dans les listes appropriées ci-dessous. Le deuxième est de créer un fichier externe dans le répertoire
 * /addons_config/ selon le même schéma que ceux qui existent déjà, et d'ajouter un #include à la fin de ce présent fichier.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs = [
	"Car",
	"Ship",
	"TowingTractor",
	"Tractor",
	"Truck",
	"Wheeled_APC"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
	"An2_Base_EP1",
	"Car",
	"Truck",
	"Ship",
	"Wheeled_APC"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des véhicules aériens pouvant héliporter des objets héliportables.
 */
R3F_LOG_CFG_heliporteurs = [
	"BAF_Merlin_HC3_D",
	"CH47_base_EP1",
	"UH60_Base",		// UH60S, UH60M
	"Mi17_base",
	"Mi24_Base",
	"MV22",				// VTOL Heliplane
	"UH1_Base",			// UH1Y Gunship
	"UH1H_base"		// Huey
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_objets_heliportables = [
	"Car",
	"TowingTractor",
	"tractor",
	"Truck",
	"UAZ_Base",
	"VWGolf",
	"Wheeled_APC",
	"Misc_cargo_cont_small",
	"Land_Misc_Cargo1D",
	"Ship"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le référentiel arbitraire utilisé est : une caisse de munition de type USVehicleBox "pèse" 12 unités.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorité d'une déclaration de capacité sur une autre correspond à leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient à la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est déclaré avec une capacité de 140 avant "Car". Et que "Car" est déclaré après "Truck" avec une capacité de 40,
 *   Alors toutes les sous-classes appartenant à "Truck" auront une capacité de 140. Et toutes les sous-classes appartenant
 *   à "Car", exceptées celles de "Truck", auront une capacité de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des véhicules (terrestres ou aériens) pouvant transporter des objets transportables.
 * Le deuxième élément des tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_transporteurs = [
	["AAV", 20],	
	["AH6_Base_EP1", 25],
	["An2_Base_EP1", 40],
	["ArmoredSUV_Base_PMC", 10],
	["ATV_Base_EP1", 5],	
	["BAF_Jackal2_BASE_D", 15],
	["BAF_Merlin_HC3_D",80],
	["BMP2_Base", 7],	
	["BRDM2_Base", 15],
	["BTR40_MG_base_EP1", 12],	
	["C130J", 150],
	["CH47_base_EP1", 80],
	["Fort_Crate_wood", 20],
	["GAZ_Vodnik_HMG", 20],
	["hilux1_civil_1_open", 15],
	["hilux1_civil_3_open", 15],
	["HMMWV_Ambulance", 15],
	["HMMWV_Ambulance_CZ_DES_EP1", 15],
	["HMMWV_Ambulance_DES_EP1", 15],
	["HMMWV_Armored", 10],
	["HMMWV_Avenger", 10],
	["HMMWV_Avenger_DES_EP1", 10],
	["HMMWV_DES_EP1", 10],
	["HMMWV_M1035_DES_EP1", 10],
	["HMMWV_M1151_M2_CZ_DES_EP1", 10],
	["HMMWV_M1151_M2_DES_EP1", 10],
	["HMMWV_M2", 10],
	["HMMWV_M998A2_SOV_DES_EP1", 10],
	["HMMWV_M998_crows_M2_DES_EP1", 10],
	["HMMWV_M998_crows_MK19_DES_EP1", 10],
	["HMMWV_MK19", 10],
	["HMMWV_MK19_DES_EP1", 10],
	["HMMWV_Terminal_EP1", 15],
	["HMMWV_TOW", 10],
	["HMMWV_TOW_DES_EP1", 10],
	["Kamaz_Base", 5],
	["Lada_base", 8],
	["LandRover_CZ_EP1", 10],
	["LandRover_MG_Base_EP1", 5],
	["LandRover_Special_CZ_EP1", 5],
	["LandRover_SPG9_Base_EP1", 5],
	["Land_Misc_Cargo1D", 150],
	["M113_Base", 15],
	["Mi17_base", 60],
	["Motorcycle", 2],
	["Motorcycle", 5],
	["MTVR", 50],
	["MtvrReammo", 5],
	["MtvrRefuel", 5],
	["MtvrRepair", 5],
	["MV22", 80],
	["Offroad_DSHKM_base", 10],
	["Pickup_PK_base", 10],
	["S1203_TK_CIV_EP1", 15],
	["Ship", 10],
	["SkodaBase", 8],	
	["StrykerBase_EP1", 25],
	["SUV_Base_EP1", 15],
	["T34", 5],
	["T55_Base", 5],
	["T72_Base", 5],
	["TowingTractor", 5],
	["Tractor", 5],
	["UAZ_AGS30_Base", 5],
	["UAZ_MG_Base", 5],
	["UAZ_SPG9_Base", 5],
	["UAZ_Unarmed_Base", 12],
	["UH1H_base", 35],
	["UH1_Base", 30],
	["UH60_Base", 40],
	["UralCivil", 50],
	["UralCivil2", 50],
	["UralRefuel_Base", 5],
	["Ural_Base", 35],
	["Ural_CDF", 50],
	["Ural_INS", 50],
	["Ural_TK_CIV_EP1", 50],
	["Ural_UN_EP1", 50],
	["Ural_ZU23_Base", 20],
	["V3S_Base_EP1", 40],
	["V3S_Civ", 50],
	["V3S_Refuel_TK_GUE_EP1", 10],
	["Volha_TK_CIV_Base_EP1", 8],
	["VWGolf", 8],
	["ZSU_Base", 5]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
 
R3F_LOG_CFG_objets_transportables =  [
	["2b14_82mm", 4],
	["ACamp", 3],
	["AGS_base", 4],
	["AmmoCrate_NoInteractive_Base_EP1", 5],
	["ATV_Base_EP1", 10],
	["BAF_L2A1_ACOG_base", 4],
	["Barrack2", 15],
	["BarrelBase", 2],
	["Base_WarfareBBarrier10x", 7],
	["Base_WarfareBBarrier10x", 8],
	["Base_WarfareBBarrier10xTall", 10],
	["Base_WarfareBBarrier10xTall", 10],
	["Base_WarfareBBarrier5x", 5],
	["Camp", 5],
	["CampEast", 6],
	["Concrete_Wall_EP1", 5],
	["CZBasicWeapons_EP1", 5],
	["Desk", 1],
	["DSHKM_base", 4],
	["DSHkM_Mini_TriPod_TK_INS_EP1", 4],
	["DSHKM_TK_INS_EP1", 4],
	["FlagCarrier", 1],
	["FlagCarrierChecked", 1],
	["FlagCarrierSmall", 1],
	["FoldChair", 1],
	["FoldChair_with_Cargo", 1],
	["FoldTable", 1],
	["Fort_Barracks_USMC", 15],
	["Fort_Barricade",4],
	["Fort_Crate_wood", 2],
	["Fort_EnvelopeBig", 1],
	["Fort_EnvelopeBig_EP1",3],
	["Fort_EnvelopeSmall", 1],
	["Fort_EnvelopeSmall_EP1",2],
	["Fort_RazorWire", 2],
	["Fort_StoneWall_EP1", 5],
	["Fuel_can",1],
	["GERBasicWeapons_EP1", 5],
	["GMG_TriPod", 4],
	["GuerillaCacheBox", 5],
	["GuerillaCacheBox_EP1", 5],
	["Hedgehog", 3],
	["Igla_AA_pod_East", 7],
	["Ka137_Base_PMC", 15],
	["KORD_Base", 4],
	["Land_Antenna", 15],
	["Land_BagFenceCorner", 2],
	["Land_BagFenceLong",2],
	["Land_Bag_EP1",1],
	["Land_Barrel_water",2],
	["Land_CamoNet_NATO", 3],
	["Land_Campfire_burning",1],
	["Land_Chair_EP1", 1],
	["Land_Climbing_Obstacle", 3],
	["Land_CncBlock", 2],
	["Land_CncBlock_Stripes", 2],
	["Land_ConcreteBlock", 20],
	["Land_ConcreteRamp", 15],
	["Land_Dirthump01", 10],
	["Land_Fire_barrel", 1],
	["Land_Fire_barrel_burning",1],
	["Land_fortified_nest_big", 15],
	["Land_fortified_nest_small", 6],
	["Land_fortified_nest_small",3],
	["Land_fort_artillery_nest",10],
	["Land_fort_bagfence_corner", 2],
	["Land_fort_bagfence_long", 2],
	["Land_fort_bagfence_round", 3],
	["Land_fort_rampart",6],
	["Land_Fort_Watchtower", 8],
	["Land_Fort_Watchtower_EP1",8],
	["Land_GuardShed", 3],
	["Land_HBarrier5",3],
	["Land_HBarrier5",3],
	["Land_HBarrier_large", 3],
	["Land_HBarrier_large",7],
	["Land_ladder", 5],
	["Land_ladder_half", 3],
	["Land_leseni2x", 8],
	["Land_leseni4x", 15],
	["Land_Misc_ConcPipeline_EP1", 5],
	["Land_Misc_deerstand", 3],
	["Land_Misc_Rubble_EP1", 2],
	["Land_Misc_Scaffolding", 5],
	["Land_prebehlavka", 4],
	["Land_prolejzacka", 5],
	["Land_RedWhiteBarrier", 2],
	["Land_runway_edgelight", 1],
	["Land_Sack_EP1",1],
	["Land_stand_small_EP1",1],
	["Land_Teapot_EP1",1],
	["Land_tent_east", 6],
	["Land_Toilet", 3],
	["Land_WoodenRamp", 2],
	["LocalBasicAmmunitionBox", 5],
	["LocalBasicWeaponsBox", 5],
	["M1030", 5],
	["M252", 4],
	["M2HD_mini_TriPod", 4],
	["M2StaticMG_base", 4],
	["MASH", 5],
	["Metis", 4],
	["Misc_cargo_cont_tiny", 10],
	["MK19_TriPod", 4],
	["MMT_base", 1],
	["Notebook", 1],
	["Notice_board", 1],
	["Obstacle_saddle", 2],
	["Old_bike_base_EP1", 1],
	["Old_moto_base", 5],
	["Paleta1", 2],
	["Pchela1T", 15],
	["PowerGenerator", 10],
	["RampConcrete", 10],
	["ReammoBox", 5],
	["ReammoBox_EP1", 5],
	["RoadBarrier_light", 2],
	["RUBasicAmmunitionBox", 5],
	["RUBasicWeaponsBox", 5],
	["RULaunchersBox", 5],
	["RUOrdnanceBox", 5],
	["RUSpecialWeaponsBox", 5],
	["RUVehicleBox", 12],
	["Satelit", 15],
	["SatPhone", 1],
	["SmallTable", 1],
	["SpecialWeaponsBox", 5],
	["SPG9_base", 4],
	["StaticSEARCHLight", 4],
	["Stinger_Pod_base", 7],
	["Suitcase",1],
	["TKBasicAmmunitionBox_EP1", 5],
	["TKBasicWeapons_EP1", 5],
	["TKLaunchers_EP1", 5],
	["TKOrdnanceBox_EP1", 5],
	["TKSpecialWeapons_EP1", 5],
	["TKVehicleBox_EP1", 12],
	["TOW_TriPod", 5],
	["TOW_TriPod_Base", 5],
	["TT650_Base", 5],
	["UNBasicAmmunitionBox_EP1", 5],
	["UNBasicWeapons_EP1", 5],
	["USBasicAmmunitionBox", 5],
	["USBasicAmmunitionBox_EP1", 5],
	["USBasicWeaponsBox", 5],
	["USBasicWeapons_EP1", 5],
	["USLaunchersBox", 5],
	["USLaunchers_EP1", 5],
	["USOrdnanceBox", 5],
	["USOrdnanceBox_EP1", 5],
	["USSpecialWeaponsBox", 5],
	["USSpecialWeapons_EP1", 5],
	["USVehicleBox", 12],
	["USVehicleBox_EP1", 12],
	["Wall_L_2m5_EP1", 5],
	["Warfare2b14_82mm_Base", 4],
	["WarfareBCamp", 15],
	["WarfareBDepot", 30],
	["WarfareBMGNest_M240_base", 10],
	["WarfareBMGNest_PK_Base", 10],
	["ZavoraAnim", 2],
	["ZU23_base", 10]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */

R3F_LOG_CFG_objets_deplacables = [
	//Crates
	"ReammoBox_EP1",
	"LocalBasicAmmunitionBox",
	"LocalBasicWeaponsBox",
	"RUBasicAmmunitionBox",
	"RUBasicWeaponsBox",
	"RULaunchersBox",
	"RUOrdnanceBox",
	"RUSpecialWeaponsBox",
	"RUVehicleBox",
	"SpecialWeaponsBox",
	"USBasicAmmunitionBox",
	"USBasicWeaponsBox",
	"USLaunchersBox",
	"USOrdnanceBox",
	"USSpecialWeaponsBox",
	"USVehicleBox",
	"CZBasicWeapons_EP1",
	"GERBasicWeapons_EP1",
	"GuerillaCacheBox_EP1",
	"TKBasicAmmunitionBox_EP1",
	"TKBasicWeapons_EP1",
	"TKLaunchers_EP1",
	"TKOrdnanceBox_EP1",
	"TKSpecialWeapons_EP1",
	"TKVehicleBox_EP1",
	"UNBasicAmmunitionBox_EP1",
	"UNBasicWeapons_EP1",
	"USBasicAmmunitionBox_EP1",
	"USBasicWeapons_EP1",
	"USLaunchers_EP1",
	"USOrdnanceBox_EP1",
	"USSpecialWeapons_EP1",
	"USVehicleBox_EP1",

	//Misc
	"ACamp",
	"ATV_Base_EP1",
	"BAF_L2A1_ACOG_base",
	"Barrack2",
	"BarrelBase",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier5x",
	"Camp",
	"CampEast",
	"Concrete_Wall_EP1",
	"Desk",
	"FlagCarrier",
	"FlagCarrierChecked",
	"FlagCarrierSmall",
	"FoldChair",
	"FoldChair_with_Cargo",
	"FoldTable",
	"Fort_Barracks_USMC",
	"Fort_Barricade",
	"Fort_Crate_wood",
	"Fort_EnvelopeBig",
	"Fort_EnvelopeBig_EP1",
	"Fort_EnvelopeBig_EP1",
	"Fort_EnvelopeSmall",
	"Fort_EnvelopeSmall_EP1",
	"Fort_EnvelopeSmall_EP1",
	"Fort_RazorWire",
	"Fort_StoneWall_EP1",
	"Fuel_can",
	"Gunrack1",
	"Hedgehog",
	"Land_Antenna",
	"Land_arrows_yellow_L",
	"Land_arrows_yellow_R",
	"Land_A_tent",
	"Land_BagFenceLong",
	"Land_Bag_EP1",
	"Land_Barrel_empty",
	"Land_Barrel_sand",
	"Land_Barrel_water",
	"Land_CamoNet_NATO",
	"Land_Campfire_burning",
	"Land_Chair_EP1",
	"Land_Climbing_Obstacle",
	"Land_CncBlock",
	"Land_CncBlock_Stripes",
	"Land_ConcreteBlock",
	"Land_ConcreteRamp",
	"Land_coneLight",
	"Land_Dirthump01",
	"Land_Fire_barrel",
	"Land_Fire_barrel_burning",
	"Land_fortified_nest_big",
	"Land_fortified_nest_small",
	"Land_fort_artillery_nest",
	"Land_fort_bagfence_corner",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_round",
	"Land_fort_rampart",
	"Land_Fort_Watchtower",
	"Land_Fort_Watchtower_EP1",
	"Land_GuardShed",
	"Land_HBarrier5",
	"Land_HBarrier_large",
	"Land_ladder_half",
	"Land_leseni2x",
	"Land_leseni4x",
	"Land_Misc_Cargo1D",
	"Land_Misc_ConcPipeline_EP1",
	"Land_Misc_deerstand",
	"Land_Misc_IronPipes_EP1",
	"Land_Misc_Rubble_EP1",
	"Land_Misc_Scaffolding",
	"Land_prebehlavka",
	"Land_prolejzacka",
	"Land_RedWhiteBarrier",
	"Land_runway_edgelight",
	"Land_Sack_EP1",
	"Land_stand_small_EP1",
	"Land_Teapot_EP1",
	"Land_tent_east",
	"Land_Toilet",
	"Land_WoodenRamp",
	"MASH",
	"Misc_cargo_cont_tiny",
	"Motorcycle",
	"Notebook",
	"Obstacle_saddle",
	"Paleta1",
	"PowerGenerator",
	"Radio",
	"RampConcrete",
	"RoadBarrier_light",
	"Satelit",
	"SatPhone",
	"SmallTable",
	"SmallTV",
	"StaticWeapon",
	"Suitcase",
	"TargetE",
	"TargetEpopup",
	"TargetPopUpTarget",
	"Wall_L_2m5_EP1",
	"WarfareBunkerSign",
	"ZavoraAnim",

	//Items
	"EvMoney",
	"Fuel_can",
	"Satelit",
	"Suitcase",

	//Static Weapons
	"StaticMGWeapon",
	"StaticATWeapon",
	"StaticAAWeapon",
	"StaticCannon",
	"StaticGrenadeLauncher",
	"StaticMortar",
	"StaticSEARCHLight",
	"StaticCanon",

	//Vehicles
	"ATV_Base_EP1",
	"Ka137_Base_PMC",
	"Motorcycle",

	//Objects
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBContructionSite",
	"Fort_Barracks_USMC",
	"Fort_Barricade",
	"Fort_Crate_wood",
	"Fort_RazorWire",
	"Hedgehog",
	"Land_BagFenceLong",
	"Land_Barrel_water",
	"Land_CncBlock",
	"Land_ConcreteBlock",
	"Land_ConcreteRamp",
	"Land_fortified_nest_big",
	"Land_fortified_nest_small",
	"Land_fort_artillery_nest",
	"Land_fort_bagfence_corner",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_round",
	"Land_fort_rampart",
	"Land_Fort_Watchtower",
	"Land_GuardShed",
	"Land_HBarrier_large",
	"Land_leseni2x",
	"Land_Misc_deerstand",
	"Land_Misc_Scaffolding",
	"Land_prebehlavka",
	"Land_stand_small_EP1",
	"Land_tent_east",
	"Mash",
	"RampConcrete",
	"WarfareBCamp",
	"WarfareBDepot"
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalités logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
#include "addons_config\arma2_CO_objects.sqf"