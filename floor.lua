floor = {
    width = 1440,
    height = 200,
    xPos = 0,
    yPos = 700,
    draw = function (self)
        love.graphics.rectangle("fill", self.xPos, self.yPos, self.width, self.height)
    end
}