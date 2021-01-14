--File: main.lua

--Load libraries
Object = require "lib.classic"  --Classic lib for simulating OOP

--Init empty list of assets, entities, states and systems
local Assets = nil

local MoleEntity = nil
local PlayerEntity = nil

local HoleState = nil
local LevelState = nil

local LevelSystem = nil
local MoleSystem = nil
local PlayerSystem = nil

local level1 = nil

--Main loading function of the game
function love.load()
  
  --Load assets
  Assets = require "src.assets"
  --Load entities
  MoleEntity = require "src.entities.moleEntity"
  PlayerEntity = require "src.entities.playerEntity"
  --Load states
  HoleState = require "src.states.holeState"
  LevelState = require "src.states.levelState"
  --Load systems
  LevelSystem = require "src.systems.levelSystem"
  MoleSystem = require "src.systems.moleSystem"
  PlayerSystem = require "src.systems.playerSystem"

  --Map the first level
  holes1 = {HoleState(133, 133), HoleState(299, 133), HoleState(465, 133), 
            HoleState(133, 299), HoleState(299, 299), HoleState(465, 299), 
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}

  --Create the first level
  level1 = LevelState(holes1, 60)
  
  --Create the player
  player = PlayerEntity(10,0)
  
  --Create the systems
  moleSystem = MoleSystem()
  playerSystem = PlayerSystem()
  levelSystem = LevelSystem()
  
  --Set the cursor image
  love.mouse.setCursor(love.mouse.newCursor(Assets.cursor, 0, 0))

end

--Main drawing function of the game
function love.draw()
  
  --Set background color
  love.graphics.setBackgroundColor(9/255, 125/255, 31/255)
  
  --Draw the player gui
  player:drawGUI()
  
  
  --Draw level 1
  level1:draw()
  
  --If the game is on, draw the moles
  if levelSystem:isGameRunning(level1, player) then
    --Draw the moles
    for i, m in ipairs(level1.moles) do
      m:draw()
    end
  end
  
end

--Main updating function of the game
function love.update(dt)
  if levelSystem:isGameRunning(level1, player) then
    --Update the entities and states
    levelSystem:updateEntity(level1, dt)
    playerSystem:updateEntity(player, dt)
  
    for i, m in ipairs(level1.moles) do
      moleSystem:updateEntity(m, player, dt)
    end
  end
end

--Mouse click, updating score and healthpoins for plyer
function love.mousepressed(x,y,button)
    if levelSystem:isGameRunning(level1, player) then
      playerSystem:killMole(player, x, y, level1.moles)
    end
end  
