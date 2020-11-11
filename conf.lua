--File: conf.lua

--Configuration function
function love.conf(t)
  
    --Set size of the window
    t.window.width = 600
    t.window.height = 600
    --Set title of the window
    t.window.title = "Krecik"
    --Set the icon of the game
    t.window.icon = "assets/krecik_icon.jpg"
    --Open a console for dev
    t.console = true
end