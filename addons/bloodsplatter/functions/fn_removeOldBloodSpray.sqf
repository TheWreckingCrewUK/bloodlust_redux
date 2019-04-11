if (count BloodLust_BloodSprays > 0) then {
	_spray = BloodLust_BloodSprays select 0;
	deleteVehicle _spray;
	BloodLust_BloodSprays deleteAt 0;
};