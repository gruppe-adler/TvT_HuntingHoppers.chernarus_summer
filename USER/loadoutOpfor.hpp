class loadouts_opfor {
    class AllUnits {
        primaryWeapon = "rhs_weap_ak74mr";
        primaryWeaponMagazine = "rhs_45Rnd_545X39_AK_Green";
        primaryWeaponMuzzle = "";
        primaryWeaponOptics = "";
        primaryWeaponPointer = "acc_flashlight";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "";
        uniform[] = {"LOP_U_AM_Fatigue_01","LOP_U_AM_Fatigue_01_2","LOP_U_AM_Fatigue_01_3","LOP_U_AM_Fatigue_01_4","LOP_U_AM_Fatigue_01_5","LOP_U_AM_Fatigue_01_6","LOP_U_AM_Fatigue_02","LOP_U_AM_Fatigue_02_2","LOP_U_AM_Fatigue_02_3","LOP_U_AM_Fatigue_02_4","LOP_U_AM_Fatigue_02_5","LOP_U_AM_Fatigue_02_6","LOP_U_AM_Fatigue_03","LOP_U_AM_Fatigue_03_2","LOP_U_AM_Fatigue_03_3","LOP_U_AM_Fatigue_03_4","LOP_U_AM_Fatigue_03_5","LOP_U_AM_Fatigue_03_6","LOP_U_AM_Fatigue_04","LOP_U_AM_Fatigue_04_2","LOP_U_AM_Fatigue_04_3","LOP_U_AM_Fatigue_04_4","LOP_U_AM_Fatigue_04_5","LOP_U_AM_Fatigue_04_6"};
        vest[] = {"V_TacChestrig_oli_F"};
        backpack = "";
        headgear = "LOP_H_Pakol";
        goggles = "";
        nvgoggles = "";
        radio = "TFAR_fadak";
        binoculars = "Binocular";
        map = "ItemMap";
        gps = "ItemGPS";
        compass = "ItemCompass";
        addItemsToUniform[] = {
            LIST_6("ACE_fieldDressing"),
            LIST_2("ACE_morphine"),
            LIST_2("rhs_mag_rdg2_white"),
            LIST_2("ACE_Chemlight_HiWhite"),
            "ACE_epinephrine",
            "ACE_Flashlight_KSF1",
            "ACE_MapTools"
        };
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
    };

    class Type {
        //rifleman
        class Soldier_F {
            addItemsToVest[] = {
                LIST_6("rhs_45Rnd_545X39_AK_Green"),
                "rhs_mag_f1"
            };
        };

        //autorifleman
        class Soldier_AR_F: Soldier_F {
            goggles = "rhs_balaclava1_olive";
            primaryWeapon = "rhs_weap_pkm";
            primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_green";
            primaryWeaponPointer = "";
            addItemsToVest[] = {
                "rhs_100Rnd_762x54mmR_green",
                "rhs_mag_f1"
            };
            backpack = "B_AssaultPack_blk";
            addItemsToBackpack[] = {
                "rhs_100Rnd_762x54mmR_green",
                "rhs_100Rnd_762x54mmR_green"
            };
        };

        //light AT
        class Soldier_LAT_F: Soldier_F {
            goggles = "G_Bandanna_khk";
            secondaryWeapon = "rhs_weap_rpg26";
        };

        //ammo bearer
        class Soldier_A_F: Soldier_F {
            goggles = "G_Balaclava_blk";
            backpack = "B_TacticalPack_oli";
            addItemsToBackpack[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green"),
                "rhs_100Rnd_762x54mmR_green"
            };
        };

        //assistant autorifleman
        class Soldier_AAR_F: Soldier_F {
            goggles = "G_Balaclava_blk";
            backpack = "B_TacticalPack_oli";
            addItemsToBackpack[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green"),
                "rhs_100Rnd_762x54mmR_green"
            };
        };

        //medic
        class Medic_F: Soldier_F {
            goggles = "G_Bandanna_tan";
            backpack = "B_AssaultPack_rgr";
            addItemsToBackpack[] = {
                LIST_20("ACE_fieldDressing"),
                LIST_10("ACE_fieldDressing"),
                LIST_15("ACE_morphine"),
                LIST_15("ACE_epinephrine"),
                LIST_8("ACE_bloodIV_250")
            };
        };

        //team leader
        class Soldier_TL_F: Soldier_F {
            goggles = "G_Bandanna_khk";
            primaryWeapon = "rhs_weap_ak74mr_gp25";
            backpack = "B_AssaultPack_rgr";
            addItemsToBackpack[] = {
                LIST_2("hlc_GRD_White"),
                LIST_2("hlc_GRD_Red"),
                LIST_2("hlc_GRD_green"),
                LIST_2("rhs_VG40OP_green"),
                LIST_2("rhs_VG40OP_red"),
                LIST_2("rhs_VG40OP_white")
            };
        };

        //squad leader
        class Soldier_SL_F: Soldier_TL_F {
            goggles = "rhs_scarf";
        };
    };

    class Rank {
        class LIEUTENANT {
            goggles = "G_Aviator";
        };
    };
};
