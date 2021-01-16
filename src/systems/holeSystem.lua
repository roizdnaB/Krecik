--File: holeSystem.lua

--Create a holeSystem system
local HoleSystem = Object:extend()

--Updating function
function HoleSystem:updateEntities(entities, dt)
  
  for i, e in ipairs(entities) do
    --If the hole is dynamic, move it
    if e.dynamic == true then
    
      --Get the width and height of the window
      local windowWidth = love.graphics.getWidth()
      local windowHeight = love.graphics.getHeight()
    
      if e.direction == "up" then
        e.y = e.y - e.velocity * dt
    
      elseif e.direction == "right" then
        e.x = e.x + e.velocity * dt
      
      elseif e.direction == "down" then
        e.y = e.y + e.velocity * dt
    
      elseif e.direction == "left" then
        e.x = e.x - e.velocity * dt
      end
    
      --Collision for left/right
      if e.direction == "right" or e.direction == "left" then
        if e.x < e.radius then
          e.x = e.radius
          e.velocity = -e.velocity
        elseif e.x + e.radius > windowWidth then
          e.x = windowWidth - e.radius
          e.velocity = -e.velocity
        end
      end
    
      --Collision for up/down
      if e.direction == "up" or e.direction == "down" then
        if e.y < e.radius then
          e.y = e.radius
          e.velocity = -e.velocity
        elseif e.y + e.radius > windowHeight then
          e.y = windowHeight - e.radius
          e.velocity = -e.velocity
        end
      end
    end
  end
end

--Return the HoleSystem system
return HoleSystem