# BloodLust_Redux
BloodLust Redux is a refresh of the much loved but sadly abandoned BloodLust mod, originally created by Gavin N. "Zooloo75" Alvesteffer. BloodLust Redux adds various elements of gore to ArmA3 such as blood splatters, blood sprays, blood pooling, bleeding, gibbing, and other misc details.

BLR aims to keep the mod up to date with engine changes, fix bugs, lower overhead as much as possible, as well as shift more integration with the CBA required mod, such as migrating to the CBA settings system and adding global events for mission makers.

We hope to achieve a client optional state in multiplayer, where as long as the server is running the mod, there should be no _gameplay_ impact (such as bodies being removed post vaporisation for non-BLR clients, but will miss out on the effects). However, with the CBA settings system, it should also be possible for those clients to disable the more grapically demanding aspects locally too.

BLR uses the same GPLv3 license that BloodLust used, so please feel free to modify and distrubute this project per your needs, just keep it public as the license states. Please push upstream any improvements! :)

This project is maintained by: http://thewreckingcrew.eu

## Custom Events
BLR adds a series of public events through CBA's Event System. These will enable mission/mod makers to trigger certain functionality, when an event occurs, per their needs.

### Global Events

 Name | Paramaters | Desc
 --- | --- | ---
BloodLust_unitVaporised | _unit \<OBJECT> <br> _gibForce \<INTEGER> <br> _gibs \<ARRAY (OBJECTS)> <br> _bloodSplatters \<ARRAY (OBJECTS)> | Called after a unit is vaporised
BloodLust_unitBleedingStarted | _unit \<OBJECT> | Called before the unit has started bleeding
BloodLust_unitBleedingStopped | _unit \<OBJECT> | Called after the unit has stopped bleeding

### Local Events

 Name | Paramaters | Desc 
 --- | --- | --- 
BloodLust_gibCreated | _gib \<OBJECT> | Called each time a gib has been created
BloodLust_splatterCreated | _splatter \<OBJECT> | Called each time a splatter has been created (smears, too)