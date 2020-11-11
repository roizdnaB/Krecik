--File: main.lua

--Load libraries
tiny = require "lib.tiny"       --Tiny lib for supporting ECS architectral pattern
Object = require "lib.classic"  --Classic lib for simulating OOP

--Init empty list of assets, entities, states and systems
local Assets = nil
local Player = nil
local Level = nil
local Mole = nil
local Hole = nil

local level1 = nil

--Main loading function of the game
function love.load()
  
  --Load assets
  Assets = require "src.assets"
  --Load entities
  Player = require "src.entities.player"
  --Load states
  Hole = require "src.states.hole"
  Level = require "src.states.level"

  --Map the first level
  holes1 = {Hole(133, 133), Hole(299, 133), Hole(465, 133), 
            Hole(133, 299), Hole(299, 299), Hole(465, 299), 
            Hole(133, 465), Hole(299, 465), Hole(465, 465)}

  --Load the first level
  level1 = Level(holes1)

  --Set the cursor image
  love.mouse.setCursor(love.mouse.newCursor(Assets.cursor, 0, 0))

end

--Main drawing function of the game
function love.draw()
  --Set background color
  love.graphics.setBackgroundColor(9/255, 125/255, 31/255)
  --Draw level 1
  level1:draw()
end

--Main updating function of the game
function love.update()
end
