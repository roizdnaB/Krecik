--File: playerEntity.lua

--Create a player class
local PlayerEntity = Object:extend()

local Assets = nil

--Constructor of the player class
function PlayerEntity:new(healthPoints, score)
  
  Assets = require "src.assets"
  
  --Health points (the number of the possible misses)
  self.healthPoints = healthPoints
  --Score (the number of hit moles)
  self.score = score
end

--Draw the player GUI method
function PlayerEntity:drawGUI()
  --If the player has no health, print the game over message
  if self.healthPoints <= 0 then
    love.graphics.draw(Assets.gameUI1,2,2, 0, 0.7, 0.3)
    love.graphics.setColor(0,0,0)
    love.graphics.print("GAME OVER",80,18)
    love.graphics.setColor(1,1,1)
    
    if Assets.isSoundPlaying == true then
      Assets.gameOver:play()
      Assets.isSoundPlaying = false
    end
  
  --If the player has 20 score, print the congratulation message
  elseif self.score >= 20 then
    love.graphics.draw(Assets.gameUI1,2,2, 0, 0.7, 0.3)
    love.graphics.setColor(0,0,0)
    love.graphics.print("YOU WIN",90,18)
    love.graphics.setColor(1,1,1)
    
    if Assets.isSoundPlaying == true then
      Assets.youWin:play()
      Assets.isSoundPlaying = false
    end
    
  --Else, print the player's info bar
  else
    love.graphics.draw(Assets.gameUI1,2,2, 0, 0.7, 0.3)
    love.graphics.setColor(0,0,0)
    love.graphics.print("SCORE: " .. self.score, 50, 18)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(Assets.heart, 150, 20, 0, 2.5, 2.5)
    love.graphics.setColor(0,0,0)
    love.graphics.print("x ".. self.healthPoints, 170, 18)
    love.graphics.setColor(1,1,1)
  end
end

--Return the Player class
return PlayerEntity