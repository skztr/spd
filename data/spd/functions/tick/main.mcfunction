# When a player rejoins after quitting, display the death message again (so they can get back to where they died)
scoreboard players set @a spd_join 0
execute as @a run execute unless score @s spd_quit matches 0.. run scoreboard players set @s spd_quit 1
scoreboard players set @a[scores={spd_quit=1..}] spd_join 1
scoreboard players set @a[scores={spd_quit=1..}] spd_quit 0
tag @e[scores={spd_join=1}] remove spd_told_dead

# Detect Death
tag @a remove spd_dead
tag @a[scores={spd_dead=1..}] add spd_dead

scoreboard players set @a spd_dead 0
tag @a[tag=spd_dead] add spd_died
# respectate if dead
tag @a[tag=spd_dead] remove spd_spectate

# Detect the End of Play
execute as @e[type=minecraft:player,tag=!spd_done,tag=spd_died] run tag @s add spd_done
execute as @e[type=minecraft:player,tag=!spd_done,nbt={playerGameType:0},advancements={splits:wake=true}] run tag @s add spd_win
execute as @e[type=minecraft:player,tag=!spd_done,nbt={playerGameType:2},advancements={splits:wake=true}] run tag @s add spd_win
execute as @e[type=minecraft:player,tag=!spd_done,tag=spd_win] run tag @s add spd_done

# If a player died, the death message may allow them to view splits
execute as @e[type=minecraft:player,scores={spd_resplit=1..}] run function spd:splits/all
execute as @e[type=minecraft:player,scores={spd_resplit=1..}] run scoreboard players set @s spd_resplit 0

# If a player died, freeze the world, switch them to spectator mode, and move them to their death location
gamemode spectator @e[type=minecraft:player,tag=spd_done,nbt={playerGameType:0}]
gamemode spectator @e[type=minecraft:player,tag=spd_done,nbt={playerGameType:2}]
execute as @e[type=minecraft:player,scores={spd_respectate=1..}] run tag @s remove spd_spectate
execute as @e[type=minecraft:player,scores={spd_respectate=1..}] run scoreboard players set @s spd_respectate 0
execute as @e[type=minecraft:player,tag=spd_done,tag=!spd_spectate] run function spd:spectate

# if any player isn't playing, or if no players are playing, freeze the world
tag @a remove spd_active
tag @e[type=minecraft:player,nbt={playerGameType:0}] add spd_active
tag @e[type=minecraft:player,nbt={playerGameType:2}] add spd_active
execute unless entity @e[type=minecraft:player] run function freezer:freeze
execute if entity @e[type=minecraft:player,tag=!spd_active] run function freezer:freeze
execute if entity @e[type=minecraft:player,tag=spd_active] unless entity @e[type=minecraft:player,tag=!spd_active] run function freezer:thaw

# Keep track of player location for if they die later
execute as @e[type=minecraft:player,tag=spd_active,tag=!spd_died] run function ripcoord:store

# this makes respawns smoother, but locks the game into an infinite loop when you return via an end portal
#execute as @e[type=minecraft:player,tag=!spd_died,nbt={playerGameType:0,Dimension:"minecraft:overworld"}] at @s in minecraft:overworld run spawnpoint @s ~ ~ ~ ~
#execute as @e[type=minecraft:player,tag=!spd_died,nbt={playerGameType:0,Dimension:"minecraft:the_nether"}] at @s in minecraft:the_nether run spawnpoint @s ~ ~ ~ ~
#execute as @e[type=minecraft:player,tag=!spd_died,nbt={playerGameType:0,Dimension:"minecraft:the_end"}] at @s in minecraft:the_end run spawnpoint @s ~ ~ ~ ~

# Keep track of playtime until the game is over
execute as @e[type=minecraft:player,tag=spd_active,tag=!spd_done] run function lifetime:increment
execute as @e[type=minecraft:player,tag=spd_done] run function splits:stop

# if the game is over, show the playtime
# clicking the done message's "after" message outputs the splits.
scoreboard players enable @e[type=minecraft:player,tag=spd_done] spd_resplit
scoreboard players set @e[type=minecraft:player,tag=spd_done] spd_pad 0
execute as @e[type=minecraft:player,tag=spd_done] run title @s times 0 20 0
execute as @e[type=minecraft:player,tag=spd_done] run title @s title [{"score":{"name":"@s","objective":"lt_hours"}},":",{"score":{"name":"@s[scores={lt_minutes=0..9}]","objective":"spd_pad"}},{"score":{"name":"@s","objective":"lt_minutes"}},":",{"score":{"name":"@s[scores={lt_seconds=0..9}]","objective":"spd_pad"}},{"score":{"name":"@s","objective":"lt_seconds"}}]
execute as @e[type=minecraft:player,tag=spd_done,tag=!spd_told_done] run tellraw @s [{"text":"Finished","color":"green"},{"text":"","extra":[{"text":" after ","color":"white"},{"score":{"name":"@s","objective":"lt_hours"}},{"text":"h "},{"score":{"name":"@s","objective":"lt_minutes"}},{"text":"m "},{"score":{"name":"@s","objective":"lt_seconds"}},{"text":"s"}],"clickEvent":{"action":"run_command","value":"/trigger spd_resplit set 1"},"color":"gray"}]
execute as @e[type=minecraft:player,tag=spd_done,tag=!spd_told_done] run tag @s add spd_told_done

