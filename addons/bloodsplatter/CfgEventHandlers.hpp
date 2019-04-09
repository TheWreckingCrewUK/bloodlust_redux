class Extended_PreInit_EventHandlers {
	class BloodSplatter {
		init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf';";
	};
};

class Extended_InitPost_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			init = "[_this select 0] call BloodLust_fnc_InitUnit;";
		};
	};
};

class Extended_Killed_EventHandlers {
	class AllVehicles {
		class BloodSplatter {
			init = "_this call BloodLust_fnc_handleKilledVehicle;";
		};
	};
};

class Extended_Respawn_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			respawn = "_this call BloodLust_fnc_handleRespawn;";
		};
	};
};