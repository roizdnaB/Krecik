--File: game_tests.lua

--Load libraries
Object = require "lib.classic"  --Classic lib for simulating OOP
local cute = require("lib.cute")

--Load application files
--Load entities
local MoleEntity = require "src.entities.moleEntity"
local PlayerEntity = require "src.entities.playerEntity"
--Load states
local HoleState = require "src.states.holeState"
local LevelState = require "src.states.levelState"
local MenuState = require "src.states.menuState"
--Load systems
local LevelSystem = require "src.systems.levelSystem"
local MoleSystem = require "src.systems.moleSystem"
local PlayerSystem = require "src.systems.playerSystem"
local HoleSystem = require "src.systems.holeSystem"

--TESTS
notion("Size of the window", function()
  local width = love.graphics.getWidth()
  local height = love.graphics.getHeight()
  
  check(width).is(600)
  check(height).is(600)
end)

notion("Number of all available buttons", function()
  
  local menu = MenuState(nil, nil)
  local number = table.getn(menu.menus)
   
   
  check(number).is(6)
end)

notion("Number of moles in the level", function()
  local holes = {HoleState(133, 133), HoleState(299, 133), HoleState(465, 133), 
                  HoleState(133, 299), HoleState(299, 299), HoleState(465, 299), 
                  HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}
  
  local level = LevelState(holes, nil, nil)
  
  check(table.getn(level.holes)).is(table.getn(level.moles))
end)

notion("Decrease the player's health if he miss / Audio controll", function()
  local player = PlayerEntity(10, 0)
  local playerSystem = PlayerSystem()
  local moles = {MoleEntity(100, 100, true), MoleEntity(300, 300, false)}
  
  playerSystem:killMole(player, 300, 300, moles)
  
  
  check(player.healthPoints).is(9)
end)

notion("Increase the player's points if he hit the mole", function()
  local player = PlayerEntity(10, 0)
  local playerSystem = PlayerSystem()
  local moles = {MoleEntity(100, 100, true), MoleEntity(300, 300, false)}
  
  playerSystem:killMole(player, 100, 100, moles)
  
  check(player.score).is(1)
end)

notion("Game is still on", function()
  local holes = {HoleState(133, 133), HoleState(299, 133), HoleState(465, 133), 
                  HoleState(133, 299), HoleState(299, 299), HoleState(465, 299), 
                  HoleState(133, 465), HoleState(299, 465), HoleState(465, 465)}
  
  local level = LevelState(holes, 2, nil)
  local player = PlayerEntity(10, 0)
  
  local levelSystem = LevelSystem()
  
  check(levelSystem:isGameRunning(level, player)).is(true)
end)

notion("Decrease the player's health if he doesn't hit the mole", function()
  local player = PlayerEntity(10, 0)
  local mole = MoleEntity(100, 100, true)
  mole.timeToDespawn = -1
  local moleSystem = MoleSystem()
  
  moleSystem:updateEntity(mole, player, 1)
  
  check(player.healthPoints).is(9)
end)
