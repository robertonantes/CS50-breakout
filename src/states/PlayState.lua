PlayState = Class{__includes = BaseState}


function PlayState:init()
  self.paddle = Paddle()
  self.ball = Ball(0)
end

function PlayState:update(dt)
  self.ball:update(dt)
  self.paddle:update(dt)
end

function PlayState:render()
  self.paddle:render()
  self.ball:render()
end
