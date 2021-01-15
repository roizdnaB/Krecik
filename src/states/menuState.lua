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

--Updating function
function MenuState:update()
  
  function love.keyreleased(key)
    if key == "up" then
      self.currentItem = self.currentItem - 1
      if self.currentItem < 1 then
        self.currentItem = #self.menus[self.currentItem]
      end
    elseif key == "down" then
      self.currentItem = self.currentItem + 1
      if self.currentItem > #self.menus[self.currentItem] then
        self.currentItem = 1
      end
    end
  end
  
  if self.currentMenu == 1 then
    if self.currentItem == 1 then
      
    elseif self.currentItem == 2 then
      self.gameState = "GAME"
    end
  end
end

return MenuState