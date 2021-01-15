 --File: menuState.lua

--Create a menu class
local MenuState = Object:extend()

--Constructor of the level class
function MenuState:new()
    --Determine if the game is on ("GAME") or in the menu "MENU"
    self.gameState = "MENU"
    
    --Array which is the map of the menu keys
    self.menus = {
      {"START", "EXIT"},
      {"LEVEL 1", "LEVEL 2"}}
    
    --Set the current menu on 1 (which is the main menu with START and EXIT buttons)
    self.currentMenu = 1
    --Set the current item
    self.currentItem = 1
end

--Drawing function
function MenuState:draw()
  --Draw the current menu
  for i=1, #self.menus[self.currentMenu] do
    love.graphics.print(self.menus[self.currentMenu][i], 10, 10+ 20*i)
  end
  
end

return MenuState