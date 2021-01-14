 --File: level.lua

--Load files
local Mole = require "src.entities.mole"

--Create a level class
local Level = Object:extend()

--Constructor of the level class
function Level:new(holes)
    --An array of the holes
    self.holes = holes
    
    --Time for one level
    self.timeLevel = 20
    --Set an array of moles with the same coords as holes
    self.moles = {}
    for i=1, table.getn(self.holes) do
      table.insert(self.moles, Mole(self.holes[i].x, self.holes[i].y, false))
    end
end

--Drawing function
function Level:draw()
  
  --Draw comunicat about end of game
  
  if self.timeLevel <= 0 then
    love.graphics.setColor(0,0,0)
    love.graphics.print("times up! Game over",405,12)
    love.graphics.rectangle("line",400,10,180,30)
  else
    love.graphics.setColor(0,0,0)
    love.graphics.print("time: "..self.timeLevel,405,12)
    love.graphics.rectangle("line",400,10,180,30)
  end
  --Draw all holes on the screen
  for i=1,table.getn(self.holes) do
    self.holes[i]:draw()
  end
end

function Level:update(dt)
  if self.timeLevel > 0 then
    self.timeLevel=(self.timeLevel-1*dt)
  end
end

return Level