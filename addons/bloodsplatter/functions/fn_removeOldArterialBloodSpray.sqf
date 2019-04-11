if (count BloodLust_ArterialBloodSprays > 0) then {
	_spray = BloodLust_ArterialBloodSprays select 0;
	deleteVehicle _spray;
	BloodLust_ArterialBloodSprays deleteAt 0;
};