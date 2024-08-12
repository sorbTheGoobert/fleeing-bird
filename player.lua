player = {
    xPos = 100,
    yPos = (700 - 40) / 2,
    size = 40,
    gravity = 20,
    terminal = 1000,
    vertical_velocity = 0,
    jump_speed = -800,
    jumpTimer = 0,
    draw = function (self)
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 0))
        love.graphics.rectangle("fill", self.xPos, self.yPos, self.size, self.size)
    end,
    update = function (self, dt)
        -- add gravity
        self.vertical_velocity = self.vertical_velocity + self.gravity

        -- if terminal
        if self.vertical_velocity > self.terminal then
            self.vertical_velocity = self.terminal
        end

        -- jump
        if (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1))  and self.jumpTimer == 0 then
            self.jumpTimer = self.jumpTimer + 1
            self.vertical_velocity = self.jump_speed
        elseif (love.keyboard.isDown("space") or love.keyboard.isDown("up") or love.mouse.isDown(1)) and self.jumpTimer > 0 then
            self.jumpTimer = self.jumpTimer + 1
        else
            self.jumpTimer = 0
        end

        -- collision
        
        -- ground
        if self.yPos + self.size > 700 then
            GameOver = true
        end

        -- pillars
        if self.xPos then
            
        end

        -- add speed
        self.yPos = self.yPos + self.vertical_velocity * dt
    end
}