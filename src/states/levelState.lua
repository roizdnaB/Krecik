 --File: levelState.lua

--Load files
local MoleEntity = require "src.entities.moleEntity"
local Assets = nil
--Create a level class
local LevelState = Object:extend()

--Constructor of the level class
function LevelState:new(holes, time, background)
  
    Assets = require "src.assets"
    
    --An array of the holes
    self.holes = holes
    --A time for one level
    self.timeOfLevel = time
    --Set an array of moles with the same coords as holes
    self.moles = {}
    for i=1, table.getn(self.holes) do
      table.insert(self.moles, MoleEntity(self.holes[i].x, self.holes[i].y, false))
    end
    
    --Set the background
    self.background = background
end

--Drawing function
function LevelState:draw()
  
  --Set background color
  for i = 0, love.graphics.getWidth() / self.background:getWidth() do
        for j = 0, love.graphics.getHeight() / self.background:getHeight() do
            love.graphics.draw(self.background, i * self.background:getWidth(), j * self.background:getHeight())
        end
    end
  
  --If the times up, draw the info about it
  if self.timeOfLevel <= 0 then
    love.graphics.print("times up! Game Over", 405, 12)
    love.graphics.rectangle("line", 400, 10, 180, 30)
  --Else, draw the timer
  else
    love.graphics.draw(Assets.gameUI1, 480, 2, 0, 0.3, 0.3)
    love.graphics.draw(Assets.timeUI, 510, 16, 0, 0.2, 0.2)
    love.graphics.setColor(0,0,0)
    love.graphics.print(math.floor(self.timeOfLevel + 0.5), 540, 16)
    love.graphics.setColor(1,1,1)
  end
  
  --Draw all holes on the screen
  for i=1,table.getn(self.holes) do
    --self.holes[i]:draw()
  end
end

return LevelState