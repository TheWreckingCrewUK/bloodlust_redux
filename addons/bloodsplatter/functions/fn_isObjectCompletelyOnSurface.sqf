params ["_object", "_normal", "_checkDistance", "_boundingBoxScale"];

_boundingBoxDimensionsHalf = (_object call BIS_fnc_boundingBoxDimensions) vectorMultiply _boundingBoxScale;
_isObjectCompletelyOnSurface = true;

_positions = [
	AGLToASL(_object modelToWorldVisual [-(_boundingBoxDimensionsHalf select 0), _boundingBoxDimensionsHalf select 1, 0]),
	AGLToASL(_object modelToWorldVisual [_boundingBoxDimensionsHalf select 0, _boundingBoxDimensionsHalf select 1, 0]),
	AGLToASL(_object modelToWorldVisual [-(_boundingBoxDimensionsHalf select 0), -(_boundingBoxDimensionsHalf select 1), 0]),
	AGLToASL(_object modelToWorldVisual [_boundingBoxDimensionsHalf select 0, -(_boundingBoxDimensionsHalf select 1), 0])
];

{
	_isIntersecting = lineIntersects [
		_x vectorAdd (_normal vectorMultiply 0.1),
		_x vectorDiff (_normal vectorMultiply _checkDistance)
	];
	
	if (!_isIntersecting) exitWith {
		_isObjectCompletelyOnSurface = false;
	}
} foreach _positions;

_isObjectCompletelyOnSurface;