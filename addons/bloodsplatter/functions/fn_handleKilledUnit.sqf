params ["_unit", "_killer", "_instigator", "_useEffects"];

if (BloodLust_IsFallingVaporisationEnabled) then {
	_isUnitVaporized = [_unit, _killer] call BloodLust_fnc_UnitFallVaporisation;
};