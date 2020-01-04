PlayState = Class{__includes = BaseState}

PADDLE_SPEED = 180

function PlayState:init()
  self.paddle = Paddle()
end

function PlayState:update(dt)
  self.paddle:update(dt)
end

function PlayState:render()
  self.paddle:render()
end
