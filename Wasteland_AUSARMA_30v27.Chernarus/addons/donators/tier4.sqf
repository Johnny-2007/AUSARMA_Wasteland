//  @file Name: tier4.sqf
// 	@file Version: 2.0
//	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.


// RECON / SCOUT CLASS
if (((getPlayerUID player) in Tier4)) then {

_player = _this;
removeAllWeapons _player;
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";
_player selectWeapon "glock17_EP1";

_player addWeapon "ItemGPS";
_player addWeapon "Binocular";

_player setVariable["canfood",1,true];
_player setVariable["water",1,true];
_player setVariable["medkits",1,true];
_player setVariable["fuelEmpty",1,true];

aActionsIDs = aActionsIDs + [_player addAction[("<t color=""#21DE31"">Beacon Detector</t>"), "client\actions\detectBeacon.sqf", 1, 1, false, false, "", 'player distance (nearestobjects [player, ["Satelit"],  500] select 0) < 500 AND ((nearestobjects [player, ["Satelit"],  500] select 0) getVariable "faction") != "WORLD"']];
};