/*    handles player respawn
*
*     executed locally when player dies
*/

#include "component.hpp"

if (player getVariable ["wr_interrupted", false]) exitWith {};

[] call FUNC(resetPlayerVars);

//check JIP player is spawning for the first time
private _joinTime = player getVariable ["joinTime", 0];
private _playerSide = [player, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide
INFO("onPlayerKilled playerSide is " + str _playerSide);

// if (serverTime - _joinTime < 30 && didJIP) exitWith {INFO("Player is JIP. Exiting onPlayerKilled.")};

[false] call ace_spectator_fnc_setSpectator;

// set spectator attributes
[[], [west, east, independent, civilian]] call ace_spectator_fnc_updateSides;
private _side = [player, true] call BIS_fnc_objectSide;
private _playersOfSide = [];
    { 
        if ([_x, true] call BIS_fnc_objectSide == _side) then { _playersOfSide pushBackUnique _x; };
    } forEach (playableUnits + switchableUnits);
[_playersOfSide, []] call ace_spectator_fnc_updateUnits;
[true] call ace_spectator_fnc_setSpectator;

private _maxRespawns = switch (_playerSide) do {
    case (WEST): {[missionConfigFile >> "missionsettings","bluforWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    case (EAST): {[missionConfigFile >> "missionsettings","opforWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    case (INDEPENDENT): {[missionConfigFile >> "missionsettings","indepWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    case (CIVILIAN): {[missionConfigFile >> "missionsettings","civWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    default {9999};
};

if (player getVariable ["wr_respawnCount",0] >= _maxRespawns) then {
    player setVariable ["wr_interrupted",true,true]
} else {
    [player,_playerSide] remoteExec [QFUNC(addToWaiting),2,false];
};

INFO("Starting waverespawn procedure...");
player setVariable ["wr_timeOfDeath",CBA_missionTime];
player setVariable ["wr_respawnCount",(player getVariable ["wr_respawnCount",0]) + 1];

setPlayerRespawnTime 99999;

//do the steps
if (!(GVAR(WAVERESPAWNMANUAL))) then {
    [] call FUNC(playerCountdown);
} else {
    player setVariable ["wr_playerCountdownDone", true]; // skip directly to wavecountdown
};

[{player getVariable "wr_playerCountdownDone"}, {_this call FUNC(waveCountdown)}, [CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call FUNC(prepareRespawn)}, []] call CBA_fnc_waitUntilAndExecute;

private _3dhandle = player getVariable ["hoppers_3ddrawHandler", -1];
private _uihandle = player getVariable ["hoppers_uidrawHandler", -1];

if (_3dhandle > -1) then {
    removeMissionEventHandler ["Draw3D", _3dhandle];
};
if (_uihandle > -1) then {
    [_uihandle] call CBA_fnc_removePerFrameHandler;
};