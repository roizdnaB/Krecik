--File: moleSystem.lua

--Create a moleSystem system
local MoleSystem = Object:extend()

--Updating function
function MoleSystem:updateEntity(entity, dt)
  --If the mole isn't alive, then decrease time required to spawn 
  if entity.isAlive == false then
    entity.timeToSpawn = (entity.timeToSpawn - 1 * dt)
  end
  
  --If time required to spawn is less or equal to 0, then the mole is alive
  if entity.timeToSpawn <= 0 then
    entity.isAlive = true
    entity.timeToSpawn = love.math.random(2, 10)
  end
  
  --If mole is alive, decrease the time of presence
  if entity.isAlive == true then
    entity.timeToDespawn = (entity.timeToDespawn - 1 * dt)
  end
  
  --If mole is alive after the time passed, decrease the number of lifes
  if entity.timeToDespawn <= 0 then
    entity.isAlive = false
    entity.timeToDespawn = love.math.random(3, 6)
  end
end

--Return the MoleSystem system
return MoleSystem