function GenerateQuads(atlas, tileWidth, tileHeight)
  local spritesPerRow = atlas.getWidth() / tileWidth 
  local spritesPerColumn = atlas.getHeight() / tileHeight

  local sheetCounter = 0
  local spriteSheet = {}

  for y = 0, spritesPerColumn - 1 do
    for x = 0, spritesPerColumn - 1 do
      spriteSheet[sheetCounter] = love.graphics.newQuad(x * tileWidth, y * tileHeight, tileWidth, tileHeight, atlas:getDimensions())
      sheetCounter = sheetCounter + 1
    end
  end

  return spriteSheet

end

function GenerateQuadsPaddles(atlas)
  local x = 0
  local y = 64

  local counter = 0
  local paddles = {}


  for i = 0, 3 do 
    --smallest
    paddles[counter] = love.graphics.newQuad(x, y, 32, 16, atlas:getDimensions())
    counter = counter + 1

    --medium
    paddles[counter] = love.graphics.newQuad(x+32, y, 64, 16, atlas:getDimensions())
    counter = counter + 1

    --large
    paddles[counter] = love.graphics.newQuad(x+96, y, 96, 16, atlas:getDimensions())
    counter = counter + 1

    --xl
    paddles[counter] = love.graphics.newQuad(x, y + 16, 128, 16, atlas:getDimensions())
    counter = counter + 1

    x = 0
    y = y + 32
  end

  return paddles

end