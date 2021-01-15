--File: holeSystem.lua

--Create a holeSystem system
local HoleSystem = Object:extend()

--Updating function
function HoleSystem:updateEntity(entity, dt)

  --If the hole is dynamic, move it
  if entity.dynamic == true then
    
    --Get the width and height of the window
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    
    if entity.direction == "up" then
      entity.y = entity.y - entity.velocity * dt
    
    elseif entity.direction == "right" then
      entity.x = entity.x + entity.velocity * dt
      
    elseif entity.direction == "down" then
      entity.y = entity.y + entity.velocity * dt
    
    elseif entity.direction == "left" then
      entity.x = entity.x - entity.velocity * dt
    end
    
    --Collision for left/right
    if entity.direction == "right" or entity.direction == "left" then
      if entity.x < entity.radius then
        entity.x = entity.radius
        entity.velocity = -entity.velocity
      elseif entity.x + entity.radius > windowWidth then
        entity.x = windowWidth - entity.radius
        entity.velocity = -entity.velocity
      end
    end
    
    --Collision for up/down
    if entity.direction == "up" or entity.direction == "down" then
      if entity.y < entity.radius then
        entity.y = entity.radius
        entity.velocity = -entity.velocity
      elseif entity.y + entity.radius > windowHeight then
        entity.y = windowHeight - entity.radius
        entity.velocity = -entity.velocity
      end
    end
    
  end
end

--Return the HoleSystem system
return HoleSystem