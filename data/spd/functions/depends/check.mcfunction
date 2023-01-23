scoreboard players set #spd_global spd_depends_freezer -1
scoreboard players set #spd_global spd_depends_lifetime -1
scoreboard players set #spd_global spd_depends_ripcoord -1
scoreboard players set #spd_global spd_depends_seeder -1
scoreboard players set #spd_global spd_depends_splits -1

execute if score #freezer_global freezer_init matches ..-1 run scoreboard players set #spd_global spd_depends_freezer -2
execute if score #lifetime_global lifetime_init matches ..-1 run scoreboard players set #spd_global spd_depends_lifetime -2
execute if score #ripcoord_global ripcoord_init matches ..-1 run scoreboard players set #spd_global spd_depends_ripcoord -2
execute if score #seeder_global seeder_init matches ..-1 run scoreboard players set #spd_global spd_depends_seeder -2
execute if score #splits_global splits_init matches ..-1 run scoreboard players set #spd_global spd_depends_splits -2

execute if score #freezer_global freezer_init matches 0 run scoreboard players set #spd_global spd_depends_freezer 0
execute if score #lifetime_global lifetime_init matches 0 run scoreboard players set #spd_global spd_depends_lifetime 0
execute if score #ripcoord_global ripcoord_init matches 0 run scoreboard players set #spd_global spd_depends_ripcoord 0
execute if score #seeder_global seeder_init matches 0 run scoreboard players set #spd_global spd_depends_seeder 0
execute if score #splits_global splits_init matches 0 run scoreboard players set #spd_global spd_depends_splits 0

execute if score #freezer_global freezer_init matches 1 run scoreboard players set #spd_global spd_depends_freezer 1
execute if score #lifetime_global lifetime_init matches 1 run scoreboard players set #spd_global spd_depends_lifetime 1
execute if score #ripcoord_global ripcoord_init matches 1 run scoreboard players set #spd_global spd_depends_ripcoord 1
execute if score #seeder_global seeder_init matches 1 run scoreboard players set #spd_global spd_depends_seeder 1
execute if score #splits_global splits_init matches 1 run scoreboard players set #spd_global spd_depends_splits 1

scoreboard players set #spd_global spd_depends 0
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_freezer matches ..-1 run scoreboard players set #spd_global spd_depends -1
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_lifetime matches ..-1 run scoreboard players set #spd_global spd_depends -1
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_ripcoord matches ..-1 run scoreboard players set #spd_global spd_depends -1
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_seeder matches ..-1 run scoreboard players set #spd_global spd_depends -1
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_splits matches ..-1 run scoreboard players set #spd_global spd_depends -1

execute if score #spd_global spd_depends matches 0.. if score #spd_global spd_depends_freezer matches 1 run scoreboard players add #spd_global spd_depends 1
execute if score #spd_global spd_depends matches 0.. if score #spd_global spd_depends_lifetime matches 1 run scoreboard players add #spd_global spd_depends 1
execute if score #spd_global spd_depends matches 0.. if score #spd_global spd_depends_ripcoord matches 1 run scoreboard players add #spd_global spd_depends 1
execute if score #spd_global spd_depends matches 0.. if score #spd_global spd_depends_seeder matches 1 run scoreboard players add #spd_global spd_depends 1
execute if score #spd_global spd_depends matches 0.. if score #spd_global spd_depends_splits matches 1 run scoreboard players add #spd_global spd_depends 1
execute if score #spd_global spd_depends matches 0..4 run scoreboard players set #spd_global spd_depends 0
execute if score #spd_global spd_depends matches 5 run scoreboard players set #spd_global spd_depends 1

execute unless score #spd_global spd_depends matches 1 unless score #spd_global spd_depends_cool matches -100 if entity @e[type=minecraft:player] run scoreboard players remove #spd_global spd_depends_cool 1
execute if score #spd_global spd_depends matches 0 if score #spd_global spd_depends_cool matches -100 if entity @e[type=minecraft:player] run scoreboard players set #spd_global spd_depends -3

execute if score #spd_global spd_depends matches -3 if score #freezer_global freezer_init matches 0 run scoreboard players set #spd_global spd_depends_freezer -3
execute if score #spd_global spd_depends matches -3 if score #lifetime_global lifetime_init matches 0 run scoreboard players set #spd_global spd_depends_lifetime -3
execute if score #spd_global spd_depends matches -3 if score #ripcoord_global ripcoord_init matches 0 run scoreboard players set #spd_global spd_depends_ripcoord -3
execute if score #spd_global spd_depends matches -3 if score #seeder_global seeder_init matches 0 run scoreboard players set #spd_global spd_depends_seeder -3
execute if score #spd_global spd_depends matches -3 if score #splits_global splits_init matches 0 run scoreboard players set #spd_global spd_depends_splits -3
