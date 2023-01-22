execute if entity @e[tag=ripcoord_one,scores={rc_dimension=0}] in minecraft:overworld positioned as @s rotated as @s run tp @e[tag=ripcoord_one,limit=1] ~ ~ ~ ~ ~
execute if entity @e[tag=ripcoord_one,scores={rc_dimension=1}] in minecraft:the_nether positioned as @s rotated as @s run tp @e[tag=ripcoord_one,limit=1] ~ ~ ~ ~ ~
execute if entity @e[tag=ripcoord_one,scores={rc_dimension=2}] in minecraft:the_end positioned as @s rotated as @s run tp @e[tag=ripcoord_one,limit=1] ~ ~ ~ ~ ~

# kill momentum
execute as @e[tag=ripcoord_one] positioned as @s run tp @s @s
