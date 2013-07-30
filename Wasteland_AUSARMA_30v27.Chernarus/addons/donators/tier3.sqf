//  @file Name: tier3.sqf
// 	@file Version: 2.0
// 	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.


// ENGINEER CLASS
if (((getPlayerUID player) in Tier3)) then {

_player = _this;
removeAllWeapons _player;
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";
_player selectWeapon "glock17_EP1";

_player addWeapon "ItemGPS";


_player setVariable["canfood",1,true];
_player setVariable["water",1,true];
_player setVariable["medkits",1,true];
_player setVariable["fuelEmpty",1,true];

aActionsIDs = aActionsIDs + [_player addAction [localize "STR_WL_Acts_ChangeWheels", "AUSARMA\Action_Wheel.sqf", "", 1, false, true, "", "(cursorTarget isKindOf 'Car')&&(player distance cursorTarget<5)"]];
};