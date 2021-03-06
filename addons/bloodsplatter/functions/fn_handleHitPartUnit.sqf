if (count _this > 1) exitWith {};
// still broadcast regardless of local setting, maybe a weird server allows people to turn off individually??
if (local _unit) then { ["BloodLust_Broadcast_HitPartUnit", _this] call CBA_fnc_globalEvent; };
if (!BloodLust_IsBloodLustEnabled) exitWith {};

_unit = (_this select 0) select 0;

if((position _unit) distance (positionCameraToWorld [0, 0, 0]) <= BloodLust_BloodLustActivationDistance) then {
	_hitSelections = _this;
	_unit = (_hitSelections select 0) select 0;

	if (_unit getVariable ["BloodLust_IsVaporized", false]) exitWith {};

	_hitSelectionsFiltered = _hitSelections select {
		_return = false;
		if (((_x select 6) select 4) != "") then { _return = true; };
		_return;
	};

	_hitSelection = _hitSelectionsFiltered select 0;
	_hitSelection params ["_target", "_shooter", "_bullet", "_hitPosition", "_velocity", "_selections", "_ammo", "_direction", "_radius", "_surface", "_isDirectHit"];
	
	_ammoDamage   = _ammo select 0;
	_ammoCaliber =  getNumber(configFile >> "CfgAmmo" >> (_ammo select 4) >> "caliber");

	_bloodSplatterIterations = (0.3 * _ammoCaliber) max 1;

	if (BloodLust_IsBloodSprayEnabled && (random 1) <= 0.75) then {
		_sprayJitter = [0.25 - (random (0.25 * 2)), 0.25- (random (0.25 * 2)), 0.25- (random (0.25 * 2))];

		[
			_hitPosition,
			(vectorDir _bullet) vectorAdd _sprayJitter,
			(vectorUp _bullet) vectorAdd _sprayJitter
		] call BloodLust_fnc_CreateBloodSpray;

		[
			_hitPosition,
			(vectorDir _bullet) vectorAdd _sprayJitter,
			(vectorMagnitude _velocity) * 0.1,
			0.2
		] call BloodLust_fnc_CreateBloodSplash;
	};

	if (random 1 <= 1) then {
		_splatterTextures = [_target, _selections] call BloodLust_fnc_GetSplatterTextures;
		if(count _splatterTextures == 0) exitWith {};

		_splatterJitter = [0.05 - (random (0.05 * 2)), 0.05 - (random (0.05 * 2)), 0.05 - (random (0.05 * 2))];
		
		[
			_target,
			_hitPosition,
			vectorNormalized _velocity vectorAdd _splatterJitter,
			4,
			(direction _bullet + 90) + random 360,
			selectRandom _splatterTextures
		] call BloodLust_fnc_CreateBloodSplatter;
	};

	if (
		BloodLust_MaxGibs > 0 && 
		_ammoCaliber >= 0.4 && 
		_bullet call BloodLust_fnc_GetVelocityMagnitude >= 300 && 
		((random 1) <= 0.15)
	) then {
		for "_i" from 0 to ((floor(random(3))) max 1) do {
			[BloodLust_BloodSplatterJitterAmount, _hitSelection] call BloodLust_fnc_CreateGib;
		};
	};

	if (alive _unit) then {
		{
			[_hitSelection, 20, 0.02, 2] call BloodLust_fnc_MakeUnitBleed;
		} foreach _hitSelectionsFiltered;
	};
};