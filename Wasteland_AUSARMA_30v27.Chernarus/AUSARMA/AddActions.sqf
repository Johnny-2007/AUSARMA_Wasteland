While {!(Alive Player)} do {
	sleep 1;
};
player addAction [localize "STR_WL_Acts_ChangeWheels", "AUSARMA\Action_Wheel.sqf", "", 1, false, true, "", "(cursorTarget isKindOf 'Car')&&(player distance cursorTarget<5)"];