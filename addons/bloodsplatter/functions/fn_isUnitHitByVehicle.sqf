params ["_unit", "_damageSourceUnit"];

if ((typeName _damageSourceUnit) == "STRING") exitWith { false };

_vehicle = vehicle _damageSourceUnit;
_vehicleSize = sizeOf (typeOf _vehicle);

(
	(vehicle _unit == _unit) &&
	(_vehicle != _damageSourceUnit) &&
	(_unit distance _vehicle <= _vehicleSize) &&
	_vehicle call BloodLust_fnc_getVelocityMagnitude >= 15
)