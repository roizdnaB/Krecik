--File: holeState.lua

--Create a level class
local holeState = Object:extend()

--Constructor of the player class
function holeState:new(x, y)
  --Coords of the hole
  self.x = x
  self.y = y
  --Radius of the hole
  self.radius = 50
end

function holeState:draw()
  --Draw the hole
  love.graphics.setColor(150/255, 105/255, 4/255)
  love.graphics.circle("fill", self.x, self.y, self.radius)
end

--Return the Hole class
return holeState