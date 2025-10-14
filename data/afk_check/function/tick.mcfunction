scoreboard players enable @a AFK_Check
execute as @a if score @s AFK_Check matches 1 run tag @a add afkc.trigger
execute as @a if score @s AFK_Check matches 1 run function afk_check:trigger
execute as @a unless score @s afkc.time matches 0 run scoreboard players set @s AFK_Check 0

schedule function afk_check:tick 1t