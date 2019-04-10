params ["_unit", "_vehicle", "_damage"];

_vehicleSpeed = _vehicle call BloodLust_fnc_getVelocityMagnitude;

[
	selectRandom BloodLust_UnitVehicleCollisionSounds,
	_vehicle,
	false,
	getPosASL _vehicle,
	(_vehicle call BloodLust_fnc_getVelocityMagnitude) * 0.5,
	1.2 - (random 0.4),
	50
] call BloodLust_fnc_playSound;

if (_vehicleSpeed >= BloodLust_UnitVehicleVaporisationCollisionSpeed && random 1 <= 0.25) then {
	[_unit, log _vehicleSpeed] call BloodLust_fnc_vaporiseUnit;
} else {
	[_unit, 3, 0.1] call BloodLust_fnc_attachBleeding;
};