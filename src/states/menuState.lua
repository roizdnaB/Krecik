 --File: menuState.lua

--Load the libs
local Button = require "src.helpers.button"

--Create a menu class
local MenuState = Object:extend()

--Constructor of the level class
function MenuState:new()
    --Determine if the game is on ("GAME") or in the menu "MENU"
    self.gameState = "MENU"
    
    --Array which is the map of the menu buttons (see helpers -> button)
    self.menus = 
      {Button("START", 10, 30, 1, 1, 50, 30), Button("EXIT", 10, 100, 1, 2, 50, 30), 
       Button("LEVEL 1", 10, 30, 2, 1, 50, 30), Button("LEVEL 2", 10, 100, 2, 2, 50, 30), Button("LEVEL 3", 10, 170, 2, 3, 50, 30), Button("BACK", 10, 240, 2, 4, 50, 30)}
    
    --Set the current section and item
    self.currentSection = 1
    self.currentItem = 0
    
    --Set the current level
    self.currentLevel = nil
end

--Drawing function
function MenuState:draw()
  --Draw the current menu
  for i, b in ipairs(self.menus) do
    if self.currentSection == b.section then
      b:draw()
    end
  end
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