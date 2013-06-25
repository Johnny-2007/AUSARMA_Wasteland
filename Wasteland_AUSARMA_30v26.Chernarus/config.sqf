//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Type, Text name, classname, buy cost, sell amount
weaponsArray = [
	// Pistols

    // Shotguns & Rifles		
	[2, "Saiga12K Shotgun","Saiga12K",25,25],
	[2, "M1014 Shotgun","M1014",25,25],
	[2, "AK-74","AK_74",50,25],
    [2, "AK-107","AK_107_kobra",70,35],
    [2, "AKM","AK_47_M",70,35],
    [2, "M4A1 CCO","M4A1_Aim",100,50],
    [2, "M4A1 CCO SD","M4A1_AIM_SD_camo",150,75],    
    [2, "Sa-58V ACOG","Sa58V_RCO_EP1",150,75],
    [2, "M8","m8_carbine",150,75],
    [2, "Mk17 CCO","SCAR_H_CQC_CCO",350,175],
	[2, "Lee Enfield","LeeEnfield", 200,100],
    [2, "FN FAL","FN_FAL",300,150],
    [2, "M14 AIM","M14_EP1",350,175],
    [2, "Mk16 EGLM RCO","SCAR_L_STD_EGLM_RCO",350,175],	
    [2, "AA-12 Shotgun","AA12_PMC",400,200],

    // Machineguns	
    [4, "L110A1","BAF_L110A1_Aim",200,100],
    [4, "M249","M249_EP1",250,125],
    [4, "M249 scope","M249_m145_EP1",250,125],
    [4, "Mk_48 Mod","Mk_48",400,200],
    [4, "M240","M240",250,125],
    [4, "Pecheneg","Pecheneg",250,225],
	
    // Sniper rifles	
    [3, "AK 107 GL PSO","AK_107_GL_pso",150,75],
    [3, "Mk12 SPR","M4SPR",250,125],
    [3, "CZ 550 Hunting Rifle","huntingrifle",400,200],
    [3, "DMR","DMR",600,300],
    [3, "Mk17 Sniper","SCAR_H_LNG_Sniper",800,400],
    [3, "Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",600,300],
    [3, "M110 NV","M110_NVG_EP1",1500,750],	
    [3, "KSVK","ksvk",800,400],

    // Anti-tank	
    [5, "RPG-7V","RPG7V",500,250],
    [5, "SMAW","SMAW",500,250],
    [5, "FIM-92F Stinger","Stinger",800,400],
    [5, "M136 Launcher","M136",200,100],
    [5, "M47 Dragon","M47Launcher_EP1",500,250],
    [5, "NLAW","BAF_NLAW_Launcher",1000,400]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
    ["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",5],
    ["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",5],
    ["30Rnd AK","30Rnd_545x39_AK",10],
    ["30Rnd AKM","30Rnd_762x39_AK47",15],
    ["30Rnd STANAG","30Rnd_556x45_Stanag",10],
    ["30Rnd STANAG SD","30Rnd_556x45_StanagSD",30],
    ["30Rnd G36","30Rnd_556x45_G36",10],
    ["100Rnd MG36 C Mag","100Rnd_556x45_BetaCMag",40],
    ["30Rnd SA58","30Rnd_762x39_SA58",20],
    ["20Rnd FN FAL.","20Rnd_762x51_FNFAL",25],
    ["20Rnd AA-12 Slug","20Rnd_B_AA12_74Slug",30],
    ["20Rnd AA-12 Pellets","20Rnd_B_AA12_Pellets",50], 
    ["20Rnd AA-12 High Explosive","20Rnd_B_AA12_HE",400],
	
    ["200Rnd M249","200Rnd_556x45_M249",80],
    ["100Rnd M240","100Rnd_762x51_M240",80],
    ["100Rnd PKM.","100Rnd_762x54_PK",80],
    ["200Rnd L110A1","200Rnd_556x45_L110A1",80],

	["5Rnd_762x51_M24","5Rnd_762x51_M24",50],
    ["5Rnd 338 Lapua","5Rnd_86x70_L115A1",100],
    ["5Rnd CZ550","5x_22_LR_17_HMR",50],
    ["20Rnd SCAR","20Rnd_762x51_B_SCAR",40],
    ["20Rnd M14/DMR","20Rnd_762x51_DMR",50],
    ["20Rnd Mk17","20Rnd_762x51_B_SCAR",50],
    ["20Rnd Mk17 SD","20Rnd_762x51_SB_SCAR",100],
    ["10Rnd SVD.","10Rnd_762x54_SVD",100],	
    ["10Rnd M107","10Rnd_127x99_m107",300],
    ["5Rnd KSVK","5Rnd_127x108_KSVK",100],
    ["10Rnd VSS","10Rnd_9x39_SP5_VSS",100],
    
    ["M203 HE shell","1Rnd_HE_M203",50],
    ["GP25 HE shell","1Rnd_HE_GP25",50],
    
    ["RPG PG-7V Budget Rocket","PG7VL",100],
    ["RPG OG7 Anti-personnel","OG7",400],
    ["RPG PG-7VR Anti-armor","PG7VR",300],
    ["SMAW-HEAA Rocket","SMAW_HEAA",200],
    ["Strela Rocket","Strela",400],
    ["Stinger Rocket","Stinger",300],
    ["M57 Dragon Rocket","Dragon_EP1",250],
    ["NLAW Rocket","NLAW",300],
    ["M136 Rocket","M136",200],
    
    ["L109A2 Frag","BAF_L109A1_HE",100],
    ["RGO Frag Grenade","HandGrenade_East",100],
    ["M67 Frag Grenade","HandGrenade_West",100],
    
    ["Home Made Explosives","PMC_ied_v4",500]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["Range Finder","Binocular_Vector",300],
	["NV Goggles","NVGoggles",100]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",25,10],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",25,10],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",500,250],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",100,50],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","client\icons\satellite.paa",2000,1000],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\tent.paa",300,150]  
];

