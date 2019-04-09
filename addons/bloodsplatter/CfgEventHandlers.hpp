class Extended_PreInit_EventHandlers {
	class BloodSplatter_PreInit {
		init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf';";
	};
};

class Extended_InitPost_EventHandlers {
	class CAManBase {
		class BloodSplatter_Init {
			init = "[_this select 0] call BloodLust_fnc_InitUnit;";
		};
	};

	class AllVehicles {
		class BloodSplatter_Init {
			init = "[_this select 0] call BloodLust_fnc_InitVehicle;";
		};
	};
};

class Extended_Respawn_EventHandlers {
	class CAManBase {
		class BloodSplatter_Respawn {
			respawn = "_this call BloodLust_fnc_handleRespawn;";
		};
	};
};