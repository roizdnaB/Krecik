--File: main.lua

--Load libraries
Object = require "lib.classic"  --Classic lib for simulating OOP
local cute = require "lib.cute" --Testing lib

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

local cute_args = nil

--Main loading function of the game
function love.load(args)
  --If flag --cute occurs, call the cute lib
  cute_args = args
  cute.go(cute_args)
  
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
  menu = MenuState(Assets.menuBackground, Assets.moleMenu,Assets.font)
  Assets.isSoundPlaying = true
  
  --Map the first level
  holes1 = {HoleState(133, 133), HoleState(299, 133), HoleState(465, 133), 
            HoleState(133, 299), HoleState(299, 299), HoleState(465, 299), 
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}
  
  --Map the second level
  holes2 = {HoleState(133, 133, true, "right", 50),
            HoleState(299, 299, true, "left", 150),
            HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}
          
  --Map the third level
  holes3 = {HoleState(133, 133, true, "down", 100),
            HoleState(299, 299, true, "up", 175),
            HoleState(465, 465, true, "down", 250)}
  
  --Create the levels
  level1 = LevelState(holes1, 75, Assets.grass1)
  level2 = LevelState(holes2, 60, Assets.grass2)
  level3 = LevelState(holes3, 45, Assets.grass3)
  
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
    
    --Draw the level
    currentLevel:draw()
    
    --Draw the player gui
    currentPlayer:drawGUI()
    
    --If the game is on, draw the moles
    if levelSystem:isGameRunning(currentLevel, currentPlayer) then
      --Draw the moles
      for i, m in ipairs(currentLevel.moles) do
        m:draw()
      end
    end
  end
  --Draw the GUI of testing lib
  cute.draw(love.graphics)
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
    else
      --Press mouse to go back to the main menu
      function love.mousepressed()
        --Restart the game
        love.load(cute_args)
      end
    end
  end
end

--For testing lib controls
function love.keypressed(key)
  cute.keypressed(key)
end