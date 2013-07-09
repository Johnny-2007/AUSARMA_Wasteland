
//	@file Version: 1.0
//	@file Name: objectCreation.sqf
//	@file Author: [404] Deadbeat, [TOG FF] Bench
//	@file Created: 20/04/2013
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

if(_Objtype == "Land_Barrel_water") then 
{
    _obj setVariable["water",30,true];
};

if(_Objtype == "Land_stand_small_EP1") then 
{
    _obj setVariable["food",30,true];
};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
