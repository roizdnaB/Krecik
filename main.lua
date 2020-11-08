--File: main.lua

--Load libraries
tiny = require "lib.tiny"       --Tiny for support ECS architectral pattern
Object = require "lib.classic"  --Classic for simulating OOP

local assets = nil

--Main loading function of the game
function love.load()
  
  --Load assets
  assets = require "src.assets"
end

--Main drawing function of the game
function love.draw()
end

--Main updating function of the game
function love.update()
end

