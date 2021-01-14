--File: main.lua

--Load libraries
tiny = require "lib.tiny"       --Tiny lib for supporting ECS architectral pattern
Object = require "lib.classic"  --Classic lib for simulating OOP

--Init empty list of assets, entities, states and systems
local Assets = nil

local MoleEntity = nil
local PlayerEntity = nil

local HoleState = nil
local LevelState = nil

--systems

local level1 = nil

local d= nil

--Main loading function of the game
function love.load()
  
  --Load assets
  Assets = require "src.assets"
  --Load entities
  Mole = require "src.entities.moleEntity"
  Player = require "src.entities.playerEntity"
  --Load states
  Hole = require "src.states.holeState"
  Level = require "src.states.levelState"
  
  d=0

  --Map the first level
  holes1 = {Hole(133, 133), Hole(299, 133), Hole(465, 133), 
            Hole(133, 299), Hole(299, 299), Hole(465, 299), 
            Hole(133, 465), Hole(299, 465), Hole(465, 465)}

  --Load the first level
  level1 = Level(holes1)
  
  --Load player
  player = Player(10,0)
  
  --Set the cursor image
  love.mouse.setCursor(love.mouse.newCursor(Assets.cursor, 0, 0))

end

--Main drawing function of the game
function love.draw()
  
  --Set background color
  love.graphics.setBackgroundColor(9/255, 125/255, 31/255)
  
  player:draw()
  
  
    --Draw level 1
    level1:draw()
    if player.healthPoints > 0 and player.score<20 and level1.timeLevel > 0 then
    
    --Draw the moles
      for i, m in ipairs(level1.moles) do
        m:draw()
      end
    end
  
end

--Main updating function of the game
function love.update(dt)
  
  --Call the update function for every mole
  for i, m in ipairs(level1.moles) do
    m:update(dt)
  end
  
  level1:update(dt)
end

--Mouse click, updating score and healthpoins for plyer
function love.mousepressed(x,y,button)
  if player.healthPoints > 0 and player.score<20 and level1.timeLevel > 0 then
   if button==1 then
     for i, m in ipairs(level1.moles) do
      d=math.sqrt((x-m.x)*(x-m.x)+(y-m.y)*(y-m.y))
      hol = Hole(m.x,m.y)
      if d <= (hol.radius-15) then 
        if m.isAlive==true then
          player.score = player.score + 1
          m.isAlive = false
          m.timeToSpawn = love.math.random(100, 1000)
        else
           player.healthPoints = player.healthPoints - 1
        end
      end
     end
    end
  end
end  



  