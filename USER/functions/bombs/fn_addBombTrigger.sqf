params ["_boss"];

private _layBomb = [
    "layBomb",
    "Lay Bomb",
    "",
    {
        // hintSilent "Bomb Trigger Set";        
        player playMoveNow "Acts_carFixingWheel";
        [10, [], {
            [player] remoteExec ["hoppers_fnc_bombCountDown", 2];
        }, {
            hint "Aborted Bomb Laying!"
        }, "Wiring Bomb..."] call ace_common_fnc_progressBar
    }, {
          call hoppers_fnc_canLayBomb
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _layBomb] call ace_interact_menu_fnc_addActionToObject;


private _extractionStart = [
    "extractionStart",
    "Start Extraction (cancel bomb tasks)",
    "",
    {
        hintSilent "Possible extraction points marked on map. Boss is marked for Blufor now.";

        
        [player] remoteExec ["hoppers_fnc_extractionStart", 2];
        
    }, {
          !(player getVariable ["hoppers_countdownStarted", false]) && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] >= HOPPERS_BOMBS_MIN_PLACED && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] < 9999
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _extractionStart] call ace_interact_menu_fnc_addActionToObject;

["ace_unconscious", {
    params ["_unit", "_state"];

    if (_state) then {   
        [{
            params ["_unit"];

            // if player is still or again unconscious, trigger a 50/50 chance of dying or wakeup
            if (_unit getVariable ["ACE_isUnconscious", false]) then {
                if (random 1 > 0.5) then {
                    [_unit, false] call ace_medical_status_fnc_setUnconsciousState;
                    [_unit, _unit] call ace_medical_treatment_fnc_fullHeal;
                } else {
                    _unit setDamage 1;
                };
            };
        }, [_unit], 180] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;