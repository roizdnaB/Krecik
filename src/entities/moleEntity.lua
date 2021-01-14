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
  self.timeToSpawn = love.math.random(100, 1000)
  --Time required to despawn the mole
  self.timeToDespawn = love.math.random(100, 500)
end

--Drawing function
function MoleEntity:draw()
  
  --If the mole is alive, draw it
  if self.isAlive == true then
      love.graphics.setColor(1, 0, 0)
      love.graphics.circle("fill", self.x, self.y, 35)
  end
end

--Updating function
function MoleEntity:update(dt)
  
  --If the mole isn't alive, then decrease time required to spawn 
  if self.isAlive == false then
    self.timeToSpawn = self.timeToSpawn-1
  end
  
  --If time required to spawn is less or equal to 0, then the mole is alive
  if self.timeToSpawn <= 0 then
    self.isAlive = true
    self.timeToSpawn = love.math.random(100, 1000)
  end
  
  --If mole is alive, decrease the time of presence
  if self.isAlive == true then
    self.timeToDespawn = self.timeToDespawn-1
  end
  
  --If mole is alive after the time passed, decrease the number of lifes
  if self.timeToDespawn <= 0 then
    self.isAlive = false
    self.timeToDespawn = love.math.random(100, 500)
  end
  
end

--Return the Mole class
return MoleEntity