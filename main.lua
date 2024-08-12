function love.load()
    require("player")
    require("floor")
    require("pillar")
    Object = require "classic"
    pillars = {
        Pillar(1440 + 180 * 0),
        Pillar(1440 + 180 * 1),
        Pillar(1440 + 180 * 2),
        Pillar(1440 + 180 * 3),
        Pillar(1440 + 180 * 4),
        Pillar(1440 + 180 * 5),
        Pillar(1440 + 180 * 6),
        Pillar(1440 + 180 * 7),
    }
end

function love.update(dt)
    player.update(player, dt)
    for i = 1, #pillars do
        pillars[i].update()
    end
end

function love.draw()
    floor.draw(floor)
    player.draw(player)
    for i = 1, #pillars do
        pillars[i].draw()
    end
end
