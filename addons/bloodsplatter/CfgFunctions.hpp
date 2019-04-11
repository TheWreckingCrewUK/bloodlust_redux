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
			
			/** UTILITY **/
			class rotateAroundNormal {};
			class rotateObjectAroundNormal {};
			class getSurfaceIntersection {};
			class getNextBleedTime {};
			class getVelocityMagnitude {};
			class isObjectCompletelyOnSurface {};
			class animateObjectTexture {};
			class getGibClassnames {};
			class getSplatterTextures {};
			class getSplatterTextureSetIndexFromDamage {};
			class isClassInIntersectionBlackList {};
			class isAmmoInVaporisationWhitelist {};
			class isMaxBloodSplattersReached {};
			class isMaxArterialBloodSpraysReached {};
			class removeOldArterialBloodSpray {};
			class removeOldBloodSplatter {};
			class isMaxBloodSpraysReached {};
			class removeOldBloodSpray {};
			class isMaxBleedSplattersReached {};
			class removeOldBleedSplatter {};
			class isMaxGibsReached {};
			class removeOldGib {};
			class playSound {};
		};
	};
};