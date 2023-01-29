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
execute as @e[type=minecraft:player,tag=!spd_done,nbt={playerGameType:3}] run gamemode survival @s

scoreboard players set #spd_global spd_init 1
