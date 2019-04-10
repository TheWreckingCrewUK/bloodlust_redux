params ["_unit", "_gibForce"];

if (_unit getVariable ["BloodLust_IsVaporized", false]) exitWith {};

_unit call BloodLust_fnc_goreMistEffect;

// Hide bodies as long as BLR is enabled on the server, for all clients regardless of BLR presence
// Otherwise bodies would be lootable for those without BloodLust Redux running
if (isServer) then {
	_unit setVariable ["BloodLust_IsVaporized", true, true];
	_unit setDamage [1, false];
	hideObjectGlobal _unit;
};

[
	selectRandom BloodLust_VaporizationSounds,
	_unit,
	false,
	getPosASL _unit,
	30,
	1.2 - (random 0.4),
	100
] call BloodLust_fnc_playSound;

if (BloodLust_IsVaporisedHeatWaveEnabled) then { [_unit, 5] call BloodLust_fnc_refractionEffect; };

if (BloodLust_MaxGibs > 0) then {
	_gibSets = +BloodLust_VaporizationGibClassnames;

	_GetRandomGib = {
		_spawnableGibs = [];
		
		{
			params ["_gibSetIndex", "", "_spawnCount", "_spawnLimit"];
			if(_spawnCount < _spawnLimit) then { _spawnableGibs pushBack _x; };
		} foreach _gibSets;

		if (count _spawnableGibs == 0) exitWith { nil; };

		_gibSet = selectRandom _spawnableGibs;
		_gibSet params ["_gibSetIndex", "_className", "_spawnCount", "_spawnLimit"];
		(_gibSets select _gibSetIndex) set [2, _spawnCount + 1];

		_className;
	};

	_gibs = [];

	for "_i" from 1 to 17 do {
		_gibClassname = call _GetRandomGib;
		if (isNil "_gibClassname") exitWith {};

		_jitter = [10 - (random (10 * 2)), 10 - (random (10 * 2)), 10 - (random (10 * 2))];

		_gib = _gibClassname call BloodLust_fnc_createGibObject;
		_gibs pushBack _gib;
		_gib setVariable ["BloodLust_SourceUnit", _unit];
		_gib setDir (random 360);
		_gib setPosASL (getPosASL _unit);
		_gib setVelocity (_jitter vectorMultiply _gibForce);

		[_gib, 3, 0.1] call BloodLust_fnc_attachSmearBleeding;

		if (BloodLust_IsVaporisedHeatWaveEnabled) then { [_gib, 30] call BloodLust_fnc_refractionEffect; };

		["BloodLust_gibCreated", [_gib]] call CBA_fnc_localEvent;
	};
};

_bloodSplatters = [];

_unitSurfaceIntersection = [getPosASL _unit, _unit, vehicle _unit] call BloodLust_fnc_getSurfaceIntersection;
_unitSurfaceIntersection params [
	"_unitSurfaceDistance",
	"_unitSurfaceNormal",
	"_unitSurfacePosition",
	"_unitSurfaceIsIntersecting",
	"_unitSurfaceIntersectingObject"
];

if (_unitIsIntersecting) then {
	_largeSplatter = call BloodLust_fnc_createLargeBloodSplatterObject;
	_largeSplatter setObjectTexture [0, selectRandom BloodLust_LargeVaporizationBloodSplatters];
	_largeSplatter setDir (random 360);
	_largeSplatter setVectorUp _unitSurfaceNormal;
	_largeSplatter setPosASL (_unitSurfacePosition vectorAdd (_unitSurfaceNormal vectorMultiply (random 0.01)));
	_bloodSplatters pushBack _largeSplatter;
	[_largeSplatter, _unitSurfaceIntersectingObject] call BloodLust_fnc_assignSplatterToBuilding;
};

_jitter = [10 - (random (10 * 2)), 10 - (random (10 * 2)), 10 - (random (10 * 2))];

_splatter = [
	_unit,
	getPosASL _unit,
	vectorNormalized _jitter,
	4,
	random 360,
	selectRandom BloodLust_VaporizationBloodSplatters
] call BloodLust_fnc_createBloodSplatter;

_bloodSplatters pushBack _splatter;

if (BloodLust_IsVaporisedHeatWaveEnabled) then { [_splatter, 15] call BloodLust_fnc_refractionEffect; };

["BloodLust_unitVaporised", [_unit, _gibForce, _gibs, _bloodSplatters]] call CBA_fnc_globalEvent;