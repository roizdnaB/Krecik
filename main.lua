--File: main.lua

--Load libraries
Object = require "lib.classic"  --Classic lib for simulating OOP

--Init empty list of assets, entities, states and systems
local Assets = nil

local MoleEntity = nil
local PlayerEntity = nil

local HoleState = nil
local LevelState = nil
local MenuState = nil

local LevelSystem = nil
local MoleSystem = nil
local PlayerSystem = nil
local HoleSystem = nil

local currentLevel = nil
local level1 = nil
local level2 = nil
local level3 = nil

local currentPlayer = nil

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
  MenuState = require "src.states.menuState"
  --Load systems
  LevelSystem = require "src.systems.levelSystem"
  MoleSystem = require "src.systems.moleSystem"
  PlayerSystem = require "src.systems.playerSystem"
  HoleSystem = require "src.systems.holeSystem"
  
  --Create the menu
  menu = MenuState()
  
  --Map the first level
  holes1 = {HoleState(133, 133), HoleState(299, 133), HoleState(465, 133), 
            HoleState(133, 299), HoleState(299, 299), HoleState(465, 299), 
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}

  --Map the second level
  holes2 = {HoleState(133, 133, true, "right", 50),
            HoleState(299, 299, true, "left", 150),
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}
          
  --Map the third level
  holes3 = {HoleState(133, 133, true, "down", 50),
            HoleState(299, 299, true, "right", 150),
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465, true, "up", 200)}
  
  --Create the levels
  level1 = LevelState(holes1, 60, 9/255, 125/255, 31/255)
  level2 = LevelState(holes2, 45, 140/255, 131/255, 187/255)
  level3 = LevelState(holes3, 30, 105/255, 44/255, 117/255)
  
  --Create the player
  player1 = PlayerEntity(10,0)
  player2 = PlayerEntity(5, 0)
  player3 = PlayerEntity(3, 0)
  
  --Create the systems
  moleSystem = MoleSystem()
  playerSystem = PlayerSystem()
  levelSystem = LevelSystem()
  holeSystem = HoleSystem()
  
  --Set the cursor image
  love.mouse.setCursor(love.mouse.newCursor(Assets.cursor, 0, 0))

end

--Main drawing function of the game
function love.draw()
  --If the game is in the "MENU" state
  if menu.gameState == "MENU" then
    --Draw the menu UI
    menu:draw()
  --If the game is in the "GAME" state
  elseif menu.gameState == "GAME" then
  
    --Draw the player gui
    currentPlayer:drawGUI()
    
    --Draw the level
    currentLevel:draw()
    
    --If the game is on, draw the moles
    if levelSystem:isGameRunning(currentLevel, currentPlayer) then
      --Draw the moles
      for i, m in ipairs(currentLevel.moles) do
        m:draw()
      end
    end
  end
end

--Main updating function of the game
function love.update(dt)
  if menu.gameState == "MENU" then
    menu:update()
    
    --Set the current level
    if menu.currentLevel == 1 then
      currentLevel = level1
      currentPlayer = player1
    elseif menu.currentLevel == 2 then
      currentLevel = level2
      currentPlayer = player2
    elseif menu.currentLevel == 3 then
      currentLevel = level3
      currentPlayer = player3
    end
    
  elseif menu.gameState == "GAME" then
    if levelSystem:isGameRunning(currentLevel, currentPlayer) then
      --Update the entities and states
      levelSystem:updateEntity(currentLevel, dt)
      playerSystem:updateEntity(currentPlayer, dt)
  
      for i, m in ipairs(currentLevel.moles) do
        moleSystem:updateEntity(m, currentPlayer, dt)
      end
      
      holeSystem:updateEntities(currentLevel.holes, dt)
      
      --Mouse click, updating score and healthpoins for plyer
      function love.mousepressed(x,y,button)
        playerSystem:killMole(currentPlayer, x, y, currentLevel.moles)
      end  
    end
  end
end
