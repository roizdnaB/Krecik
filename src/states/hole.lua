--File: hole.lua

--Create a level class
local Hole = Object:extend()

--Constructor of the player class
function Hole:new(x, y)
  --Coords of the hole
  self.x = x
  self.y = y
  --Radius of the hole
  self.radius = 50
end

function Hole:draw()
  --Draw the hole
  love.graphics.setColor(150/255, 105/255, 4/255)
  love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Hole