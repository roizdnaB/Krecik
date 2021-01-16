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
  --Time required to spawn the mole (random real number between 2 and 6) 
  self.timeToSpawn = 2 + love.math.random() * (6 - 2)
  --Time required to despawn the mole
  self.timeToDespawn = 2 + love.math.random() * (6 - 2)
  --Set the animation
  self.animation = Animation(Assets.mole, 56, 46, 1)
end

--Drawing function
function MoleEntity:draw()
  --If the mole is alive, draw it
  if self.isAlive == true then
      if self.animation.animationEnd == false then
        local spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1
        love.graphics.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], (self.x + 7) - ((self.animation.quadWidth*2) / 2), self.y - ((self.animation.quadHeight*2) / 2), 0, 2)
      elseif self.animation.animationEnd == true then
        love.graphics.draw(self.animation.spriteSheet, self.animation.quads[#self.animation.quads], (self.x + 7) - ((self.animation.quadWidth*2) / 2), self.y - ((self.animation.quadHeight*2) / 2), 0, 2)
      end
  end
end

--Return the Mole class
return MoleEntity