# if the game is over due to death, indicate such below the playtime
execute as @e[type=minecraft:player,tag=spd_died,tag=!spd_win] run title @s subtitle [{"text":"DEAD","color":"dark_red"}]

# if the game is over due to death, show a death message indicating where and when the death occurred.
# clicking the death message's "in"/"at" message teleports the player to where they were when they died.
# clicking the death message's "after" message outputs the splits.
scoreboard players enable @e[type=minecraft:player,tag=spd_died] spd_respectate
scoreboard players enable @e[type=minecraft:player,tag=spd_died] spd_resplit
execute as @e[type=minecraft:player,tag=spd_died,tag=!spd_told_dead,scores={rc_dimension=0}] run tellraw @s [{"text":"Died","color":"dark_red"},{"text":"","extra":[{"text":" in ","color":"white"},{"text":"Overworld","color":"dark_green"},{"text":" at ","color":"white"},{"score":{"name":"@s","objective":"rc_xint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_yint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_zint"}}],"clickEvent":{"action":"run_command","value":"/trigger spd_respectate set 1"},"color":"gray"},{"text":"","extra":[{"text":" after ","color":"white"},{"score":{"name":"@s","objective":"lt_hours"}},{"text":"h "},{"score":{"name":"@s","objective":"lt_minutes"}},{"text":"m "},{"score":{"name":"@s","objective":"lt_seconds"}},{"text":"s"}],"clickEvent":{"action":"run_command","value":"/trigger spd_resplit set 1"},"color":"gray"}]
execute as @e[type=minecraft:player,tag=spd_died,tag=!spd_told_dead,scores={rc_dimension=1}] run tellraw @s [{"text":"Died","color":"dark_red"},{"text":"","extra":[{"text":" in ","color":"white"},{"text":"The Nether","color":"gold"},{"text":" at ","color":"white"},{"score":{"name":"@s","objective":"rc_xint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_yint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_zint"}}],"clickEvent":{"action":"run_command","value":"/trigger spd_respectate set 1"},"color":"gray"},{"text":"","extra":[{"text":" after ","color":"white"},{"score":{"name":"@s","objective":"lt_hours"}},{"text":"h "},{"score":{"name":"@s","objective":"lt_minutes"}},{"text":"m "},{"score":{"name":"@s","objective":"lt_seconds"}},{"text":"s"}],"clickEvent":{"action":"run_command","value":"/trigger spd_resplit set 1"},"color":"gray"}]
execute as @e[type=minecraft:player,tag=spd_died,tag=!spd_told_dead,scores={rc_dimension=2}] run tellraw @s [{"text":"Died","color":"dark_red"},{"text":"","extra":[{"text":" in ","color":"white"},{"text":"The End","color":"dark_purple"},{"text":" at ","color":"white"},{"score":{"name":"@s","objective":"rc_xint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_yint"}},{"text":" "},{"score":{"name":"@s","objective":"rc_zint"}}],"clickEvent":{"action":"run_command","value":"/trigger spd_respectate set 1"},"color":"gray"},{"text":"","extra":[{"text":" after ","color":"white"},{"score":{"name":"@s","objective":"lt_hours"}},{"text":"h "},{"score":{"name":"@s","objective":"lt_minutes"}},{"text":"m "},{"score":{"name":"@s","objective":"lt_seconds"}},{"text":"s"}],"clickEvent":{"action":"run_command","value":"/trigger spd_resplit set 1"},"color":"gray"}]
execute as @e[type=minecraft:player,tag=spd_died,tag=!spd_told_dead] run tag @s add spd_told_dead

# finally, if the game is over due to success, reveal the world seed and splits
execute as @e[type=minecraft:player,tag=spd_win] run function seeder:store
execute as @e[type=minecraft:player,tag=spd_win] run title @s subtitle [{"nbt":"StringSeed","storage":"seeder:seed","interpret":true}]
execute as @e[type=minecraft:player,tag=spd_win,tag=!spd_told_win] run function spd:splits/all
tag @e[type=minecraft:player,tag=spd_win,tag=!spd_told_win] add spd_told_win
