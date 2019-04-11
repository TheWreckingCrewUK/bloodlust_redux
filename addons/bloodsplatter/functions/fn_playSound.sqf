params ["_soundPath", "_object", "_isInside", "_position", "_volume", "_pitch", "_distance"];

if (local _object) then {
	playSound3D [_soundPath, _object, _isInside, _position, _volume, _pitch, _distance];
};