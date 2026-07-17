-- Kind of does what main should do probably, hosts all functions of the game
-- state contains 1 of three strings corresponding to their selective screen ("main, settings, or play")

local state = "main"

local buttonWidth = 1920 / 3
local buttonHeight = 200

local testLevel = require("lua/testLevel")

-- Main menu buttons
menu = love.physics.newWorld(0, 0)

PlayButton = {}
PlayButton.body = love.physics.newBody(menu, 1920/3, 100, "static")
PlayButton.shape = love.physics.newRectangleShape(1920/6, 50, 1920/3, 100)
PlayButton.fixture = love.physics.newFixture(PlayButton.body, PlayButton.shape)

SettingsButton = {}
SettingsButton.body = love.physics.newBody(menu, 1920/3, 300, "static")
SettingsButton.shape = love.physics.newRectangleShape(1920/6, 50, 1920/3, 100)
SettingsButton.fixture = love.physics.newFixture(SettingsButton.body, SettingsButton.shape)

QuitButton = {}
QuitButton.body = love.physics.newBody(menu, 1920/3, 500, "static")
QuitButton.shape = love.physics.newRectangleShape(1920/6, 50, 1920/3, 100)
QuitButton.fixture = love.physics.newFixture(QuitButton.body, QuitButton.shape)

function love.mousepressed()
    if PlayButton.fixture:testPoint(love.mouse.getX(), love.mouse.getY()) then
        state = "play"
    elseif SettingsButton.fixture:testPoint(love.mouse.getX(), love.mouse.getY()) then
        state = "settings"
    elseif QuitButton.fixture:testPoint(love.mouse.getX(), love.mouse.getY()) and state == "main" then
        state = "quit"
    end
end

function love.update(dt)
    --Check if button is pressed then change state according
    menu:update(dt)
    if state == "play" then
        testLevel:update(dt)
    end
end

function love.draw()
    if C.DISPLAY_FPS == 1 then
        love.graphics.print(love.timer.getFPS(), 1890, 10)
    end
    if state == "main" then
        love.graphics.rectangle("fill", PlayButton.body:getX(), PlayButton.body:getY(), 1920/3, 100)
        love.graphics.rectangle("fill", SettingsButton.body:getX(), SettingsButton.body:getY(), 1920/3, 100)
        love.graphics.rectangle("fill", QuitButton.body:getX(), QuitButton.body:getY(), 1920/3, 100)
    elseif state == "play" then
        testLevel.draw()
    elseif state == "quit" then
        love.event.quit()
    end
end