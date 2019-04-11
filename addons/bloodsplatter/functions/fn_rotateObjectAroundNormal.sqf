params ["_object", "_normal", "_angle"];

_object setVectorDirAndUp ([_normal, _angle] call BloodLust_fnc_rotateAroundNormal);