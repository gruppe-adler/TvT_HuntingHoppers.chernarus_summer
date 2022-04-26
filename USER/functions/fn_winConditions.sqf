[{
  params ["_args", "_handle"];

  private _opforBoss = missionNamespace getVariable ["hoppers_boss", objNull];
  private _exfilPositions = missionNamespace getVariable ["hoppers_exfilPositions", [[-9999,-9999,0]]];

  // east eliminated
  OPFOR_ELIMINATED = !alive _opforBoss;
  BLUFOR_ELIMINATED = ({side _x isEqualTo west && alive _x} count (playableUnits + switchableUnits) == 0);
  // NO_BOMBSPOTS = (HOPPERS_BOMBS_MIN_PLACED - (missionNamespace getVariable ["hoppers_missionPhase", 0])) > (count HOPPERS_BOMBS_BOMBSPOTS);

  // diag_log format ["min_placed %1, missionphase %2, bombspots %3 - %4", HOPPERS_BOMBS_MIN_PLACED, hoppers_missionPhase, count HOPPERS_BOMBS_BOMBSPOTS, NO_BOMBSPOTS];

  OPFOR_EXTRACTED = false;
  {
      private _exfilPosition = _x;
      if (alive _opforBoss && _opforBoss distance _exfilPosition < 100) then {
          OPFOR_EXTRACTED = true;
      };
  } forEach _exfilPositions;

  if (OPFOR_ELIMINATED) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;
      call GRAD_replay_fnc_stopRecord;

      ["Eliminate", "SUCCEEDED"] call BIS_fnc_taskSetState;
      {
          private _exfilPosition = _x;
          private _taskID = format ["Exfiltrate_%1", _exfilPosition];
          [_taskID, "FAILED", _forEachIndex == 0] call BIS_fnc_taskSetState;
      } forEach _exfilPositions;


      west addScoreSide 1337;
  };

  if (BLUFOR_ELIMINATED) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;
      call GRAD_replay_fnc_stopRecord;

      ["Eliminate", "FAILED"] call BIS_fnc_taskSetState;
      {
          private _exfilPosition = _x;
          private _taskID = format ["Exfiltrate_%1", _exfilPosition];
          [_taskID, "SUCCEEDED", _forEachIndex == 0] call BIS_fnc_taskSetState;
      } forEach _exfilPositions;

      east addScoreSide 1337;
  };

  if (OPFOR_EXTRACTED) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
    call GRAD_replay_fnc_stopRecord;

    ["Eliminate", "FAILED"] call BIS_fnc_taskSetState;
    {
        private _exfilPosition = _x;
        private _taskID = format ["Exfiltrate_%1", _exfilPosition];
        [_taskID, "SUCCEEDED", _forEachIndex == 0] call BIS_fnc_taskSetState;
    } forEach _exfilPositions;

    east addScoreSide 1337;
  };


}, 1, []] call CBA_fnc_addPerFrameHandler;

// end mission when replay is done
["GRAD_replay_finished",
{
  "SideScore" call BIS_fnc_endMissionServer;
}] call CBA_fnc_addEventHandler;
