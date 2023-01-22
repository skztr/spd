execute if score #spd_global spd_depends matches 0 run function spd:depends/check
execute if score #spd_global spd_depends matches -1..1 as @a unless score @s spd_depends = #spd_global spd_depends run function spd:depends/tell

execute if score #spd_global spd_depends matches 1 if score #spd_global spd_init matches 0 run function spd:tick/init
# execute if score #spd_global spd_init matches 1 as @a unless score @s spd_init = @s spd_init run tellraw @s [{"text":"[spd] ","color":"white"},{"text":" Initialized.","color":"default"}]
# execute if score #spd_global spd_init matches 1 as @a unless score @s spd_init = @s spd_init run scoreboard players set @s spd_init 1

execute if score #spd_global spd_init matches 1 run function spd:tick/main
