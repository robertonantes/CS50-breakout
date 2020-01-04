PlayState = Class{__includes = BaseState}

function PlayState:render()
  love.graphics.draw(gTextures['atlas'], gFrames['paddles'][0], 0, 0)
end
