 --File: menuState.lua

--Load the libs
local Button = require "src.helpers.button"

--Create a menu class
local MenuState = Object:extend()

--Constructor of the level class
function MenuState:new(background,mole,font)
    --Determine if the game is on ("GAME") or in the menu "MENU"
    self.gameState = "MENU"
    
    --Array which is the map of the menu buttons (see helpers -> button)
    
    self.menus = 
      {Button("START", 150, 150, 1, 1, 300, 50,50), Button("EXIT", 150, 220, 1, 2, 300, 50,30), 
       Button("LEVEL 1", 150, 150, 2, 1, 300, 50,50), Button("LEVEL 2", 150, 220, 2, 2, 300, 50,50), Button("LEVEL 3", 150, 290, 2, 3, 300, 50,50), Button("BACK", 225, 360, 2, 4, 150, 50,35)}
    
    --Set the current section and item
    self.currentSection = 1
    self.currentItem = 0
    
    --Set the current level
    self.currentLevel = nil
    
    self.background=background
    self.mole=mole
    self.font=font
    
end

--Drawing function
function MenuState:draw()
  --Set background color

   for i = 0, love.graphics.getWidth() / self.background:getWidth() do
        for j = 0, love.graphics.getHeight() / self.background:getHeight() do
            love.graphics.draw(self.background, i * self.background:getWidth(), j * self.background:getHeight())
        end
    end
    
  for i, b in ipairs(self.menus) do
    if self.currentSection == b.section then
      b:draw()
    end
  end
    fontB = love.graphics.newFont("assets/font_PS.ttf",50)
    
    love.graphics.setFont(fontB)
    love.graphics.print("MENU",250,50)
    
    love.graphics.setFont(self.font)
    love.graphics.draw(self.mole,300,350)
  --Draw the current menu
  
end

--Updating function
function MenuState:update()
  
  --Check if the mouse was pressed 
  function love.mousepressed(x, y, button)
    --For every button in the menus list
    for i, b in ipairs(self.menus) do
      --Check if the current button was clicked
      if self.currentSection == b.section and 
      x >= b.x and y >= b.y and x < b.x + b.width and y < b.y + b.height then
        --Set the new current section and item
        self.currentSection = b.section
        self.currentItem = b.item
      end
    end
  end
  
  
  --START button
  if self.currentSection == 1 and self.currentItem == 1 then
    self.currentSection = 2
    self.currentItem = 0
  --EXIT button
  elseif self.currentSection == 1 and self.currentItem == 2 then
    love.event.quit(0)
  --LEVEL 1 button
  elseif self.currentSection == 2 and self.currentItem == 1 then
    self.currentLevel = 1
    self.gameState = "GAME"
  --LEVEL 2 button
  elseif self.currentSection == 2 and self.currentItem == 2 then
    self.currentLevel = 2
    self.gameState = "GAME"
  --LEVEL 3 button
  elseif self.currentSection == 2 and self.currentItem == 3 then
    self.currentLevel = 3
    self.gameState = "GAME"
  --BACK button
  elseif self.currentSection == 2 and self.currentItem == 4 then
    self.currentSection = 1
    self.currentItem = 0
  end
end

return MenuState