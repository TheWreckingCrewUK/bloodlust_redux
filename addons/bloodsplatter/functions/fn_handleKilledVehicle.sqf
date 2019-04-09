params ["_vehicle", "_killer", "_instigator", "_useEffects"];

if (BloodLust_IsVehicleCrewVaporisationEnabled) then {
	_fuelExplosionPower = getNumber (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelExplosionPower");

	if (_fuelExplosionPower >= 1) then {
		{ [_x, _fuelExplosionPower] call BloodLust_fnc_VaporiseUnit; } forEach (crew _vehicle);
	};
};