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

--Draw the player GUI method
function PlayerEntity:drawGUI()
  --If the player has no health, print the game over message
  if self.healthPoints <= 0 then
    love.graphics.setColor(0,0,0)
    love.graphics.print("GAME OVER",10,12)
    love.graphics.rectangle("line",10,10,200,30)
  --If the player has 20 score, print the congratulation message
  elseif self.score >= 20 then
    love.graphics.setColor(0,0,0)
    love.graphics.print("CONGRATULATION! YOU WIN",10,12)
    love.graphics.rectangle("line",10,10,200,30)
  --Else, print the player's info bar
  else 
    love.graphics.setColor(0,0,0)
    love.graphics.print("SCORE:  ".. self.score.."  HEALTH:".. self.healthPoints,10,12)
    love.graphics.rectangle("line",10,10,200,30)
  end
end

--Return the Player class
return PlayerEntity