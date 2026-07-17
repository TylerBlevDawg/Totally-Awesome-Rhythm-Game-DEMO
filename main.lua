-- Totally Awesome Rhythm Game!
-- My name porty (Porter Gramling) and I made this awesome game

C = require("lua/settings")

function love.load()
    love.window.setTitle("TARG!")
    Menu = require("lua/mainMenu")
end

function love.update(dt)
    Menu:update(dt)
end

function love.draw()
    Menu.draw()
end