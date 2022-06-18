require 'src/dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('State Machine Demo')

  Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  local stateTable = {}
  GlobalStateMachine = StateMachine(stateTable)

  InputMixin()
end

function love.resize(w, h)
  Push:resize(w, h)
end

function love.update(dt)
  InputMixin:update()
  GlobalStateMachine.update(dt)
end

function love.draw()
  Push:apply('start')
  DisplayDebug()
  GlobalStateMachine.render()
  Push:apply('end')
end

function DisplayDebug()
  -- simple FPS display across all states
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
  InputMixin:debug()
end