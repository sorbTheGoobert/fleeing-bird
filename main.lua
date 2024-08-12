function love.load()
    require("player")
    require("floor")
end

function love.update(dt)
    player.update(player, dt)
end

function love.draw()
    floor.draw(floor)
    player.draw(player)
end
