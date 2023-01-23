gamerule doImmediateRespawn true
gamerule commandBlockOutput false
gamerule sendCommandFeedback false
gamerule reducedDebugInfo true
difficulty hard

scoreboard objectives setdisplay list lt_quick

# resume time
gamerule doDaylightCycle false
gamerule doFireTick false
gamerule doMobSpawning false
gamerule doWeatherCycle false
gamerule randomTickSpeed 3
effect clear @s minecraft:slowness
effect clear @s minecraft:mining_fatigue

scoreboard players set #spd_global spd_init 1
