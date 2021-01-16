--File: moleSystem.lua

--Create a moleSystem system
local MoleSystem = Object:extend()

--Updating function
function MoleSystem:updateEntity(entity, player, dt)
  --If the mole isn't alive, then decrease time required to spawn 
  if entity.isAlive == false then
    entity.timeToSpawn = (entity.timeToSpawn - 1 * dt)
    entity.animationUp.animationEnd = false
    entity.animationUp.currentTime = 0
    
    if entity.wasKilled == false then
      entity.animationDown.currentTime = entity.animationDown.currentTime + dt
      if entity.animationDown.currentTime >= entity.animationDown.duration then
        entity.animationDown.currentTime = entity.animationDown.currentTime - entity.animationDown.duration
        entity.animationDown.animationEnd = true
      end
    end
  end
  
  --If time required to spawn is less or equal to 0, then the mole is alive
  if entity.timeToSpawn <= 0 then
    entity.isAlive = true
    entity.timeToSpawn = 2 + love.math.random() * (6 - 2)
  end
  
  --If mole is alive, decrease the time of presence
  if entity.isAlive == true then
    entity.timeToDespawn = (entity.timeToDespawn - 1 * dt)
    entity.animationDown.animationEnd = false
    entity.animationDown.currentTime = 0
    
    entity.animationUp.currentTime = entity.animationUp.currentTime + dt
    if entity.animationUp.currentTime >= entity.animationUp.duration then
      entity.animationUp.currentTime = entity.animationUp.currentTime - entity.animationUp.duration
      entity.animationUp.animationEnd = true
    end
  end
  
  --If mole is alive after the time passed, decrease the number of lifes
  if entity.timeToDespawn <= 0 then
    entity.isAlive = false
    entity.animationUp.animationEnd = false
    entity.animationUp.currentTime = 0
    
    entity.animationDown.animationEnd = false
    
    entity.wasKilled = false
    entity.timeToDespawn = 2 + love.math.random() * (6 - 2)
    player.healthPoints = player.healthPoints - 1
  end
end

--Return the MoleSystem system
return MoleSystem