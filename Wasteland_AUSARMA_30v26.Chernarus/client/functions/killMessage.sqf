/*
 Based on gn1ps Post in the 404 Forums
 http://www.404games.co.uk/forum/index.php?/topic/2496-custom-death-messages/
 And Vibas serverside killmessage script.

 Edited by KiloSwiss
 All errors in this script are produced by me, don't blame anyone else for this!

 Known issues:
 Kills with Mines, Satchelcharges, etc. will display the players actual weapon he's holding in his hand(s) and not the mine/satchel.
 Killing respawning players will only announce the killers name, same for kills over a distance of 5000 meters (might be an issue with mines).
*/

_player = _this select 0;
_killer = _this select 1;

_killerWep = currentWeapon _killer;
	
_distance = _killer distance _player;
_distance = floor(_distance);

if (_distance > 5000) exitWith {	//Killed while respawning (or when driving over a mine when killer is over 5km away)
[player, nil, rGlobalChat, format["got killed by «%1»",name _killer]] call RE;
};

_distance = format["%1",round(_distance)];
_killerWep = (configFile >> "cfgWeapons" >> _killerWep);
_killerWep = format["%1",getText(_killerWep >> "displayName")];
_killerName = name _killer;

if (_killerName == "ERROR: NO UNIT") exitWith { // Drive a car into a wall/rock etc, delayed car explosions, etc
[player, nil, rGlobalChat, format["has died."]] call RE;
};

if (_killerWep == "HORN") exitWith { // Same as before, but different (suitable for passengers)
[player, nil, rGlobalChat, format["has become roadkill."]] call RE;
};

if (side _killer == Civilian) exitWith {
	if (_player == _killer) then { // Respawn suicide or killed by a explosion of a vehicle
	[player, nil, rGlobalChat, format["has killed themself."]] call RE;
	} else { //AI Kill
	[player, nil, rGlobalChat, format["was killed by AI."]] call RE;
	};
};

if(_player == _killer) then { //Suicide - Might be obsolete since respawning suicide get's catched in the "Civilian" section
[player, nil, rGlobalChat, format["has killed themself."]] call RE;
} else { //Normal kill
[player, nil, rGlobalChat, format["was killed by «%1» with %3",name _killer,_distance,_killerWep]] call RE;
};