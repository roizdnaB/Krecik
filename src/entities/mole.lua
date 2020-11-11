--File: mole.lua

--Create a mole class
local Mole = Object:extend()

--Constructor of the mole class
function Mole:new(x, y, isAlive)
  
  --Coords of the mole
  self.x = x
  self.y = y
  --Determine if mole is alive or not
  self.isAlive = isAlive
  --Time required to spawn the mole (random number) 
  self.timeToSpawn = love.math.random(100, 400)
end

--Drawing function
function Mole:draw()
  
  --If the mole is alive, draw it
  if self.isAlive == true then
      love.graphics.setColor(1, 0, 0)
      love.graphics.circle("fill", self.x, self.y, 15)
  end
end

--Updating function
function Mole:update(dt)
  
  --If the mole isn't alive, then decrease time required to spawn 
  if self.isAlive == false then
    self.timeToSpawn = self.timeToSpawn - 1
  end
  
  --If time required to spawn is less or equal to 0, then the mole is alive
  if self.timeToSpawn <= 0 then
    self.isAlive = true
  end
end

--Return the Mole class
return Mole