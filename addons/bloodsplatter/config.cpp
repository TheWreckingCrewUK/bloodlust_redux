class CfgPatches {
	class BloodSplatter {
		units[] = {};

		requiredAddons[] = {
			"cba_main",
			"A3_UI-F",
			"A3_Data_F"
		};

		requiredVersion = 1.8;
		projectName = "BloodLust Redux";
		author[] = {"Bosenator", "thewreckingcrew", "Gavin N. Alvesteffer"};
		authorUrl = "http://thewreckingcrew.eu";
		url = "https://github.com/TheWreckingCrewUK/bloodlust_redux";
		version = 1.0.0;
		versionStr = "1.0.0";
		versionAr[] = {1,0,0};
	};
};

class CfgCoreData {
	slopBlood = "BloodSplatter\Models\Plane\BloodSplatter_Plane.p3d";
	footStepBleeding0 = "BloodSplatter\Models\Plane\BloodSplatter_Plane.p3d";
	footStepBleeding1 = "BloodSplatter\Models\Plane\BloodSplatter_Plane.p3d";
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