//Name, Price, Vehicle
BuildStoreArray = [
	["Concrete Block", 100, "Land_ConcreteBlock"],
	["Fortification, Deerstand", 25, "Land_Misc_deerstand"],
	["Fortification, Sandbag Bunker (big)", 50, "Land_fortified_nest_big"],
	["Fortification, Sandbag Camp (large)", 50, "WarfareBCamp"],
	["Fortification, Sandbag Depot (huge)", 100, "WarfareBDepot"],
	["Fortification, Sandbag Nest (small)", 25, "Land_fortified_nest_small"],
	["Fortification, Watchtower", 25, "Land_Fort_Watchtower"],
	["Fortification, Wooden Guard Shed", 25, "Land_GuardShed"],
	["Misc, Campfire", 25, "Land_Campfire_burning"],
	["Misc, MASH Tent", 200, "MASH"],
	["Misc, Storage Tent", 25, "Land_tent_east"],
	["Ramp, Artillery Nest", 25, "Land_fort_artillery_nest"],
	["Ramp, Concrete (high)", 50, "Land_ConcreteRamp"],
	["Ramp, Concrete (low)", 50, "RampConcrete"],
	["Ramp, Earthern Rampart", 50, "Land_fort_rampart"],
	["Ramp, Scaffolding (high) ", 50, "Land_Misc_Scaffolding"],
	["Ramp, Scaffolding", 50, "Land_leseni2x"],
	["Ramp, Wooden Bridge", 50, "Land_prebehlavka"],
	["Roadblock, Concrete, Striped", 25, "Land_CncBlock_Stripes"],
	["Roadblock, Concrete Teeth", 100, "Land_CncBlock_Stripes"],
	["Roadblock, Rubbish Barricade", 25, "Fort_Barricade"],
	["Roadblock, Steel Hedgehog", 25, "Hedgehog"],
	["Storage Container (150x)", 300, "Land_Misc_Cargo1D"],
	["Storage, Wooden Box (20x)", 25, "Fort_Crate_wood"],
	["Supplies, Food (30x)", 300, "Land_stand_small_EP1"],
	["Supplies, Water (30x)", 300, "Land_Barrel_water"],
	["Wall, Concrete", 25, "Concrete_Wall_EP1"],
	["Wall, HESCO, Brown (long, high)", 75, "Base_WarfareBBarrier10xTall"],
	["Wall, HESCO, Brown (long, low)", 50, "Base_WarfareBBarrier10x"],
	["Wall, HESCO, Brown (short, low)", 25, "Base_WarfareBBarrier5x"],
	["Wall, HESCO, Grey (short, high)", 25, "Land_HBarrier_large"],
	["Wall, Razor Wire", 100, "Fort_RazorWire"],
	["Wall, Sandbag (corner)", 25, "Land_fort_bagfence_corner"],
	["Wall, Sandbag (long)", 25, "Land_fort_bagfence_long"],
	["Wall, Sandbag (round)", 25, "Land_fort_bagfence_round"],
	["Wall, Sandbag Fence (long)", 25, "Land_BagFenceLong"]
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",600,"Chernogorsk"],
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],			
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"],
		["Town_34",200,"NovySobor"],
		["Town_35",200,"Vyshnoye"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_38",350,"Gorka"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_45",200,"Nadezhdino"],
		["Town_46",200,"Dubrovka"]
];


// Quadrant arrays for cities
cityListNW = [
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"]
];

cityListNE = [
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_34",200,"NovySobor"],
		["Town_38",350,"Gorka"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_46",200,"Dubrovka"]
];

cityListSW = [
		["Town_0",600,"Chernogorsk"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_35",200,"Vyshnoye"],
		["Town_45",200,"Nadezhdino"]
];
cityListSE = [
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"]
];

cityLocations = [];
