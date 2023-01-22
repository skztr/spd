# must run as a specific player
tag @s remove spd_dead
tag @s remove spd_died
tag @s remove spd_told_dead
tag @s remove spd_done
tag @s remove spd_told_done
tag @s remove spd_spectate
tag @s remove spd_end
tag @s remove spd_win
tag @s remove spd_told_win

scoreboard players reset @s spd_join
scoreboard players reset @s spd_quit
scoreboard players reset @s spd_respectate

scoreboard players reset @s spd_dead
scoreboard players reset @s spd_pad

function lifetime:reset
function splits:reset
function ripcoord:reset
