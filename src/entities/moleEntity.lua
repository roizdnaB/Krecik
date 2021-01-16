--File: moleEntity.lua

--Create a mole class
local MoleEntity = Object:extend()

--Load assets
local Assets = require "src.assets"

--Constructor of the mole class
function MoleEntity:new(x, y, isAlive)
  
  --Coords of the mole
  self.x = x
  self.y = y
  --Determine if mole is alive or not
  self.isAlive = isAlive
  --Time required to spawn the mole (random real number between 2 and 6) 
  self.timeToSpawn = 2 + love.math.random() * (6 - 2)
  --Time required to despawn the mole
  self.timeToDespawn = 2 + love.math.random() * (6 - 2)
  
  self.animation = newAnimation(Assets.mole, 16, 18, 1)
end

--Drawing function
function MoleEntity:draw()
  --If the mole is alive, draw it
  if self.isAlive == true then
      love.graphics.setColor(1, 0, 0)
      love.graphics.circle("fill", self.x, self.y, 35)
      
      
  end
end

--Return the Mole class
return MoleEntity