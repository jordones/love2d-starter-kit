InputMixin = Class{}

function InputMixin:init()
  love.keyboard.keysPressed = {}
  self.lastPressed = ''
end

function InputMixin:keypressed(key)
  self.lastPressed = key
  love.keyboard.keysPressed[key] = true
end

function InputMixin:wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function InputMixin:update()
  love.keyboard.keysPressed = {}
end

function InputMixin:debug()
  love.graphics.print('Last Key Pressed: ' .. tostring(self.lastPressed), 5, 25)
end

-- Set callback on love for keypressed
function love.keypressed(key)
  InputMixin:keypressed(key)
end

-- Add function to love for wasPressed
function love.keyboard.wasPressed(key)
  InputMixin:wasPressed(key)
end