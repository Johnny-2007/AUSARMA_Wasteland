//  @file Name: checkDonator.sqf
//  @file Version: 2.0
//  @file Author: [BMRF] Madhatter
//  @file Site: www.BMRF.me
//  @file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.

_uid = "";
_uid = getPlayerUID player;
/*
switch (_uid) do 
{
	case Tier1: {player execVM "addons\donators\tier1.sqf";};
	case Tier2: {player execVM "addons\donators\tier2.sqf";};
	case Tier3:	{player execVM "addons\donators\tier3.sqf";};
	case Tier4:	{player execVM "addons\donators\tier4.sqf";};
}
*/

if (_uid in Tier1) then {
    player execVM "addons\donators\tier1.sqf";
} else {
	if (_uid in Tier2) then {
		player execVM "addons\donators\tier2.sqf";
	} else {
		if (_uid in Tier3) then {
			player execVM "addons\donators\tier3.sqf";
		} else {
			if (_uid in Tier4) then {
				player execVM "addons\donators\tier4.sqf";
			} else {
				sleep 1;
				waitUntil {scriptDone _Handle};
			};
		};
	};
};
