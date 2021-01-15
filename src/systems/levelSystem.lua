--File: levelSystem.lua

--Create a levelSystem system
local LevelSystem = Object:extend()

--Updating function
function LevelSystem:updateEntity(entity, dt)
  --Update the timer
  if entity.timeOfLevel > 0 then
    entity.timeOfLevel = (entity.timeOfLevel - 1 * dt)
  end
  
  
  --If the level is dynamic, update the position of the moles

  
  for i, m in ipairs(entity.moles) do
    m.x = entity.holes[i].x
    m.y = entity.holes[i].y
  end
end

--Check if the game is still running
function LevelSystem:isGameRunning(entity, player)
  if entity.timeOfLevel > 0 and 
  player.healthPoints > 0 and
  player.score < 20 then
    return true
  else
    return false
  end
end

--Return the LevelSystem system
return LevelSystem