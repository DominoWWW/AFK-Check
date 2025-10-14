execute as @a run scoreboard players operation @s afkc.m = @s afkc.time
execute as @a run scoreboard players operation @s afkc.m /= $60 afkc.time
execute as @a run scoreboard players operation @s afkc.m %= $60 afkc.time

execute as @a run scoreboard players operation @s afkc.h = @s afkc.time
execute as @a run scoreboard players operation @s afkc.h /= $3600 afkc.time

tag @r[tag=afkc.trigger] add afkc.select

execute as @s at @s if score @a[limit=1,tag=afkc.select] afkc.time matches 60.. if score @a[limit=1,tag=afkc.select] afkc.h matches 1.. if score @a[limit=1,tag=afkc.select] afkc.m matches 10.. run tellraw @s ["",{"selector":"@a[limit=1,tag=afkc.select]"},{"text":" Is AFK. ","color":"#FF0000"},{"text":"(","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.h"},"color":"gray"},{"text":"h ","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.m"},"color":"gray"},{"text":"m)","color":"gray"}]
execute as @s at @s if score @a[limit=1,tag=afkc.select] afkc.time matches 60.. if score @a[limit=1,tag=afkc.select] afkc.h matches 1.. if score @a[limit=1,tag=afkc.select] afkc.m matches ..9 run tellraw @s ["",{"selector":"@a[limit=1,tag=afkc.select]"},{"text":" Is AFK. ","color":"#FF0000"},{"text":"(","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.h"},"color":"gray"},{"text":"h 0","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.m"},"color":"gray"},{"text":"m)","color":"gray"}]

execute as @s at @s if score @a[limit=1,tag=afkc.select] afkc.time matches 60.. if score @a[limit=1,tag=afkc.select] afkc.h matches 0 if score @a[limit=1,tag=afkc.select] afkc.m matches 10.. run tellraw @s ["",{"selector":"@a[limit=1,tag=afkc.select]"},{"text":" Is AFK. ","color":"#FF0000"},{"text":"(","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.m"},"color":"gray"},{"text":"m)","color":"gray"}]
execute as @s at @s if score @a[limit=1,tag=afkc.select] afkc.time matches 60.. if score @a[limit=1,tag=afkc.select] afkc.h matches 0 if score @a[limit=1,tag=afkc.select] afkc.m matches ..9 run tellraw @s ["",{"selector":"@a[limit=1,tag=afkc.select]"},{"text":" Is AFK. ","color":"#FF0000"},{"text":"(","color":"gray"},{"text":"0","color":"gray"},{"score":{"name":"@a[limit=1,tag=afkc.select]","objective":"afkc.m"},"color":"gray"},{"text":"m)","color":"gray"}]

execute as @s at @s if score @a[limit=1,tag=afkc.select] afkc.time matches ..60 run tellraw @s ["",{"selector":"@a[limit=1,tag=afkc.select]"},{"text":" Is not AFK.","color":"#00FF0F"}]

tag @a[tag=afkc.select] remove afkc.trigger
tag @a remove afkc.select

execute if entity @a[tag=afkc.trigger] run function afk_check:trigger