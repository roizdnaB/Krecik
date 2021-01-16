--File: moleEntity.lua

--Create a mole class
local MoleEntity = Object:extend()

--Load assets
local Assets = nil
local Animation = nil

--Constructor of the mole class
function MoleEntity:new(x, y, isAlive)
  
  Assets = require "src.assets"
  Animation = require "src.helpers.animation"
  
  --Coords of the mole
  self.x = x
  self.y = y
  --Determine if mole is alive or not
  self.isAlive = isAlive
  
  self.wasKilled = false
  
  --Time required to spawn the mole (random real number between 2 and 6) 
  self.timeToSpawn = 2 + love.math.random() * (6 - 2)
  --Time required to despawn the mole
  self.timeToDespawn = 2 + love.math.random() * (6 - 2)
  --Set the animation
  self.animationUp = Animation(Assets.moleUp, 56, 46, 0.5)
  self.animationDown = Animation(Assets.moleDown, 56, 44, 1)
end

--Drawing function
function MoleEntity:draw()
  --If the mole is alive, draw it
  if self.isAlive == true then
    if self.animationUp.animationEnd == false then
        local spriteNum = math.floor(self.animationUp.currentTime / self.animationUp.duration * #self.animationUp.quads) + 1
        love.graphics.draw(self.animationUp.spriteSheet, self.animationUp.quads[spriteNum], (self.x + 7) - ((self.animationUp.quadWidth*2) / 2), self.y - ((self.animationUp.quadHeight*2) / 2), 0, 2)
    elseif self.animationUp.animationEnd == true then
        love.graphics.draw(self.animationUp.spriteSheet, self.animationUp.quads[#self.animationUp.quads], (self.x + 7) - ((self.animationUp.quadWidth*2) / 2), self.y - ((self.animationUp.quadHeight*2) /        2), 0, 2)
      end
  elseif self.isAlive == false and self.animationDown.animationEnd == false and self.wasKilled == false then
    local spriteNum = math.floor(self.animationDown.currentTime / self.animationDown.duration * #self.animationDown.quads) + 1
    love.graphics.draw(self.animationDown.spriteSheet, self.animationDown.quads[spriteNum], (self.x + 7) - ((self.animationDown.quadWidth*2) / 2), self.y - ((self.animationDown.quadHeight*2) / 2), 0, 2)
  end
end

--Return the Mole class
return MoleEntity