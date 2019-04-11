params ["_splashStartPosition", "_splashDirectionVector", "_splashForce", "_splashDuration"];

_startTime = time;
_endTime = _startTime + _splashDuration;

[
	{
		_arguments = _this getVariable "params";
		_arguments params [
			"_splashStartPosition",
			"_splashDirectionVector",
			"_splashForce",
			"_splashDuration",
			"_startTime",
			"_endTime"
		];

		_lastSplatterPositionASL = _this getVariable ["LastSplatterPositionASL", _splashStartPosition];
		_currentSplashTime = time - _startTime;
		_currentSplashGravity = [0, 0, -9.81] vectorMultiply _currentSplashTime;
		_halfDropletJitterAmount = 0.15;

		for [{_dropletIndex = 0}, {_dropletIndex < 3}, {_dropletIndex = _dropletIndex + 1}] do {
			_currentSplashAngleJitter = [
				_halfDropletJitterAmount - (random 0.3),
				_halfDropletJitterAmount - (random 0.3),
				_halfDropletJitterAmount - (random 0.3)
			];
			
			_currentSplashForceVector = ((vectorNormalized (_splashDirectionVector vectorAdd _currentSplashAngleJitter)) vectorMultiply (_splashForce * _currentSplashTime + (_dropletIndex * 0.001))) vectorAdd _currentSplashGravity;

			_splatterPlacement = [_lastSplatterPositionASL, _currentSplashForceVector, 4, 1.5] call BloodLust_fnc_getCalculatedSplatterPlacement;
			_splatterPosition = _splatterPlacement select 0;
			_splatterNormal = _splatterPlacement select 1;

			if (_splatterPosition distance _lastSplatterPositionASL < 0.015) exitWith {};

			_splatterAngle = ((_splashDirectionVector select 0) atan2 (_splashDirectionVector select 1)) + 90;
			_splatter = ["tiny"] call BloodLust_fnc_createBloodSmearObject;

			if (vectorMagnitude _currentSplashForceVector >= 1) then {
				_splatter setObjectTexture [0, selectRandom BloodLust_BleedTextures];
			} else {
				_splatter setObjectTexture [0, selectRandom BloodLust_SmearTextures];
			};

			_splatter setPosASL _splatterPosition;
			[_splatter, _splatterNormal, _splatterAngle] call BloodLust_fnc_rotateObjectAroundNormal;

			[
				selectRandom BloodLust_BleedSounds,
				_splatter,
				false,
				_splatterPosition,
				vectorMagnitude (_splatterPosition vectorDiff _splashStartPosition),
				1,
				10
			] call BloodLust_fnc_playSound;

			_this setVariable ["LastSplatterPositionASL", _splatterPosition];
		};

		_nextSplatterTime = time + (0.003);
	},
	0,
	[_splashStartPosition, _splashDirectionVector, _splashForce, _splashDuration, _startTime, _endTime],
	{ _nextSplatterTime = 0; },
	{},
	{ time >= _nextSplatterTime && random 1 <= 0.8; },
	{
		_arguments = _this getVariable "params";
		_endTime = _arguments select 5;
		time >= _endTime;
	},
	["_nextSplatterTime"]
] call CBA_fnc_createPerFrameHandlerObject;