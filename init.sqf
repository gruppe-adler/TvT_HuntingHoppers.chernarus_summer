enableEnvironment [false, true];

[] execVM "USER\userInit.sqf";

disableRemoteSensors true;

// Initialize Loading of Streamator
if !(isNil "CLib_fnc_loadModules") then { call CLib_fnc_loadModules; };
