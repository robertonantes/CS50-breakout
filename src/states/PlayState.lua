PlayState = Class{__includes = BaseState}


function PlayState:init()

  self.paddle = Paddle()
  self.ball = Ball(0)
  self.bricks = self:CreateBricks()

end

function PlayState:CreateBricks()

  local x = 88
  local y = 32

  local bricks = {}
  local counter = 0
  local skin
  
  for i = 0, 2 do 
    for j = 0, 7 do
      skin = math.random(0, 20)
      bricks[counter] = Brick(skin, x, y)
      x = x + 34
      counter = counter + 1
    end
    x = 88
    y = y + 18
  end
  

  return bricks
end




function PlayState:update(dt)
  self.ball:update(dt)
  self.paddle:update(dt)
end

function PlayState:render()
  self.paddle:render()
  self.ball:render()

  for k, brick in pairs(self.bricks) do
    brick:render()
  end
 
end
