if (count BloodLust_Gibs > 0) then {
	_gib = BloodLust_Gibs select 0;
	deleteVehicle _gib;
	BloodLust_Gibs deleteAt 0;
};