execute as @a run scoreboard players operation @s afkc.moveSave = @s afkc.move 
execute as @a at @s store result score @s afkc.move run data get entity @s Rotation[1] 100000
execute as @a unless score @s afkc.move = @s afkc.moveSave run scoreboard players set @s afkc.time 0
execute as @a run scoreboard players add @s afkc.time 1

execute as @a at @s if score @s afkc.time >= $threshold afkc.time run tag @s add afk
execute as @a at @s if score @s afkc.time < $threshold afkc.time run tag @s remove afk

schedule function afk_check:sec 1s