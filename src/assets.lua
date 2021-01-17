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

--Return the list full of assets
return assets