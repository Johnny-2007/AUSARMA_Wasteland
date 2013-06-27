//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = ["78933318","74351430","87646790","6121728"]; //Freeborne, Damnation, Vlad, Johnny
publicVariable "moderators"; 
           
administrators = [""];
publicVariable "administrators";

serverAdministrators = [""]; 
publicVariable "serverAdministrators";
