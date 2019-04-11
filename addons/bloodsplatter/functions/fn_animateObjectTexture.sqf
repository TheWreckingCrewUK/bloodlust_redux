params ["_textures", "_frameRate", "_isLoop", "_deleteObjectAfterEndOfAnimation", "_object", "_deletionFunction"];

_startTime = time;
_duration = (count _textures) / _frameRate;
_durationPerFrame = _duration / (count _textures);

[{
	_args = _this select 0;
	_eventHandlerId = _this select 1;
	_textures = _args select 0;
	_frameRate = _args select 1;
	_isLoop = _args select 2;
	_deleteObjectAfterEndOfAnimation = _args select 3;
	_object = _args select 4;
	_startTime = _args select 5;
	_durationPerFrame = _args select 6;
	_deletionFunction = _args select 7;
	
	params ["_args", "_eventHandlerId"];
	_args params ["_textures", "_frameRate", "_isLoop", "_deleteObjectAfterEndOfAnimation", "_object", "_startTime", "_durationPerFrame", "_deletionFunction"];
	
	_frameIndex = (floor((time - _startTime) / _durationPerFrame)) min ((count _textures) - 1);
	_currentFrameIndex = _object getVariable ["BloodLust_CurrentFrameIndex", _frameIndex];

	if (isNull _object) then {
		[_eventHandlerId] call CBA_fnc_removePerFrameHandler;
	} else {
		if (_currentFrameIndex >= ((count _textures) - 1)) then {
			if (_isLoop) then {
				_object setVariable ["BloodLust_CurrentFrameIndex", 0];
			} else {
				if (_deleteObjectAfterEndOfAnimation) then {
					_object call _deletionFunction;
					deleteVehicle _object;
				};

				[_eventHandlerId] call CBA_fnc_removePerFrameHandler;
			};
		} else {
			if (_frameIndex != _currentFrameIndex) then {
				_object setObjectTexture [0, _textures select _currentFrameIndex];
			};

			_object setVariable ["BloodLust_CurrentFrameIndex", _frameIndex];
		};
	};
}, 1 / _frameRate, [_textures, _frameRate, _isLoop, _deleteObjectAfterEndOfAnimation, _object, _startTime, _durationPerFrame, _deletionFunction]] call CBA_fnc_addPerFrameHandler;