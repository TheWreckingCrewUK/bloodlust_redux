params ["_unit", "_causedBy", "_damage"];

if (BloodLust_IsUnitVehicleCollisionEffectsEnabled) then {
	_isUnitHitByVehicle = [_unit, _causedBy] call BloodLust_fnc_IsUnitHitByVehicle;
	
	if (_isUnitHitByVehicle) then {
		[_unit, vehicle _causedBy, _damage] call BloodLust_fnc_UnitHitByVehicle;
	};
};

if (BloodLust_IsFallingVaporisationEnabled) then {
	[_unit, _causedBy] call BloodLust_fnc_UnitFallVaporization;
};