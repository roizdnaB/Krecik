--File: level.lua

--Create a level class
local Level = Object:extend()

--Constructor of the player class
function Level:new(holes)
    --An array of the holes
    self.holes = holes
end

function Level:draw()
  for i=1,9 do
    --Draw all holes on the screen
    self.holes[i]:draw()
  end
end

return Level