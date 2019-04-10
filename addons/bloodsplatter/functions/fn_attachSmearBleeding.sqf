params ["_object", "_duration", "_minimumSpeed"];

_endTime = time + _duration;

[{
	params ["_args"];
	_args params ["_object", "_endTime", "_minimumSpeed"];

	_previousBleedTime = _object getVariable ["BloodLust_PreviousBleedTime", -1];

	if (time >= _endTime) then {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	} else {
		if (time > _previousBleedTime) then {
			_surfaceIntersection = [
				getPosASL _object,
				_object,
				vehicle _object
			] call BloodLust_fnc_getSurfaceIntersection;
			
			_surfaceIntersection params [
				"_surfaceDistance",
				"_surfaceNormal",
				"_surfacePosition",
				"_surfaceIsIntersecting"
			];
			
			if (
				_surfaceIsIntersecting &&
				_surfaceDistance <= 0.05 &&
				_object call BloodLust_fnc_getVelocityMagnitude >= _minimumSpeed
			) then {
				_splatterPosition = _surfacePosition vectorAdd (_surfaceNormal vectorMultiply 0.01);
				_splatter = call BloodLust_fnc_createBleedSplatterObject;
				_splatter setDir (random 360);
				_splatter setObjectTexture [0, selectRandom BloodLust_SmearTextures];
				_splatter setPosASL _splatterPosition;
				_splatter setVectorUp _surfaceNormal;
				_object setVariable ["BloodLust_PreviousBleedTime", time];
				
				["BloodLust_splatterCreated", [_splatter]] call CBA_fnc_localEvent;
			};
		};
	};
}, 0, [_object, _endTime, _minimumSpeed]] call CBA_fnc_addPerFrameHandler;