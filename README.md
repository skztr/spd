# Spd: Speedrunning Helper

Uses the functionality of several other "utility" datapacks to create a complete "speedrunning" experience, including
automatic timings, an end screen that reveals the total playtime and seed, and freezing the world on death so you can
look at what killed you.

## Dependencies
Depends on other datapacks:
   - [Freezer](https://github.com/skztr/freezer)   (stops the world when the player isn't in survival mode)
   - [Lifetime](https://github.com/skztr/lifetime) (keeps track of playtime)
   - [RIPCoord](https://github.com/skztr/ripcoord) (keeps track of player location so it can be displayed on death)
   - [Seeder](https://github.com/skztr/seeder)     (stores the world seed somewhere commands can access it)
   - [Splits](https://github.com/skztr/splits)     (extends Lifetime to time specific goals)

## Features
 - Playtime calculation by number of game ticks.
 - When key moments are reached (eg: entering the nether), the split time is displayed
 - When the exit portal is entered, the total playtime and seed are displayed.
 - On Death, Player immediately enters spectator mode, and Playtime is displayed (ie: enforced hardcore).
 - When in spectator mode, the world is frozen, maintaining the state of everything at the time of completion.

## Difficulty Settings
 - Hard Difficulty
 - Reduced Debug Info

## Important Note
I am not aware of any speedrunning communities which accept speedruns timed using this datapack. Due to this, the
pack is currently intended only for casual play or "practice runs". It was created as a programming exercise by someone
who does not expect to ever have a run fast enough to post to a leaderboard. "Hardcore" and "Reduced Debug Info" also
preclude the use of popular strategies used in many speedruns, and this datapack makes no effort to make it easy to
disable these restrictions.
