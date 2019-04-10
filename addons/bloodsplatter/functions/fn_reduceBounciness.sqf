params ["_object", "_reductionAmount", "_duration"];

_startTime = time;
_endTime = _startTime + _duration;

[{
	params ["_args"];
	_args params ["_object", "_reductionAmount", "_endTime"];

	if (time >= _endTime) then {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	} else {
		if (isTouchingGround _object) then {
			_objectVelocity = velocity _object;
			_zVelocityAmount = 1 - _reductionAmount;

			_object setVelocity [
				_objectVelocity select 0,
				_objectVelocity select 1,
				(_objectVelocity select 2) * _zVelocityAmount
			];
		};
	};
}, 0, [_object, _reductionAmount, _endTime]] call CBA_fnc_addPerFrameHandler;