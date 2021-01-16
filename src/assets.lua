--File: assets.lua

--Init empty list of assets
local assets = {}

--Load all assets in the game
assets.cursor = love.image.newImageData("assets/cursor_icon.png")
assets.grass = love.graphics.newImage("assets/grass.png")
assets.menuBackground = love.graphics.newImage("assets/wheat.png")
assets.moleMenu = love.graphics.newImage("assets/moleMenu.png")
<<<<<<< HEAD
assets.mole = love.graphics.newImage("assets/mole.png")
assets.font = love.graphics.newFont("assets/font_PS.ttf",20)
=======
assets.moleUp = love.graphics.newImage("assets/moleUp.png")

>>>>>>> 95743c3ae0baca8d3fd4e9efb80357567c61c6ee
--Return the list full of assets
return assets