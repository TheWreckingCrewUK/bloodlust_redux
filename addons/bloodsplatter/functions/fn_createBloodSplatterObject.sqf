params ["_type"];

if(call BloodLust_fnc_isMaxBloodSplattersReached) then { call BloodLust_fnc_removeOldBloodSplatter; };

_splatter = objNull;

switch (toLower (_type)) do {
	case "large": { _splatter = "BloodSplatter_LargePlane" createVehicleLocal [0, 0, 0]; };
	default { _splatter = "BloodSplatter_Plane" createVehicleLocal [0, 0, 0]; };
};

BloodLust_BloodSplatters pushBack _splatter;
_splatter;