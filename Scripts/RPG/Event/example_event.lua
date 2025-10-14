local event = GMod.RPG.R.Event:Register("example_NpcDie_1")

function event:Dead(eventp, whohappen, lastHit) -- lastHit可能为null
end

local event = GMod.RPG.R.Event:Register("example_NpcDie_2")

function event:Dead(eventp, whohappen, lastHit) -- lastHit可能为null
end