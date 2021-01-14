--File: moleEntity.lua

--Create a mole class
local MoleEntity = Object:extend()

--Constructor of the mole class
function MoleEntity:new(x, y, isAlive)
  
  --Coords of the mole
  self.x = x
  self.y = y
  --Determine if mole is alive or not
  self.isAlive = isAlive
  --Time required to spawn the mole (random number) 
  self.timeToSpawn = love.math.random(2, 10)
  --Time required to despawn the mole
  self.timeToDespawn = love.math.random(3, 6)
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