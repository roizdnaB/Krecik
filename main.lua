--File: main.lua

--Load libraries
tiny = require "lib.tiny"       --Tiny lib for supporting ECS architectral pattern
Object = require "lib.classic"  --Classic lib for simulating OOP

--Init empty list of assets
local assets = nil
local player = nil
local cursor = nil

--Main loading function of the game
function love.load()
  
  --Load assets
  assets = require "src.assets"
  --Load entities
  player = require "src.entities.player"
  
  --Set the cursor image
  love.mouse.setCursor(love.mouse.newCursor("assets/cursor_icon.png", 0, 0))

end

--Main drawing function of the game
function love.draw()

end

--Main updating function of the game
function love.update()
end
