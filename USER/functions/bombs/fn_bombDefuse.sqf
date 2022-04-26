params ["_bomb"];

// systemChat str _bomb;
private _boss = _bomb getVariable ["hoppers_countdownBoss", objNull];
_boss setVariable ["hoppers_countdownStarted", false, true];
_bomb setVariable ["hoppers_countdownStarted", false, true];
missionNamespace setVariable ["hoppers_countdown", -1, true];

private _bombspot = _bomb getVariable ["hoppers_bombBombspot", ""];
[_bombspot, west, "SUCCEEDED"] call hoppers_fnc_bombTaskSetState;
[_bombspot, east, "FAILED"] call hoppers_fnc_bombTaskSetState;

HOPPERS_BOMBS_BOMBSPOTS deleteAt (HOPPERS_BOMBS_BOMBSPOTS find _bombspot);

remoteExecCall ["grad_waverespawn_fnc_respawnManual", west];
remoteExecCall ["hoppers_fnc_bombDefusedHint", 0];

private _markers = _bomb getVariable ["hoppers_bombMarkers", []];
_markers params ["_centerMarker", "_bombMarker", "_bombMarkerFill"];
_centerMarker setMarkerColor "ColorBlack";
deleteMarker _bombMarker;
deleteMarker _bombMarkerFill;

deleteVehicle _bomb;