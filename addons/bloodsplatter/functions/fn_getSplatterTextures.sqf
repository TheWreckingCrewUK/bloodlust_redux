params ["_unit", "_selections"];

_splatterTextures = [];

if ("head" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 2) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;

	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_HeadSplatterTextures select _textureSetIndex);
	};
};

if ("spine1" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 4) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_Spine1SplatterTextures select _textureSetIndex);
	};
};

if ("spine2" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 5) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_Spine2SplatterTextures select _textureSetIndex);
	};
};

if ("spine3" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 6) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_Spine3SplatterTextures select _textureSetIndex);
	};
};

if ("body" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 7) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_BodySplatterTextures select _textureSetIndex);
	};
};

if ("leftarm" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_ArmSplatterTextures select _textureSetIndex);
	};
};

if ("leftforearm" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_ArmSplatterTextures select _textureSetIndex);
	};
};

if ("rightarm" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_ArmSplatterTextures select _textureSetIndex);
	};
};

if ("rightforearm" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_ArmSplatterTextures select _textureSetIndex);
	};
};

if ("leftleg" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

if ("leftupleg" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

if ("rightleg" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

if ("rightupleg" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

if ("leftfoot" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

if ("rightfoot" in _selections) then {
	_textureSetIndex = (_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage;
	
	if (_textureSetIndex != -1) then {
		_splatterTextures = _splatterTextures + (BloodLust_LegSplatterTextures select _textureSetIndex);
	};
};

_splatterTextures;