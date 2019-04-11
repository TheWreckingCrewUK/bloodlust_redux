params ["_classname"];

if(call BloodLust_fnc_isMaxGibsReached) then { call BloodLust_fnc_removeOldGib; };

_gib = _classname createVehicleLocal [0,0,0];
BloodLust_Gibs pushBack _gib;
_gib;