Pillar = Object.extend(Object)

function Pillar.new(self, xPos)
    self.xPos = xPos or 1440
    self.yPos = math.random(0, 800)
    self.width = 75
    self.height = 350
    self.velocity = 150
end

function Pillar.update(self, dt)
    self.xPos = self.xPos + self.velocity * dt
    if self.xPos < 0 then
        self.xPos = 1440
        self.yPos = math.random(0, 800)
    end
end

function Pillar.draw(self)
    love.graphics.rectangle("fill", self.xPos, 0, self.width, self.yPos)
    love.graphics.rectangle("fill", self.xPos, self.yPos + 100, self.width, 900)
end
