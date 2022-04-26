HOPPERS_BOMBS_BOMBSPOTS = [];

private _bombSpotSelectedCount = 20;
private _bombSpotPreparedCount = 20; // bombspot markers up to "mrk_bombspot_30" need to be placed

private _arraySelectFrom = [];


for "_i" from 1 to _bombSpotPreparedCount do {

    private _string = format ["mrk_bombspot_%1", _i];
    _arraySelectFrom pushBackUnique _string;
    _string setMarkerAlpha 0;
};


for "_i" from 1 to _bombSpotSelectedCount do {
    private _bombspot = selectRandom _arraySelectFrom;
    HOPPERS_BOMBS_BOMBSPOTS pushBackUnique _bombspot;
    _arraySelectFrom deleteAt (_arraySelectFrom find _bombspot);
};


{
    private _bombspot = _x;
    private _position = getMarkerPos _bombspot;

    private _bombSpot = format ["%1_%2", east, _bombSpot];
    [_position, _bombspot] call hoppers_fnc_tasksInitOpfor;
} forEach HOPPERS_BOMBS_BOMBSPOTS;