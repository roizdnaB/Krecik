--File: assets.lua

--Init empty list of assets
local assets = {}

--Load all assets in the game
assets.cursor = love.image.newImageData("assets/cursor_icon.png")
assets.grass= love.graphics.newImage("assets/grass.png")

--Return the list full of assets
return assets