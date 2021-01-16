 --File: animation.lua

--Create a animation class
local Animation = Object:extend()

--Constructor of the button class
function Animation:new(image, width, height, duration)
  self.spriteSheet = image
  self.quads = {}
  
  for y = 0, image:getHeight() - height, height do
    for x = 0, image:getWidth() - width, width do
      table.insert(self.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
    end
  end
  
  self.duration = duration or 1
  self.currentTime = 0
  
  self.quadWidth = width
  self.quadHeight = height
  
  self.animationEnd = false
end

--Return animation class
return Animation
