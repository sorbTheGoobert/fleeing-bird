floor = {
    width = 1440,
    height = 200,
    xPos = 0,
    yPos = 700,
    draw = function(self)
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
        love.graphics.draw(floorSprite, self.xPos, self.yPos, 0, 2, 2, 0, 0)
        if debugMode then
            love.graphics.setColor(love.math.colorFromBytes(0, 255, 0))
            love.graphics.rectangle("line", self.xPos, self.yPos, self.width, self.height)
        end
    end
}
