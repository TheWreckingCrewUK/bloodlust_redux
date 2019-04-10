params ["_jitterAmount", "_hitSelection"];
_hitSelection params ["_target", "_shooter", "_bullet", "_hitPosition", "_velocity", "_selections", "_ammo", "_direction", "_radius", "_surface", "_isDirectHit"];

_normalVelocity = vectorNormalized _velocity;

_jitter = [
	_jitterAmount - (random (_jitterAmount * 2)),
	_jitterAmount - (random (_jitterAmount * 2)),
	_jitterAmount - (random (_jitterAmount * 2))
];

_gibClassnames  = [_target, _selections] call BloodLust_fnc_getGibClassnames;

if (count _gibClassnames == 0) exitWith {};
_gibClassname = selectRandom _gibClassnames;

if (call BloodLust_fnc_isMaxGibsReached) then { call BloodLust_fnc_removeOldGib; };

_gib = _gibClassname call BloodLust_fnc_createGibObject;
_gib setVariable ["BloodLust_SourceUnit", _target];
_gib setVariable ["BloodLust_SourceHitSelection", _hitSelection];
_gib setDir (random 360);
_gib setPosASL _hitPosition;
_gib setVelocity ((_normalVelocity vectorAdd _jitter) vectorMultiply 1.75);

[_gib, 0.5, 3] call BloodLust_fnc_reduceBounciness;
[_gib, 3, 0.1] call BloodLust_fnc_attachBleeding;

["BloodLust_gibCreated", [_gib]] call CBA_fnc_localEvent;

_gib;