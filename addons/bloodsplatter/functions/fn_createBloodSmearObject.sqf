params ["_type"];

if(call BloodLust_fnc_isMaxBleedSplattersReached) then { call BloodLust_fnc_removeOldBleedSplatter; };

_splatter = objNull;

switch (toLower (_type)) do {
	case "tiny": { _splatter = "BloodSplatter_TinyPlane" createVehicleLocal [0, 0, 0]; };
	default { _splatter = "BloodSplatter_SmallPlane" createVehicleLocal [0, 0, 0]; };
};

BloodLust_BleedSplatters pushBack _splatter;
_splatter;