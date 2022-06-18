require 'src/dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('State Machine Demo')

  Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  InputMixin()
end

function love.resize(w, h)
  Push:resize(w, h)
end

function love.update(dt)
  InputMixin:update()
end


function love.draw()
  Push:apply('start')
  
  displayDebug()
  Push:apply('end')
end

function displayDebug()
  -- simple FPS display across all states
  -- love.graphics.setFont(gFonts['small'])
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
  InputMixin:debug()
end