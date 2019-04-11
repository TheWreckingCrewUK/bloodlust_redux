params ["_damage"];
_textureSetIndex = -1;

if (_damage <= 0.33) then {
	_textureSetIndex = 2;
} else {
	if (_damage <= 0.66) then {
		_textureSetIndex = 1;
	} else {
		if (_damage <= 1) then {
			_textureSetIndex = 0;
		};
	};
};

_textureSetIndex;