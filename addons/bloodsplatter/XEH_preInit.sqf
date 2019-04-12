#include "initSettings.sqf"

/** HANDLE REBROADCASTS FOR LOCALITY ISSUES OVER MP **/
["BloodLust_Broadcast_ExplosionUnit", {
	if !(local (_this select 0)) then { _this call BloodLust_fnc_handleExplosionUnit; };
}] call CBA_fnc_addEventHandler;

["BloodLust_Broadcast_HitPartUnit", {
	if !(local ((_this select 0) select 0)) then { _this call BloodLust_fnc_handleHitPartUnit; };
}] call CBA_fnc_addEventHandler;