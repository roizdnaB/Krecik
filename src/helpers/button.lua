 --File: button.lua

--Create a button class
local Button = Object:extend()

--Constructor of the button class
function Button:new(label, x, y, section, item, width, height)
   --Label of the button
   self.label = label
   --Coords of the button
   self.x = x
   self.y = y
   --Set the width and height
   self.width = width
   self.height = height
   --Set the menu section of this button and the item section of this button
   self.section = section
   self.item = item
end

--Drawing function
function Button:draw()
  love.graphics.print(self.label, self.x, self.y)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

--Updating function
function Button:update()
  
end

return Button