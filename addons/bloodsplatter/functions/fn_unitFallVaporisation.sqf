params ["_unit", "_killer"];

_unitVelocityMagnitude = vectorMagnitude (velocity _unit);

if (
	_unit == _killer &&
	(vehicle _unit == _unit) &&
	_unitVelocityMagnitude >= BloodLust_FallingVaporisationSpeedThreshold
) exitWith {
	[_unit, _unitVelocityMagnitude * 0.2] call BloodLust_fnc_vaporiseUnit;
	true;
};

false;