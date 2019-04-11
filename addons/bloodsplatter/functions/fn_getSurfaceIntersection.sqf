params ["_positionASL", "_ignoreObject1", "_ignoreObject2"];

_surfaceDistance = 0;
_surfaceNormal = [0, 0, 0];
_surfacePosition = [0, 0, 0];
_isIntersecting = false;
_intersectingObject = objNull;

_intersections = lineIntersectsSurfaces [
	_positionASL,
	_positionASL vectorAdd [0, 0, -100],
	_ignoreObject1,
	_ignoreObject2,
	true,
	10,
	"GEOM",
	"FIRE"
];

_filteredIntersections = _intersections select {
	!([(typeOf (_x select 2)), (getModelInfo (_x select 2)) select 0] call BloodLust_fnc_isClassInIntersectionBlackList);
};

if (count _filteredIntersections > 0) then {
	_intersection = _filteredIntersections select 0;
	_intersection params ["_surfacePosition", "_surfaceNormal", "_intersectingObject"];
	_surfaceDistance = (_positionASL select 2) - (_surfacePosition select 2);
	_isIntersecting = true;
};

[_surfaceDistance, _surfaceNormal, _surfacePosition, _isIntersecting, _intersectingObject];