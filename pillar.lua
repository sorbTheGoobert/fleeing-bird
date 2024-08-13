local object = require "classic"
Pillar = object.extend(object)

function Pillar.new(self, xPos, index)
    self.xPos = xPos
    self.yPos = math.random(0, 500)
    self.index = index
    self.width = 75
    self.velocity = -300
end

function Pillar.update(self, dt)
    self.xPos = self.xPos + self.velocity * dt
    if self.xPos + self.width < 0 then
        if self.index > 1 then
            self.xPos = pillars[self.index - 1].xPos + 400
        else
            self.xPos = pillars[#pillars].xPos + 400
        end
        self.yPos = math.random(0, 500)
    end
end

function Pillar.draw(self)
    if debugMode then
        love.graphics.setColor(love.math.colorFromBytes(0, 255, 100))
        love.graphics.rectangle("line", self.xPos, 0, self.width, self.yPos)
        love.graphics.rectangle("line", self.xPos, self.yPos + 200, self.width, 700 - self.yPos - 200)
    end
end
