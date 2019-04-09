if (!BloodLust_IsBloodLustEnabled || count _this > 1) exitWith {};

_unit = (_this select 0) select 0;

if((position _unit) distance (positionCameraToWorld [0, 0, 0]) <= BloodLust_BloodLustActivationDistance) then {
	_hitSelections = _this;
    _unit = (_hitSelections select 0) select 0;

    if(_unit getVariable ["BloodLust_IsVaporized", false]) exitWith {};

    _hitSelectionsFiltered = _hitSelections select
    {
        _return    = false;
        _ammoClass = (_x select 6) select 4;
        if(_ammoClass != "") then
        {
            _return = true;
        };
        _return;
    };

    _hitSelection = _hitSelectionsFiltered select 0;
    _target       = _hitSelection select 0;
    _shooter      = _hitSelection select 1;
    _bullet       = _hitSelection select 2;
    _hitPosition  = _hitSelection select 3;
    _velocity     = _hitSelection select 4;
    _selections   = _hitSelection select 5;
    _ammo         = _hitSelection select 6;
    _direction    = _hitSelection select 7;
    _radius       = _hitSelection select 8;
    _surface      = _hitSelection select 9;
    _isDirectHit  = _hitSelection select 10;
    _ammoDamage   = _ammo select 0;
    _ammoCaliber =  getNumber(configFile >> "CfgAmmo" >> (_ammo select 4) >> "caliber");
    _bloodSplatterIterations = ((BloodLust_BloodSplatterIterationCaliberMultiplier * _ammoCaliber) * BloodLust_BloodSplatterIterations) max 1;

    if(BloodLust_IsBloodSprayEnabled && (random 1) <= BloodLust_BloodSprayProbability) then
    {
        for "_i" from 1 to BloodLust_BloodSprayIterations do
        {
            _sprayJitter =
            [
                BloodLust_BloodSprayJitterAmount - (random (BloodLust_BloodSprayJitterAmount * 2)),
                BloodLust_BloodSprayJitterAmount - (random (BloodLust_BloodSprayJitterAmount * 2)),
                BloodLust_BloodSprayJitterAmount - (random (BloodLust_BloodSprayJitterAmount * 2))
            ];

            [_hitPosition, (vectorDir _bullet) vectorAdd _sprayJitter, (vectorUp _bullet) vectorAdd _sprayJitter] call BloodLust_CreateBloodSpray;

            if(BloodLust_IsBloodSplashingEnabled) then
            {
                [_hitPosition, (vectorDir _bullet) vectorAdd _sprayJitter, (vectorMagnitude _velocity) * BloodLust_BloodSplashProjectileSpeedContribution, BloodLust_BloodSplashDuration] call BloodLust_CreateBloodSplash;
            };
        };
    };

    if(random 1 <= BloodLust_BloodSplatterProbability) then
    {
        for "_i" from 1 to _bloodSplatterIterations do
        {
            _splatterTextures = [_target, _selections] call BloodLust_GetSplatterTextures;
            if(count _splatterTextures == 0) exitWith {};
            _splatterJitter =
            [
                BloodLust_BloodSplatterJitterAmount - (random (BloodLust_BloodSplatterJitterAmount * 2)),
                BloodLust_BloodSplatterJitterAmount - (random (BloodLust_BloodSplatterJitterAmount * 2)),
                BloodLust_BloodSplatterJitterAmount - (random (BloodLust_BloodSplatterJitterAmount * 2))
            ];
            [
                _target,
                _hitPosition,
                vectorNormalized _velocity vectorAdd _splatterJitter,
                BloodLust_BloodSplatterIntersectionMaxDistance,
                (direction _bullet + 90) + random BloodLust_BloodSplatterAngleJitterAmount,
                selectRandom _splatterTextures
            ] call BloodLust_CreateBloodSplatter;
        };
    };

    if(BloodLust_IsGibbingEnabled && _ammoCaliber >= BloodLust_GibCaliberThreshold && _bullet call BloodLust_GetVelocityMagnitude >= BloodLust_GibbingProjectileSpeedThreshold && ((random 1) <= BloodLust_GibProbability)) then
    {
        for "_i" from 0 to ((floor(random(BloodLust_GibIterations))) max 1) do
        {
            [BloodLust_BloodSplatterJitterAmount, _hitSelection] call BloodLust_CreateGib;
        };
    };

    if(BloodLust_IsBleedingEnabled && alive _unit) then
    {
       {
           [_hitSelection, BloodLust_BleedDuration, BloodLust_BleedFrequency, BloodLust_BleedFrequencyVariance] call BloodLust_MakeUnitBleed;
       } foreach _hitSelectionsFiltered;
    };
};