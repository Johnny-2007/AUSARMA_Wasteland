/*
 Based on gn1ps Post in the 404 Forums
 http://www.404games.co.uk/forum/index.php?/topic/2496-custom-death-messages/
 And Vibas serverside killmessage script.

 Edited by KiloSwiss
 All errors in this script are produced by me, don't blame anyone else for this! =)

 Known issues:
 Kills with Mines, Satchelcharges, etc. will display the players actual weapon he's holding in his hand(s) and not the mine/satchel.
 Killing respawning players will only announce the killers name, same for kills over a distance of 3000 meters (might be an issue with mines).
 This will also show incredible long sniper kills with almost impossible weapons if someone is killed with a mine and distance is between 1500 and 3000m
*/

_player = _this select 0;
_killer = _this select 1;
	
//_distance = _killer distance _player;
//_distance = floor(_distance);

//if (_distance > 3000) exitWith {	//Killed while respawning (or when driving over a mine and the killer is over 3km away)
//_killerName = name _killer;
//	if (isNull _killerName) then {
//	[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
//	} else {
//	[player, nil, rGlobalChat, format["got killed by «%1»",name _killer]] call RE;
//	};
//};

//_distance = format["%1",round(_distance)];
//switch (true) do {
//	case (_distance < 300) : {	// Close range kills
//	_distance = format[""];};
//
//	case (_distance > 300 && _distance < 800) : { //Show no distance
//	_distance = format[""];};
//
//	case (_distance > 800 && _distance < 1500) : {	//Long distance kills
//	_distance = format[""];};
//
//	case (_distance > 1500 && _distance < 3000) : { //Show the distance in meters only for really remarkable long shots
//	_distance = format[" from over 1500m"];};
//
//	default {};
//};

// Define the name for killer and his weapon
_killerName = name _killer;
_killerWep = currentWeapon _killer;
_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
_weaponName = format["%1",getText(_weaponName >> "displayName")];
_killerWep = format["«%1»",_weaponName];


if (_killerName == "ERROR: NO UNIT") exitWith { // Drive a car into a wall/rock etc. or drive over a mine
[player, nil, rGlobalChat, format["has DIED"]] call RE;
};
if (_weaponName == "HORN") exitWith { // Same as before, but different (suitable for passengers)
[player, nil, rGlobalChat, format["has become ROADKILL"]] call RE;
};

if (side _killer == Civilian) exitWith {
	if (_player == _killer) then { // Respawn suicide or killed by a explosion of a vehicle
	[player, nil, rGlobalChat, format["has KILLED THEMSELF."]] call RE;
	} else { //AI Kill (not always AI so I removed the "AI" from the killmessage)
	[player, nil, rGlobalChat, format["was KILLED by «%1» with %2",name _killer,_killerWep]] call RE;
	};
};

if(_player == _killer) then { //Suicide - Might be obsolete since respawning suicide get's catched in the "Civilian" section
[player, nil, rGlobalChat, format["has KILLED THEMSELF."]] call RE;
} else { //Normal kill - Player kills Player with a weapon
[player, nil, rGlobalChat, format["was KILLED by «%1» with %2",name _killer,_killerWep]] call RE;
};
