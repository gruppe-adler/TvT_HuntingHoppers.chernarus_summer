params ["_vehicle", ["_respawnInstant", true]];

if (!isServer) exitWith {};

clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

private _isAir = if (_vehicle isKindOf "Air") then { true } else { false };
private _isOH = _isAir; // for gm as no extra heli planned

// opfor land vehicle
if (!_isAir) then {
    _vehicle addMagazineCargoGlobal ['gm_30Rnd_545x39mm_B_7N6_ak74_org', 20]; 
    _vehicle addMagazineCargoGlobal ['gm_75Rnd_762x39mm_B_57N231_ak47_blk', 20];
    [_vehicle, _respawnInstant, 5, "(_this select 0) addMagazineCargoGlobal ['gm_30Rnd_545x39mm_B_7N6_ak74_org', 20]; 
    (_this select 0) addMagazineCargoGlobal ['gm_75Rnd_762x39mm_B_57N231_ak47_blk', 20];"] call GRAD_vehiclerespawn_fnc_add;
} else {
    _vehicle addMagazineCargoGlobal ['gm_30Rnd_556x45mm_B_DM11_g36_blk', 20]; 
    _vehicle addMagazineCargoGlobal ['gm_120Rnd_762x51mm_B_T_DM21_mg3_grn', 20];

    if (!_isOH) then {
        [_vehicle, _respawnInstant, 5, "(_this select 0) addMagazineCargoGlobal ['gm_30Rnd_556x45mm_B_DM11_g36_blk', 20]; 
    (_this select 0) addMagazineCargoGlobal ['gm_120Rnd_762x51mm_B_T_DM21_mg3_grn', 20];"] call GRAD_vehiclerespawn_fnc_add;
        _vehicle lockTurret [[0],true];
    } else {
        [_vehicle, _respawnInstant, 5, "(_this select 0) addMagazineCargoGlobal ['gm_30Rnd_556x45mm_B_DM11_g36_blk', 20]; 
    (_this select 0) addMagazineCargoGlobal ['gm_120Rnd_762x51mm_B_T_DM21_mg3_grn', 20];"] call GRAD_vehiclerespawn_fnc_add; 
    };
};


