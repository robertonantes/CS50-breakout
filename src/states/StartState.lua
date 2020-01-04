StartState = Class{__includes = BaseState}

local selectedOption = 1

function StartState:update(dt)

  if love.keyboard.wasPressed('down') or love.keyboard.wasPressed('up') then
    selectedOption = selectedOption == 1 and 2 or 1
  end

  if love.keyboard.wasPressed('return') then
    gStateMachine:change('play')
  end

end

function StartState:render()
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf('BREAKOUT', 0, VIRTUAL_HEIGHT /3, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(gFonts['medium'])
  if selectedOption == 1 then
    love.graphics.setColor(103/255, 1, 1, 1)
  end

  love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 70, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(1, 1, 1, 1)

  if selectedOption == 2 then
    love.graphics.setColor(103/255, 1, 1, 1)
  end

  love.graphics.printf("HIGH SCORES", 0, VIRTUAL_HEIGHT / 2 + 90, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(1, 1, 1, 1)

end