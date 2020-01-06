Brick = Class{}



function Brick:init(skin, x, y)
  self.skin = skin

  self.width = 32
  self.height = 16
  self.x = x
  self.y = y

end


function Brick:render()
  love.graphics.draw(gTextures['atlas'], gFrames['bricks'][self.skin], self.x, self.y)
end