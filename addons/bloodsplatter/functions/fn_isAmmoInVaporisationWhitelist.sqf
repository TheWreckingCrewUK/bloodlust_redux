params ["_ammoClass"];
_return = false;

{
	if (_ammoClass == _x || _ammoClass isKindOf _x) exitWith { _return = true; };
} foreach BloodLust_VaporizationAmmoClassnames;

_return;