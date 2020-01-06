require 'src/Dependencies'


function love.load()


  math.randomseed(os.time())

  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Breakout')

  gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
  }

  gTextures = {
    ['atlas'] = love.graphics.newImage('graphics/blocks.png'),
    ['background'] = love.graphics.newImage('graphics/background.png')
  }

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  gStateMachine = StateMachine({
    ['start'] = function() return StartState() end,
    ['play'] = function() return PlayState() end
  })

  gFrames = {
    ['paddles'] = GenerateQuadsPaddles(gTextures['atlas']),
    ['balls']  = GenerateQuadsBalls(gTextures['atlas']),
    ['bricks'] = GenerateQuadsBricks(gTextures['atlas'])
  }

  gStateMachine:change('start')
  love.keyboard.keysPressed = {}
end

function love.resize(w, h)
  push:resize(w, h)
end

function love.update(dt)
  gStateMachine:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  love.keyboard.keysPressed = {}
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
    return true
  else
    return false
  end
end

function love.draw()
  push:apply('start')

  local backgroundWidth = gTextures['background']:getWidth()
  local backgroundHeight = gTextures['background']:getHeight()

  love.graphics.draw(gTextures['background'], 0, 0, 0, VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))
  gStateMachine:render()


  push:apply('end')
end