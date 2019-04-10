params ["_hitSelection", "_duration"];
_hitSelection params ["_target", "_shooter", "_bullet", "_hitPosition", "_velocity", "_selections", "_ammo", "_direction", "_radius", "_surface", "_isDirectHit"];

_bulletVectorDir = vectorDir _bullet;
_bulletVectorUp = vectorUp _bullet;

if (count _selections == 0) exitWith {};

_selectionName = selectRandom _selections;
_endTime = time + _duration;
_arterialBloodSprayEndTime = time + 10;
_initialUnitDamage = damage _target;
_bleedSmearEndTime = time + 10;
_target setVariable [format ["BloodLust_NextBleedTime_%1", _selectionName], call BloodLust_fnc_getNextBleedTime];

[{
	params ["_args"];
	_args ["_target", "_initialUnitDamage", "_projectileVelocity", "_selectionName", "_bulletVectorDir", "_bulletVectorUp", "_endTime", "_arterialBloodSprayEndTime", "_bleedSmearEndTime"];

	_nextBleedTime = _target getVariable [format ["BloodLust_NextBleedTime_%1", _selectionName], 0];
	_splatterAngle = random 360;

	if (
		(time >= _endTime) ||
		(_target getVariable ["BloodLust_IsVaporized", false]) ||
		((damage _target) < _initialUnitDamage)
	) exitWith {
		["BloodLust_unitBleedingStopped", [_target]] call CBA_fnc_globalEvent;
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};

	_hitPointPosition = AGLToASL(_target modelToWorld (_target selectionPosition [_selectionName, "HitPoints"]));
	_intersectionEndPosition = AGLToASL((_target modelToWorld ((_target selectionPosition [_selectionName, "HitPoints"]))) vectorAdd ((vectorNormalized _projectileVelocity) vectorMultiply 0.3));
	
	_surfaceIntersections = lineIntersectsSurfaces [
		_hitPointPosition,
		_intersectionEndPosition,
		_target,
		vehicle _target,
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

	["BloodLust_unitBleedingStarted", [_target]] call CBA_fnc_globalEvent;

	if (count _surfaceIntersections == 0 && time >= _nextBleedTime) then {
		_intersectionEndPosition = AGLToASL(_target modelToWorld ((_target selectionPosition [_selectionName, "HitPoints"]) vectorAdd [0, 0, -0.15]));
		_surfaceIntersections = lineIntersectsSurfaces [
			_hitPointPosition,
			_intersectionEndPosition,
			_target,
			vehicle _target,
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
	};

	if (count _surfaceIntersections > 0 && time <= _bleedSmearEndTime) then {
		_previousSmearPosition = _target getVariable [format ["BloodLust_PreviousBleedSmearPosition_%1", _selectionName], [0, 0, 0]];
		_surfaceIntersections params ["_surfaceIntersection", "_surfacePosition", "_surfaceNormal"];
		_splatterPosition = _surfacePosition vectorAdd (_surfaceNormal vectorMultiply 0.01);

		if (_splatterPosition distance _previousSmearPosition >= 0.025) then {
			_splatterAngle = direction _target - ([_splatterPosition, _previousSmearPosition] call BIS_fnc_dirTo);
			_splatter = call BloodLust_fnc_createBloodSmearObject;
			_splatter setObjectTexture [0, selectRandom BloodLust_SmearTextures];
			_splatter setPosASL _splatterPosition;

			[_splatter, _surfaceNormal, _splatterAngle] call BloodLust_fnc_rotateObjectAroundNormal;

			["BloodLust_splatterCreated", [_splatter]] call CBA_fnc_localEvent;

			_target setVariable [format ["BloodLust_PreviousBleedSmearPosition_%1", _selectionName], _splatterPosition];
			_target setVariable [format ["BloodLust_NextBleedTime_%1", _selectionName], call BloodLust_fnc_getNextBleedTime];
		};
	} else {
		if (time >= _nextBleedTime) then {
			_jitter = [0.15 - (random (0.15 * 2)), 0.15 - (random (0.15 * 2)), 0.15 - (random (0.15 * 2))];
			
			_splatterPosition = (AGLtoASL(_target modelToWorldVisual (_target selectionPosition [_selectionName, "HitPoints"]))) vectorAdd _jitter;
			_surfaceIntersection = [_splatterPosition, _target, vehicle _target] call BloodLust_fnc_getSurfaceIntersection;

			_surfaceIntersections params ["_surfaceIntersection", "_surfacePosition", "_surfaceNormal"];

			if (_surfaceDistance > 0.3) then {
				_splatterPosition = _surfacePosition vectorAdd (_surfaceNormal vectorMultiply 0.01);
				_splatter = call BloodLust_fnc_createBleedSplatterObject;
				_splatter setObjectTexture [0, selectRandom BloodLust_BleedTextures];
				_splatter setPosASL _splatterPosition;
				[_splatter, _surfaceNormal, _splatterAngle] call BloodLust_fnc_rotateObjectAroundNormal;

				["BloodLust_splatterCreated", [_splatter]] call CBA_fnc_localEvent;

				[
					selectRandom BloodLust_BleedSounds,
					_splatter,
					false,
					_splatterPosition,
					_surfaceDistance / 4,
					1,
					4
				] call BloodLust_fnc_playSound;
				
				_target setVariable [format ["BloodLust_NextBleedTime_%1", _selectionName], call BloodLust_fnc_getNextBleedTime];

				if (time <= _arterialBloodSprayEndTime && random 1 <= 0.75) then {
					_arterialBloodSprayPosition = _hitPointPosition;
					_arterialBloodSprayDirection = vectorNormalized (((_bulletVectorDir vectorAdd _jitter)) vectorCrossProduct (vectorDir _target));
					_arterialBloodSprayUp = vectorNormalized (((_bulletVectorUp vectorAdd _jitter)) vectorCrossProduct (vectorUp _target));

					[
						_arterialBloodSprayPosition,
						_arterialBloodSprayDirection,
						_arterialBloodSprayUp
					] call BloodLust_fnc_createArterialBloodSpray;
				};
			} else {
				_hasBloodPool = _target getVariable ["BloodLust_HasBloodPool", false];
				_unitSpeed = _target call BloodLust_fnc_getVelocityMagnitude;
				
				if (!_hasBloodPool && !alive _target && _unitSpeed < 1) then {
					_target setVariable ["BloodLust_HasBloodPool", true];
					_bloodPool = call BloodLust_fnc_createBloodPoolObject;
					_bloodPool setPosASL (_surfacePosition vectorAdd (_surfaceNormal vectorMultiply 0.01));
					[_bloodPool, _surfaceNormal, _splatterAngle] call BloodLust_fnc_rotateObjectAroundNormal;
				};
			};
		};
	};
}, 0, [_target, _initialUnitDamage, _velocity, _selectionName, _bulletVectorDir, _bulletVectorUp, _endTime, _arterialBloodSprayEndTime, _bleedSmearEndTime]] call CBA_fnc_addPerFrameHandler;
