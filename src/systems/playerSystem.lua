--File: playerSystem.lua

--Create a playerSystem system
local PlayerSystem = Object:extend()

--Updating function
function PlayerSystem:updateEntity(entity, dt)
  
end

--Try to kill the mole
function PlayerSystem:killMole(entity, x, y, moles)
  --For every mole in the level
  for i, m in ipairs(moles) do
    --Check if the click is in the radius of the mole
    local d = math.sqrt( (x-m.x)*(x-m.x) + (y-m.y)*(y-m.y) )
    local holeRadius = 50
      
    if d <= (holeRadius - 15) then
      --If the player clicked in the hole with the mole
      if m.isAlive == true then
        entity.score = entity.score + 1
        m.isAlive = false
      --If the player clicked in the hole without the mole
      else
        entity.healthPoints = entity.healthPoints - 1
      end
    end
  end    
end

--Return the PlayerSystem system
return PlayerSystem