if (!BloodLust_IsBloodPoolingEnabled) exitWith {};

if (call BloodLust_fnc_isMaxBloodSplattersReached) then { call BloodLust_fnc_removeOldBloodSplatter; };

_pool = "BloodSplatter_MediumPlane" createVehicleLocal [0, 0, 0];

BloodLust_BloodSplatters pushBack _pool;

[
	selectRandom BloodLust_BloodPoolTextures,
	BloodLust_BloodPoolFramerate,
	false,
	false,
	_pool,
	{}
] call BloodLust_fnc_animateObjectTexture;

_pool;