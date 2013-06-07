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
	"BRDM2_Base",
	"BTR90_Base",
	"Car",
	"Fishing_Boat",
	"GAZ_Vodnik_HMG",
	"LAV25_Base",
	"MLRS",
	"RHIB",
	"Smallboat_1",
	"smallboat_2",
	"StrykerBase_EP1",
	"TowingTractor",
	"Tractor",
	"Truck"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
	"An2_Base_EP1",
	"ArmoredSUV_Base_PMC",
	"BAF_Jackal2_BASE_D",
	"BRDM2_Base",
	"BTR40_MG_base_EP1",
	"D30_base",
	"GAZ_Vodnik_HMG",
	"hilux1_civil_1_open",
	"hilux1_civil_3_open_EP1",
	"HMMWV_Base",
	"Ikarus",
	"Lada_base",
	"LandRover_Base",
	"M119",
	"Offroad_DSHKM_base",
	"Pickup_PK_base",
	"S1203_TK_CIV_EP1",
	"Ship",
	"SkodaBase",
	"SUV_Base_EP1",
	"Tractor",
	"Truck",
	"UAZ_Base",
	"Volha_TK_CIV_Base_EP1",
	"VWGolf",
	"ZU23_base"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des véhicules aériens pouvant héliporter des objets héliportables.
 */
