 --File: level.lua

--Load files
local MoleEntity = require "src.entities.moleEntity"

--Create a level class
local LevelEntity = Object:extend()

--Constructor of the level class
function LevelEntity:new(holes)
    --An array of the holes
    self.holes = holes
    
    --Set an array of moles with the same coords as holes
    self.moles = {}
    for i=1, table.getn(self.holes) do
      table.insert(self.moles, Mole(self.holes[i].x, self.holes[i].y, false))
    end
end

--Drawing function
function LevelEntity:draw()
  
  --Draw all holes on the screen
  for i=1,table.getn(self.holes) do
    self.holes[i]:draw()
  end
end

return LevelEntity