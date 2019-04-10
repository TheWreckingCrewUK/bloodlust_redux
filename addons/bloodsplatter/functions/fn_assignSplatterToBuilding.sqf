params [["_splatter", objNull], ["_surfaceObject", objNull]];

if (_surfaceObject isKindOf "Building") then {
	_surfaceObjectSplatters = _surfaceObject getVariable ["BloodLust_BloodSplatters", []];
	_surfaceObject setVariable ["BloodLust_BloodSplatters", _surfaceObjectSplatters + [_splatter]];
	_isKilledEventHandlerAssignedToSurfaceObject = _surfaceObject getVariable ["BloodLust_IsKilledEventHandlerAssigned", false];
	if (!_isKilledEventHandlerAssignedToSurfaceObject) then {
		_surfaceObject setVariable ["BloodLust_IsKilledEventHandlerAssigned", true];
		
		_surfaceObject addEventHandler ["Killed", {
			params ["_object"];
			_attachedSplatters = _object getVariable ["BloodLust_BloodSplatters", []];
			
			{
				BloodLust_BloodSplatters = BloodLust_BloodSplatters - [_x];
				deleteVehicle _x;
			} foreach _attachedSplatters;
		}];
	};
};