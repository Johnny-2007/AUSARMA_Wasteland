//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = [""];
publicVariable "moderators"; 
           
administrators = [""];
publicVariable "administrators";

serverAdministrators = ["78933318","74351430","6121728"]; //Freeborne, Damnation, Dr.Rockso. Removed Tags, Teleport and Money cheats.
publicVariable "serverAdministrators";
