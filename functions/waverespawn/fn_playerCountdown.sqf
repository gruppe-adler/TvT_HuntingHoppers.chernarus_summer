#include "component.hpp"

INFO("Starting player countdown...");

[{
    private _timeOfDeath = player getVariable ["wr_timeOfDeath",-1];

    private _playerSide = [player, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide

    //check interrupt
    if (player getVariable "wr_interrupted") exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_playerCountdownDone", true];
    };

    if (call (player getVariable "wr_interruptCondition")) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_interrupted", true];
        player setVariable ["wr_playerCountdownDone", true];
        INFO("Respawn interrupted.");
    };

    if (CBA_missionTime - _timeOfDeath > GVAR(MAXRESPAWNTIME)) then {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_isFreeRespawn", true];
        player setVariable ["wr_playerCountdownDone", true];
        INFO("Max respawn time reached.");
    };

    _playerTimeLeft = (player getVariable "wr_playerRespawnTimeLeft") - 1;
    player setVariable ["wr_playerRespawnTimeLeft", _playerTimeLeft];
    [_playerSide,"Waiting for player-countdown."] call FUNC(respawnHint);

    if (_playerTimeLeft <= 0) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_playerCountdownDone", true];
    };

    systemChat "player countdown running";
}, 1, []] call CBA_fnc_addPerFrameHandler;
