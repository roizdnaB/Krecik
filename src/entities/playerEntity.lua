--File: playerEntity.lua

--Create a player class
local PlayerEntity = Object:extend()

--Constructor of the player class
function PlayerEntity:new(healthPoints, score)
  
  --Health points (the number of the possible misses)
  self.healthPoints = healthPoints
  --Score (the number of hit moles)
  self.score = score
end

function PlayerEntity:update()
end  

--Draw the player method
function PlayerEntity:draw()
  if self.healthPoints==0 then
    love.graphics.setColor(0,0,0)
    love.graphics.print("GAME OVER",10,12)
    love.graphics.rectangle("line",10,10,200,30)
  elseif self.score==20 then
    love.graphics.setColor(0,0,0)
    love.graphics.print("CONGRATULATION! YOU WIN",10,12)
    love.graphics.rectangle("line",10,10,200,30)
  else 
    love.graphics.setColor(0,0,0)
    love.graphics.print("SCORE:  ".. self.score.."  HEALTH:".. self.healthPoints,10,12)
    love.graphics.rectangle("line",10,10,200,30)
  end
end


--Return the Player class
return PlayerEntity