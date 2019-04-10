params ["_object", "_positionASL", "_normalDirection", "_intersectionDistance", "_splatterAngle", "_splatterTexture"];

_splatter = call BloodLust_fnc_createBloodSplatterObject;
_splatterPosition = [0, 0, 0];
_splatterNormal = [0, 0, 0];
_intersectionEndPositionASL = _positionASL vectorAdd (_normalDirection vectorMultiply _intersectionDistance);

_surfaceIntersections = lineIntersectsSurfaces [
	_positionASL,
	_intersectionEndPositionASL,
	_object,
	vehicle _object,
	true,
	10,
	"VIEW",
	"NONE"
] select {
	_intersectingObject  = _x select 2;
	_isObjectInIntersectionBlackList = [
		typeOf _intersectingObject,
		(getModelInfo _intersectingObject) select 0
	] call BloodLust_fnc_isClassInIntersectionBlackList;
	
	_return = !_isObjectInIntersectionBlackList;
	_return;
};

if (count _surfaceIntersections > 0) then {
	_surfaceIntersection = _surfaceIntersections select 0;
	_splatterPosition = _surfaceIntersection select 0;
	_splatterNormal = _surfaceIntersection select 1;
	_surfaceObject = _surfaceIntersection select 2;
	_surfaceIntersectionGround = [
		_positionASL vectorAdd (_normalDirection vectorMultiply 1.5),
		_object,
		vehicle _object
	] call BloodLust_fnc_getSurfaceIntersection;

	_surfaceDistance = _surfaceIntersectionGround select 0;

	if (_surfaceDistance > 0.1) then { [_splatter, _surfaceObject] call BloodLust_fnc_assignSplatterToBuilding; };
} else {
	_surfaceIntersection = [
		_positionASL vectorAdd (_normalDirection vectorMultiply 1.5),
		_object,
		vehicle _object
	] call BloodLust_fnc_getSurfaceIntersection;

	_splatterNormal = _surfaceIntersection select 1;
	_splatterPosition = _surfaceIntersection select 2;
};

_splatter setObjectTexture [0, _splatterTexture];
_splatter setPosASL (_splatterPosition vectorAdd (_splatterNormal vectorMultiply 0.01));
[_splatter, _splatterNormal, _splatterAngle] call BloodLust_fnc_rotateObjectAroundNormal;

["BloodLust_splatterCreated", [_splatter]] call CBA_fnc_localEvent;