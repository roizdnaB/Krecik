--File: player.lua

--Create a player class
local Player = Object:extend()

--Constructor of the player class
function Player:new(healthPoints, score)
  
  --Health points (the number of the possible misses)
  self.healthPoints = healthPoints
  --Score (the number of hit moles)
  self.score = score
end

--Draw the player method
function Player:draw()
end

--Return the Player class
return Player