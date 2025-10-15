scoreboard objectives add AFK_Check trigger
scoreboard objectives add afkc.move dummy
scoreboard objectives add afkc.moveSave dummy
scoreboard objectives add afkc.time dummy
scoreboard objectives add afkc.m dummy
scoreboard objectives add afkc.h dummy

scoreboard players set $60 afkc.time 60
scoreboard players set $3600 afkc.time 3600

execute unless score $threshold afkc.time matches -2147483648..2147483647 run scoreboard players set $threshold afkc.time 120

function afk_check:tick
function afk_check:sec