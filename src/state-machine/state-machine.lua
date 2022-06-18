StateMachine = Class{}

function StateMachine:init(states)
  self.states = states
  self.current = BaseState()
end

function StateMachine:update(dt)
  self.current:update(dt)
end

function StateMachine:render()
  self.current:render()
end