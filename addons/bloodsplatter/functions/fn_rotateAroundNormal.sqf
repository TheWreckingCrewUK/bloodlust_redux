params ["_normal", "_angle"];

[[sin _angle, cos _angle, sin _angle * cos _angle] vectorCrossProduct _normal, _normal];