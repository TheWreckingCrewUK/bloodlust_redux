class Extended_PreInit_EventHandlers {
	class BloodSplatter {
		init = "call compile preprocessFileLineNumbers 'bloodsplatter\XEH_preInit.sqf';";
	};
};

class Extended_Killed_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			killed = "_this call BloodLust_fnc_handleKilledUnit;";
		};
	};
	
	class AllVehicles {
		class BloodSplatter {
			killed = "_this call BloodLust_fnc_handleKilledVehicle;";
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

class Extended_HitPart_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			hitPart = "_this call BloodLust_fnc_handleHitPartUnit;";
		};
	};
};

class Extended_Explosion_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			explosion = "_this call BloodLust_fnc_handleExplosionUnit;";
		};
	};
};

class Extended_Hit_EventHandlers {
	class CAManBase {
		class BloodSplatter {
			hit = "_this call BloodLust_fnc_handleHitUnit;";
		};
	};
};
