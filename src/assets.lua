--File: assets.lua

--Init empty list of assets
local assets = {}

--Load all assets in the game
assets.icon = love.graphics.newImage("assets/krecik_icon.jpg")
assets.cursor = love.graphics.newImage("assets/cursor_icon.png")

--Return the list full of assets
return assets