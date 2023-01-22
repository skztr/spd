gamerule commandBlockOutput true
gamerule sendCommandFeedback true

scoreboard objectives add spd_join dummy
scoreboard objectives add spd_quit minecraft.custom:minecraft.leave_game
scoreboard objectives add spd_respectate trigger
scoreboard objectives add spd_resplit trigger
scoreboard objectives add spd_pad dummy
scoreboard objectives add spd_dead deathCount

scoreboard objectives add spd_depends dummy
scoreboard objectives add spd_depends_freezer dummy
scoreboard objectives add spd_depends_lifetime dummy
scoreboard objectives add spd_depends_ripcoord dummy
scoreboard objectives add spd_depends_seeder dummy
scoreboard objectives add spd_depends_splits dummy
scoreboard objectives add spd_init dummy

scoreboard players set #spd_global spd_depends 0
scoreboard players set #spd_global spd_depends_freezer 0
scoreboard players set #spd_global spd_depends_lifetime 0
scoreboard players set #spd_global spd_depends_ripcoord 0
scoreboard players set #spd_global spd_depends_seeder 0
scoreboard players set #spd_global spd_depends_splits 0
scoreboard players set #spd_global spd_init 0
