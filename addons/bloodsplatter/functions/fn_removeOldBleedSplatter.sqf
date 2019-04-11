if (count BloodLust_BleedSplatters > 0) then {
	_splatter = BloodLust_BleedSplatters select 0;
	BloodLust_BleedSplatters deleteAt 0;
	deleteVehicle _splatter;
};