R3F_LOG_CFG_heliporteurs = [
	"BAF_Merlin_HC3_D",
	"CH47_base_EP1",
	"Ka60_Base_PMC",
	"Mi17_base",
	"Mi24_Base",
	"Mi24_Base",
	"MV22",
	"UH1H_base",
	"UH1_Base",
	"UH60_Base"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_objets_heliportables = [

	"ArmoredSUV_Base_PMC",
	"BAF_Jackal2_BASE_D",
	"BTR40_MG_base_EP1",
	"D30_base",
	"GAZ_Vodnik_HMG",
	"hilux1_civil_1_open",
	"hilux1_civil_3_open_EP1",
	"HMMWV_Base",
	"Ikarus",
	"Lada_base",
	"LandRover_Base",
	"M119",
	"Offroad_DSHKM_base",
	"Pickup_PK_base",
	"S1203_TK_CIV_EP1",
	"Ship",
	"SkodaBase",
	"SUV_Base_EP1",
	"Tractor",
	"Truck",
	"UAZ_Base",
	"Volha_TK_CIV_Base_EP1",
	"VWGolf",
	"ZU23_base"
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
	["2S6M_Tunguska", 10],
	["AAV", 12],
	["AH6_Base_EP1", 25],
	["An2_Base_EP1", 40],
	["ArmoredSUV_Base_PMC", 12],
	["ATV_Base_EP1", 5],
	["BAF_Jackal2_BASE_D", 15],
	["BAF_Merlin_HC3_D",75],
	["BMP2_Base", 7],
	["BMP3", 7],
	["BRDM2_Base", 15],
	["BTR40_MG_base_EP1", 15],
	["BTR60_TK_EP1", 25],
	["BTR90_Base", 25],
	["C130J", 150],
	["CH47_base_EP1", 80],
	["Fort_Crate_wood", 20],
	["GAZ_Vodnik_HMG", 25],
	["GRAD_Base", 10],
	["hilux1_civil_1_open", 12],
	["hilux1_civil_3_open_EP1", 12],
	["HMMWV_Avenger", 5],
	["HMMWV_Base", 18],
	["HMMWV_M1151_M2_DES_EP1", 12],
	["HMMWV_M998A2_SOV_DES_EP1", 12],
	["Ikarus", 50],
	["Ka60_Base_PMC", 40],
	["KamazRefuel", 10],
	["Kamaz_Base", 50],
	["Lada_base", 10],
	["LandRover_Base", 15],
	["LandRover_MG_TK_INS_EP1", 12],	
	["LAV25_Base", 25],
	["M113_Base", 12],
	["M1A1", 5],
	["M2A2_Base", 15],
	["MAZ_543_SCUD_Base_EP1", 10],
	["Mi17_base", 60],
	["Mi24_Base", 50],
	["Misc_cargo_cont_tiny", 40],
	["MLRS", 8],
	["Motorcycle", 5],
	["MTVR", 50],
	["MtvrRefuel", 10],
	["MV22", 80],
	["Offroad_DSHKM_base", 15],
	["Pickup_PK_base", 15],
	["S1203_TK_CIV_EP1", 20],
	["Ship", 10],
	["SkodaBase", 10],
	["StrykerBase_EP1", 25],
	["SUV_Base_EP1", 15],
	["T34", 5],
	["T55_Base", 5],
	["T72_Base", 5],
	["T90", 5],
	["TowingTractor", 5],
	["Tractor", 5],
	["UAZ_Base", 10],
	["UH1H_base", 35],
	["UH1_Base", 30],
	["UH60_Base", 40],
	["UralRefuel_Base", 10],
	["Ural_Base", 35],
	["Ural_CDF", 50],
	["Ural_INS", 50],
	["Ural_ZU23_Base", 20],
	["V3S_Base_EP1", 50],
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
	["Desk", 1],
	["DSHKM_base", 4],
	["FlagCarrier", 1],
	["FlagCarrierChecked", 1],
	["FlagCarrierSmall", 1],
	["FoldChair", 1],
	["FoldChair_with_Cargo", 1],
	["FoldTable", 1],
	["Fort_Barricade",4],
	["Fort_Crate_wood", 2],
	["Fort_EnvelopeBig", 1],
	["Fort_EnvelopeBig_EP1",3],
	["Fort_EnvelopeSmall", 1],
	["Fort_EnvelopeSmall_EP1",2],
	["Fort_RazorWire", 2],
	["Fort_RazorWire",1],
	["Fort_StoneWall_EP1", 5],
	["Fort_StoneWall_EP1",2],
	["Fuel_can",1],
	["GMG_TriPod", 4],
	["GuerillaCacheBox", 5],
	["Hedgehog", 3],
	["Igla_AA_pod_East", 7],
	["Ka137_Base_PMC", 15],
	["KORD_Base", 5],
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
	["Land_fort_bagfence_corner",2],
	["Land_fort_bagfence_long", 2],
	["Land_fort_bagfence_round", 2],
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
	["Land_Misc_Rubble_EP1",2],
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
	["M1030", 5],
	["M252", 4],
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
	["RUVehicleBox", 12],
	["SatPhone", 1],
	["SmallTable", 1],
	["SPG9_base", 4],
	["StaticSEARCHLight", 4],
	["Stinger_Pod_base", 7],
	["Suitcase",1],
	["TKVehicleBox_EP1", 12],
	["TOW_TriPod", 5],
	["TOW_TriPod_Base", 5],
	["TT650_Base", 5],
	["USBasicAmmunitionBox", 5],
	["USVehicleBox", 12],
	["USVehicleBox_EP1", 12],
	["Wall_L_2m5_EP1", 5],
	["Warfare2b14_82mm_Base", 4],
	["WarfareBCamp", 15],
	["WarfareBDepot", 30],
	["WarfareBMGNest_M240_base", 10],
	["WarfareBMGNest_PK_Base", 10],
	["WarfareBVehicleServicePoint", 80],
	["ZavoraAnim", 2]	
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */

R3F_LOG_CFG_objets_deplacables = [
	"ACamp",
	"AmmoCrate_NoInteractive_Base_EP1",
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
	"Fort_Barricade",
	"Fort_Crate_wood",
	"Fort_EnvelopeBig",
	"Fort_EnvelopeBig_EP1",
	"Fort_EnvelopeSmall",
	"Fort_EnvelopeSmall_EP1",
	"Fort_RazorWire",
	"Fort_StoneWall_EP1",
	"Fuel_can",
	"GMG_TriPod",
	"Gunrack1",
	"Hedgehog",
	"Ka137_Base_PMC",
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
	"ReammoBox",
	"RoadBarrier_light",
	"SatPhone",
	"SmallTable",
	"SmallTV",
	"StaticWeapon",
	"Suitcase",
	"TargetE",
	"TargetEpopup",
	"TargetPopUpTarget",
	"Wall_L_2m5_EP1",
	"WarfareBCamp",
	"WarfareBDepot",
	"WarfareBunkerSign",
	"WarfareBVehicleServicePoint",
	"ZavoraAnim"
];


/****** OBJECT HEALTH SYSTEM ******/

/**
 * List of class names of objects using the health/damage system.
 *
 * format = ["class", health, isExplosiveImmune, isBallisticsImmune]
 * 	health examples:
 * 		20 is equivalent of 20,000 player hp
 * 		G17 does 0.003 damage to bunkers
 * 		Stanag does 0.03 damage to bunkers
 *		rpg does 17 damage to bunkers
 *		zero hp defaults to 30
 */
R3F_LOG_CFG_object_health = [
	["Base_WarfareBBarrier10x",			0,false,false],
	["Base_WarfareBBarrier10xTall",		0,false,false],
	["Base_WarfareBBarrier5x",			0,false,false],
	["Concrete_Wall_EP1",				0,false,false],
	["Fort_Barricade",					0,false,false],
	["Fort_Crate_wood",					0,false,false],
	["Fort_Nest_M240",					10,false,false],
	["Fort_RazorWire",					5,false,false],
	["Hedgehog",						0,false,false],
	["Land_BagFenceLong",				0,false,false],
	["Land_Barrel_water",				1000,true,true],
	["Land_CamoNet_NATO",				5,false,false],
	["Land_CncBlock_Stripes",			0,false,false],
	["Land_ConcreteBlock",				0,false,false],
	["Land_ConcreteRamp",				20,false,false],
	["Land_fortified_nest_big",			0,false,false],
	["Land_fortified_nest_small_EP1",	0,false,false],
	["Land_fort_artillery_nest",		0,false,false],
	["Land_fort_bagfence_corner",		0,false,false],
	["Land_fort_bagfence_long",			0,false,false],
	["Land_fort_bagfence_round",		0,false,false],
	["Land_fort_rampart",				0,false,false],
	["Land_fort_rampart_EP1",			0,false,false],
	["Land_Fort_Watchtower",			0,false,false],
	["Land_Fort_Watchtower_EP1",		0,false,false],
	["Land_GuardShed",					0,false,false],
	["Land_HBarrier_large",				0,false,false],
	["Land_leseni2x",					0,false,false],
	["Land_Misc_Scaffolding",			0,false,false],
	["Land_prebehlavka",				0,false,false],
	["Land_stand_small_EP1",			1000,true,true],
	["Land_tent_east",					0,false,false],
	["RampConcrete",					0,false,false],
	["WarfareBCamp",					0,false,false],
	["WarfareBDepot",					20,false,false],
	["WarfareBVehicleServicePoint",		5,false,false],
	["ZavoraAnim",						5,false,false]
];

R3F_LOG_CFG_object_ammoDamageTypeBallistic = [
	"B_",
	"F_"
];

R3F_LOG_CFG_object_ammoDamageTypeExplosive = [
	"R_",
	"M_",
	"Sh",
	"Bo",
	"G_"
];


/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 *
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalités logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
#include "addons_config\arma2_CO_objects.sqf"
