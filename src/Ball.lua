Ball = Class{}


function Ball:init(skin)

  skin = skin or 0
  
  self.skin = skin
  self.width = 8
  self.height = 8

  self.x = VIRTUAL_WIDTH / 2 - 4
  self.y = VIRTUAL_HEIGHT - 40

  self.dy = -150
  self.dx = math.random(2) == 1 and 100 or -100

end

function Ball:update(dt)
  
  self.y = self.y + self.dy * dt
  self.x = self.x +  self.dx * dt

  if self.y <= 0 or (self.y + self.height) >= VIRTUAL_HEIGHT then
    self.dy = -self.dy
  end

  if self.x <= 0 or (self.x + self.width) >= VIRTUAL_WIDTH then
    self.dx = - self.dx
  end

end

function Ball:render()
  love.graphics.draw(gTextures['atlas'], gFrames['balls'][self.skin], self.x, self.y)
end