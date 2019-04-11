params ["_class", "_model"];

_return = false;
if (isNil "_model") then { _model = "lolnope.exe"; };

if (
	_model in BloodLust_BloodSplatterIntersectionBlackList ||
	_class in BloodLust_BloodSplatterIntersectionBlackList
) then {
	_return = true;
} else {
	{
		if (_class isKindOf _x) exitWith { _return = true; };
	} foreach BloodLust_BloodSplatterIntersectionBlackList;
};

_return;