//  @file Name: tier2.sqf
//	@file Version: 2.0
//	@file Author: [BMRF] Madhatter
//	@file Site: www.BMRF.me
//	@file Date: 11-June-2013
//	@file Note: Out of respect, please request permission from the author prior to use. Thank you.

if (((getPlayerUID player) in Tier2)) then {

removeAllWeapons player;
player addMagazine "17Rnd_9x19_glock17";
player addMagazine "17Rnd_9x19_glock17";
player addWeapon "glock17_EP1";
player selectWeapon "glock17_EP1";

player addWeapon "ItemGPS";

player setVariable["canfood",1,true];
player setVariable["water",1,true];
player setVariable["medkits",1,true];
player setVariable["fuelEmpty",1,true];
};
