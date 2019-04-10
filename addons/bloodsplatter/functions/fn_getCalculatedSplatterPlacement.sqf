params [
	"_sourcePositionASL",
	"_directionVector",
	"_maxSurfaceIntersectionDistance",
	["_maxGroundIntersectionDistance", _maxSurfaceIntersectionDistance]
];

_placementPosition = [0, 0, 0];
_placementNormal = [0, 0, 0];
_placementIsOnSurface = false;
_placementObject = objNull;

_endPosition = _sourcePositionASL vectorAdd (_directionVector vectorMultiply _maxSurfaceIntersectionDistance);

_surfaceIntersections = lineIntersectsSurfaces [
	_sourcePositionASL,
	_endPosition,
	objNull,
	objNull,
	true,
	10,
	"VIEW",
	"NONE"
] select {
	_intersectingObject  = _x select 2;
	_isObjectInIntersectionBlackList = [typeOf _intersectingObject, (getModelInfo _intersectingObject) select 0] call BloodLust_fnc_isClassInIntersectionBlackList;
	_return = !_isObjectInIntersectionBlackList;
	_return;
};

if (count _surfaceIntersections > 0) then {
	_surfaceIntersections params ["_surfaceIntersection"];
	_surfaceIntersection params ["_placementPosition", "_placementNormal", "_placementObject"];
	_placementIsOnSurface = true;
} else {
	_endPosition = _sourcePositionASL vectorAdd (_directionVector vectorMultiply _maxGroundIntersectionDistance);
	_surfaceIntersection = [_endPosition, objNull, objNull] call BloodLust_fnc_getSurfaceIntersection;
	_surfaceIntersection params ["", "_placementNormal", "_placementPosition", "", "_placementObject"];
	_placementIsOnSurface = !(isNull _placementObject);
};

_placementPosition = _placementPosition vectorAdd (_placementNormal vectorMultiply (random 0.01));

[_placementPosition, _placementNormal, _placementIsOnSurface, _placementObject];