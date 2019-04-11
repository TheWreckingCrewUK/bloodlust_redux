if (count BloodLust_BloodSplatters > 0) then {
	_splatter = BloodLust_BloodSplatters select 0;
	deleteVehicle _splatter;
	BloodLust_BloodSplatters deleteAt 0;
};