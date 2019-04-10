params ["_unit", "_damage"];

if (_unit getVariable ["BloodLust_IsVaporized", false]) exitWith {};

if (BloodLust_IsVaporisationEnabled && _damage >= BloodLust_VaporisationDamageThreshold) exitWith {
	[_unit, _damage * 0.3] call BloodLust_fnc_vaporiseUnit;
};

if(_damage >= BloodLust_ExplosionDamageThreshold) then {
	_splatterCount = _damage * 30;
	
	for [{_i = 0}, {_i < _splatterCount}, {_i = _i + 1}] do {
		_jitter = [10 - (random (10 * 2)), 10 - (random (10 * 2)), 10 - (random (10 * 2))];

		_splatter = [
			_unit,
			getPosASL _unit,
			vectorNormalized _jitter,
			4,
			random 360,
			selectRandom BloodLust_VaporizationBloodSplatters
		] call BloodLust_fnc_createBloodSplatter;
	};
};