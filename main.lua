function love.load()
    -- files
    require("player")
    require("floor")
    require("pillar")
    require("background")

    -- seed
    math.randomseed(os.time())

    -- initialize
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

    -- font
    font1 = love.graphics.newFont("assets/font.TTF", 64)
    font2 = love.graphics.newFont("assets/font.TTF", 16)
    love.graphics.setFont(font1);

    -- audio
    bgsong = love.audio.newSource("assets/BTWuhhInfernalCatharsisByDokuro.mp3", "stream")
    bgsong:setVolume(0.2)
    bgsong:setLooping(true)
    bgsong:play()

    death1SFX = love.audio.newSource("assets/deathAwaits.wav", "static")
    death2SFX = love.audio.newSource("assets/bigahhmetalpipesfx.mp3", "static")
    death2SFX:setVolume(0.2)

    jumpSFX = love.audio.newSource("assets/boing.wav", "static")

    scoreSFX = love.audio.newSource("assets/scoreHELLYEAH.wav", "static")
end

function love.update(dt)

    -- loop
    if not GameOver then
        background.update(background, dt)
        player.update(player, dt)
        for i = 1, #pillars do
            pillars[i].update(pillars[i], dt)
        end

        -- restart
    elseif GameOver and (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1)) then
        
        -- initialize (i hope i spelled it right)
        GameOver = false
        player.point = 0
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
    
    -- background
    background.draw(background)

    -- each pillars
    for i = 1, #pillars do
        pillars[i].draw(pillars[i])
    end
    
    -- floor
    floor.draw(floor)
    
    -- player
    player.draw(player)

    -- GUI
    -- score
    love.graphics.setFont(font1);
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.printf(player.point, (1440 - 500) / 2, 10, 500, "center")
    -- thanks dokuro :) (i didnt get permission, i feel like somethings wrong ngl)
    love.graphics.setFont(font2);
    love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
    love.graphics.printf("Also the song was made by DM Dokuro, not mine. The song is Infernal Catharsis.", 10, 900 - 26, 700, "left")
end

function love.keypressed(key)
    -- debugging bind
    if key == "b" and debugMode == true then
        debugMode = false
    elseif key == "b" and debugMode == false then
        debugMode = true
    end
end
