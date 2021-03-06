--File: assets.lua

--Init empty list of assets
local assets = {}

--Load all assets in the game
assets.cursor = love.image.newImageData("assets/cursor_icon.png")
assets.grass1 = love.graphics.newImage("assets/grass1.png")
assets.grass2 = love.graphics.newImage("assets/grass2.png")
assets.grass3 = love.graphics.newImage("assets/grass3.png")
assets.menuBackground = love.graphics.newImage("assets/wheat.png")
assets.moleMenu = love.graphics.newImage("assets/moleMenu.png")
assets.moleUp = love.graphics.newImage("assets/moleUp.png")
assets.font = love.graphics.newFont("assets/font_PS.ttf", 20)
assets.moleUp = love.graphics.newImage("assets/moleUp.png")
assets.moleDown = love.graphics.newImage("assets/moleDown.png")
assets.gameUI1 = love.graphics.newImage("assets/gameUI1.png")
assets.heart = love.graphics.newImage("assets/heart.png")
assets.timeUI = love.graphics.newImage("assets/timeUI.png")

assets.isSoundPlaying = true
assets.gameOver = love.audio.newSource("assets/gameOver.mp3", "static")
assets.gameOver:setVolume(0.3)

assets.hit = love.audio.newSource("assets/hit.mp3", "static")
assets.hit:setVolume(0.3)

assets.youWin = love.audio.newSource("assets/youWin.mp3", "static")
assets.youWin:setVolume(0.3)

--Return the list full of assets
return assets