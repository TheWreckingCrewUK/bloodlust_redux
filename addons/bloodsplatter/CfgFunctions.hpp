class CfgFunctions {
	class BloodLust {
		class functions {
			file = "bloodsplatter\functions";
			
			/** INIT AND HANDLERS **/
			class handleExplosionUnit {};
			class handleHitPartUnit {};
			class handleHitUnit {};
			class handleKilledUnit {};
			class handleKilledVehicle {};
			class handleRespawn {};
			
			/** DAMAGE **/
			class unitHitByVehicle {};
			class unitFallVaporisation {};
			
			/** EFFECTS **/
			class createBloodPoolObject {};
			class createGib {};
			
			/** HELPERS **/
			class isUnitHitByVehicle {};
		};
	};
};