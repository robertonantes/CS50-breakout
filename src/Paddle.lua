Paddle = Class()

function Paddle:init()
  
  self.skin = 0 -- blue skin
  self.size = 3 -- smallest one
  local x, y, w, h = gFrames['paddles'][self.skin * 4 + self.size]:getViewport();
  self.width = w -- width from quad
  
  self.x = VIRTUAL_WIDTH / 2 - self.width / 2
  self.y = VIRTUAL_HEIGHT - 32
  self.dx = 0
  
end


function Paddle:update(dt)
  if love.keyboard.isDown('right') then
    self.dx = PADDLE_SPEED
  elseif love.keyboard.isDown('left') then
    self.dx = -PADDLE_SPEED
  else
    self.dx = 0
  end


  if(self.dx < 0) then
    self.x = math.max(0, self.x + self.dx * dt);
  end

  if(self.dx > 0) then
    self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
  end

end


function Paddle:render()
  love.graphics.draw(gTextures['atlas'], gFrames['paddles'][self.skin * 4 + self.size], self.x, self.y)
end