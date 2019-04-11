params ["_unit", "_selections"];

_gibClassnames = [];

if ("head" in _selections) then {
	if ((_unit getHitIndex 2) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_HeadGibClassnames;
	};
};

if ("spine1" in _selections) then {
	if ((_unit getHitIndex 4) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_Spine1GibClassnames;
	};
};

if ("spine2" in _selections) then {
	if ((_unit getHitIndex 5) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_Spine2GibClassnames;
	};
};

if ("spine3" in _selections) then {
	if ((_unit getHitIndex 6) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_Spine3GibClassnames;
	};
};

if ("body" in _selections) then {
	if ((_unit getHitIndex 7) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_BodyGibClassnames;
	};
};

if ("leftarm" in _selections) then {
	if ((_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_ArmGibClassnames;
	};
};

if ("leftforearm" in _selections) then {
	if ((_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_ArmGibClassnames;
	};
};

if ("rightarm" in _selections) then {
	if ((_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_ArmGibClassnames;
	};
};

if ("rightforearm" in _selections) then {
	if ((_unit getHitIndex 9) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_ArmGibClassnames;
	};
};

if ("leftleg" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

if ("leftupleg" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

if ("rightleg" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

if ("rightupleg" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

if ("leftfoot" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

if ("rightfoot" in _selections) then {
	if ((_unit getHitIndex 10) call BloodLust_fnc_getSplatterTextureSetIndexFromDamage != -1) then {
		_gibClassnames = _gibClassnames + BloodLust_LegGibClassnames;
	};
};

_gibClassnames;