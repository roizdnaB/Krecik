--File: holeSystem.lua

--Create a holeSystem system
local HoleSystem = Object:extend()

--Updating function
function HoleSystem:updateEntity(entity, dt)

  --If the hole is dynamic, move it
  if entity.dynamic == true then
    --Set the new x coord
    entity.x = entity.x + entity.velocity * dt
  
    --Get the window width
    local windowWidth = love.graphics.getWidth()
    
    if entity.x < entity.radius then
      entity.x = entity.radius
      entity.velocity = -entity.velocity
    elseif entity.x + entity.radius > windowWidth then
      entity.x = windowWidth - entity.radius
      entity.velocity = -entity.velocity
    end
  end
end

--Return the HoleSystem system
return HoleSystem