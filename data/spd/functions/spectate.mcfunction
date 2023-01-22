# must run as a specific player, who is assumed to be in spectator mode
# teleport the player to their last known living coordinates

tag @s add spd_one
execute as @s[tag=spd_one] run function ripcoord:marker
tag @s remove spd_one

execute if entity @s[scores={rc_dimension=0},nbt={Dimension:"minecraft:overworld"}] run tag @s add spd_spectate
execute if entity @s[scores={rc_dimension=1},nbt={Dimension:"minecraft:the_nether"}] run tag @s add spd_spectate
execute if entity @s[scores={rc_dimension=2},nbt={Dimension:"minecraft:the_end"}] run tag @s add spd_spectate
