Pillar = Object.extend(Object)

function Pillar.new(self, xPos, yPos)
    self.xPos = xPos or 1440
    self.yPos = yPos
    self.width = 75
    self.height = 350
    self.velocity = 150
end

function Pillar.update(self, dt)
    self.xPos = self.xPos + self.velocity * dt
end
