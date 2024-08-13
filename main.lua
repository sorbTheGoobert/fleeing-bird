function love.load()
    require("player")
    require("floor")
    require("pillar")
    require("background")
    math.randomseed(os.time())
    Object = require "classic"
    globby = love.graphics.newImage("assets/globby.png")
    floorSprite = love.graphics.newImage("assets/floor.png")
    backgroundImage = love.graphics.newImage("assets/background.jpg")
    GameOver = true
    debugMode = false
    closestPillarIndex = 1
    pillars = {
        Pillar(1440 + 400 * 0, 1),
        Pillar(1440 + 400 * 1, 2),
        Pillar(1440 + 400 * 2, 3),
        Pillar(1440 + 400 * 3, 4),
        Pillar(1440 + 400 * 4, 5),
        Pillar(1440 + 400 * 5, 6),
        Pillar(1440 + 400 * 6, 7),
        Pillar(1440 + 400 * 7, 8),
    }
end

function love.update(dt)
    if not GameOver then
        background.update(background, dt)
        player.update(player, dt)
        for i = 1, #pillars do
            pillars[i].update(pillars[i], dt)
        end
    elseif GameOver and (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1)) then
        GameOver = false
        closestPillarIndex = 1
        pillars = {
            Pillar(1440 + 400 * 0, 1),
            Pillar(1440 + 400 * 1, 2),
            Pillar(1440 + 400 * 2, 3),
            Pillar(1440 + 400 * 3, 4),
            Pillar(1440 + 400 * 4, 5),
            Pillar(1440 + 400 * 5, 6),
            Pillar(1440 + 400 * 6, 7),
            Pillar(1440 + 400 * 7, 8),
        }
        player.yPos = (700 - 30) / 2
    end
end

function love.draw()
    background.draw(background)
    for i = 1, #pillars do
        pillars[i].draw(pillars[i])
    end
    floor.draw(floor)
    player.draw(player)
    love.graphics.print(closestPillarIndex, 10, 10)
    -- love.graphics.print(pillars[closestPillarIndex].xPos, 10, 10)
    -- love.graphics.print(player.xPos, 10, 30)
    -- love.graphics.print(player.size, 10, 50)
    -- love.graphics.print(tostring(GameOver), 10, 70)
end
