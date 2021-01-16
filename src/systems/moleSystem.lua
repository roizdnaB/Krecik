--File: moleSystem.lua

--Create a moleSystem system
local MoleSystem = Object:extend()

--Updating function
function MoleSystem:updateEntity(entity, player, dt)
  --If the mole isn't alive, then decrease time required to spawn 
  if entity.isAlive == false then
    entity.timeToSpawn = (entity.timeToSpawn - 1 * dt)
    entity.animation.animationEnd = false
    entity.animation.currentTime = 0
  end
  
  --If time required to spawn is less or equal to 0, then the mole is alive
  if entity.timeToSpawn <= 0 then
    entity.isAlive = true
    entity.timeToSpawn = 2 + love.math.random() * (6 - 2)
  end
  
  --If mole is alive, decrease the time of presence
  if entity.isAlive == true then
    entity.timeToDespawn = (entity.timeToDespawn - 1 * dt)
    
    entity.animation.currentTime = entity.animation.currentTime + dt
    if entity.animation.currentTime >= entity.animation.duration then
      entity.animation.currentTime = entity.animation.currentTime - entity.animation.duration
      entity.animation.animationEnd = true
    end
  end
  
  --If mole is alive after the time passed, decrease the number of lifes
  if entity.timeToDespawn <= 0 then
    entity.isAlive = false
    entity.animation.animationEnd = false
    entity.animation.currentTime = 0
    entity.timeToDespawn = 2 + love.math.random() * (6 - 2)
    player.healthPoints = player.healthPoints - 1
  end
end

--Return the MoleSystem system
return MoleSystem