--File: assets.lua

--Init empty list of assets
local assets = {}

--Load all assets in the game
assets.cursor = love.image.newImageData("assets/cursor_icon.png")
assets.grass= love.graphics.newImage("assets/grass.png")
assets.mole = love.graphics.newImage("assets/mole.png")

--Return the list full of assets
return assets