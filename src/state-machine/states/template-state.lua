TemplateState = Class{__includes = BaseState}

function TemplateState:init()
  print('Initializing TemplateState')
  print('Here is where you can initialize any class instance variables')
  self.timeSpentInSate = 0
end

function TemplateState:render()
  -- TemplateState Render
  -- Here is where you can include code that will update the display on every frame
  love.graphics.printf(
    'Current state: TemplateState\n - Time elapsed ' .. tostring(math.floor(self.timeSpentInSate)),
    0,
    VIRTUAL_HEIGHT / 2,
    VIRTUAL_WIDTH,
    'center'
  )
end

function TemplateState:update(dt)
  -- TemplateState Update
  -- Here is where you can include code that will update every frame
  self.timeSpentInSate = self.timeSpentInSate + dt
end

function TemplateState:enter(props)
  print('TemplateState Enter')
  print('This is the entrypoint to the state lifecyle and can accept params')
end

function TemplateState:exit()
  print('TemplateState Exit')
  print('This is the exitpoint to the state lifecyle and can run cleanup')
end
