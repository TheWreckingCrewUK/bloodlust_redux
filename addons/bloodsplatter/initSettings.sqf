[
	"BloodLust_isEnabled",
	"CHECKBOX",
	"Enable BloodLust",
	"BloodLust Redux",
	true,
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_MaxBloodSprays",
	"SLIDER",
	"Max Blood Sprays",
	["BloodLust Redux", "Performance Settings"],
	[0, 40, 20, -1],
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_MaxBloodSplatters",
	"SLIDER",
	"Max Blood Splatters",
	["BloodLust Redux", "Performance Settings"],
	[0, 1500, 3000, -1],
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_MaxGibs",
	"SLIDER",
	"Max Gibs",
	["BloodLust Redux", "Performance Settings"],
	[0, 50, 30, -1],
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_IsCleanUpEnabled",
	"CHECKBOX",
	"Enable Cleanup",
	["BloodLust Redux", "Performance Settings"],
	true,
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_CleanUpDistance",
	"SLIDER",
	"Cleanup Distance",
	["BloodLust Redux", "Performance Settings"],
	[1, 1000, 100, -1],
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_CleanUpDelay",
	"SLIDER",
	"Cleanup Delay",
	["BloodLust Redux", "Performance Settings"],
	[5, 900, 30, -1],
	nil, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_IsAIVaporisationEnabled",
	"CHECKBOX",
	"Enable AI Vaporisation",
	["BloodLust Redux", "Gameplay"],
	true,
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_IsPlayerVaporisationEnabled",
	"CHECKBOX",
	"Enable Player Vaporisation",
	["BloodLust Redux", "Gameplay"],
	true,
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_VaporisationDamageThreshold",
	"SLIDER",
	"Vaporisation Damage Threshold",
	["BloodLust Redux", "Gameplay"],
	[0, 100, 1, -1],
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_IsFallingVaporisationEnabled",
	"CHECKBOX",
	"Enable Falling Vaporisation",
	["BloodLust Redux", "Gameplay"],
	true,
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_FallingVaporisationSpeedThreshold",
	"SLIDER",
	"Falling Vaporisation Speed Threshold",
	["BloodLust Redux", "Gameplay"],
	[0, 100, 20, -1],
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_ExplosionDamageThreshold",
	"SLIDER",
	"Explosion Damage Threshold",
	["BloodLust Redux", "Gameplay"],
	[0, 25, 0.2, 1],
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;

[
	"BloodLust_UnitVehicleVaporisationCollisionSpeed",
	"SLIDER",
	"Vehicle Vaporisation Collision Speed",
	["BloodLust Redux", "Gameplay"],
	[0, 500, 30, -1],
	true, // isGlobal
	{  }, // script called when setting is changed
	true
] call CBA_settings_fnc_init;