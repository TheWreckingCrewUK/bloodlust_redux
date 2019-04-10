params ["_positionASL", "_vectorDir", "_vectorUp"];

if (isNil "_positionASL" || isNil "_vectorDir" || isNil "_vectorUp") exitWith {};
if (call BloodLust_fnc_isMaxBloodSpraysReached) exitWith {};

_spray = "BloodSplatter_SprayPlane" createVehicleLocal [0, 0, 0];

BloodLust_BloodSprays pushBack _spray;
_spray setPosASL _positionASL;
_spray setVectorDirAndUp [_vectorDir, _vectorUp];
_spray setPosASL (AGLToASL(_spray modelToWorld [0, 0.9, 0]));

[
	selectRandom BloodLust_SprayTextures,
	BloodLust_BloodSprayFramerate,
	false,
	true,
	_spray,
	{ BloodLust_BloodSprays = BloodLust_BloodSprays - [(_this select 0)]; }
] call BloodLust_fnc_animateObjectTexture;

[
	selectRandom BloodLust_BloodSpraySounds,
	_spray,
	false,
	getPosASL _spray,
	1.5,
	1.2 - (random 0.4),
	7
] call BloodLust_fnc_playSound;

_spray;