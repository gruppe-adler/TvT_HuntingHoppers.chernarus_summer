private _string = "Bomb defused! Blufor respawns.";

[
  _string,
  2,
  5, // duration
  [side player, false] call BIS_fnc_sideColor, // color
  true // outline
] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition