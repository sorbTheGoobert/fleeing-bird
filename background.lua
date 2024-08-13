background = {
    width = 1440 * 2,
    height = 900,
    xPos = 0,
    yPos = 0,
    velocity = -100,
    multiplierW = 1440 / 474,
    multiplierH = 900 / 316,
    update = function (self, dt)
        self.xPos = self.xPos + self.velocity * dt
        if self.xPos <= -1440 then
            self.xPos = 0
        end
    end,
    draw = function(self)
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
        love.graphics.draw(backgroundImage, self.xPos, self.yPos, 0, self.multiplierW, self.multiplierY)
        love.graphics.draw(backgroundImage, self.xPos + 1440, self.yPos, 0, self.multiplierW, self.multiplierY)
    end,
}