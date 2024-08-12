function love.load()
    require("player")
    require("floor")
    require("pillar")
    math.randomseed(os.time())
    GameOver = false
    Object = require "classic"
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
        love.math.setRandomSeed(os.time())
        player.update(player, dt)
        for i = 1, #pillars do
            pillars[i].update(pillars[i], dt)
        end
    end
end

function love.draw()
    floor.draw(floor)
    player.draw(player)
    for i = 1, #pillars do
        pillars[i].draw(pillars[i])
    end
end
