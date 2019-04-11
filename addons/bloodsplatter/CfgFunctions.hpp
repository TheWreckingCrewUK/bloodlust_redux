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
			class vaporiseUnit {};
			
			/** EFFECTS **/
			class createBloodPoolObject {};
			class createGib {};
			class attachBleeding {};
			class attachSmearBleeding {};
			class makeUnitBleed {};
			class createArterialBloodSpray {};
			class createBloodSpray {};
			class createBloodSplash {};
			class createBloodSplatter {};
			
			/** HELPERS **/
			class isUnitHitByVehicle {};
			class reduceBounciness {};
			class getCalculatedSplatterPlacement {};
			class assignSplatterToBuilding {};
			class createBloodSplatterObject {};
			class createBloodSmearObject {};
			class createGibObject {};
			class cleanUp {};
		};
	};
};