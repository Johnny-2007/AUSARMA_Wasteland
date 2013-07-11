/**
 * S�lectionne un objet � charger dans un transporteur
 * 
 * @param 0 l'objet � s�lectionner
 */
 


if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	// Set mutex lock to active.
	R3F_LOG_mutex_local_verrou = true;

	_objet = _this select 0;
	_owner_close = false;
    _ownerMinDistance = 100;
	if(!isNil{_objet getVariable "R3F_Side"}) then {
		if(playerSide != (_objet getVariable "R3F_Side") || playerSide == resistance) then {
			{
				if((side group _x == (_objet getVariable "R3F_Side")) && group _x != group player && alive _x) then {
					if((_x distance _objet) < _ownerMinDistance) exitWith {
						_owner_close = true;
					};
				};
			} forEach allUnits;
		};
	};
    
	if (_owner_close) exitwith {
    	hint format["This item belongs to another group and they are nearby."]; 
        R3F_LOG_mutex_local_verrou = false;
    };
	
	R3F_LOG_objet_selectionne = _this select 0;
	player globalChat format [STR_R3F_LOG_action_selectionner_objet_charge_fait, getText (configFile >> "CfgVehicles" >> (typeOf R3F_LOG_objet_selectionne) >> "displayName")];
	R3F_LOG_mutex_local_verrou = false;
};
