# must be run as a specific player
gamemode spectator @s
execute at @s align xyz run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["spd_before_init"]}
execute at @s run teleport @s @e[type=minecraft:marker,tag=spd_before_init,sort=nearest,limit=1]
execute at @s run kill @e[type=minecraft:marker,tag=spd_before_init,sort=nearest,limit=1]
