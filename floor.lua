floor = {
    width = 1440,
    height = 200,
    xPos = 0,
    yPos = 700,
    draw = function (self)
        love.graphics.setColor(love.math.colorFromBytes(0, 255, 0))
        love.graphics.rectangle("fill", self.xPos, self.yPos, self.width, self.height)
    end
}