//	@file Version: 1.0
//	@file Name: clientCompile.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

// Event handlers
onRespawn = compile preprocessfile "client\clientEvents\onRespawn.sqf";
onKilled = compile preprocessfile "client\clientEvents\onKilled.sqf";
onKeyPress = compile preprocessFile "client\clientEvents\onKeyPress.sqf";

// Player details and actions
loadPlayerMenu = compile preprocessFile "client\systems\playerMenu\init.sqf";
playerSpawn = compile preprocessFileLineNumbers "client\functions\playerSpawn.sqf";
playerSetup = compile preprocessFileLineNumbers "client\functions\playerSetup.sqf";
spawnAction = compile preprocessFileLineNumbers "client\functions\spawnAction.sqf";
placeSpawnBeacon = compile preprocessFileLineNumbers "client\systems\playerMenu\placeSpawnBeacon.sqf";
refuelVehicle = compile preprocessFileLineNumbers "client\systems\playerMenu\refuel.sqf";
repairVehicle = compile preprocessFile "client\systems\playerMenu\repair.sqf";
placeCammoNet = compile preprocessFileLineNumbers "client\systems\playerMenu\placeCammoNet.sqf";
useMedicalKit = compile preprocessFileLineNumbers "client\systems\playerMenu\useMedicalKit.sqf";
useEdibleItem = compile preprocessFileLineNumbers "client\systems\playerMenu\useEdibleItem.sqf";

// Sync client with server time
timeSync = compile preprocessFileLineNumbers "client\functions\clientTimeSync.sqf";

// Update scripts
updateMissionsMarkers = compile preprocessFileLineNumbers "client\functions\updatePlayerMissionMarkers.sqf";
updateRadarMarkers = compile preprocessFileLineNumbers "client\functions\updatePlayerRadarMarkers.sqf";
updateTeamKiller = compile preprocessFileLineNumbers "client\functions\updateTeamKiller.sqf";

// Team-kill system
teamkillAction = compile preprocessFileLineNumbers "client\functions\doTeamKillAction.sqf";
teamkillMessage = compile preprocessFileLineNumbers "client\functions\showTeamKillMessage.sqf";

// Dialog compiles
client_respawnDialog = compile preprocessFileLineNumbers "client\functions\loadRespawnDialog.sqf";
loadGeneralStore = compile preprocessFileLineNumbers "client\systems\generalStore\loadGenStore.sqf";
loadGunStore = compile preprocessFileLineNumbers "client\systems\gunStore\loadGunStore.sqf";
loadSellConfirm = compile preprocessFileLineNumbers "client\systems\gunStore\loadSellConfirm.sqf";
sellWeaponConfirmed = compile preprocessFileLineNumbers "client\systems\gunStore\sellWeaponConfirmed.sqf";

// Building Dialog compiles
loadbuildStore = compile preprocessFileLineNumbers "client\systems\BuildStore\loadBuildStore.sqf";
PopulatebuildStore = compile preprocessFileLineNumbers "client\systems\BuildStore\populateBuildStore.sqf";
buildItemInfo = compile preprocessFileLineNumbers "client\systems\BuildStore\itemInfo.sqf";
player groupChat "Client Compile Complete";
sleep 1;
playerCompiledScripts = true;

