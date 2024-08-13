player = {
    xPos = 100,
    yPos = (700 - 30) / 2,
    size = 30,
    gravity = 2500,
    terminal = 1000,
    vertical_velocity = 0,
    jump_speed = -600,
    jumpTimer = 0,
    rotation = 0,
    point = 0,
    draw = function(self)
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
        love.graphics.draw(globby, self.xPos + 15, self.yPos + 15, math.rad(self.rotation), 1.25, 1.25, 20, 20)
        if debugMode then
            love.graphics.setColor(love.math.colorFromBytes(255, 0, 0))
            love.graphics.rectangle("line", self.xPos, self.yPos, self.size, self.size)
        end
    end,
    update = function(self, dt)
        -- add gravity
        self.vertical_velocity = self.vertical_velocity + self.gravity * dt

        -- if terminal
        if self.vertical_velocity > self.terminal then
            self.vertical_velocity = self.terminal
        end

        -- jump
        if (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1)) and self.jumpTimer == 0 then
            self.jumpTimer = self.jumpTimer + 1
            self.vertical_velocity = self.jump_speed
            jumpSFX:play()
        elseif (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1)) and self.jumpTimer > 0 then
            self.jumpTimer = self.jumpTimer + 1
        else
            self.jumpTimer = 0
        end

        -- collision

        -- ground
        if self.yPos + self.size > 700 then
            GameOver = true
            death1SFX:play();
            death2SFX:play();
        end

        -- pillars
        if (
                self.xPos + self.size > pillars[closestPillarIndex].xPos and
                self.xPos < pillars[closestPillarIndex].xPos + pillars[closestPillarIndex].width
            ) then
            if not (
                    self.yPos > pillars[closestPillarIndex].yPos and
                    self.yPos + self.size < pillars[closestPillarIndex].yPos + 200
                )
            then
                GameOver = true
                death1SFX:play();
                death2SFX:play();
            end
        elseif self.xPos > pillars[closestPillarIndex].xPos + pillars[closestPillarIndex].width then
            if closestPillarIndex < #pillars then
                closestPillarIndex = closestPillarIndex + 1
            else
                closestPillarIndex = 1
            end
            self.point = self.point + 1
            scoreSFX:play()
        end


        -- add speed
        self.yPos = self.yPos + self.vertical_velocity * dt

        -- rotation
        self.rotation = self.vertical_velocity * dt * 2
        if self.rotation < -45 then
            self.rotation = -45
        end
        if self.rotation > 75 then
            self.rotation = 75
        end
    end
}
