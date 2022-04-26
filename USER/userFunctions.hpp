/*  Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

#include "..\node_modules\grad-dyngroupdecals\cfgFunctions.hpp"
#include "..\node_modules\grad-vehicleRespawn\cfgFunctions.hpp"
#include "..\node_modules\grad-gpsTracker\cfgFunctions.hpp"

class hoppers
   {
       class all
       {
           file = "USER\functions";


           class addBoss;
           class addCivilianPenalty;

           class areaBarCreate;
           class areaBarGetColor;
           class areaBarShow;

           class civilianAddWeapon;

           class eventListener { postInit = 1; };
           class extractionStart;
           class fadeMarker;

           class init { postInit = 1; };

           class tasksInitBlufor;
           class tasksInitOpfor;
           class winConditions;
       };

       class bombs {
            file = "USER\functions\bombs";

            class addBombDefuseAction;
            class addBombTrigger;
            class bombCountDown;
            class bombDefuse;
            class bombDefusedHint;
            class bombDetonate;
            class bombDetonateAction;
            class bombShowCountdown;
            class bombTaskDefuse;
            class bombTaskSetState;
            class canLayBomb;
            class createBombMarker;
            class selectBombSpots;
       };

       class mapReplacements {
            file = "USER\functions\mapReplacements";

            class mapreplaceBuildings;
            class mapreplacePlants;
            class replacementInit { postInit = 1; };
       };
   };
